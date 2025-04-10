\m5_TLV_version 1d: tl-x.org
\m5
   
   // =================================================
   // Welcome!  New to Makerchip? Try the "Learn" menu.
   // =================================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   
   //Basic Gates
   $not = !$in1;
   $and = $in1 && $in2;
   $or = $in1 || $in2;
   $xor = $in1 ^ $in2;
   $nand = ! ($in1 && $in2);
   $nor = ! ( $in1 || $in2);
   
   //Arithmetic Operations
   $result[7:0] = $sel[1] ? ( $sel[0] ? $a[7:0] / $b[7:0] : $a[7:0] * $b[7:0]) :
                             ( $sel[0] ? $a[7:0] - $b[7:0] : $a[7:0] + $b[7:0]);
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule

