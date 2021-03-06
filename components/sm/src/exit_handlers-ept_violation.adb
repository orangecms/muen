--
--  Copyright (C) 2014, 2015, 2016  Reto Buerki <reet@codelabs.ch>
--  Copyright (C) 2014, 2015, 2016  Adrian-Ken Rueegsegger <ken@codelabs.ch>
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

with SK.Bitops;

with Debug_Ops;

package body Exit_Handlers.EPT_Violation
is

   use type SK.Word64;
   use Subject_Info;

   --  Type related to EPT violation specific exit qualification.

   type EPTV_Info_Type is record
      Read              : Boolean;
      Write             : Boolean;
      Instruction_Fetch : Boolean;
      Is_Readable       : Boolean;
      Is_Writable       : Boolean;
      Valid_Address     : Boolean;
      Is_Linear_Access  : Boolean;
      NMI_Blocking      : Boolean;
   end record;

   MMConf_Base_Address : constant SK.Word64 := 16#f800_0000#;
   MMConf_Size         : constant SK.Word64 := 16#0100_0000#;

   subtype MMConf_Region is SK.Word64 range
     MMConf_Base_Address .. MMConf_Base_Address + MMConf_Size - 1;

   -------------------------------------------------------------------------

   --  Return EPT violation information from exit qualification, as specified
   --  by Intel SDM Vol. 3C, section 27.2.1, table 27-7.
   function To_EPTV_Info (Qualification : SK.Word64) return EPTV_Info_Type
   is
      Info : EPTV_Info_Type;
   begin
      Info.Read              := SK.Bitops.Bit_Test (Value => Qualification,
                                                    Pos   => 0);
      Info.Write             := SK.Bitops.Bit_Test (Value => Qualification,
                                                    Pos   => 1);
      Info.Instruction_Fetch := SK.Bitops.Bit_Test (Value => Qualification,
                                                    Pos   => 2);
      Info.Is_Readable       := SK.Bitops.Bit_Test (Value => Qualification,
                                                    Pos   => 3);
      Info.Is_Writable       := SK.Bitops.Bit_Test (Value => Qualification,
                                                    Pos   => 4);
      Info.Valid_Address     := SK.Bitops.Bit_Test (Value => Qualification,
                                                    Pos   => 7);
      Info.Is_Linear_Access  := SK.Bitops.Bit_Test (Value => Qualification,
                                                    Pos   => 8);
      Info.NMI_Blocking      := SK.Bitops.Bit_Test (Value => Qualification,
                                                    Pos   => 12);
      return Info;
   end To_EPTV_Info;

   -------------------------------------------------------------------------

   procedure Process (Action : out Types.Subject_Action_Type)
   is
      Exit_Q : constant SK.Word64 := Subject_Info.State.Exit_Qualification;
      GPA    : constant SK.Word64 := State.Guest_Phys_Addr;

      Info : constant EPTV_Info_Type := To_EPTV_Info (Qualification => Exit_Q);
   begin
      Action := Types.Subject_Halt;

      if GPA in MMConf_Region and then Info.Read then

         --  Return 16#ffff# to indicate a non-existent device.

         State.Regs.RAX := 16#ffff#;
         Action         := Types.Subject_Continue;
      end if;

      pragma Debug (GPA not in MMConf_Region,
                    Debug_Ops.Put_String (Item => "Invalid "));
      pragma Debug (GPA not in MMConf_Region and then Info.Read,
                    Debug_Ops.Put_String (Item => "read"));
      pragma Debug (GPA not in MMConf_Region and then Info.Write,
                    Debug_Ops.Put_String (Item => "write"));
      pragma Debug (GPA not in MMConf_Region, Debug_Ops.Put_Value64
                    (Message => " access at guest physical address",
                     Value   => GPA));
   end Process;

end Exit_Handlers.EPT_Violation;
