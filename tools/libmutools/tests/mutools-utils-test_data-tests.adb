--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Mutools.Utils.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Mutools.Utils.Test_Data.Tests is


--  begin read only
   procedure Test_Bit_Test (Gnattest_T : in out Test);
   procedure Test_Bit_Test_b20131 (Gnattest_T : in out Test) renames Test_Bit_Test;
--  id:2.2/b201318c7b3f783a/Bit_Test/1/0/
   procedure Test_Bit_Test (Gnattest_T : in out Test) is
   --  mutools-utils.ads:28:4:Bit_Test
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin
      Assert (Condition => Bit_Test
              (Value => 512,
               Pos   => 9),
              Message   => "Bit not set");
      Assert (Condition => not Bit_Test
              (Value => 512,
               Pos   => 8),
              Message   => "Bit set");
--  begin read only
   end Test_Bit_Test;
--  end read only


--  begin read only
   procedure Test_Bit_Set (Gnattest_T : in out Test);
   procedure Test_Bit_Set_1ea4aa (Gnattest_T : in out Test) renames Test_Bit_Set;
--  id:2.2/1ea4aa8030cf5e4e/Bit_Set/1/0/
   procedure Test_Bit_Set (Gnattest_T : in out Test) is
   --  mutools-utils.ads:34:4:Bit_Set
