--
--  Copyright (C) 2015  Reto Buerki <reet@codelabs.ch>
--  Copyright (C) 2015  Adrian-Ken Rueegsegger <ken@codelabs.ch>
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

with Debuglog.Client;

package body Tm.Utils
is
   use type Interfaces.Unsigned_8;

   function To_Binary
     (BCD : Interfaces.Unsigned_8)
      return Interfaces.Unsigned_8
   is
     (((BCD / 16) * 10) + (BCD and 16#0f#));

   -------------------------------------------------------------------------

   procedure To_Mutime
     (Rtc_Time  :     Rtc.Time_Type;
      Date_Time : out Mutime.Date_Time_Type;
      Success   : out Boolean)
   is
      Bin_Time : Rtc.Time_Type;
      Year     : Natural;
   begin
      Bin_Time.Century := To_Binary (BCD => Rtc_Time.Century);
      Bin_Time.Year    := To_Binary (BCD => Rtc_Time.Year);
      Bin_Time.Month   := To_Binary (BCD => Rtc_Time.Month);
      Bin_Time.Day     := To_Binary (BCD => Rtc_Time.Day);
      Bin_Time.Hour    := To_Binary (BCD => Rtc_Time.Hour);
      Bin_Time.Minute  := To_Binary (BCD => Rtc_Time.Minute);
      Bin_Time.Second  := To_Binary (BCD => Rtc_Time.Second);

      Date_Time := Mutime.Epoch;
      Success   := False;

      Year := Natural (Bin_Time.Century) * 100 + Natural (Bin_Time.Year);
      if Year >= Natural (Mutime.Year_Type'First)
        and then Year <= Natural (Mutime.Year_Type'Last)
      then
         Debuglog.Client.Put_Line
           (Item => "Using century register for year calculation");
         Date_Time.Year := Mutime.Year_Type (Year);
      else

         --  Assume 20th century.

         Debuglog.Client.Put_Line
           (Item => "Century register not present, assuming 20th century");
         Date_Time.Year := Mutime.Year_Type (2000 + Natural (Bin_Time.Year));
      end if;

      if Bin_Time.Month < Interfaces.Unsigned_8 (Mutime.Month_Type'First)
        or else Bin_Time.Month > Interfaces.Unsigned_8 (Mutime.Month_Type'Last)
      then
         Debuglog.Client.Put_Reg8 (Name  => "RTC month invalid",
                                   Value => Bin_Time.Month);
         return;
      else
         Date_Time.Month := Mutime.Month_Type (Bin_Time.Month);
      end if;

      if Bin_Time.Day < Interfaces.Unsigned_8 (Mutime.Day_Type'First)
        or else Bin_Time.Day >
          Interfaces.Unsigned_8 (Mutime.Day_Type'Last)
      then
         Debuglog.Client.Put_Reg8 (Name  => "RTC day invalid",
                                   Value => Bin_Time.Day);
         return;
      else
         Date_Time.Day := Mutime.Day_Type (Bin_Time.Day);
      end if;

      if Bin_Time.Hour > Interfaces.Unsigned_8 (Mutime.Hour_Type'Last)
      then
         Debuglog.Client.Put_Reg8 (Name  => "RTC hour invalid",
                                   Value => Bin_Time.Hour);
         return;
      else
         Date_Time.Hour := Mutime.Hour_Type (Bin_Time.Hour);
      end if;

      if Bin_Time.Minute > Interfaces.Unsigned_8 (Mutime.Minute_Type'Last)
      then
         Debuglog.Client.Put_Reg8 (Name  => "RTC minute invalid",
                                   Value => Bin_Time.Minute);
         return;
      else
         Date_Time.Minute := Mutime.Minute_Type (Bin_Time.Minute);
      end if;

      if Bin_Time.Second > Interfaces.Unsigned_8 (Mutime.Second_Type'Last)
      then
         Debuglog.Client.Put_Reg8 (Name  => "RTC second invalid",
                                   Value => Bin_Time.Second);
         return;
      else
         Date_Time.Second := Mutime.Second_Type (Bin_Time.Second);
      end if;

      Success := True;
   end To_Mutime;

end Tm.Utils;
