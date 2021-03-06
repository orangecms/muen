--
--  Copyright (C) 2014, 2015  Reto Buerki <reet@codelabs.ch>
--  Copyright (C) 2014, 2015  Adrian-Ken Rueegsegger <ken@codelabs.ch>
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

with Expanders.Components;
with Expanders.Memory;
with Expanders.Hardware;

package body Stage1.Expansion
is

   -------------------------------------------------------------------------

   procedure Clear
   is
   begin
      Procs.Clear;
   end Clear;

   -------------------------------------------------------------------------

   function Get_Count return Natural renames Procs.Get_Count;

   -------------------------------------------------------------------------

   procedure Register_All (Data : Muxml.XML_Data_Type)
   is
      use Expanders;

      pragma Unreferenced (Data);
   begin

      --  Expand hardware RMRRs prior to removal.

      Procs.Register (Process => Memory.Add_Reserved_Memory_Regions'Access);
      Procs.Register (Process => Hardware.Add_Reserved_Memory_Blocks'Access);
      Procs.Register (Process => Hardware.Remove_Reserved_Mem_Regions'Access);

      Procs.Register (Process => Components.Add_Binaries'Access);
      Procs.Register (Process => Components.Add_Channels'Access);
      Procs.Register (Process => Components.Add_Memory'Access);
      Procs.Register (Process => Components.Add_Devices'Access);
      Procs.Register (Process => Components.Remove_Components'Access);
      Procs.Register (Process => Components.Remove_Component_Reference'Access);
   end Register_All;

   -------------------------------------------------------------------------

   procedure Run (Data : in out Muxml.XML_Data_Type) renames Procs.Run;

end Stage1.Expansion;
