--
--  Copyright (C) 2014  Reto Buerki <reet@codelabs.ch>
--  Copyright (C) 2014  Adrian-Ken Rueegsegger <ken@codelabs.ch>
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

with Ahven.Framework;

package Memory_Tests
is

   type Testcase is new Ahven.Framework.Test_Case with null record;

   --  Initialize testcase.
   procedure Initialize (T : in out Testcase);

   --  Validate physical memory references.
   procedure Validate_Physmem_Refs;

   --  Validate presence of VMXON regions.
   procedure Validate_VMXON_Presence;

   --  Validate size of VMXON regions.
   procedure Validate_VMXON_Size;

   --  Validate VMXON physical address (lowmem).
   procedure Validate_VMXON_In_Lowmem;

   --  Validate presence of VMCS regions.
   procedure Validate_VMCS_Presence;

   --  Validate size of VMCS regions.
   procedure Validate_VMCS_Size;

   --  Validate VMCS physical address (lowmem).
   procedure Validate_VMCS_In_Lowmem;

   --  Validate physical memory address alignment.
   procedure Validate_Physaddr_Alignment;

   --  Validate virtual memory address alignment.
   procedure Validate_Virtaddr_Alignment;

   --  Validate memory region size.
   procedure Validate_Region_Size;

end Memory_Tests;