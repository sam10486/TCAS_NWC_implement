`include "../include/define.svh"
`include "AGU_top.sv"
`define CYCLE 10

module Testbench ();
    logic clk;
    logic rst;
    logic enable;
    logic AGU_done_out;

    logic [`D_width-1:0] MA0_idx;
    logic [`D_width-1:0] BN0_idx;

    logic [`D_width-1:0] MA1_idx;
    logic [`D_width-1:0] BN1_idx;

    logic [`D_width-1:0] MA2_idx;
    logic [`D_width-1:0] BN2_idx;

    logic [`D_width-1:0] MA3_idx;
    logic [`D_width-1:0] BN3_idx;

    logic [`D_width-1:0] MA4_idx;
    logic [`D_width-1:0] BN4_idx;

    logic [`D_width-1:0] MA5_idx;
    logic [`D_width-1:0] BN5_idx;

    logic [`D_width-1:0] MA6_idx;
    logic [`D_width-1:0] BN6_idx;

    logic [`D_width-1:0] MA7_idx;
    logic [`D_width-1:0] BN7_idx;

    logic [`D_width-1:0] MA8_idx;
    logic [`D_width-1:0] BN8_idx;

    logic [`D_width-1:0] MA9_idx;
    logic [`D_width-1:0] BN9_idx;

    logic [`D_width-1:0] MA10_idx;
    logic [`D_width-1:0] BN10_idx;

    logic [`D_width-1:0] MA11_idx;
    logic [`D_width-1:0] BN11_idx;

    logic [`D_width-1:0] MA12_idx;
    logic [`D_width-1:0] BN12_idx;

    logic [`D_width-1:0] MA13_idx;
    logic [`D_width-1:0] BN13_idx;

    logic [`D_width-1:0] MA14_idx;
    logic [`D_width-1:0] BN14_idx;

    logic [`D_width-1:0] MA15_idx;
    logic [`D_width-1:0] BN15_idx;
    
    logic [`D_width-1:0] BN_golden [0:`degree*`k-1];
    logic [`D_width-1:0] MA_golden [0:`degree*`k-1];
    logic [`D_width-1:0] cnt;
    logic [`D_width-1:0] it_cnt;

    logic flag0, flag1, flag2, flag3, flag4, flag5, flag6, flag7, flag8, flag9,
            flag10, flag11, flag12, flag13, flag14, flag15, flag_all;

    initial begin
        $readmemh("../sim/data_file/AGU_idx/AGU_algo_bank.txt", BN_golden);  
        $readmemh("../sim/data_file/AGU_idx/AGU_algo_MA.txt", MA_golden);  
    end

    AGU_top AGU_top(
        .clk(clk),
        .rst(rst),
        .AGU_enable(enable),

        .MA0_idx(MA0_idx),
        .BN0_idx(BN0_idx),

        .MA1_idx(MA1_idx),
        .BN1_idx(BN1_idx),

        .MA2_idx(MA2_idx),
        .BN2_idx(BN2_idx),

        .MA3_idx(MA3_idx),
        .BN3_idx(BN3_idx),

        .MA4_idx(MA4_idx),
        .BN4_idx(BN4_idx),

        .MA5_idx(MA5_idx),
        .BN5_idx(BN5_idx),

        .MA6_idx(MA6_idx),
        .BN6_idx(BN6_idx),

        .MA7_idx(MA7_idx),
        .BN7_idx(BN7_idx),

        .MA8_idx(MA8_idx),
        .BN8_idx(BN8_idx),

        .MA9_idx(MA9_idx),
        .BN9_idx(BN9_idx),

        .MA10_idx(MA10_idx),
        .BN10_idx(BN10_idx),

        .MA11_idx(MA11_idx),
        .BN11_idx(BN11_idx),

        .MA12_idx(MA12_idx),
        .BN12_idx(BN12_idx),

        .MA13_idx(MA13_idx),
        .BN13_idx(BN13_idx),

        .MA14_idx(MA14_idx),
        .BN14_idx(BN14_idx),

        .MA15_idx(MA15_idx),
        .BN15_idx(BN15_idx),
        .AGU_done_out(AGU_done_out),
        .BN_MA_out_en(BN_MA_out_en)
    );

    always #(`CYCLE/2) clk = ~clk;

    initial begin
        #0
        clk = 0; 
        rst = 1;
        #`CYCLE rst = 0;
    end

    always_ff @( posedge clk or posedge rst ) begin : blockName
        if (rst) begin
            it_cnt <= 'd0;
        end else begin
            if (cnt == `degree-1 && it_cnt != `k) begin
                it_cnt <= it_cnt + 'd1;
            end else begin
                it_cnt <= it_cnt; 
            end
        end
    end


    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            cnt <= 'd0;
        end else begin
            if (AGU_done_out) begin
                cnt <= cnt;
            end else begin
                if (cnt == `degree-1 || it_cnt == `k) begin
                    cnt <= 'd0;
                end else begin
                    cnt <= cnt + 'd1;
                end
            end
        end
    end

    always_comb begin
        if (rst) begin
            enable = 'd0;
        end else begin
            if (it_cnt == `k) begin
                enable <= 'd0;
            end else begin
                enable <= 'd1;
            end
        end
    end

    integer num = 0;
    integer err = 0;
    initial begin
        #(`CYCLE*7);
        if (BN_MA_out_en) begin
            for (int i = 0; i<(`degree)/16 ; i=i+16) begin
                flag0 = (BN0_idx == BN_golden[i+0] && MA0_idx == MA_golden[i+0]) ? 'd1 : 'd0;
                flag1 = (BN1_idx == BN_golden[i+1] && MA1_idx == MA_golden[i+1]) ? 'd1 : 'd0;
                flag2 = (BN2_idx == BN_golden[i+2] && MA2_idx == MA_golden[i+2]) ? 'd1 : 'd0;
                flag3 = (BN3_idx == BN_golden[i+3] && MA3_idx == MA_golden[i+3]) ? 'd1 : 'd0;
                flag4 = (BN4_idx == BN_golden[i+4] && MA4_idx == MA_golden[i+4]) ? 'd1 : 'd0;
                flag5 = (BN5_idx == BN_golden[i+5] && MA5_idx == MA_golden[i+5]) ? 'd1 : 'd0;
                flag6 = (BN6_idx == BN_golden[i+6] && MA6_idx == MA_golden[i+6]) ? 'd1 : 'd0;
                flag7 = (BN7_idx == BN_golden[i+7] && MA7_idx == MA_golden[i+7]) ? 'd1 : 'd0;
                flag8 = (BN8_idx == BN_golden[i+8] && MA8_idx == MA_golden[i+8]) ? 'd1 : 'd0;
                flag9 = (BN9_idx == BN_golden[i+9] && MA9_idx == MA_golden[i+9]) ? 'd1 : 'd0;
                flag10 = (BN10_idx == BN_golden[i+10] && MA10_idx == MA_golden[i+10]) ? 'd1 : 'd0;
                flag11 = (BN11_idx == BN_golden[i+11] && MA11_idx == MA_golden[i+11]) ? 'd1 : 'd0;
                flag12 = (BN12_idx == BN_golden[i+12] && MA12_idx == MA_golden[i+12]) ? 'd1 : 'd0;
                flag13 = (BN13_idx == BN_golden[i+13] && MA13_idx == MA_golden[i+13]) ? 'd1 : 'd0;
                flag14 = (BN14_idx == BN_golden[i+14] && MA14_idx == MA_golden[i+14]) ? 'd1 : 'd0;
                flag15 = (BN15_idx == BN_golden[i+15] && MA15_idx == MA_golden[i+15]) ? 'd1 : 'd0;

                flag_all = flag0 && flag1 && flag2 && flag3 && flag4 && flag5 && flag6 && flag7 
                            && flag8 && flag9 && flag10 && flag11 && flag12 && flag13 && flag14 && flag15;
                
                if (flag_all) begin
                    $display("%d data is correct",num);
                end else begin
                    $display("%d data is failed!!!!", num);
                    err = err + 1;
                end
                num = num + 16;
                #`CYCLE;
            end
        end
        result(err, num);
        #(`CYCLE*`MAX) $finish;
    end
    
    initial begin
        $fsdbDumpfile("AGU_tb.vcd");
        $fsdbDumpvars;
        $fsdbDumpvars("+struct", "+mda", AGU_top);
        $fsdbDumpvars("+struct", "+mda", Testbench);
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