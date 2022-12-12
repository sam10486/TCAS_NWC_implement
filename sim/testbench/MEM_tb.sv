`include "../include/define.svh"
`define CYCLE 10
`include "memory_wrapper.sv"

module Testbench ();
    logic clk;
    logic rst;
    logic LAST_STAGE,
    logic [`D_width-1:0] data_in0,
    logic [`D_width-1:0] data_in1,
    logic [`D_width-1:0] data_in2,
    logic [`D_width-1:0] data_in3,
    logic [`D_width-1:0] data_in4,
    logic [`D_width-1:0] data_in5,
    logic [`D_width-1:0] data_in6,
    logic [`D_width-1:0] data_in7,
    logic [`D_width-1:0] data_in8,
    logic [`D_width-1:0] data_in9,
    logic [`D_width-1:0] data_in10,
    logic [`D_width-1:0] data_in11,
    logic [`D_width-1:0] data_in12,
    logic [`D_width-1:0] data_in13,
    logic [`D_width-1:0] data_in14,
    logic [`D_width-1:0] data_in15,
    logic [`MA_width-1:0] MA0_idx,
    logic [`MA_width-1:0] MA1_idx,
    logic [`MA_width-1:0] MA2_idx,
    logic [`MA_width-1:0] MA3_idx,
    logic [`MA_width-1:0] MA4_idx,
    logic [`MA_width-1:0] MA5_idx,
    logic [`MA_width-1:0] MA6_idx,
    logic [`MA_width-1:0] MA7_idx,
    logic [`MA_width-1:0] MA8_idx,
    logic [`MA_width-1:0] MA9_idx,
    logic [`MA_width-1:0] MA10_idx,
    logic [`MA_width-1:0] MA11_idx,
    logic [`MA_width-1:0] MA12_idx,
    logic [`MA_width-1:0] MA13_idx,
    logic [`MA_width-1:0] MA14_idx,
    logic [`MA_width-1:0] MA15_idx,
    logic [`BANK_width-1:0] BN0_idx,
    logic [`BANK_width-1:0] BN1_idx,
    logic [`BANK_width-1:0] BN2_idx,
    logic [`BANK_width-1:0] BN3_idx,
    logic [`BANK_width-1:0] BN4_idx,
    logic [`BANK_width-1:0] BN5_idx,
    logic [`BANK_width-1:0] BN6_idx,
    logic [`BANK_width-1:0] BN7_idx,
    logic [`BANK_width-1:0] BN8_idx,
    logic [`BANK_width-1:0] BN9_idx,
    logic [`BANK_width-1:0] BN10_idx,
    logic [`BANK_width-1:0] BN11_idx,
    logic [`BANK_width-1:0] BN12_idx,
    logic [`BANK_width-1:0] BN13_idx,
    logic [`BANK_width-1:0] BN14_idx,
    logic [`BANK_width-1:0] BN15_idx,

    logic r_enable,
    logic w_enable,
    logic clk,
    logic rst,
    logic [`MA_width-1:0] R16_w_MA0_idx,
    logic [`MA_width-1:0] R16_w_MA1_idx,
    logic [`MA_width-1:0] R16_w_MA2_idx,
    logic [`MA_width-1:0] R16_w_MA3_idx,
    logic [`MA_width-1:0] R16_w_MA4_idx,
    logic [`MA_width-1:0] R16_w_MA5_idx,
    logic [`MA_width-1:0] R16_w_MA6_idx,
    logic [`MA_width-1:0] R16_w_MA7_idx,
    logic [`MA_width-1:0] R16_w_MA8_idx,
    logic [`MA_width-1:0] R16_w_MA9_idx,
    logic [`MA_width-1:0] R16_w_MA10_idx,
    logic [`MA_width-1:0] R16_w_MA11_idx,
    logic [`MA_width-1:0] R16_w_MA12_idx,
    logic [`MA_width-1:0] R16_w_MA13_idx,
    logic [`MA_width-1:0] R16_w_MA14_idx,
    logic [`MA_width-1:0] R16_w_MA15_idx,
    logic [`BANK_width-1:0] R16_w_BN0_idx,
    logic [`BANK_width-1:0] R16_w_BN1_idx,
    logic [`BANK_width-1:0] R16_w_BN2_idx,
    logic [`BANK_width-1:0] R16_w_BN3_idx,
    logic [`BANK_width-1:0] R16_w_BN4_idx,
    logic [`BANK_width-1:0] R16_w_BN5_idx,
    logic [`BANK_width-1:0] R16_w_BN6_idx,
    logic [`BANK_width-1:0] R16_w_BN7_idx,
    logic [`BANK_width-1:0] R16_w_BN8_idx,
    logic [`BANK_width-1:0] R16_w_BN9_idx,
    logic [`BANK_width-1:0] R16_w_BN10_idx,
    logic [`BANK_width-1:0] R16_w_BN11_idx,
    logic [`BANK_width-1:0] R16_w_BN12_idx,
    logic [`BANK_width-1:0] R16_w_BN13_idx,
    logic [`BANK_width-1:0] R16_w_BN14_idx,
    logic [`BANK_width-1:0] R16_w_BN15_idx,
    //output
    logic [`D_width-1:0] memory_b0,
    logic [`D_width-1:0] memory_b1,
    logic [`D_width-1:0] memory_b2,
    logic [`D_width-1:0] memory_b3,
    logic [`D_width-1:0] memory_b4,
    logic [`D_width-1:0] memory_b5,
    logic [`D_width-1:0] memory_b6,
    logic [`D_width-1:0] memory_b7,
    logic [`D_width-1:0] memory_b8,
    logic [`D_width-1:0] memory_b9,
    logic [`D_width-1:0] memory_b10,
    logic [`D_width-1:0] memory_b11,
    logic [`D_width-1:0] memory_b12,
    logic [`D_width-1:0] memory_b13,
    logic [`D_width-1:0] memory_b14,
    logic [`D_width-1:0] memory_b15,
    logic r_enable_out,
    logic w_enable_out,
    logic [`MA_width-1:0] MA0_idx_out,
    logic [`MA_width-1:0] MA1_idx_out,
    logic [`MA_width-1:0] MA2_idx_out,
    logic [`MA_width-1:0] MA3_idx_out,
    logic [`MA_width-1:0] MA4_idx_out,
    logic [`MA_width-1:0] MA5_idx_out,
    logic [`MA_width-1:0] MA6_idx_out,
    logic [`MA_width-1:0] MA7_idx_out,
    logic [`MA_width-1:0] MA8_idx_out,
    logic [`MA_width-1:0] MA9_idx_out,
    logic [`MA_width-1:0] MA10_idx_out,
    logic [`MA_width-1:0] MA11_idx_out,
    logic [`MA_width-1:0] MA12_idx_out,
    logic [`MA_width-1:0] MA13_idx_out,
    logic [`MA_width-1:0] MA14_idx_out,
    logic [`MA_width-1:0] MA15_idx_out,
    logic [`BANK_width-1:0] BN0_idx_out,
    logic [`BANK_width-1:0] BN1_idx_out,
    logic [`BANK_width-1:0] BN2_idx_out,
    logic [`BANK_width-1:0] BN3_idx_out,
    logic [`BANK_width-1:0] BN4_idx_out,
    logic [`BANK_width-1:0] BN5_idx_out,
    logic [`BANK_width-1:0] BN6_idx_out,
    logic [`BANK_width-1:0] BN7_idx_out,
    logic [`BANK_width-1:0] BN8_idx_out,
    logic [`BANK_width-1:0] BN9_idx_out,
    logic [`BANK_width-1:0] BN10_idx_out,
    logic [`BANK_width-1:0] BN11_idx_out,
    logic [`BANK_width-1:0] BN12_idx_out,
    logic [`BANK_width-1:0] BN13_idx_out,
    logic [`BANK_width-1:0] BN14_idx_out,
    logic [`BANK_width-1:0] BN15_idx_out

    memory_wrapper memory_wrapper(
        //input
        .LAST_STAGE (LAST_STAGE ),
        .data_in0   (data_in0   ),
        .data_in1   (data_in1   ),
        .data_in2   (data_in2   ),
        .data_in3   (data_in3   ),
        .data_in4   (data_in4   ),
        .data_in5   (data_in5   ),
        .data_in6   (data_in6   ),
        .data_in7   (data_in7   ),
        .data_in8   (data_in8   ),
        .data_in9   (data_in9   ),
        .data_in10  (data_in10  ),
        .data_in11  (data_in11  ),
        .data_in12  (data_in12  ),
        .data_in13  (data_in13  ),
        .data_in14  (data_in14  ),
        .data_in15  (data_in15  ),

        .MA0_idx   (MA0_idx  ),
        .MA1_idx   (MA1_idx  ),
        .MA2_idx   (MA2_idx  ),
        .MA3_idx   (MA3_idx  ),
        .MA4_idx   (MA4_idx  ),
        .MA5_idx   (MA5_idx  ),
        .MA6_idx   (MA6_idx  ),
        .MA7_idx   (MA7_idx  ),
        .MA8_idx   (MA8_idx  ),
        .MA9_idx   (MA9_idx  ),
        .MA10_idx  (MA10_idx ),
        .MA11_idx  (MA11_idx ),
        .MA12_idx  (MA12_idx ),
        .MA13_idx  (MA13_idx ),
        .MA14_idx  (MA14_idx ),
        .MA15_idx  (MA15_idx ),

        .BN0_idx    (BN0_idx ),
        .BN1_idx    (BN1_idx ),
        .BN2_idx    (BN2_idx ),
        .BN3_idx    (BN3_idx ),
        .BN4_idx    (BN4_idx ),
        .BN5_idx    (BN5_idx ),
        .BN6_idx    (BN6_idx ),
        .BN7_idx    (BN7_idx ),
        .BN8_idx    (BN8_idx ),
        .BN9_idx    (BN9_idx ),
        .BN10_idx   (BN10_idx),
        .BN11_idx   (BN11_idx),
        .BN12_idx   (BN12_idx),
        .BN13_idx   (BN13_idx),
        .BN14_idx   (BN14_idx),
        .BN15_idx   (BN15_idx),

        .r_enable   (r_enable),
        .w_enable   (w_enable),
        .clk        (clk     ),
        .rst        (rst     ),

        .R16_w_MA0_idx (R16_w_MA0_idx ),
        .R16_w_MA1_idx (R16_w_MA1_idx ),
        .R16_w_MA2_idx (R16_w_MA2_idx ),
        .R16_w_MA3_idx (R16_w_MA3_idx ),
        .R16_w_MA4_idx (R16_w_MA4_idx ),
        .R16_w_MA5_idx (R16_w_MA5_idx ),
        .R16_w_MA6_idx (R16_w_MA6_idx ),
        .R16_w_MA7_idx (R16_w_MA7_idx ),
        .R16_w_MA8_idx (R16_w_MA8_idx ),
        .R16_w_MA9_idx (R16_w_MA9_idx ),
        .R16_w_MA10_idx(R16_w_MA10_idx),
        .R16_w_MA11_idx(R16_w_MA11_idx),
        .R16_w_MA12_idx(R16_w_MA12_idx),
        .R16_w_MA13_idx(R16_w_MA13_idx),
        .R16_w_MA14_idx(R16_w_MA14_idx),
        .R16_w_MA15_idx(R16_w_MA15_idx),

        .R16_w_BN0_idx   (R16_w_BN0_idx  ),
        .R16_w_BN1_idx   (R16_w_BN1_idx  ),
        .R16_w_BN2_idx   (R16_w_BN2_idx  ),
        .R16_w_BN3_idx   (R16_w_BN3_idx  ),
        .R16_w_BN4_idx   (R16_w_BN4_idx  ),
        .R16_w_BN5_idx   (R16_w_BN5_idx  ),
        .R16_w_BN6_idx   (R16_w_BN6_idx  ),
        .R16_w_BN7_idx   (R16_w_BN7_idx  ),
        .R16_w_BN8_idx   (R16_w_BN8_idx  ),
        .R16_w_BN9_idx   (R16_w_BN9_idx  ),
        .R16_w_BN10_idx  (R16_w_BN10_idx ),
        .R16_w_BN11_idx  (R16_w_BN11_idx ),
        .R16_w_BN12_idx  (R16_w_BN12_idx ),
        .R16_w_BN13_idx  (R16_w_BN13_idx ),
        .R16_w_BN14_idx  (R16_w_BN14_idx ),
        .R16_w_BN15_idx  (R16_w_BN15_idx ),

        //output
        .memory_b0   (memory_b0 ),
        .memory_b1   (memory_b1 ),
        .memory_b2   (memory_b2 ),
        .memory_b3   (memory_b3 ),
        .memory_b4   (memory_b4 ),
        .memory_b5   (memory_b5 ),
        .memory_b6   (memory_b6 ),
        .memory_b7   (memory_b7 ),
        .memory_b8   (memory_b8 ),
        .memory_b9   (memory_b9 ),
        .memory_b10  (memory_b10),
        .memory_b11  (memory_b11),
        .memory_b12  (memory_b12),
        .memory_b13  (memory_b13),
        .memory_b14  (memory_b14),
        .memory_b15  (memory_b15),

        .r_enable_out(r_enable_out),
        .w_enable_out(w_enable_out),

        .MA0_idx_out    (MA0_idx_out  ),
        .MA1_idx_out    (MA1_idx_out  ),
        .MA2_idx_out    (MA2_idx_out  ),
        .MA3_idx_out    (MA3_idx_out  ),
        .MA4_idx_out    (MA4_idx_out  ),
        .MA5_idx_out    (MA5_idx_out  ),
        .MA6_idx_out    (MA6_idx_out  ),
        .MA7_idx_out    (MA7_idx_out  ),
        .MA8_idx_out    (MA8_idx_out  ),
        .MA9_idx_out    (MA9_idx_out  ),
        .MA10_idx_out   (MA10_idx_out ),
        .MA11_idx_out   (MA11_idx_out ),
        .MA12_idx_out   (MA12_idx_out ),
        .MA13_idx_out   (MA13_idx_out ),
        .MA14_idx_out   (MA14_idx_out ),
        .MA15_idx_out   (MA15_idx_out ),

        .BN0_idx_out    (BN0_idx_out ),
        .BN1_idx_out    (BN1_idx_out ),
        .BN2_idx_out    (BN2_idx_out ),
        .BN3_idx_out    (BN3_idx_out ),
        .BN4_idx_out    (BN4_idx_out ),
        .BN5_idx_out    (BN5_idx_out ),
        .BN6_idx_out    (BN6_idx_out ),
        .BN7_idx_out    (BN7_idx_out ),
        .BN8_idx_out    (BN8_idx_out ),
        .BN9_idx_out    (BN9_idx_out ),
        .BN10_idx_out   (BN10_idx_out),
        .BN11_idx_out   (BN11_idx_out),
        .BN12_idx_out   (BN12_idx_out),
        .BN13_idx_out   (BN13_idx_out),
        .BN14_idx_out   (BN14_idx_out),
        .BN15_idx_out   (BN15_idx_out)

    );


    initial begin
        $readmemh("../sim/data_file/mem/mem_algo_bank.txt", BN_golden);  
        $readmemh("../sim/data_file/mem/mem_algo_MA.txt", MA_golden);  
        $readmemh("../sim/data_file/mem/mem_algo_data.txt", data_golden);  
    end

    always #(`CYCLE/2) clk = ~clk;

    initial begin
        #0
        clk = 0; 
        rst = 1;
        i = 0;
        #`CYCLE rst = 0;
    end





    initial begin
        $dumpfile("MEM_tb.vcd");
        $dumpvars;
        //$fsdbDumpvars("+struct", "+mda", mem);
        //$fsdbDumpvars("+struct", "+mda", Testbench);
        #(`CYCLE*`MAX)
        $finish;
    end
    task result;
    input integer err;
    input integer num;
    integer rf;
    begin
      if (err === 0)
      begin
        $display("\n");
        $display("\n");
        $display("        ****************************               ");
        $display("        **                        **       |\__||  ");
        $display("        **  Congratulations !!    **      / O.O  | ");
        $display("        **                        **    /_____   | ");
        $display("        **  Simulation PASS!!     **   /^ ^ ^ \\  |");
        $display("        **                        **  |^ ^ ^ ^ |w| ");
        $display("        ****************************   \\m___m__|_|");
        $display("\n");
      end
      else
      begin
        $display("\n");
        $display("\n");
        $display("        ****************************               ");
        $display("        **                        **       |\__||  ");
        $display("        **  OOPS!!                **      / X,X  | ");
        $display("        **                        **    /_____   | ");
        $display("        **  Simulation Failed!!   **   /^ ^ ^ \\  |");
        $display("        **                        **  |^ ^ ^ ^ |w| ");
        $display("        ****************************   \\m___m__|_|");
        $display("         Totally has %d errors                     ", err); 
        $display("\n");
      end
    end
  endtask
  
endmodule