--
--  Copyright (C) 2016  Reto Buerki <reet@codelabs.ch>
--  Copyright (C) 2016  Adrian-Ken Rueegsegger <ken@codelabs.ch>
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

with Muxml;
with Mutools.Immutable_Processors;

package Memhashes.Pre_Checks
is

   --  Validate that hash references point to an existing physical memory
   --  region.
   procedure Hash_References (Data : Muxml.XML_Data_Type);

   --  Register all pre-checks.
   procedure Register_All;

   --  Run registered pre-checks.
   procedure Run
     (Data      : Muxml.XML_Data_Type;
      Input_Dir : String);

   --  Return number of registered pre-checks.
   function Get_Count return Natural;

   --  Clear registered pre-checks.
   procedure Clear;

   Check_Error : exception;

private

   package Check_Procs is new
     Mutools.Immutable_Processors (Param_Type => Muxml.XML_Data_Type);

end Memhashes.Pre_Checks;
