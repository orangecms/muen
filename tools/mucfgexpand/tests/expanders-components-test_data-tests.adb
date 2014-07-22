--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Expanders.Components.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Expanders.Components.Test_Data.Tests is


--  begin read only
   procedure Test_Remove_Components (Gnattest_T : in out Test);
   procedure Test_Remove_Components_6de748 (Gnattest_T : in out Test) renames Test_Remove_Components;
--  id:2.2/6de748c3fcaaadad/Remove_Components/1/0/
   procedure Test_Remove_Components (Gnattest_T : in out Test) is
   --  expanders-components.ads:23:4:Remove_Components
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin
      Test_Utils.Expander.Run_Test
        (Filename     => "obj/components_remove.xml",
         Ref_Filename => "data/components_remove.ref.xml",
         Expander     => Remove_Components'Access);
--  begin read only
   end Test_Remove_Components;
--  end read only

end Expanders.Components.Test_Data.Tests;
