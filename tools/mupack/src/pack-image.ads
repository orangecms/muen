--
--  Copyright (C) 2013  Reto Buerki <reet@codelabs.ch>
--  Copyright (C) 2013  Adrian-Ken Rueegsegger <ken@codelabs.ch>
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

with Interfaces;

package Pack.Image
is

   --  Add file to kernel image. The file is added as new section with
   --  the specified physical address and name.
   procedure Add_Section
     (Image    : String;
      Filename : String;
      Name     : String;
      Address  : Interfaces.Unsigned_64);

   --  Convert given source ELF binary to raw binary file.
   procedure To_Binary
     (Src_Elf : String;
      Dst_Bin : String);

end Pack.Image;