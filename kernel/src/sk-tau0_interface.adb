--
--  Copyright (C) 2015, 2016  Reto Buerki <reet@codelabs.ch>
--  Copyright (C) 2015, 2016  Adrian-Ken Rueegsegger <ken@codelabs.ch>
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

with System;

with Skp.Kernel;

package body SK.Tau0_Interface
with
   Refined_State => (State => New_Major)
is

   New_Major : Skp.Scheduling.Major_Frame_Range
   with
      Atomic,
      Async_Writers,
      Address => System'To_Address (Skp.Kernel.Tau0_Iface_Address);

   -------------------------------------------------------------------------

   procedure Get_Major_Frame (ID : out Skp.Scheduling.Major_Frame_Range)
   with
      Refined_Global  => (Input    => New_Major,
                          Proof_In => CPU_Global.CPU_ID),
      Refined_Depends => (ID => New_Major)
   is
   begin
      ID := New_Major;
   end Get_Major_Frame;

end SK.Tau0_Interface;
