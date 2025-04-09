\m5_TLV_version 1d: tl-x.org
\m5
   
   // ============================================
   // Welcome, new visitors! Try the "Learn" menu.
   // ============================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   |calc
      @0
         $reset = *reset;
         
      @1
         $val1 [31:0] = >>2$result [31:0];
         $val2 [31:0] = $rand2[3:0];
         
         $valid = $reset ? 1'b0 : >>1$valid + 1'b1 ;
         $valid_or_reset = $valid || $reset;
         
      ?$vaild_or_reset
         @1   
            $add[31:0] = $val1 + $val2;
            $sub[31:0] = $val1 - $val2;
            $mul[31:0] = $val1 * $val2;
            $div[31:0] = $val1 / $val2;
            
         @2   
            $result [31:0] = $reset ? 32'b0 :
                          ($op[1:0] == 2'b00) ? $add :
                          ($op[1:0] == 2'b01) ? $sub :
                          ($op[1:0] == 2'b10) ? $mul :
                                                $div ;
            
   // Assert these to end simulation (before the cycle limit).
   *passed = *cyc_cnt > 30;
   *failed = 1'b0;
\SV
   endmodule
