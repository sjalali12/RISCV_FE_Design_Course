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
   |comp
        @0
         //Program Counter Implementation
         $pc[31:0] = >>1$reset ? 32'd0 :
               //>>1$taken_br ? >>1$br_tgt_pc :
               >>3$valid_taken_br ? >>3$br_tgt_pc :
               //>>1$pc + 32'd4;
               //>>3$inc_pc;
               >>3$valid_load ? >>3$inc_pc :
               >>3$valid_jump && >>3$is_jal ? >>3$br_tgt_pc :
               >>3$valid_jump && >>3$is_jalr ? >>3$jalr_tgt_pc :
               >>1$inc_pc;
        
   //...
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