--  end read only

      pragma Unreferenced (Gnattest_T);

      use type Interfaces.Unsigned_64;

      Ref_Num_1 : constant Interfaces.Unsigned_64 := 16#800000#;
      Ref_Num_2 : constant Interfaces.Unsigned_64 := 16#A000800000#;
      Number    : Interfaces.Unsigned_64          := 0;
   begin
      for I in Utils.Unsigned_64_Pos'Range loop
         Assert (Condition => not Bit_Test
                 (Value => Number,
                  Pos   => I),
                 Message   => "Bit" & I'Img & " set");
      end loop;

      Number := Utils.Bit_Set (Value => Number,
                               Pos   => 23);
      Assert (Condition => Number = Ref_Num_1,
              Message   => "Number mismatch (1)");
      Assert (Condition => Bit_Test
              (Value => Number,
               Pos   => 23),
              Message   => "Bit 23 not set");

      Number := Bit_Set (Value => Number,
                         Pos   => 37);
      Number := Bit_Set (Value => Number,
                         Pos   => 39);
      Assert (Condition => Number = Ref_Num_2,
              Message   => "Number mismatch (2)");
--  begin read only
   end Test_Bit_Set;
--  end read only


--  begin read only
   procedure Test_Bit_Clear (Gnattest_T : in out Test);
   procedure Test_Bit_Clear_ad7498 (Gnattest_T : in out Test) renames Test_Bit_Clear;
--  id:2.2/ad749817baa4ad02/Bit_Clear/1/0/
   procedure Test_Bit_Clear (Gnattest_T : in out Test) is
   --  mutools-utils.ads:40:4:Bit_Clear
--  end read only

      pragma Unreferenced (Gnattest_T);

      use type Interfaces.Unsigned_64;
   begin
      Assert (Condition => Bit_Clear
              (Value => 512,
               Pos   => 9) = 0,
              Message   => "Bit not cleared");
--  begin read only
   end Test_Bit_Clear;
--  end read only


--  begin read only
   procedure Test_To_Hex (Gnattest_T : in out Test);
   procedure Test_To_Hex_cea88e (Gnattest_T : in out Test) renames Test_To_Hex;
--  id:2.2/cea88e075ae00656/To_Hex/1/0/
   procedure Test_To_Hex (Gnattest_T : in out Test) is
   --  mutools-utils.ads:49:4:To_Hex
--  end read only

      pragma Unreferenced (Gnattest_T);

      Ref_First  : constant String := "0";
      Ref_Last   : constant String := "ffffffffffffffff";
      Ref_Number : constant String := "deadcafebeefbeef";
      Norm_First : constant String := "16#0000#";
      Norm_Last  : constant String := "16#ffff_ffff_ffff_ffff#";
      Norm_Num   : constant String := "16#dead_cafe_beef_beef#";
      Norm_Num2  : constant String := "16#00de_adbe_efbe#";
      Norm_Short : constant String := "16#23#";
      Number     : constant Interfaces.Unsigned_64 := 16#deadcafebeefbeef#;
   begin
      Assert (Condition => To_Hex
              (Number    => Interfaces.Unsigned_64'First,
               Normalize => False) = Ref_First,
              Message   => "Unsigned_64'First hex string mismatch");
      Assert (Condition => To_Hex
              (Number    => Interfaces.Unsigned_64'Last,
               Normalize => False) = Ref_Last,
              Message   => "Unsigned_64'Last hex string mismatch");
      Assert (Condition => To_Hex
              (Number    => Number,
               Normalize => False) = Ref_Number,
              Message   => "Hex string without prefix mismatch");
      Assert (Condition => To_Hex
              (Number    => Interfaces.Unsigned_64'First,
               Normalize => True) = Norm_First,
              Message   => "Normalized Unsigned_64'First hex string mismatch");
      Assert (Condition => To_Hex
              (Number    => Interfaces.Unsigned_64'Last,
               Normalize => True) = Norm_Last,
              Message   => "Normalized Unsigned_64'Last hex string mismatch");
      Assert (Condition => To_Hex
              (Number    => Number,
               Normalize => True) = Norm_Num,
              Message   => "Normalized " & Norm_Num & " hex string mismatch");
      Assert (Condition => To_Hex
              (Number    => 16#de_adbe_efbe#,
               Normalize => True) = Norm_Num2,
              Message   => "Normalized " & Norm_Num2 & " hex string mismatch");
      Assert (Condition => To_Hex
              (Number     => 16#23#,
               Normalize  => True,
               Byte_Short => True) = Norm_Short,
              Message   => "Normalized 16#23# hex string mismatch");
--  begin read only
   end Test_To_Hex;
--  end read only


--  begin read only
   procedure Test_Decode_Entity_Name (Gnattest_T : in out Test);
   procedure Test_Decode_Entity_Name_ec79f4 (Gnattest_T : in out Test) renames Test_Decode_Entity_Name;
--  id:2.2/ec79f4ba16a29875/Decode_Entity_Name/1/0/
   procedure Test_Decode_Entity_Name (Gnattest_T : in out Test) is
   --  mutools-utils.ads:57:4:Decode_Entity_Name
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin
      Assert (Condition => Decode_Entity_Name
              (Encoded_Str => "linux|zp") = "linux",
              Message   => "Entity name mismatch");
--  begin read only
   end Test_Decode_Entity_Name;
--  end read only


--  begin read only
   procedure Test_Is_Managed_By_VMX (Gnattest_T : in out Test);
   procedure Test_Is_Managed_By_VMX_d49f3b (Gnattest_T : in out Test) renames Test_Is_Managed_By_VMX;
--  id:2.2/d49f3b4fcfb97944/Is_Managed_By_VMX/1/0/
   procedure Test_Is_Managed_By_VMX (Gnattest_T : in out Test) is
   --  mutools-utils.ads:62:4:Is_Managed_By_VMX
--  end read only

      pragma Unreferenced (Gnattest_T);

      use Mutools.Constants;

      subtype Handled_MSR is
        Interfaces.Unsigned_64 with Static_Predicate => Handled_MSR in
          IA32_SYSENTER_CS | IA32_SYSENTER_ESP | IA32_SYSENTER_EIP
            | IA32_FS_BASE | IA32_GS_BASE;
   begin
      for MSR in Handled_MSR loop
         Assert (Condition => Is_Managed_By_VMX
                 (MSR                    => MSR,
                  DEBUGCTL_Control       => False,
                  PAT_Control            => False,
                  PERFGLOBALCTRL_Control => False,
                  EFER_Control           => False),
                 Message   => To_Hex (Number => MSR) & " not managed by VMX");
      end loop;


      Assert (Condition => not Is_Managed_By_VMX
              (MSR                    => IA32_KERNEL_GS_BASE,
               DEBUGCTL_Control       => False,
               PAT_Control            => False,
               PERFGLOBALCTRL_Control => False,
               EFER_Control           => False),
              Message   => "IA32_KERNEL_GS_BASE managed by VMX");

      Assert (Condition => Is_Managed_By_VMX
              (MSR                    => IA32_DEBUGCTL,
               DEBUGCTL_Control       => True,
               PAT_Control            => False,
               PERFGLOBALCTRL_Control => False,
               EFER_Control           => False),
              Message   => "IA32_DEBUGCTL not managed by VMX");
      Assert (Condition => not Is_Managed_By_VMX
              (MSR                    => IA32_DEBUGCTL,
               DEBUGCTL_Control       => False,
               PAT_Control            => False,
               PERFGLOBALCTRL_Control => False,
               EFER_Control           => False),
              Message   => "IA32_DEBUGCTL managed by VMX");

      Assert (Condition => Is_Managed_By_VMX
              (MSR                    => IA32_PAT,
               DEBUGCTL_Control       => False,
               PAT_Control            => True,
               PERFGLOBALCTRL_Control => False,
               EFER_Control           => False),
              Message   => "IA32_PAT not managed by VMX");
      Assert (Condition => not Is_Managed_By_VMX
              (MSR                    => IA32_PAT,
               DEBUGCTL_Control       => False,
               PAT_Control            => False,
               PERFGLOBALCTRL_Control => False,
               EFER_Control           => False),
              Message   => "IA32_PAT managed by VMX");

      Assert (Condition => Is_Managed_By_VMX
              (MSR                    => IA32_PERF_GLOBAL_CTRL,
               DEBUGCTL_Control       => False,
               PAT_Control            => False,
               PERFGLOBALCTRL_Control => True,
               EFER_Control           => False),
              Message   => "IA32_PERF_GLOBAL_CTRL not managed by VMX");
      Assert (Condition => not Is_Managed_By_VMX
              (MSR                    => IA32_PERF_GLOBAL_CTRL,
               DEBUGCTL_Control       => False,
               PAT_Control            => False,
               PERFGLOBALCTRL_Control => False,
               EFER_Control           => False),
              Message   => "IA32_PER_GLOBAL_CTRL managed by VMX");

      Assert (Condition => Is_Managed_By_VMX
              (MSR                    => IA32_EFER,
               DEBUGCTL_Control       => False,
               PAT_Control            => False,
               PERFGLOBALCTRL_Control => False,
               EFER_Control           => True),
              Message   => "IA32_EFER not managed by VMX");
      Assert (Condition => not Is_Managed_By_VMX
              (MSR                    => IA32_EFER,
               DEBUGCTL_Control       => False,
               PAT_Control            => False,
               PERFGLOBALCTRL_Control => False,
               EFER_Control           => False),
              Message   => "IA32_EFER managed by VMX");
--  begin read only
   end Test_Is_Managed_By_VMX;
--  end read only

end Mutools.Utils.Test_Data.Tests;