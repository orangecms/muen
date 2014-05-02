--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Muxml.Utils.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Muxml.Utils.Test_Data.Tests is


--  begin read only
   procedure Test_Get_Attribute (Gnattest_T : in out Test);
   procedure Test_Get_Attribute_7606a9 (Gnattest_T : in out Test) renames Test_Get_Attribute;
--  id:2.2/7606a922e00da111/Get_Attribute/1/0/
   procedure Test_Get_Attribute (Gnattest_T : in out Test) is
   --  muxml-utils.ads:27:4:Get_Attribute
--  end read only

      pragma Unreferenced (Gnattest_T);

      Impl : DOM.Core.DOM_Implementation;
      Data : XML_Data_Type;
      Node : DOM.Core.Node;
   begin
      Data.Doc := DOM.Core.Create_Document (Implementation => Impl);

      Node := DOM.Core.Documents.Create_Element
        (Doc      => Data.Doc,
         Tag_Name => "parent");
      DOM.Core.Elements.Set_Attribute
        (Elem  => Node,
         Name  => "parentAttr",
         Value => "parent_attribute");
      Append_Child
        (Node      => Data.Doc,
         New_Child => Node);
      Node := DOM.Core.Nodes.Append_Child
        (N         => Node,
         New_Child => DOM.Core.Documents.Create_Element
           (Doc      => Data.Doc,
            Tag_Name => "child"));
      DOM.Core.Elements.Set_Attribute
        (Elem  => Node,
         Name  => "childAttr",
         Value => "child_attribute");

      Append_Child
        (Node      => Node,
         New_Child => DOM.Core.Documents.Create_Element
           (Doc      => Data.Doc,
            Tag_Name => "grandchild"));

      Assert (Condition => Get_Attribute
              (Doc   => Data.Doc,
               XPath => "parent",
               Name  => "parentAttr") = "parent_attribute",
              Message   => "Attribute mismatch (1)");
      Assert (Condition => Get_Attribute
              (Doc   => Data.Doc,
               XPath => "/parent/child",
               Name  => "childAttr") = "child_attribute",
              Message   => "Attribute mismatch (2)");
      Assert (Condition => Get_Attribute
              (Doc   => Data.Doc,
               XPath => "parent",
               Name  => "nonexistent") = "",
              Message   => "Attribute mismatch (3)");
      Assert (Condition => Get_Attribute
              (Doc   => Data.Doc,
               XPath => "//grandchild",
               Name  => "nonexistent") = "",
              Message   => "Attribute mismatch (4)");
      Assert (Condition => Get_Attribute
              (Doc   => Data.Doc,
               XPath => "nonexistent",
               Name  => "someAttribute") = "",
              Message   => "Attribute mismatch (5)");
--  begin read only
   end Test_Get_Attribute;
--  end read only


--  begin read only
   procedure Test_Set_Attribute (Gnattest_T : in out Test);
   procedure Test_Set_Attribute_9ffe3d (Gnattest_T : in out Test) renames Test_Set_Attribute;
--  id:2.2/9ffe3df58c900cd0/Set_Attribute/1/0/
   procedure Test_Set_Attribute (Gnattest_T : in out Test) is
   --  muxml-utils.ads:35:4:Set_Attribute
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Set_Attribute;
--  end read only


--  begin read only
   procedure Test_Get_Element (Gnattest_T : in out Test);
   procedure Test_Get_Element_d0ef1a (Gnattest_T : in out Test) renames Test_Get_Element;
--  id:2.2/d0ef1aa70f2c2b3a/Get_Element/1/0/
   procedure Test_Get_Element (Gnattest_T : in out Test) is
   --  muxml-utils.ads:44:4:Get_Element
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_Element;
--  end read only


--  begin read only
   procedure Test_Get_Element_Value (Gnattest_T : in out Test);
   procedure Test_Get_Element_Value_69bad0 (Gnattest_T : in out Test) renames Test_Get_Element_Value;
--  id:2.2/69bad06be5a13405/Get_Element_Value/1/0/
   procedure Test_Get_Element_Value (Gnattest_T : in out Test) is
   --  muxml-utils.ads:52:4:Get_Element_Value
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_Element_Value;
--  end read only


