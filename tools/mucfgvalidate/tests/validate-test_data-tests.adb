--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Validate.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Validate.Test_Data.Tests is


--  begin read only
   procedure Test_Run (Gnattest_T : in out Test);
   procedure Test_Run_caf683 (Gnattest_T : in out Test) renames Test_Run;
--  id:2.2/caf683ddeff4352b/Run/1/0/
   procedure Test_Run (Gnattest_T : in out Test) is
   --  validate.ads:25:4:Run
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin
      Run (Policy => "data/test_policy.xml");

      --  Positive test, no exceptions must occur.

      XML_Processors.Clear;
--  begin read only
   end Test_Run;
--  end read only


--  begin read only
   procedure Test_Register_All (Gnattest_T : in out Test);
   procedure Test_Register_All_86826d (Gnattest_T : in out Test) renames Test_Register_All;
--  id:2.2/86826d71989a86e2/Register_All/1/0/
   procedure Test_Register_All (Gnattest_T : in out Test) is
   --  validate.ads:30:4:Register_All
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Register_All;
--  end read only

end Validate.Test_Data.Tests;
