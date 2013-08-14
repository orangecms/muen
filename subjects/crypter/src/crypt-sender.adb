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

with System;

package body Crypt.Sender
--# own
--#    State is out Response;
is

   Response : Crypt.Message_Type;
   for Response'Address use System'To_Address (16#20000#);
   pragma Volatile (Response);

   -------------------------------------------------------------------------

   procedure Send (Res : Crypt.Message_Type)
   --# global
   --#    out Response;
   --# derives
   --#    Response from Res;
   is
   begin
      Response := Res;
   end Send;

end Crypt.Sender;