--  begin read only
   procedure Test_Append (Gnattest_T : in out Test);
   procedure Test_Append_6bcf00 (Gnattest_T : in out Test) renames Test_Append;
--  id:2.2/6bcf005e971aed10/Append/1/0/
   procedure Test_Append (Gnattest_T : in out Test) is
   --  muxml-utils.ads:58:4:Append
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Append;
--  end read only


--  begin read only
   procedure Test_Append_Child (Gnattest_T : in out Test);
   procedure Test_Append_Child_0b6f31 (Gnattest_T : in out Test) renames Test_Append_Child;
--  id:2.2/0b6f317beeb588d9/Append_Child/1/0/
   procedure Test_Append_Child (Gnattest_T : in out Test) is
   --  muxml-utils.ads:63:4:Append_Child
--  end read only

      pragma Unreferenced (Gnattest_T);

      use type DOM.Core.Node;

      Impl : DOM.Core.DOM_Implementation;
      Data : XML_Data_Type;
      Node, Child : DOM.Core.Node;
   begin
      Data.Doc := DOM.Core.Create_Document (Implementation => Impl);

      Node := DOM.Core.Documents.Create_Element (Doc      => Data.Doc,
                                                 Tag_Name => "node");
      Child := DOM.Core.Documents.Create_Element (Doc     => Data.Doc,
                                                  Tag_Name => "child");
      Append_Child (Node      => Node,
                    New_Child => Child);

      Assert (Condition => DOM.Core.Nodes.Has_Child_Nodes (N => Node),
              Message   => "Error appending child");
      Assert (Condition => DOM.Core.Nodes.First_Child (N => Node) = Child,
              Message   => "Child mismatch");
--  begin read only
   end Test_Append_Child;
--  end read only


--  begin read only
   procedure Test_Merge (Gnattest_T : in out Test);
   procedure Test_Merge_64a439 (Gnattest_T : in out Test) renames Test_Merge;
--  id:2.2/64a439c9547e9313/Merge/1/0/
   procedure Test_Merge (Gnattest_T : in out Test) is
   --  muxml-utils.ads:77:4:Merge
--  end read only

      pragma Unreferenced (Gnattest_T);
   begin
      declare
         Data : Muxml.XML_Data_Type;
         Impl : DOM.Core.DOM_Implementation;
         Doc  : constant DOM.Core.Document
           := DOM.Core.Create_Document (Implementation => Impl);
         Node, Tmp : DOM.Core.Node;
      begin
         Muxml.Parse (Data => Data,
                      Kind => Muxml.VCPU_Profile,
                      File => "data/vcpu_profile.xml");

         --  Construct the following XML structure:
         --  <vcpu><segments><cs selector="16#ffff#>text</cs></segments></vcpu>

         Node := DOM.Core.Documents.Create_Element
           (Doc      => Doc,
            Tag_Name => "cs");
         DOM.Core.Elements.Set_Attribute
           (Elem  => Node,
            Name  => "access",
            Value => "16#cafe#");
         DOM.Core.Elements.Set_Attribute
           (Elem  => Node,
            Name  => "selector",
            Value => "16#ffff#");
         Append_Child
           (Node      => Node,
            New_Child => DOM.Core.Documents.Create_Text_Node
              (Doc  => Doc,
               Data => "text"));
         Tmp := DOM.Core.Documents.Create_Element
           (Doc      => Doc,
            Tag_Name => "segments");
         Append_Child (Node      => Tmp,
                       New_Child => Node);
         Node := DOM.Core.Documents.Create_Element
           (Doc      => Doc,
            Tag_Name => "vcpu");
         Append_Child (Node      => Node,
                       New_Child => Tmp);
         Append_Child
           (Node      => Doc,
            New_Child => Node);

         Assert
           (Condition => Get_Attribute
              (Doc   => Data.Doc,
               XPath => "/vcpu/segments/cs",
               Name  => "selector") = "16#0008#",
            Message   => "Unexpected cs selector attribute in vcpu policy");

         Merge (Left  => Data.Doc,
                Right => Doc);

         Assert (Condition => Get_Attribute
                 (Doc   => Data.Doc,
                  XPath => "/vcpu/segments/cs",
                  Name  => "access") = "16#cafe#",
                 Message   => "Error merging XML nodes: cs access");
         Assert (Condition => Get_Attribute
                 (Doc   => Data.Doc,
                  XPath => "/vcpu/segments/cs",
                  Name  => "selector") = "16#ffff#",
                 Message   => "Error merging XML nodes: cs selector");
      end;

      Merge_Nodes_Name_Mismatch:
      declare
         Impl : DOM.Core.DOM_Implementation;
         Doc  : constant DOM.Core.Document
           := DOM.Core.Create_Document (Implementation => Impl);
         Node_A, Node_B : DOM.Core.Node;
      begin
         Node_A := DOM.Core.Documents.Create_Element
           (Doc      => Doc,
            Tag_Name => "A");
         DOM.Core.Elements.Set_Attribute
           (Elem  => Node_A,
            Name  => "attr",
            Value => "foobar");
         Append_Child (Node      => Doc,
                       New_Child => Node_A);

         Node_B := DOM.Core.Documents.Create_Element
           (Doc      => Doc,
            Tag_Name => "B");
         DOM.Core.Elements.Set_Attribute
           (Elem  => Node_B,
            Name  => "attr",
            Value => "16#cafe#");

         Merge (Left  => Node_A,
                Right => Node_B);

         Assert (Condition => DOM.Core.Elements.Get_Attribute
                 (Elem => Node_A,
                  Name => "attr") = "foobar",
                 Message   => "Node B merged into Node A");
      end Merge_Nodes_Name_Mismatch;
