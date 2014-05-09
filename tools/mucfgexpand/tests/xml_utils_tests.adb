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

with Interfaces;

with DOM.Core.Nodes;
with DOM.Core.Elements;

with McKae.XML.XPath.XIA;

with Muxml;

with Expanders.XML_Utils;

package body XML_Utils_Tests
is

   use Ahven;
   use Expanders;

   -------------------------------------------------------------------------

   procedure Calculate_PT_Size
   is
      use type Interfaces.Unsigned_64;

      Policy : Muxml.XML_Data_Type;
   begin
      Muxml.Parse (Data => Policy,
                   Kind => Muxml.Format_A,
                   File => "data/calculate_pt.xml");

      Assert
        (Condition => Expanders.XML_Utils.Calculate_PT_Size
           (Policy             => Policy,
            Dev_Virt_Mem_XPath => "/system/kernel/devices/device/memory",
            Virt_Mem_XPath     => "/system/kernel/memory/cpu[@id='0']/memory")
         = 16#6000#,
         Message   => "Size mismatch");
   end Calculate_PT_Size;

   -------------------------------------------------------------------------

   procedure Calculate_Region_Address
   is
      Policy : Muxml.XML_Data_Type;
   begin
      Muxml.Parse (Data => Policy,
                   Kind => Muxml.Format_Src,
                   File => "data/test_policy.xml");

      declare
         use type Interfaces.Unsigned_64;

         Virt_Mem : constant DOM.Core.Node_List
           := McKae.XML.XPath.XIA.XPath_Query
             (N     => Policy.Doc,
              XPath => "/system/subjects/subject[@name='subject1']/memory/"
              & "memory");
         Dev_Mem  :  constant DOM.Core.Node_List
           := McKae.XML.XPath.XIA.XPath_Query
             (N     => Policy.Doc,
              XPath => "/system/subjects/subject[@name='subject1']/devices/"
              & "device/memory");
      begin
         Assert (Condition => Expanders.XML_Utils.Calculate_Region_Address
                 (Policy             => Policy,
                  Fixed_Memory       => Virt_Mem,
                  Device_Memory      => Dev_Mem,
                  Address_Space_Size => Interfaces.Unsigned_64'Last,
                  Region_Size        => 16#1000#) = 16#0000#,
                 Message   => "Region address mismatch (1)");

         Assert (Condition => Expanders.XML_Utils.Calculate_Region_Address
                 (Policy             => Policy,
                  Fixed_Memory       => Virt_Mem,
                  Device_Memory      => Dev_Mem,
                  Address_Space_Size => Interfaces.Unsigned_64'Last,
                  Region_Size        => 16#2000#) = 16#2000#,
                 Message   => "Region address mismatch (2)");
      end;
   end Calculate_Region_Address;

   -------------------------------------------------------------------------

   procedure Create_Subject_Event
   is
      Dom_Impl : DOM.Core.DOM_Implementation;
      Policy   : Muxml.XML_Data_Type;
      Node     : DOM.Core.Node;
      Logical  : constant String := "log_name";
      Physical : constant String := "phys_name";
      Action   : constant String := "continue";
      ID       : constant String := "42";
      Vector   : constant String := "none";
   begin
      Policy.Doc := DOM.Core.Create_Document (Implementation => Dom_Impl);

      Node := XML_Utils.Create_Source_Event_Node
        (Policy        => Policy,
         ID            => ID,
         Logical_Name  => Logical,
         Physical_Name => Physical,
         Action        => Action);

      Assert (Condition => DOM.Core.Elements.Get_Tag_Name
              (Elem => Node) = "event",
              Message   => "Event tag mismatch");
      Assert (Condition => DOM.Core.Elements.Get_Attribute
              (Elem => Node,
               Name => "id") = ID,
              Message   => "ID mismatch");
      Assert (Condition => DOM.Core.Elements.Get_Attribute
              (Elem => Node,
               Name => "action") = Action,
              Message   => "Action mismatch");
      Assert (Condition => DOM.Core.Elements.Get_Attribute
              (Elem => Node,
               Name => "logical") = Logical,
              Message   => "Logical name mismatch");
      Assert (Condition => DOM.Core.Elements.Get_Tag_Name
              (Elem => DOM.Core.Nodes.First_Child (N => Node)) = "notify",
              Message   => "Notify tag mismatch");
      Assert (Condition => DOM.Core.Elements.Get_Attribute
              (Elem => DOM.Core.Nodes.First_Child (N => Node),
               Name => "physical") = Physical,
              Message   => "Physical name mismatch");

      Node := XML_Utils.Create_Target_Event_Node
        (Policy        => Policy,
         Logical_Name  => Logical,
         Physical_Name => Physical,
         Vector        => Vector);

      Assert (Condition => DOM.Core.Elements.Get_Tag_Name
              (Elem => Node) = "event",
              Message   => "Event tag mismatch (2)");
      Assert (Condition => DOM.Core.Elements.Get_Attribute
              (Elem => Node,
               Name => "logical") = Logical,
              Message   => "Logical name mismatch (2)");
      Assert (Condition => DOM.Core.Elements.Get_Attribute
              (Elem => Node,
               Name => "physical") = Physical,
              Message   => "Physical name mismatch (2)");
      Assert (Condition => DOM.Core.Elements.Get_Attribute
              (Elem => Node,
               Name => "vector") = Vector,
              Message   => "Vector mismatch");
   end Create_Subject_Event;

   -------------------------------------------------------------------------

   procedure Create_Virtual_Memory
   is
      Dom_Impl : DOM.Core.DOM_Implementation;
      Policy   : Muxml.XML_Data_Type;
      Node     : DOM.Core.Node;
      Logical  : constant String := "testl";
      Physical : constant String := "testp";
      Address  : constant String := "16#2000#";
   begin
      Policy.Doc := DOM.Core.Create_Document (Implementation => Dom_Impl);

      Node := XML_Utils.Create_Virtual_Memory_Node
        (Policy        => Policy,
         Logical_Name  => Logical,
         Physical_Name => Physical,
         Address       => Address,
         Writable      => True,
         Executable    => False);

      Assert (Condition => DOM.Core.Elements.Get_Attribute
              (Elem => Node,
               Name => "logical") = Logical,
              Message   => "Logical name mismatch");
      Assert (Condition => DOM.Core.Elements.Get_Attribute
              (Elem => Node,
               Name => "physical") = "testp",
              Message   => "Physical name mismatch");
      Assert (Condition => DOM.Core.Elements.Get_Attribute
              (Elem => Node,
               Name => "virtualAddress") = Address,
              Message   => "Address mismatch");
      Assert (Condition => DOM.Core.Elements.Get_Attribute
              (Elem => Node,
               Name => "writable") = "true",
              Message   => "Writable mismatch");
      Assert (Condition => DOM.Core.Elements.Get_Attribute
              (Elem => Node,
               Name => "executable") = "false",
              Message   => "Executable mismatch");
   end Create_Virtual_Memory;

   -------------------------------------------------------------------------

   procedure Initialize (T : in out Testcase)
   is
   begin
      T.Set_Name (Name => "XML utility tests");
      T.Add_Test_Routine
        (Routine => Create_Virtual_Memory'Access,
         Name    => "Create virtual memory node");
      T.Add_Test_Routine
        (Routine => Create_Subject_Event'Access,
         Name    => "Create subject event node");
      T.Add_Test_Routine
        (Routine => Calculate_PT_Size'Access,
         Name    => "Calculate size of paging structures");
      T.Add_Test_Routine
        (Routine => Calculate_Region_Address'Access,
         Name    => "Calculate address of new allocated region");
   end Initialize;

end XML_Utils_Tests;