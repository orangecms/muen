--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Expanders.Kernel.Test_Data is

   -------------------------------------------------------------------------

   procedure Set_Up (Gnattest_T : in out Test) is
      pragma Unreferenced (Gnattest_T);
   begin
      null;
   end Set_Up;

   -------------------------------------------------------------------------

   procedure Tear_Down (Gnattest_T : in out Test) is
      pragma Unreferenced (Gnattest_T);
   begin
      null;
   end Tear_Down;

   -------------------------------------------------------------------------

   procedure Pre_Sched_Group_Info_Mappings (Data : in out Muxml.XML_Data_Type)
   is
   begin
      Subjects.Add_Tau0 (Data => Data);
      Pre_Subj_Mappings (Data => Data);
   end Pre_Sched_Group_Info_Mappings;

   -------------------------------------------------------------------------

   procedure Pre_Subj_Mappings (Data : in out Muxml.XML_Data_Type)
   is
   begin
      Add_Section_Skeleton (Data => Data);
      Subjects.Add_Ids (Data => Data);
      Subjects.Add_CPU_Ids (Data => Data);
   end Pre_Subj_Mappings;

   -------------------------------------------------------------------------

   procedure Pre_Subj_MSR_Store_Mappings (Data : in out Muxml.XML_Data_Type)
   is
   begin
      Pre_Subj_Mappings (Data => Data);
      Subjects.Handle_Profile (Data => Data);
      Memory.Add_Subject_MSR_Store (Data => Data);
   end Pre_Subj_MSR_Store_Mappings;

end Expanders.Kernel.Test_Data;