--  begin read only
   end Test_Merge;
--  end read only


--  begin read only
   procedure Test_Ancestor_Node (Gnattest_T : in out Test);
   procedure Test_Ancestor_Node_314569 (Gnattest_T : in out Test) renames Test_Ancestor_Node;
--  id:2.2/3145695d1e1d2313/Ancestor_Node/1/0/
   procedure Test_Ancestor_Node (Gnattest_T : in out Test) is
   --  muxml-utils.ads:83:4:Ancestor_Node
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Ancestor_Node;
--  end read only


--  begin read only
   procedure Test_Remove_Child (Gnattest_T : in out Test);
   procedure Test_Remove_Child_540ca0 (Gnattest_T : in out Test) renames Test_Remove_Child;
--  id:2.2/540ca0eb2b0d8bd4/Remove_Child/1/0/
   procedure Test_Remove_Child (Gnattest_T : in out Test) is
   --  muxml-utils.ads:91:4:Remove_Child
--  end read only

      pragma Unreferenced (Gnattest_T);

      Node     : DOM.Core.Node;
      Dom_Impl : DOM.Core.DOM_Implementation;
      Doc      : constant DOM.Core.Document
        := DOM.Core.Create_Document (Implementation => Dom_Impl);
   begin
      Node := DOM.Core.Documents.Create_Element
        (Doc      => Doc,
         Tag_Name => "elem");

      Append_Child (Node      => Doc,
                    New_Child => Node);

      Assert (Condition => DOM.Core.Nodes.Has_Child_Nodes (N => Doc),
              Message   => "Unable to add child to document");

      Remove_Child (Node       => Doc,
                    Child_Name => "elem");

      Assert (Condition => not DOM.Core.Nodes.Has_Child_Nodes (N => Doc),
              Message   => "Error removing child node");

      begin
         Remove_Child (Node       => Doc,
                       Child_Name => "elem");
         Assert (Condition => False,
                 Message   => "Exception expected");

      exception
         when E : XML_Error =>
            Assert (Condition => Ada.Exceptions.Exception_Message (X => E)
                    = "Unable to remove child 'elem' from node '#document'",
                    Message   => "Exception mismatch");
      end;
--  begin read only
   end Test_Remove_Child;
--  end read only

end Muxml.Utils.Test_Data.Tests;
