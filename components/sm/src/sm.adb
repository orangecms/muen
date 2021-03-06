--
--  Copyright (C) 2013, 2014, 2016  Reto Buerki <reet@codelabs.ch>
--  Copyright (C) 2013, 2014, 2016  Adrian-Ken Rueegsegger <ken@codelabs.ch>
--
--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
--

with X86_64;

with SK.CPU;
with SK.Hypercall;
with SK.Constants;
with SK.Interrupt_Tables;

with Debuglog.Client;

with Mutime.Info;
with Musinfo.Instance;

with Time;
with Interrupts;
with Interrupt_Handler;
with Subject_Info;
with Exit_Handlers.CPUID;
with Exit_Handlers.EPT_Violation;
with Exit_Handlers.IO_Instruction;
with Exit_Handlers.RDMSR;
with Exit_Handlers.WRMSR;
with Exit_Handlers.CR_Access;
with Exit_Handlers.RDTSC;
with Devices.RTC;
with Devices.UART8250;
with Types;

with Debug_Ops;

pragma Unreferenced (Interrupt_Handler);

procedure Sm
with
   Global => (Input  => (SK.Interrupt_Tables.State,
                         Musinfo.Instance.State, Mutime.Info.State,
                         Musinfo.Instance.Scheduling_Info),
              Output => Interrupts.State,
              In_Out => (Exit_Handlers.RDTSC.State, Subject_Info.State,
                         Devices.UART8250.State, Devices.RTC.State,
                         Debuglog.Client.State,
                         X86_64.State))
is
   use type SK.Word32;
   use type SK.Word64;
   use type Types.Subject_Action_Type;
   use Subject_Info;

   Reset_Event  : constant := 1;
   Resume_Event : constant := 4;
   Action       : Types.Subject_Action_Type := Types.Subject_Continue;

   Exit_Reason : SK.Word32;
   RIP, Instruction_Len : SK.Word64;
begin
   pragma Debug (Debug_Ops.Put_Line (Item => "SM subject running"));
   Interrupts.Initialize;
   Time.Initialize;

   SK.CPU.Sti;
   SK.CPU.Hlt;

   loop
      Exit_Reason := State.Exit_Reason;

      if Exit_Reason = SK.Constants.EXIT_REASON_CPUID then
         Exit_Handlers.CPUID.Process (Action => Action);
      elsif Exit_Reason = SK.Constants.EXIT_REASON_INVLPG
        or else Exit_Reason = SK.Constants.EXIT_REASON_DR_ACCESS
      then

         --  Ignore INVLPG and MOV DR for now.

         Action := Types.Subject_Continue;

      elsif Exit_Reason = SK.Constants.EXIT_REASON_RDTSC then
         Exit_Handlers.RDTSC.Process (Action => Action);
      elsif Exit_Reason = SK.Constants.EXIT_REASON_IO_INSTRUCTION then
         Exit_Handlers.IO_Instruction.Process (Action => Action);
      elsif Exit_Reason = SK.Constants.EXIT_REASON_RDMSR then
         Exit_Handlers.RDMSR.Process (Action => Action);
      elsif Exit_Reason = SK.Constants.EXIT_REASON_WRMSR then
         Exit_Handlers.WRMSR.Process (Action => Action);
      elsif Exit_Reason = SK.Constants.EXIT_REASON_CR_ACCESS then
         Exit_Handlers.CR_Access.Process (Action => Action);
      elsif Exit_Reason = SK.Constants.EXIT_REASON_EPT_VIOLATION then
         Exit_Handlers.EPT_Violation.Process (Action => Action);
      else
         pragma Debug (Debug_Ops.Put_Line
                       (Item => "Unhandled trap for associated subject"));

         Action := Types.Subject_Halt;
      end if;

      case Action
      is
         when Types.Subject_Continue =>
            RIP             := State.RIP;
            Instruction_Len := State.Instruction_Len;
            State.RIP       := RIP + Instruction_Len;
            SK.Hypercall.Trigger_Event (Number => Resume_Event);
         when Types.Subject_Halt     =>
            pragma Debug (Debug_Ops.Dump_State);
            SK.CPU.Stop;
         when Types.Subject_Reset    =>
            SK.Hypercall.Trigger_Event (Number => Reset_Event);
      end case;
   end loop;
end Sm;
