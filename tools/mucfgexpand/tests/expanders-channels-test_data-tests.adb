--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Expanders.Channels.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Expanders.Channels.Test_Data.Tests is


--  begin read only
   procedure Test_Add_Physical_Memory (Gnattest_T : in out Test);
   procedure Test_Add_Physical_Memory_127041 (Gnattest_T : in out Test) renames Test_Add_Physical_Memory;
--  id:2.2/127041296e3a499b/Add_Physical_Memory/1/0/
   procedure Test_Add_Physical_Memory (Gnattest_T : in out Test) is
   --  expanders-channels.ads:24:4:Add_Physical_Memory
--  end read only

      pragma Unreferenced (Gnattest_T);

      ----------------------------------------------------------------------

      procedure No_Channels_Section
      is
         Policy : Muxml.XML_Data_Type;
      begin
         Muxml.Parse (Data => Policy,
                      Kind => Muxml.Format_Src,
                      File => "data/test_policy.xml");

         Muxml.Utils.Remove_Child
           (Node       => Muxml.Utils.Get_Element
              (Doc   => Policy.Doc,
               XPath => "/system"),
            Child_Name => "channels");

         Expanders.Channels.Add_Physical_Memory (Data => Policy);

         --  Must not raise an exception.

      end No_Channels_Section;
   begin
      Test_Utils.Expander.Run_Test
        (Filename     => "obj/channels_memory.xml",
         Ref_Filename => "data/channels_memory.ref.xml",
         Expander     => Expanders.Channels.Add_Physical_Memory'Access);

      No_Channels_Section;
--  begin read only
   end Test_Add_Physical_Memory;
--  end read only

end Expanders.Channels.Test_Data.Tests;