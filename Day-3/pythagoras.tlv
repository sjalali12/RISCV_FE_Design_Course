\m5_TLV_version 1d: tl-x.org
\m5
   
   // ============================================
   // Welcome, new visitors! Try the "Learn" menu.
   // ============================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing reqd top-module defn, random stimulus & Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
   `include "sqrt32.v";

\TLV
   //.$reset = *reset;
   
   |calc
      @1
         $a[7:0] = $rand1[3:0];
         $b[7:0] = $rand2[3:0];
         $aa_sq[15:0] = $a[7:0] ** 2;
         $bb_sq[15:0] = $b[7:0] ** 2;
      @2
         $cc_sq[15:0] = $aa_sq + $bb_sq;
      @3
         $c[7:0] = sqrt($cc_sq);

   
   // Assert these to end simulation (before the cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
