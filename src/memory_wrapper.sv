`include "../include/define.svh"
`include "Mux_16_1_out.sv"
`include "Mux_16_1_in.sv"
`include "w_R16_Mux_16_1_in.sv"
//`include "../mem/SRAM_DP_512_rtl.v"

module memory_wrapper (
    input LAST_STAGE,
    input [`D_width-1:0] data_in0   ,
    input [`D_width-1:0] data_in1   ,
    input [`D_width-1:0] data_in2   ,
    input [`D_width-1:0] data_in3   ,
    input [`D_width-1:0] data_in4   ,
    input [`D_width-1:0] data_in5   ,
    input [`D_width-1:0] data_in6   ,
    input [`D_width-1:0] data_in7   ,
    input [`D_width-1:0] data_in8   ,
    input [`D_width-1:0] data_in9   ,
    input [`D_width-1:0] data_in10  ,
    input [`D_width-1:0] data_in11  ,
    input [`D_width-1:0] data_in12  ,
    input [`D_width-1:0] data_in13  ,
    input [`D_width-1:0] data_in14  ,
    input [`D_width-1:0] data_in15  ,

    input [`MA_width-1:0] MA0_idx   ,
    input [`MA_width-1:0] MA1_idx   ,
    input [`MA_width-1:0] MA2_idx   ,
    input [`MA_width-1:0] MA3_idx   ,
    input [`MA_width-1:0] MA4_idx   ,
    input [`MA_width-1:0] MA5_idx   ,
    input [`MA_width-1:0] MA6_idx   ,
    input [`MA_width-1:0] MA7_idx   ,
    input [`MA_width-1:0] MA8_idx   ,
    input [`MA_width-1:0] MA9_idx   ,
    input [`MA_width-1:0] MA10_idx  ,
    input [`MA_width-1:0] MA11_idx  ,
    input [`MA_width-1:0] MA12_idx  ,
    input [`MA_width-1:0] MA13_idx  ,
    input [`MA_width-1:0] MA14_idx  ,
    input [`MA_width-1:0] MA15_idx  ,

    input [`BANK_width-1:0] BN0_idx ,
    input [`BANK_width-1:0] BN1_idx ,
    input [`BANK_width-1:0] BN2_idx ,
    input [`BANK_width-1:0] BN3_idx ,
    input [`BANK_width-1:0] BN4_idx ,
    input [`BANK_width-1:0] BN5_idx ,
    input [`BANK_width-1:0] BN6_idx ,
    input [`BANK_width-1:0] BN7_idx ,
    input [`BANK_width-1:0] BN8_idx ,
    input [`BANK_width-1:0] BN9_idx ,
    input [`BANK_width-1:0] BN10_idx,
    input [`BANK_width-1:0] BN11_idx,
    input [`BANK_width-1:0] BN12_idx,
    input [`BANK_width-1:0] BN13_idx,
    input [`BANK_width-1:0] BN14_idx,
    input [`BANK_width-1:0] BN15_idx,
    

    input r_enable,
    input w_enable,
    input clk,
    input rst,
    input [`MA_width-1:0] R16_w_MA0_idx ,
    input [`MA_width-1:0] R16_w_MA1_idx ,
    input [`MA_width-1:0] R16_w_MA2_idx ,
    input [`MA_width-1:0] R16_w_MA3_idx ,
    input [`MA_width-1:0] R16_w_MA4_idx ,
    input [`MA_width-1:0] R16_w_MA5_idx ,
    input [`MA_width-1:0] R16_w_MA6_idx ,
    input [`MA_width-1:0] R16_w_MA7_idx ,
    input [`MA_width-1:0] R16_w_MA8_idx ,
    input [`MA_width-1:0] R16_w_MA9_idx ,
    input [`MA_width-1:0] R16_w_MA10_idx,
    input [`MA_width-1:0] R16_w_MA11_idx,
    input [`MA_width-1:0] R16_w_MA12_idx,
    input [`MA_width-1:0] R16_w_MA13_idx,
    input [`MA_width-1:0] R16_w_MA14_idx,
    input [`MA_width-1:0] R16_w_MA15_idx,

    input [`BANK_width-1:0] R16_w_BN0_idx   ,
    input [`BANK_width-1:0] R16_w_BN1_idx   ,
    input [`BANK_width-1:0] R16_w_BN2_idx   ,
    input [`BANK_width-1:0] R16_w_BN3_idx   ,
    input [`BANK_width-1:0] R16_w_BN4_idx   ,
    input [`BANK_width-1:0] R16_w_BN5_idx   ,
    input [`BANK_width-1:0] R16_w_BN6_idx   ,
    input [`BANK_width-1:0] R16_w_BN7_idx   ,
    input [`BANK_width-1:0] R16_w_BN8_idx   ,
    input [`BANK_width-1:0] R16_w_BN9_idx   ,
    input [`BANK_width-1:0] R16_w_BN10_idx  ,
    input [`BANK_width-1:0] R16_w_BN11_idx  ,
    input [`BANK_width-1:0] R16_w_BN12_idx  ,
    input [`BANK_width-1:0] R16_w_BN13_idx  ,
    input [`BANK_width-1:0] R16_w_BN14_idx  ,
    input [`BANK_width-1:0] R16_w_BN15_idx  ,

    output logic [`D_width-1:0] memory_b0   ,
    output logic [`D_width-1:0] memory_b1   ,
    output logic [`D_width-1:0] memory_b2   ,
    output logic [`D_width-1:0] memory_b3   ,
    output logic [`D_width-1:0] memory_b4   ,
    output logic [`D_width-1:0] memory_b5   ,
    output logic [`D_width-1:0] memory_b6   ,
    output logic [`D_width-1:0] memory_b7   ,
    output logic [`D_width-1:0] memory_b8   ,
    output logic [`D_width-1:0] memory_b9   ,
    output logic [`D_width-1:0] memory_b10  ,
    output logic [`D_width-1:0] memory_b11  ,
    output logic [`D_width-1:0] memory_b12  ,
    output logic [`D_width-1:0] memory_b13  ,
    output logic [`D_width-1:0] memory_b14  ,
    output logic [`D_width-1:0] memory_b15  ,

    output logic r_enable_out,
    output logic w_enable_out,
    output logic [`MA_width-1:0] MA0_idx_out    ,
    output logic [`MA_width-1:0] MA1_idx_out    ,
    output logic [`MA_width-1:0] MA2_idx_out    ,
    output logic [`MA_width-1:0] MA3_idx_out    ,
    output logic [`MA_width-1:0] MA4_idx_out    ,
    output logic [`MA_width-1:0] MA5_idx_out    ,
    output logic [`MA_width-1:0] MA6_idx_out    ,
    output logic [`MA_width-1:0] MA7_idx_out    ,
    output logic [`MA_width-1:0] MA8_idx_out    ,
    output logic [`MA_width-1:0] MA9_idx_out    ,
    output logic [`MA_width-1:0] MA10_idx_out   ,
    output logic [`MA_width-1:0] MA11_idx_out   ,
    output logic [`MA_width-1:0] MA12_idx_out   ,
    output logic [`MA_width-1:0] MA13_idx_out   ,
    output logic [`MA_width-1:0] MA14_idx_out   ,
    output logic [`MA_width-1:0] MA15_idx_out   ,

    output logic [`BANK_width-1:0] BN0_idx_out  ,
    output logic [`BANK_width-1:0] BN1_idx_out  ,
    output logic [`BANK_width-1:0] BN2_idx_out  ,
    output logic [`BANK_width-1:0] BN3_idx_out  ,
    output logic [`BANK_width-1:0] BN4_idx_out  ,
    output logic [`BANK_width-1:0] BN5_idx_out  ,
    output logic [`BANK_width-1:0] BN6_idx_out  ,
    output logic [`BANK_width-1:0] BN7_idx_out  ,
    output logic [`BANK_width-1:0] BN8_idx_out  ,
    output logic [`BANK_width-1:0] BN9_idx_out  ,
    output logic [`BANK_width-1:0] BN10_idx_out ,
    output logic [`BANK_width-1:0] BN11_idx_out ,
    output logic [`BANK_width-1:0] BN12_idx_out ,
    output logic [`BANK_width-1:0] BN13_idx_out ,
    output logic [`BANK_width-1:0] BN14_idx_out ,
    output logic [`BANK_width-1:0] BN15_idx_out 
);
    parameter BN = `BN;
    parameter radix_16 = `pow_radix_k1;
    parameter radix_2 = `pow_radix_k2;
    genvar i;

    logic   [63:0]          QA [0:BN-1];            //data output
    logic   [63:0]          QB [0:BN-1];            //data output
    logic                   CLKA;                   //clk
    logic                   CENA [0:BN-1];          //chip select
    logic                   WENA [0:BN-1];          //write enable
    logic   [8:0]           AA [0:BN-1];            //input addr
    logic   [`D_width-1:0]  DA [0:BN-1];            //data in a
    logic                   CLKB;                   //clk
    logic                   CENB [0:BN-1];          //chip select
    logic                   WENB [0:BN-1];          //write enable
    logic   [8:0]           AB [0:BN-1];            //input addr
    logic   [`D_width-1:0]  DB [0:BN-1];            //data in b
    logic   [2:0]   EMAA;   
    logic   [2:0]   EMAB;

    logic [`D_width-1:0] QA_out [0:BN-1];
    logic [`D_width-1:0] QA_out_sel [0:BN-1];
    logic [4:0] sel_out [0:BN-1];

    assign CLKA = clk;
    assign CLKB = clk;
    assign EMAA = 'd0;
    assign EMAB = 'd0;

    logic [64-`D_width-1:0] zero;
    logic [`D_width-1:0] zero_mux_16_in; 
    assign zero = 'd0;
    assign zero_mux_16_in = 'd0;

    logic [4:0] BN_idx_sel_in [0:BN-1];
    logic [4:0] R16_w_BN_idx_sel_in [0:BN-1];

    //---------Read sel--------------
    always_comb begin
        if      (BN0_idx    == 'd0)     BN_idx_sel_in[0] = 'd0;
        else if (BN1_idx    == 'd0)     BN_idx_sel_in[0] = 'd1;
        else if (BN2_idx    == 'd0)     BN_idx_sel_in[0] = 'd2;
        else if (BN3_idx    == 'd0)     BN_idx_sel_in[0] = 'd3;
        else if (BN4_idx    == 'd0)     BN_idx_sel_in[0] = 'd4;
        else if (BN5_idx    == 'd0)     BN_idx_sel_in[0] = 'd5;
        else if (BN6_idx    == 'd0)     BN_idx_sel_in[0] = 'd6;
        else if (BN7_idx    == 'd0)     BN_idx_sel_in[0] = 'd7;
        else if (BN8_idx    == 'd0)     BN_idx_sel_in[0] = 'd8;
        else if (BN9_idx    == 'd0)     BN_idx_sel_in[0] = 'd9;
        else if (BN10_idx   == 'd0)     BN_idx_sel_in[0] = 'd10;
        else if (BN11_idx   == 'd0)     BN_idx_sel_in[0] = 'd11;
        else if (BN12_idx   == 'd0)     BN_idx_sel_in[0] = 'd12;
        else if (BN13_idx   == 'd0)     BN_idx_sel_in[0] = 'd13;
        else if (BN14_idx   == 'd0)     BN_idx_sel_in[0] = 'd14;
        else if (BN15_idx   == 'd0)     BN_idx_sel_in[0] = 'd15;    
        else                            BN_idx_sel_in[0] = 'd16; // 16 is turn off
    end

    always_comb begin
        if      (BN0_idx    == 'd1)     BN_idx_sel_in[1] = 'd0;
        else if (BN1_idx    == 'd1)     BN_idx_sel_in[1] = 'd1;
        else if (BN2_idx    == 'd1)     BN_idx_sel_in[1] = 'd2;
        else if (BN3_idx    == 'd1)     BN_idx_sel_in[1] = 'd3;
        else if (BN4_idx    == 'd1)     BN_idx_sel_in[1] = 'd4;
        else if (BN5_idx    == 'd1)     BN_idx_sel_in[1] = 'd5;
        else if (BN6_idx    == 'd1)     BN_idx_sel_in[1] = 'd6;
        else if (BN7_idx    == 'd1)     BN_idx_sel_in[1] = 'd7;
        else if (BN8_idx    == 'd1)     BN_idx_sel_in[1] = 'd8;
        else if (BN9_idx    == 'd1)     BN_idx_sel_in[1] = 'd9;
        else if (BN10_idx   == 'd1)     BN_idx_sel_in[1] = 'd10;
        else if (BN11_idx   == 'd1)     BN_idx_sel_in[1] = 'd11;
        else if (BN12_idx   == 'd1)     BN_idx_sel_in[1] = 'd12;
        else if (BN13_idx   == 'd1)     BN_idx_sel_in[1] = 'd13;
        else if (BN14_idx   == 'd1)     BN_idx_sel_in[1] = 'd14;
        else if (BN15_idx   == 'd1)     BN_idx_sel_in[1] = 'd15;
        else                            BN_idx_sel_in[1] = 'd16; // 16 is turn off
    end

    always_comb begin
        if      (BN0_idx    == 'd2)     BN_idx_sel_in[2] = 'd0;
        else if (BN1_idx    == 'd2)     BN_idx_sel_in[2] = 'd1;
        else if (BN2_idx    == 'd2)     BN_idx_sel_in[2] = 'd2;
        else if (BN3_idx    == 'd2)     BN_idx_sel_in[2] = 'd3;
        else if (BN4_idx    == 'd2)     BN_idx_sel_in[2] = 'd4;
        else if (BN5_idx    == 'd2)     BN_idx_sel_in[2] = 'd5;
        else if (BN6_idx    == 'd2)     BN_idx_sel_in[2] = 'd6;
        else if (BN7_idx    == 'd2)     BN_idx_sel_in[2] = 'd7;
        else if (BN8_idx    == 'd2)     BN_idx_sel_in[2] = 'd8;
        else if (BN9_idx    == 'd2)     BN_idx_sel_in[2] = 'd9;
        else if (BN10_idx   == 'd2)     BN_idx_sel_in[2] = 'd10;
        else if (BN11_idx   == 'd2)     BN_idx_sel_in[2] = 'd11;
        else if (BN12_idx   == 'd2)     BN_idx_sel_in[2] = 'd12;
        else if (BN13_idx   == 'd2)     BN_idx_sel_in[2] = 'd13;
        else if (BN14_idx   == 'd2)     BN_idx_sel_in[2] = 'd14;
        else if (BN15_idx   == 'd2)     BN_idx_sel_in[2] = 'd15;
        else                            BN_idx_sel_in[2] = 'd16; // 16 is turn off
    end

    always_comb begin
        if      (BN0_idx    == 'd3)     BN_idx_sel_in[3] = 'd0;
        else if (BN1_idx    == 'd3)     BN_idx_sel_in[3] = 'd1;
        else if (BN2_idx    == 'd3)     BN_idx_sel_in[3] = 'd2;
        else if (BN3_idx    == 'd3)     BN_idx_sel_in[3] = 'd3;
        else if (BN4_idx    == 'd3)     BN_idx_sel_in[3] = 'd4;
        else if (BN5_idx    == 'd3)     BN_idx_sel_in[3] = 'd5;
        else if (BN6_idx    == 'd3)     BN_idx_sel_in[3] = 'd6;
        else if (BN7_idx    == 'd3)     BN_idx_sel_in[3] = 'd7;
        else if (BN8_idx    == 'd3)     BN_idx_sel_in[3] = 'd8;
        else if (BN9_idx    == 'd3)     BN_idx_sel_in[3] = 'd9;
        else if (BN10_idx   == 'd3)     BN_idx_sel_in[3] = 'd10;
        else if (BN11_idx   == 'd3)     BN_idx_sel_in[3] = 'd11;
        else if (BN12_idx   == 'd3)     BN_idx_sel_in[3] = 'd12;
        else if (BN13_idx   == 'd3)     BN_idx_sel_in[3] = 'd13;
        else if (BN14_idx   == 'd3)     BN_idx_sel_in[3] = 'd14;
        else if (BN15_idx   == 'd3)     BN_idx_sel_in[3] = 'd15;
        else                            BN_idx_sel_in[3] = 'd16; // 16 is turn off
    end
    
    always_comb begin
        if      (BN0_idx    == 'd4)     BN_idx_sel_in[4] = 'd0;
        else if (BN1_idx    == 'd4)     BN_idx_sel_in[4] = 'd1;
        else if (BN2_idx    == 'd4)     BN_idx_sel_in[4] = 'd2;
        else if (BN3_idx    == 'd4)     BN_idx_sel_in[4] = 'd3;
        else if (BN4_idx    == 'd4)     BN_idx_sel_in[4] = 'd4;
        else if (BN5_idx    == 'd4)     BN_idx_sel_in[4] = 'd5;
        else if (BN6_idx    == 'd4)     BN_idx_sel_in[4] = 'd6;
        else if (BN7_idx    == 'd4)     BN_idx_sel_in[4] = 'd7;
        else if (BN8_idx    == 'd4)     BN_idx_sel_in[4] = 'd8;
        else if (BN9_idx    == 'd4)     BN_idx_sel_in[4] = 'd9;
        else if (BN10_idx   == 'd4)     BN_idx_sel_in[4] = 'd10;
        else if (BN11_idx   == 'd4)     BN_idx_sel_in[4] = 'd11;
        else if (BN12_idx   == 'd4)     BN_idx_sel_in[4] = 'd12;
        else if (BN13_idx   == 'd4)     BN_idx_sel_in[4] = 'd13;
        else if (BN14_idx   == 'd4)     BN_idx_sel_in[4] = 'd14;
        else if (BN15_idx   == 'd4)     BN_idx_sel_in[4] = 'd15;
        else                            BN_idx_sel_in[4] = 'd16; // 16 is turn off
    end

    always_comb begin
        if      (BN0_idx    == 'd5)     BN_idx_sel_in[5] = 'd0;
        else if (BN1_idx    == 'd5)     BN_idx_sel_in[5] = 'd1;
        else if (BN2_idx    == 'd5)     BN_idx_sel_in[5] = 'd2;
        else if (BN3_idx    == 'd5)     BN_idx_sel_in[5] = 'd3;
        else if (BN4_idx    == 'd5)     BN_idx_sel_in[5] = 'd4;
        else if (BN5_idx    == 'd5)     BN_idx_sel_in[5] = 'd5;
        else if (BN6_idx    == 'd5)     BN_idx_sel_in[5] = 'd6;
        else if (BN7_idx    == 'd5)     BN_idx_sel_in[5] = 'd7;
        else if (BN8_idx    == 'd5)     BN_idx_sel_in[5] = 'd8;
        else if (BN9_idx    == 'd5)     BN_idx_sel_in[5] = 'd9;
        else if (BN10_idx   == 'd5)     BN_idx_sel_in[5] = 'd10;
        else if (BN11_idx   == 'd5)     BN_idx_sel_in[5] = 'd11;
        else if (BN12_idx   == 'd5)     BN_idx_sel_in[5] = 'd12;
        else if (BN13_idx   == 'd5)     BN_idx_sel_in[5] = 'd13;
        else if (BN14_idx   == 'd5)     BN_idx_sel_in[5] = 'd14;
        else if (BN15_idx   == 'd5)     BN_idx_sel_in[5] = 'd15;
        else                            BN_idx_sel_in[5] = 'd16; // 16 is turn off
    end

    always_comb begin
        if      (BN0_idx    == 'd6)     BN_idx_sel_in[6] = 'd0;
        else if (BN1_idx    == 'd6)     BN_idx_sel_in[6] = 'd1;
        else if (BN2_idx    == 'd6)     BN_idx_sel_in[6] = 'd2;
        else if (BN3_idx    == 'd6)     BN_idx_sel_in[6] = 'd3;
        else if (BN4_idx    == 'd6)     BN_idx_sel_in[6] = 'd4;
        else if (BN5_idx    == 'd6)     BN_idx_sel_in[6] = 'd5;
        else if (BN6_idx    == 'd6)     BN_idx_sel_in[6] = 'd6;
        else if (BN7_idx    == 'd6)     BN_idx_sel_in[6] = 'd7;
        else if (BN8_idx    == 'd6)     BN_idx_sel_in[6] = 'd8;
        else if (BN9_idx    == 'd6)     BN_idx_sel_in[6] = 'd9;
        else if (BN10_idx   == 'd6)     BN_idx_sel_in[6] = 'd10;
        else if (BN11_idx   == 'd6)     BN_idx_sel_in[6] = 'd11;
        else if (BN12_idx   == 'd6)     BN_idx_sel_in[6] = 'd12;
        else if (BN13_idx   == 'd6)     BN_idx_sel_in[6] = 'd13;
        else if (BN14_idx   == 'd6)     BN_idx_sel_in[6] = 'd14;
        else if (BN15_idx   == 'd6)     BN_idx_sel_in[6] = 'd15;
        else                            BN_idx_sel_in[6] = 'd16; // 16 is turn off
    end

    always_comb begin
        if      (BN0_idx    == 'd7)     BN_idx_sel_in[7] = 'd0;
        else if (BN1_idx    == 'd7)     BN_idx_sel_in[7] = 'd1;
        else if (BN2_idx    == 'd7)     BN_idx_sel_in[7] = 'd2;
        else if (BN3_idx    == 'd7)     BN_idx_sel_in[7] = 'd3;
        else if (BN4_idx    == 'd7)     BN_idx_sel_in[7] = 'd4;
        else if (BN5_idx    == 'd7)     BN_idx_sel_in[7] = 'd5;
        else if (BN6_idx    == 'd7)     BN_idx_sel_in[7] = 'd6;
        else if (BN7_idx    == 'd7)     BN_idx_sel_in[7] = 'd7;
        else if (BN8_idx    == 'd7)     BN_idx_sel_in[7] = 'd8;
        else if (BN9_idx    == 'd7)     BN_idx_sel_in[7] = 'd9;
        else if (BN10_idx   == 'd7)     BN_idx_sel_in[7] = 'd10;
        else if (BN11_idx   == 'd7)     BN_idx_sel_in[7] = 'd11;
        else if (BN12_idx   == 'd7)     BN_idx_sel_in[7] = 'd12;
        else if (BN13_idx   == 'd7)     BN_idx_sel_in[7] = 'd13;
        else if (BN14_idx   == 'd7)     BN_idx_sel_in[7] = 'd14;
        else if (BN15_idx   == 'd7)     BN_idx_sel_in[7] = 'd15;
        else                            BN_idx_sel_in[7] = 'd16; // 16 is turn off
    end

    always_comb begin
        if      (BN0_idx    == 'd8)     BN_idx_sel_in[8] = 'd0;
        else if (BN1_idx    == 'd8)     BN_idx_sel_in[8] = 'd1;
        else if (BN2_idx    == 'd8)     BN_idx_sel_in[8] = 'd2;
        else if (BN3_idx    == 'd8)     BN_idx_sel_in[8] = 'd3;
        else if (BN4_idx    == 'd8)     BN_idx_sel_in[8] = 'd4;
        else if (BN5_idx    == 'd8)     BN_idx_sel_in[8] = 'd5;
        else if (BN6_idx    == 'd8)     BN_idx_sel_in[8] = 'd6;
        else if (BN7_idx    == 'd8)     BN_idx_sel_in[8] = 'd7;
        else if (BN8_idx    == 'd8)     BN_idx_sel_in[8] = 'd8;
        else if (BN9_idx    == 'd8)     BN_idx_sel_in[8] = 'd9;
        else if (BN10_idx   == 'd8)     BN_idx_sel_in[8] = 'd10;
        else if (BN11_idx   == 'd8)     BN_idx_sel_in[8] = 'd11;
        else if (BN12_idx   == 'd8)     BN_idx_sel_in[8] = 'd12;
        else if (BN13_idx   == 'd8)     BN_idx_sel_in[8] = 'd13;
        else if (BN14_idx   == 'd8)     BN_idx_sel_in[8] = 'd14;
        else if (BN15_idx   == 'd8)     BN_idx_sel_in[8] = 'd15;
        else                            BN_idx_sel_in[8] = 'd16; // 16 is turn off
    end

    always_comb begin
        if      (BN0_idx    == 'd9)     BN_idx_sel_in[9] = 'd0;
        else if (BN1_idx    == 'd9)     BN_idx_sel_in[9] = 'd1;
        else if (BN2_idx    == 'd9)     BN_idx_sel_in[9] = 'd2;
        else if (BN3_idx    == 'd9)     BN_idx_sel_in[9] = 'd3;
        else if (BN4_idx    == 'd9)     BN_idx_sel_in[9] = 'd4;
        else if (BN5_idx    == 'd9)     BN_idx_sel_in[9] = 'd5;
        else if (BN6_idx    == 'd9)     BN_idx_sel_in[9] = 'd6;
        else if (BN7_idx    == 'd9)     BN_idx_sel_in[9] = 'd7;
        else if (BN8_idx    == 'd9)     BN_idx_sel_in[9] = 'd8;
        else if (BN9_idx    == 'd9)     BN_idx_sel_in[9] = 'd9;
        else if (BN10_idx   == 'd9)     BN_idx_sel_in[9] = 'd10;
        else if (BN11_idx   == 'd9)     BN_idx_sel_in[9] = 'd11;
        else if (BN12_idx   == 'd9)     BN_idx_sel_in[9] = 'd12;
        else if (BN13_idx   == 'd9)     BN_idx_sel_in[9] = 'd13;
        else if (BN14_idx   == 'd9)     BN_idx_sel_in[9] = 'd14;
        else if (BN15_idx   == 'd9)     BN_idx_sel_in[9] = 'd15;
        else                            BN_idx_sel_in[9] = 'd16; // 16 is turn off
    end

    always_comb begin
        if      (BN0_idx    == 'd10)     BN_idx_sel_in[10] = 'd0;
        else if (BN1_idx    == 'd10)     BN_idx_sel_in[10] = 'd1;
        else if (BN2_idx    == 'd10)     BN_idx_sel_in[10] = 'd2;
        else if (BN3_idx    == 'd10)     BN_idx_sel_in[10] = 'd3;
        else if (BN4_idx    == 'd10)     BN_idx_sel_in[10] = 'd4;
        else if (BN5_idx    == 'd10)     BN_idx_sel_in[10] = 'd5;
        else if (BN6_idx    == 'd10)     BN_idx_sel_in[10] = 'd6;
        else if (BN7_idx    == 'd10)     BN_idx_sel_in[10] = 'd7;
        else if (BN8_idx    == 'd10)     BN_idx_sel_in[10] = 'd8;
        else if (BN9_idx    == 'd10)     BN_idx_sel_in[10] = 'd9;
        else if (BN10_idx   == 'd10)     BN_idx_sel_in[10] = 'd10;
        else if (BN11_idx   == 'd10)     BN_idx_sel_in[10] = 'd11;
        else if (BN12_idx   == 'd10)     BN_idx_sel_in[10] = 'd12;
        else if (BN13_idx   == 'd10)     BN_idx_sel_in[10] = 'd13;
        else if (BN14_idx   == 'd10)     BN_idx_sel_in[10] = 'd14;
        else if (BN15_idx   == 'd10)     BN_idx_sel_in[10] = 'd15;
        else                             BN_idx_sel_in[10] = 'd16; // 16 is turn off
    end

    always_comb begin
        if      (BN0_idx    == 'd11)     BN_idx_sel_in[11] = 'd0;
        else if (BN1_idx    == 'd11)     BN_idx_sel_in[11] = 'd1;
        else if (BN2_idx    == 'd11)     BN_idx_sel_in[11] = 'd2;
        else if (BN3_idx    == 'd11)     BN_idx_sel_in[11] = 'd3;
        else if (BN4_idx    == 'd11)     BN_idx_sel_in[11] = 'd4;
        else if (BN5_idx    == 'd11)     BN_idx_sel_in[11] = 'd5;
        else if (BN6_idx    == 'd11)     BN_idx_sel_in[11] = 'd6;
        else if (BN7_idx    == 'd11)     BN_idx_sel_in[11] = 'd7;
        else if (BN8_idx    == 'd11)     BN_idx_sel_in[11] = 'd8;
        else if (BN9_idx    == 'd11)     BN_idx_sel_in[11] = 'd9;
        else if (BN10_idx   == 'd11)     BN_idx_sel_in[11] = 'd10;
        else if (BN11_idx   == 'd11)     BN_idx_sel_in[11] = 'd11;
        else if (BN12_idx   == 'd11)     BN_idx_sel_in[11] = 'd12;
        else if (BN13_idx   == 'd11)     BN_idx_sel_in[11] = 'd13;
        else if (BN14_idx   == 'd11)     BN_idx_sel_in[11] = 'd14;
        else if (BN15_idx   == 'd11)     BN_idx_sel_in[11] = 'd15;
        else                             BN_idx_sel_in[11] = 'd16; // 16 is turn off
    end

    always_comb begin
        if      (BN0_idx    == 'd12)     BN_idx_sel_in[12] = 'd0;
        else if (BN1_idx    == 'd12)     BN_idx_sel_in[12] = 'd1;
        else if (BN2_idx    == 'd12)     BN_idx_sel_in[12] = 'd2;
        else if (BN3_idx    == 'd12)     BN_idx_sel_in[12] = 'd3;
        else if (BN4_idx    == 'd12)     BN_idx_sel_in[12] = 'd4;
        else if (BN5_idx    == 'd12)     BN_idx_sel_in[12] = 'd5;
        else if (BN6_idx    == 'd12)     BN_idx_sel_in[12] = 'd6;
        else if (BN7_idx    == 'd12)     BN_idx_sel_in[12] = 'd7;
        else if (BN8_idx    == 'd12)     BN_idx_sel_in[12] = 'd8;
        else if (BN9_idx    == 'd12)     BN_idx_sel_in[12] = 'd9;
        else if (BN10_idx   == 'd12)     BN_idx_sel_in[12] = 'd10;
        else if (BN11_idx   == 'd12)     BN_idx_sel_in[12] = 'd11;
        else if (BN12_idx   == 'd12)     BN_idx_sel_in[12] = 'd12;
        else if (BN13_idx   == 'd12)     BN_idx_sel_in[12] = 'd13;
        else if (BN14_idx   == 'd12)     BN_idx_sel_in[12] = 'd14;
        else if (BN15_idx   == 'd12)     BN_idx_sel_in[12] = 'd15;
        else                             BN_idx_sel_in[12] = 'd16; // 16 is turn off
    end

    always_comb begin
        if      (BN0_idx    == 'd13)     BN_idx_sel_in[13] = 'd0;
        else if (BN1_idx    == 'd13)     BN_idx_sel_in[13] = 'd1;
        else if (BN2_idx    == 'd13)     BN_idx_sel_in[13] = 'd2;
        else if (BN3_idx    == 'd13)     BN_idx_sel_in[13] = 'd3;
        else if (BN4_idx    == 'd13)     BN_idx_sel_in[13] = 'd4;
        else if (BN5_idx    == 'd13)     BN_idx_sel_in[13] = 'd5;
        else if (BN6_idx    == 'd13)     BN_idx_sel_in[13] = 'd6;
        else if (BN7_idx    == 'd13)     BN_idx_sel_in[13] = 'd7;
        else if (BN8_idx    == 'd13)     BN_idx_sel_in[13] = 'd8;
        else if (BN9_idx    == 'd13)     BN_idx_sel_in[13] = 'd9;
        else if (BN10_idx   == 'd13)     BN_idx_sel_in[13] = 'd10;
        else if (BN11_idx   == 'd13)     BN_idx_sel_in[13] = 'd11;
        else if (BN12_idx   == 'd13)     BN_idx_sel_in[13] = 'd12;
        else if (BN13_idx   == 'd13)     BN_idx_sel_in[13] = 'd13;
        else if (BN14_idx   == 'd13)     BN_idx_sel_in[13] = 'd14;
        else if (BN15_idx   == 'd13)     BN_idx_sel_in[13] = 'd15;
        else                             BN_idx_sel_in[13] = 'd16; // 16 is turn off
    end

    always_comb begin
        if      (BN0_idx    == 'd14)     BN_idx_sel_in[14] = 'd0;
        else if (BN1_idx    == 'd14)     BN_idx_sel_in[14] = 'd1;
        else if (BN2_idx    == 'd14)     BN_idx_sel_in[14] = 'd2;
        else if (BN3_idx    == 'd14)     BN_idx_sel_in[14] = 'd3;
        else if (BN4_idx    == 'd14)     BN_idx_sel_in[14] = 'd4;
        else if (BN5_idx    == 'd14)     BN_idx_sel_in[14] = 'd5;
        else if (BN6_idx    == 'd14)     BN_idx_sel_in[14] = 'd6;
        else if (BN7_idx    == 'd14)     BN_idx_sel_in[14] = 'd7;
        else if (BN8_idx    == 'd14)     BN_idx_sel_in[14] = 'd8;
        else if (BN9_idx    == 'd14)     BN_idx_sel_in[14] = 'd9;
        else if (BN10_idx   == 'd14)     BN_idx_sel_in[14] = 'd10;
        else if (BN11_idx   == 'd14)     BN_idx_sel_in[14] = 'd11;
        else if (BN12_idx   == 'd14)     BN_idx_sel_in[14] = 'd12;
        else if (BN13_idx   == 'd14)     BN_idx_sel_in[14] = 'd13;
        else if (BN14_idx   == 'd14)     BN_idx_sel_in[14] = 'd14;
        else if (BN15_idx   == 'd14)     BN_idx_sel_in[14] = 'd15;
        else                             BN_idx_sel_in[14] = 'd16; // 16 is turn off
    end

    always_comb begin
        if      (BN0_idx    == 'd15)     BN_idx_sel_in[15] = 'd0;
        else if (BN1_idx    == 'd15)     BN_idx_sel_in[15] = 'd1;
        else if (BN2_idx    == 'd15)     BN_idx_sel_in[15] = 'd2;
        else if (BN3_idx    == 'd15)     BN_idx_sel_in[15] = 'd3;
        else if (BN4_idx    == 'd15)     BN_idx_sel_in[15] = 'd4;
        else if (BN5_idx    == 'd15)     BN_idx_sel_in[15] = 'd5;
        else if (BN6_idx    == 'd15)     BN_idx_sel_in[15] = 'd6;
        else if (BN7_idx    == 'd15)     BN_idx_sel_in[15] = 'd7;
        else if (BN8_idx    == 'd15)     BN_idx_sel_in[15] = 'd8;
        else if (BN9_idx    == 'd15)     BN_idx_sel_in[15] = 'd9;
        else if (BN10_idx   == 'd15)     BN_idx_sel_in[15] = 'd10;
        else if (BN11_idx   == 'd15)     BN_idx_sel_in[15] = 'd11;
        else if (BN12_idx   == 'd15)     BN_idx_sel_in[15] = 'd12;
        else if (BN13_idx   == 'd15)     BN_idx_sel_in[15] = 'd13;
        else if (BN14_idx   == 'd15)     BN_idx_sel_in[15] = 'd14;
        else if (BN15_idx   == 'd15)     BN_idx_sel_in[15] = 'd15;
        else                             BN_idx_sel_in[15] = 'd16; // 16 is turn off
    end

    //-------Write select-------------
    always_comb begin
        if (LAST_STAGE) begin
            if      (R16_w_BN0_idx    == 'd0)     R16_w_BN_idx_sel_in[0] = 'd0;
            else if (R16_w_BN1_idx    == 'd0)     R16_w_BN_idx_sel_in[0] = 'd1;
            else if (R16_w_BN2_idx    == 'd0)     R16_w_BN_idx_sel_in[0] = 'd2;
            else if (R16_w_BN3_idx    == 'd0)     R16_w_BN_idx_sel_in[0] = 'd3;
            else if (R16_w_BN4_idx    == 'd0)     R16_w_BN_idx_sel_in[0] = 'd4;
            else if (R16_w_BN5_idx    == 'd0)     R16_w_BN_idx_sel_in[0] = 'd5;
            else if (R16_w_BN6_idx    == 'd0)     R16_w_BN_idx_sel_in[0] = 'd6;
            else if (R16_w_BN7_idx    == 'd0)     R16_w_BN_idx_sel_in[0] = 'd7;
            else if (R16_w_BN8_idx    == 'd0)     R16_w_BN_idx_sel_in[0] = 'd8;
            else if (R16_w_BN9_idx    == 'd0)     R16_w_BN_idx_sel_in[0] = 'd9;
            else if (R16_w_BN10_idx   == 'd0)     R16_w_BN_idx_sel_in[0] = 'd10;
            else if (R16_w_BN11_idx   == 'd0)     R16_w_BN_idx_sel_in[0] = 'd11;
            else if (R16_w_BN12_idx   == 'd0)     R16_w_BN_idx_sel_in[0] = 'd12;
            else if (R16_w_BN13_idx   == 'd0)     R16_w_BN_idx_sel_in[0] = 'd13;
            else if (R16_w_BN14_idx   == 'd0)     R16_w_BN_idx_sel_in[0] = 'd14;
            else if (R16_w_BN15_idx   == 'd0)     R16_w_BN_idx_sel_in[0] = 'd15;
            else                                  R16_w_BN_idx_sel_in[0] = 'd16; // 16 is turn off
        end else begin
            if      (R16_w_BN0_idx    == 'd0)     R16_w_BN_idx_sel_in[0] = 'd0;
            else if (R16_w_BN1_idx    == 'd0)     R16_w_BN_idx_sel_in[0] = 'd1;
            else if (R16_w_BN2_idx    == 'd0)     R16_w_BN_idx_sel_in[0] = 'd2;
            else if (R16_w_BN3_idx    == 'd0)     R16_w_BN_idx_sel_in[0] = 'd3;
            else if (R16_w_BN4_idx    == 'd0)     R16_w_BN_idx_sel_in[0] = 'd4;
            else if (R16_w_BN5_idx    == 'd0)     R16_w_BN_idx_sel_in[0] = 'd5;
            else if (R16_w_BN6_idx    == 'd0)     R16_w_BN_idx_sel_in[0] = 'd6;
            else if (R16_w_BN7_idx    == 'd0)     R16_w_BN_idx_sel_in[0] = 'd7;
            else if (R16_w_BN8_idx    == 'd0)     R16_w_BN_idx_sel_in[0] = 'd8;
            else if (R16_w_BN9_idx    == 'd0)     R16_w_BN_idx_sel_in[0] = 'd9;
            else if (R16_w_BN10_idx   == 'd0)     R16_w_BN_idx_sel_in[0] = 'd10;
            else if (R16_w_BN11_idx   == 'd0)     R16_w_BN_idx_sel_in[0] = 'd11;
            else if (R16_w_BN12_idx   == 'd0)     R16_w_BN_idx_sel_in[0] = 'd12;
            else if (R16_w_BN13_idx   == 'd0)     R16_w_BN_idx_sel_in[0] = 'd13;
            else if (R16_w_BN14_idx   == 'd0)     R16_w_BN_idx_sel_in[0] = 'd14;
            else if (R16_w_BN15_idx   == 'd0)     R16_w_BN_idx_sel_in[0] = 'd15;
            else                                  R16_w_BN_idx_sel_in[0] = 'd16; // 16 is turn off
        end 
    end

    always_comb begin
        if (LAST_STAGE) begin
            if      (R16_w_BN0_idx    == 'd1)     R16_w_BN_idx_sel_in[1] = 'd0;
            else if (R16_w_BN1_idx    == 'd1)     R16_w_BN_idx_sel_in[1] = 'd1;
            else if (R16_w_BN2_idx    == 'd1)     R16_w_BN_idx_sel_in[1] = 'd2;
            else if (R16_w_BN3_idx    == 'd1)     R16_w_BN_idx_sel_in[1] = 'd3;
            else if (R16_w_BN4_idx    == 'd1)     R16_w_BN_idx_sel_in[1] = 'd4;
            else if (R16_w_BN5_idx    == 'd1)     R16_w_BN_idx_sel_in[1] = 'd5;
            else if (R16_w_BN6_idx    == 'd1)     R16_w_BN_idx_sel_in[1] = 'd6;
            else if (R16_w_BN7_idx    == 'd1)     R16_w_BN_idx_sel_in[1] = 'd7;
            else if (R16_w_BN8_idx    == 'd1)     R16_w_BN_idx_sel_in[1] = 'd8;
            else if (R16_w_BN9_idx    == 'd1)     R16_w_BN_idx_sel_in[1] = 'd9;
            else if (R16_w_BN10_idx   == 'd1)     R16_w_BN_idx_sel_in[1] = 'd10;
            else if (R16_w_BN11_idx   == 'd1)     R16_w_BN_idx_sel_in[1] = 'd11;
            else if (R16_w_BN12_idx   == 'd1)     R16_w_BN_idx_sel_in[1] = 'd12;
            else if (R16_w_BN13_idx   == 'd1)     R16_w_BN_idx_sel_in[1] = 'd13;
            else if (R16_w_BN14_idx   == 'd1)     R16_w_BN_idx_sel_in[1] = 'd14;
            else if (R16_w_BN15_idx   == 'd1)     R16_w_BN_idx_sel_in[1] = 'd15;
            else                                  R16_w_BN_idx_sel_in[1] = 'd16; // 16 is turn off
        end else begin
            if      (R16_w_BN0_idx    == 'd1)     R16_w_BN_idx_sel_in[1] = 'd0;
            else if (R16_w_BN1_idx    == 'd1)     R16_w_BN_idx_sel_in[1] = 'd1;
            else if (R16_w_BN2_idx    == 'd1)     R16_w_BN_idx_sel_in[1] = 'd2;
            else if (R16_w_BN3_idx    == 'd1)     R16_w_BN_idx_sel_in[1] = 'd3;
            else if (R16_w_BN4_idx    == 'd1)     R16_w_BN_idx_sel_in[1] = 'd4;
            else if (R16_w_BN5_idx    == 'd1)     R16_w_BN_idx_sel_in[1] = 'd5;
            else if (R16_w_BN6_idx    == 'd1)     R16_w_BN_idx_sel_in[1] = 'd6;
            else if (R16_w_BN7_idx    == 'd1)     R16_w_BN_idx_sel_in[1] = 'd7;
            else if (R16_w_BN8_idx    == 'd1)     R16_w_BN_idx_sel_in[1] = 'd8;
            else if (R16_w_BN9_idx    == 'd1)     R16_w_BN_idx_sel_in[1] = 'd9;
            else if (R16_w_BN10_idx   == 'd1)     R16_w_BN_idx_sel_in[1] = 'd10;
            else if (R16_w_BN11_idx   == 'd1)     R16_w_BN_idx_sel_in[1] = 'd11;
            else if (R16_w_BN12_idx   == 'd1)     R16_w_BN_idx_sel_in[1] = 'd12;
            else if (R16_w_BN13_idx   == 'd1)     R16_w_BN_idx_sel_in[1] = 'd13;
            else if (R16_w_BN14_idx   == 'd1)     R16_w_BN_idx_sel_in[1] = 'd14;
            else if (R16_w_BN15_idx   == 'd1)     R16_w_BN_idx_sel_in[1] = 'd15;
            else                                  R16_w_BN_idx_sel_in[1] = 'd16; // 16 is turn off
        end     
    end

    always_comb begin
        if (LAST_STAGE) begin
            if      (R16_w_BN0_idx    == 'd2)     R16_w_BN_idx_sel_in[2] = 'd0;
            else if (R16_w_BN1_idx    == 'd2)     R16_w_BN_idx_sel_in[2] = 'd1;
            else if (R16_w_BN2_idx    == 'd2)     R16_w_BN_idx_sel_in[2] = 'd2;
            else if (R16_w_BN3_idx    == 'd2)     R16_w_BN_idx_sel_in[2] = 'd3;
            else if (R16_w_BN4_idx    == 'd2)     R16_w_BN_idx_sel_in[2] = 'd4;
            else if (R16_w_BN5_idx    == 'd2)     R16_w_BN_idx_sel_in[2] = 'd5;
            else if (R16_w_BN6_idx    == 'd2)     R16_w_BN_idx_sel_in[2] = 'd6;
            else if (R16_w_BN7_idx    == 'd2)     R16_w_BN_idx_sel_in[2] = 'd7;
            else if (R16_w_BN8_idx    == 'd2)     R16_w_BN_idx_sel_in[2] = 'd8;
            else if (R16_w_BN9_idx    == 'd2)     R16_w_BN_idx_sel_in[2] = 'd9;
            else if (R16_w_BN10_idx   == 'd2)     R16_w_BN_idx_sel_in[2] = 'd10;
            else if (R16_w_BN11_idx   == 'd2)     R16_w_BN_idx_sel_in[2] = 'd11;
            else if (R16_w_BN12_idx   == 'd2)     R16_w_BN_idx_sel_in[2] = 'd12;
            else if (R16_w_BN13_idx   == 'd2)     R16_w_BN_idx_sel_in[2] = 'd13;
            else if (R16_w_BN14_idx   == 'd2)     R16_w_BN_idx_sel_in[2] = 'd14;
            else if (R16_w_BN15_idx   == 'd2)     R16_w_BN_idx_sel_in[2] = 'd15;
            else                                  R16_w_BN_idx_sel_in[2] = 'd16; // 16 is turn off
        end else begin
            if      (R16_w_BN0_idx    == 'd2)     R16_w_BN_idx_sel_in[2] = 'd0;
            else if (R16_w_BN1_idx    == 'd2)     R16_w_BN_idx_sel_in[2] = 'd1;
            else if (R16_w_BN2_idx    == 'd2)     R16_w_BN_idx_sel_in[2] = 'd2;
            else if (R16_w_BN3_idx    == 'd2)     R16_w_BN_idx_sel_in[2] = 'd3;
            else if (R16_w_BN4_idx    == 'd2)     R16_w_BN_idx_sel_in[2] = 'd4;
            else if (R16_w_BN5_idx    == 'd2)     R16_w_BN_idx_sel_in[2] = 'd5;
            else if (R16_w_BN6_idx    == 'd2)     R16_w_BN_idx_sel_in[2] = 'd6;
            else if (R16_w_BN7_idx    == 'd2)     R16_w_BN_idx_sel_in[2] = 'd7;
            else if (R16_w_BN8_idx    == 'd2)     R16_w_BN_idx_sel_in[2] = 'd8;
            else if (R16_w_BN9_idx    == 'd2)     R16_w_BN_idx_sel_in[2] = 'd9;
            else if (R16_w_BN10_idx   == 'd2)     R16_w_BN_idx_sel_in[2] = 'd10;
            else if (R16_w_BN11_idx   == 'd2)     R16_w_BN_idx_sel_in[2] = 'd11;
            else if (R16_w_BN12_idx   == 'd2)     R16_w_BN_idx_sel_in[2] = 'd12;
            else if (R16_w_BN13_idx   == 'd2)     R16_w_BN_idx_sel_in[2] = 'd13;
            else if (R16_w_BN14_idx   == 'd2)     R16_w_BN_idx_sel_in[2] = 'd14;
            else if (R16_w_BN15_idx   == 'd2)     R16_w_BN_idx_sel_in[2] = 'd15;
            else                                  R16_w_BN_idx_sel_in[2] = 'd16; // 16 is turn off
        end   
    end

    always_comb begin
        if (LAST_STAGE) begin
            if      (R16_w_BN0_idx    == 'd3)     R16_w_BN_idx_sel_in[3] = 'd0;
            else if (R16_w_BN1_idx    == 'd3)     R16_w_BN_idx_sel_in[3] = 'd1;
            else if (R16_w_BN2_idx    == 'd3)     R16_w_BN_idx_sel_in[3] = 'd2;
            else if (R16_w_BN3_idx    == 'd3)     R16_w_BN_idx_sel_in[3] = 'd3;
            else if (R16_w_BN4_idx    == 'd3)     R16_w_BN_idx_sel_in[3] = 'd4;
            else if (R16_w_BN5_idx    == 'd3)     R16_w_BN_idx_sel_in[3] = 'd5;
            else if (R16_w_BN6_idx    == 'd3)     R16_w_BN_idx_sel_in[3] = 'd6;
            else if (R16_w_BN7_idx    == 'd3)     R16_w_BN_idx_sel_in[3] = 'd7;
            else if (R16_w_BN8_idx    == 'd3)     R16_w_BN_idx_sel_in[3] = 'd8;
            else if (R16_w_BN9_idx    == 'd3)     R16_w_BN_idx_sel_in[3] = 'd9;
            else if (R16_w_BN10_idx   == 'd3)     R16_w_BN_idx_sel_in[3] = 'd10;
            else if (R16_w_BN11_idx   == 'd3)     R16_w_BN_idx_sel_in[3] = 'd11;
            else if (R16_w_BN12_idx   == 'd3)     R16_w_BN_idx_sel_in[3] = 'd12;
            else if (R16_w_BN13_idx   == 'd3)     R16_w_BN_idx_sel_in[3] = 'd13;
            else if (R16_w_BN14_idx   == 'd3)     R16_w_BN_idx_sel_in[3] = 'd14;
            else if (R16_w_BN15_idx   == 'd3)     R16_w_BN_idx_sel_in[3] = 'd15;
            else                                  R16_w_BN_idx_sel_in[3] = 'd16; // 16 is turn off
        end else begin
            if      (R16_w_BN0_idx    == 'd3)     R16_w_BN_idx_sel_in[3] = 'd0;
            else if (R16_w_BN1_idx    == 'd3)     R16_w_BN_idx_sel_in[3] = 'd1;
            else if (R16_w_BN2_idx    == 'd3)     R16_w_BN_idx_sel_in[3] = 'd2;
            else if (R16_w_BN3_idx    == 'd3)     R16_w_BN_idx_sel_in[3] = 'd3;
            else if (R16_w_BN4_idx    == 'd3)     R16_w_BN_idx_sel_in[3] = 'd4;
            else if (R16_w_BN5_idx    == 'd3)     R16_w_BN_idx_sel_in[3] = 'd5;
            else if (R16_w_BN6_idx    == 'd3)     R16_w_BN_idx_sel_in[3] = 'd6;
            else if (R16_w_BN7_idx    == 'd3)     R16_w_BN_idx_sel_in[3] = 'd7;
            else if (R16_w_BN8_idx    == 'd3)     R16_w_BN_idx_sel_in[3] = 'd8;
            else if (R16_w_BN9_idx    == 'd3)     R16_w_BN_idx_sel_in[3] = 'd9;
            else if (R16_w_BN10_idx   == 'd3)     R16_w_BN_idx_sel_in[3] = 'd10;
            else if (R16_w_BN11_idx   == 'd3)     R16_w_BN_idx_sel_in[3] = 'd11;
            else if (R16_w_BN12_idx   == 'd3)     R16_w_BN_idx_sel_in[3] = 'd12;
            else if (R16_w_BN13_idx   == 'd3)     R16_w_BN_idx_sel_in[3] = 'd13;
            else if (R16_w_BN14_idx   == 'd3)     R16_w_BN_idx_sel_in[3] = 'd14;
            else if (R16_w_BN15_idx   == 'd3)     R16_w_BN_idx_sel_in[3] = 'd15;
            else                                  R16_w_BN_idx_sel_in[3] = 'd16; // 16 is turn off
        end    
    end

    always_comb begin
        if (LAST_STAGE) begin
            if      (R16_w_BN0_idx    == 'd4)     R16_w_BN_idx_sel_in[4] = 'd0;
            else if (R16_w_BN1_idx    == 'd4)     R16_w_BN_idx_sel_in[4] = 'd1;
            else if (R16_w_BN2_idx    == 'd4)     R16_w_BN_idx_sel_in[4] = 'd2;
            else if (R16_w_BN3_idx    == 'd4)     R16_w_BN_idx_sel_in[4] = 'd3;
            else if (R16_w_BN4_idx    == 'd4)     R16_w_BN_idx_sel_in[4] = 'd4;
            else if (R16_w_BN5_idx    == 'd4)     R16_w_BN_idx_sel_in[4] = 'd5;
            else if (R16_w_BN6_idx    == 'd4)     R16_w_BN_idx_sel_in[4] = 'd6;
            else if (R16_w_BN7_idx    == 'd4)     R16_w_BN_idx_sel_in[4] = 'd7;
            else if (R16_w_BN8_idx    == 'd4)     R16_w_BN_idx_sel_in[4] = 'd8;
            else if (R16_w_BN9_idx    == 'd4)     R16_w_BN_idx_sel_in[4] = 'd9;
            else if (R16_w_BN10_idx   == 'd4)     R16_w_BN_idx_sel_in[4] = 'd10;
            else if (R16_w_BN11_idx   == 'd4)     R16_w_BN_idx_sel_in[4] = 'd11;
            else if (R16_w_BN12_idx   == 'd4)     R16_w_BN_idx_sel_in[4] = 'd12;
            else if (R16_w_BN13_idx   == 'd4)     R16_w_BN_idx_sel_in[4] = 'd13;
            else if (R16_w_BN14_idx   == 'd4)     R16_w_BN_idx_sel_in[4] = 'd14;
            else if (R16_w_BN15_idx   == 'd4)     R16_w_BN_idx_sel_in[4] = 'd15;
            else                                  R16_w_BN_idx_sel_in[4] = 'd16; // 16 is turn off
        end else begin
            if      (R16_w_BN0_idx    == 'd4)     R16_w_BN_idx_sel_in[4] = 'd0;
            else if (R16_w_BN1_idx    == 'd4)     R16_w_BN_idx_sel_in[4] = 'd1;
            else if (R16_w_BN2_idx    == 'd4)     R16_w_BN_idx_sel_in[4] = 'd2;
            else if (R16_w_BN3_idx    == 'd4)     R16_w_BN_idx_sel_in[4] = 'd3;
            else if (R16_w_BN4_idx    == 'd4)     R16_w_BN_idx_sel_in[4] = 'd4;
            else if (R16_w_BN5_idx    == 'd4)     R16_w_BN_idx_sel_in[4] = 'd5;
            else if (R16_w_BN6_idx    == 'd4)     R16_w_BN_idx_sel_in[4] = 'd6;
            else if (R16_w_BN7_idx    == 'd4)     R16_w_BN_idx_sel_in[4] = 'd7;
            else if (R16_w_BN8_idx    == 'd4)     R16_w_BN_idx_sel_in[4] = 'd8;
            else if (R16_w_BN9_idx    == 'd4)     R16_w_BN_idx_sel_in[4] = 'd9;
            else if (R16_w_BN10_idx   == 'd4)     R16_w_BN_idx_sel_in[4] = 'd10;
            else if (R16_w_BN11_idx   == 'd4)     R16_w_BN_idx_sel_in[4] = 'd11;
            else if (R16_w_BN12_idx   == 'd4)     R16_w_BN_idx_sel_in[4] = 'd12;
            else if (R16_w_BN13_idx   == 'd4)     R16_w_BN_idx_sel_in[4] = 'd13;
            else if (R16_w_BN14_idx   == 'd4)     R16_w_BN_idx_sel_in[4] = 'd14;
            else if (R16_w_BN15_idx   == 'd4)     R16_w_BN_idx_sel_in[4] = 'd15;
            else                                  R16_w_BN_idx_sel_in[4] = 'd16; // 16 is turn off
        end
    end

    always_comb begin
        if (LAST_STAGE) begin
            if      (R16_w_BN0_idx    == 'd5)     R16_w_BN_idx_sel_in[5] = 'd0;
            else if (R16_w_BN1_idx    == 'd5)     R16_w_BN_idx_sel_in[5] = 'd1;
            else if (R16_w_BN2_idx    == 'd5)     R16_w_BN_idx_sel_in[5] = 'd2;
            else if (R16_w_BN3_idx    == 'd5)     R16_w_BN_idx_sel_in[5] = 'd3;
            else if (R16_w_BN4_idx    == 'd5)     R16_w_BN_idx_sel_in[5] = 'd4;
            else if (R16_w_BN5_idx    == 'd5)     R16_w_BN_idx_sel_in[5] = 'd5;
            else if (R16_w_BN6_idx    == 'd5)     R16_w_BN_idx_sel_in[5] = 'd6;
            else if (R16_w_BN7_idx    == 'd5)     R16_w_BN_idx_sel_in[5] = 'd7;
            else if (R16_w_BN8_idx    == 'd5)     R16_w_BN_idx_sel_in[5] = 'd8;
            else if (R16_w_BN9_idx    == 'd5)     R16_w_BN_idx_sel_in[5] = 'd9;
            else if (R16_w_BN10_idx   == 'd5)     R16_w_BN_idx_sel_in[5] = 'd10;
            else if (R16_w_BN11_idx   == 'd5)     R16_w_BN_idx_sel_in[5] = 'd11;
            else if (R16_w_BN12_idx   == 'd5)     R16_w_BN_idx_sel_in[5] = 'd12;
            else if (R16_w_BN13_idx   == 'd5)     R16_w_BN_idx_sel_in[5] = 'd13;
            else if (R16_w_BN14_idx   == 'd5)     R16_w_BN_idx_sel_in[5] = 'd14;
            else if (R16_w_BN15_idx   == 'd5)     R16_w_BN_idx_sel_in[5] = 'd15;
            else                                  R16_w_BN_idx_sel_in[5] = 'd16; // 16 is turn off
        end else begin
            if      (R16_w_BN0_idx    == 'd5)     R16_w_BN_idx_sel_in[5] = 'd0;
            else if (R16_w_BN1_idx    == 'd5)     R16_w_BN_idx_sel_in[5] = 'd1;
            else if (R16_w_BN2_idx    == 'd5)     R16_w_BN_idx_sel_in[5] = 'd2;
            else if (R16_w_BN3_idx    == 'd5)     R16_w_BN_idx_sel_in[5] = 'd3;
            else if (R16_w_BN4_idx    == 'd5)     R16_w_BN_idx_sel_in[5] = 'd4;
            else if (R16_w_BN5_idx    == 'd5)     R16_w_BN_idx_sel_in[5] = 'd5;
            else if (R16_w_BN6_idx    == 'd5)     R16_w_BN_idx_sel_in[5] = 'd6;
            else if (R16_w_BN7_idx    == 'd5)     R16_w_BN_idx_sel_in[5] = 'd7;
            else if (R16_w_BN8_idx    == 'd5)     R16_w_BN_idx_sel_in[5] = 'd8;
            else if (R16_w_BN9_idx    == 'd5)     R16_w_BN_idx_sel_in[5] = 'd9;
            else if (R16_w_BN10_idx   == 'd5)     R16_w_BN_idx_sel_in[5] = 'd10;
            else if (R16_w_BN11_idx   == 'd5)     R16_w_BN_idx_sel_in[5] = 'd11;
            else if (R16_w_BN12_idx   == 'd5)     R16_w_BN_idx_sel_in[5] = 'd12;
            else if (R16_w_BN13_idx   == 'd5)     R16_w_BN_idx_sel_in[5] = 'd13;
            else if (R16_w_BN14_idx   == 'd5)     R16_w_BN_idx_sel_in[5] = 'd14;
            else if (R16_w_BN15_idx   == 'd5)     R16_w_BN_idx_sel_in[5] = 'd15;
            else                                  R16_w_BN_idx_sel_in[5] = 'd16; // 16 is turn off
        end
    end

    always_comb begin
        if (LAST_STAGE) begin
            if      (R16_w_BN0_idx    == 'd6)     R16_w_BN_idx_sel_in[6] = 'd0;
            else if (R16_w_BN1_idx    == 'd6)     R16_w_BN_idx_sel_in[6] = 'd1;
            else if (R16_w_BN2_idx    == 'd6)     R16_w_BN_idx_sel_in[6] = 'd2;
            else if (R16_w_BN3_idx    == 'd6)     R16_w_BN_idx_sel_in[6] = 'd3;
            else if (R16_w_BN4_idx    == 'd6)     R16_w_BN_idx_sel_in[6] = 'd4;
            else if (R16_w_BN5_idx    == 'd6)     R16_w_BN_idx_sel_in[6] = 'd5;
            else if (R16_w_BN6_idx    == 'd6)     R16_w_BN_idx_sel_in[6] = 'd6;
            else if (R16_w_BN7_idx    == 'd6)     R16_w_BN_idx_sel_in[6] = 'd7;
            else if (R16_w_BN8_idx    == 'd6)     R16_w_BN_idx_sel_in[6] = 'd8;
            else if (R16_w_BN9_idx    == 'd6)     R16_w_BN_idx_sel_in[6] = 'd9;
            else if (R16_w_BN10_idx   == 'd6)     R16_w_BN_idx_sel_in[6] = 'd10;
            else if (R16_w_BN11_idx   == 'd6)     R16_w_BN_idx_sel_in[6] = 'd11;
            else if (R16_w_BN12_idx   == 'd6)     R16_w_BN_idx_sel_in[6] = 'd12;
            else if (R16_w_BN13_idx   == 'd6)     R16_w_BN_idx_sel_in[6] = 'd13;
            else if (R16_w_BN14_idx   == 'd6)     R16_w_BN_idx_sel_in[6] = 'd14;
            else if (R16_w_BN15_idx   == 'd6)     R16_w_BN_idx_sel_in[6] = 'd15;
            else                                  R16_w_BN_idx_sel_in[6] = 'd16; // 16 is turn off
        end else begin
            if      (R16_w_BN0_idx    == 'd6)     R16_w_BN_idx_sel_in[6] = 'd0;
            else if (R16_w_BN1_idx    == 'd6)     R16_w_BN_idx_sel_in[6] = 'd1;
            else if (R16_w_BN2_idx    == 'd6)     R16_w_BN_idx_sel_in[6] = 'd2;
            else if (R16_w_BN3_idx    == 'd6)     R16_w_BN_idx_sel_in[6] = 'd3;
            else if (R16_w_BN4_idx    == 'd6)     R16_w_BN_idx_sel_in[6] = 'd4;
            else if (R16_w_BN5_idx    == 'd6)     R16_w_BN_idx_sel_in[6] = 'd5;
            else if (R16_w_BN6_idx    == 'd6)     R16_w_BN_idx_sel_in[6] = 'd6;
            else if (R16_w_BN7_idx    == 'd6)     R16_w_BN_idx_sel_in[6] = 'd7;
            else if (R16_w_BN8_idx    == 'd6)     R16_w_BN_idx_sel_in[6] = 'd8;
            else if (R16_w_BN9_idx    == 'd6)     R16_w_BN_idx_sel_in[6] = 'd9;
            else if (R16_w_BN10_idx   == 'd6)     R16_w_BN_idx_sel_in[6] = 'd10;
            else if (R16_w_BN11_idx   == 'd6)     R16_w_BN_idx_sel_in[6] = 'd11;
            else if (R16_w_BN12_idx   == 'd6)     R16_w_BN_idx_sel_in[6] = 'd12;
            else if (R16_w_BN13_idx   == 'd6)     R16_w_BN_idx_sel_in[6] = 'd13;
            else if (R16_w_BN14_idx   == 'd6)     R16_w_BN_idx_sel_in[6] = 'd14;
            else if (R16_w_BN15_idx   == 'd6)     R16_w_BN_idx_sel_in[6] = 'd15;
            else                                  R16_w_BN_idx_sel_in[6] = 'd16; // 16 is turn off
        end
    end

    always_comb begin
        if (LAST_STAGE) begin
            if      (R16_w_BN0_idx    == 'd7)     R16_w_BN_idx_sel_in[7] = 'd0;
            else if (R16_w_BN1_idx    == 'd7)     R16_w_BN_idx_sel_in[7] = 'd1;
            else if (R16_w_BN2_idx    == 'd7)     R16_w_BN_idx_sel_in[7] = 'd2;
            else if (R16_w_BN3_idx    == 'd7)     R16_w_BN_idx_sel_in[7] = 'd3;
            else if (R16_w_BN4_idx    == 'd7)     R16_w_BN_idx_sel_in[7] = 'd4;
            else if (R16_w_BN5_idx    == 'd7)     R16_w_BN_idx_sel_in[7] = 'd5;
            else if (R16_w_BN6_idx    == 'd7)     R16_w_BN_idx_sel_in[7] = 'd6;
            else if (R16_w_BN7_idx    == 'd7)     R16_w_BN_idx_sel_in[7] = 'd7;
            else if (R16_w_BN8_idx    == 'd7)     R16_w_BN_idx_sel_in[7] = 'd8;
            else if (R16_w_BN9_idx    == 'd7)     R16_w_BN_idx_sel_in[7] = 'd9;
            else if (R16_w_BN10_idx   == 'd7)     R16_w_BN_idx_sel_in[7] = 'd10;
            else if (R16_w_BN11_idx   == 'd7)     R16_w_BN_idx_sel_in[7] = 'd11;
            else if (R16_w_BN12_idx   == 'd7)     R16_w_BN_idx_sel_in[7] = 'd12;
            else if (R16_w_BN13_idx   == 'd7)     R16_w_BN_idx_sel_in[7] = 'd13;
            else if (R16_w_BN14_idx   == 'd7)     R16_w_BN_idx_sel_in[7] = 'd14;
            else if (R16_w_BN15_idx   == 'd7)     R16_w_BN_idx_sel_in[7] = 'd15;
            else                                  R16_w_BN_idx_sel_in[7] = 'd16; // 16 is turn off
        end else begin
            if      (R16_w_BN0_idx    == 'd7)     R16_w_BN_idx_sel_in[7] = 'd0;
            else if (R16_w_BN1_idx    == 'd7)     R16_w_BN_idx_sel_in[7] = 'd1;
            else if (R16_w_BN2_idx    == 'd7)     R16_w_BN_idx_sel_in[7] = 'd2;
            else if (R16_w_BN3_idx    == 'd7)     R16_w_BN_idx_sel_in[7] = 'd3;
            else if (R16_w_BN4_idx    == 'd7)     R16_w_BN_idx_sel_in[7] = 'd4;
            else if (R16_w_BN5_idx    == 'd7)     R16_w_BN_idx_sel_in[7] = 'd5;
            else if (R16_w_BN6_idx    == 'd7)     R16_w_BN_idx_sel_in[7] = 'd6;
            else if (R16_w_BN7_idx    == 'd7)     R16_w_BN_idx_sel_in[7] = 'd7;
            else if (R16_w_BN8_idx    == 'd7)     R16_w_BN_idx_sel_in[7] = 'd8;
            else if (R16_w_BN9_idx    == 'd7)     R16_w_BN_idx_sel_in[7] = 'd9;
            else if (R16_w_BN10_idx   == 'd7)     R16_w_BN_idx_sel_in[7] = 'd10;
            else if (R16_w_BN11_idx   == 'd7)     R16_w_BN_idx_sel_in[7] = 'd11;
            else if (R16_w_BN12_idx   == 'd7)     R16_w_BN_idx_sel_in[7] = 'd12;
            else if (R16_w_BN13_idx   == 'd7)     R16_w_BN_idx_sel_in[7] = 'd13;
            else if (R16_w_BN14_idx   == 'd7)     R16_w_BN_idx_sel_in[7] = 'd14;
            else if (R16_w_BN15_idx   == 'd7)     R16_w_BN_idx_sel_in[7] = 'd15;
            else                                  R16_w_BN_idx_sel_in[7] = 'd16; // 16 is turn off
        end
    end

    always_comb begin
        if (LAST_STAGE) begin
            if      (R16_w_BN0_idx    == 'd8)     R16_w_BN_idx_sel_in[8] = 'd0;
            else if (R16_w_BN1_idx    == 'd8)     R16_w_BN_idx_sel_in[8] = 'd1;
            else if (R16_w_BN2_idx    == 'd8)     R16_w_BN_idx_sel_in[8] = 'd2;
            else if (R16_w_BN3_idx    == 'd8)     R16_w_BN_idx_sel_in[8] = 'd3;
            else if (R16_w_BN4_idx    == 'd8)     R16_w_BN_idx_sel_in[8] = 'd4;
            else if (R16_w_BN5_idx    == 'd8)     R16_w_BN_idx_sel_in[8] = 'd5;
            else if (R16_w_BN6_idx    == 'd8)     R16_w_BN_idx_sel_in[8] = 'd6;
            else if (R16_w_BN7_idx    == 'd8)     R16_w_BN_idx_sel_in[8] = 'd7;
            else if (R16_w_BN8_idx    == 'd8)     R16_w_BN_idx_sel_in[8] = 'd8;
            else if (R16_w_BN9_idx    == 'd8)     R16_w_BN_idx_sel_in[8] = 'd9;
            else if (R16_w_BN10_idx   == 'd8)     R16_w_BN_idx_sel_in[8] = 'd10;
            else if (R16_w_BN11_idx   == 'd8)     R16_w_BN_idx_sel_in[8] = 'd11;
            else if (R16_w_BN12_idx   == 'd8)     R16_w_BN_idx_sel_in[8] = 'd12;
            else if (R16_w_BN13_idx   == 'd8)     R16_w_BN_idx_sel_in[8] = 'd13;
            else if (R16_w_BN14_idx   == 'd8)     R16_w_BN_idx_sel_in[8] = 'd14;
            else if (R16_w_BN15_idx   == 'd8)     R16_w_BN_idx_sel_in[8] = 'd15;
            else                                  R16_w_BN_idx_sel_in[8] = 'd16; // 16 is turn off
        end else begin
            if      (R16_w_BN0_idx    == 'd8)     R16_w_BN_idx_sel_in[8] = 'd0;
            else if (R16_w_BN1_idx    == 'd8)     R16_w_BN_idx_sel_in[8] = 'd1;
            else if (R16_w_BN2_idx    == 'd8)     R16_w_BN_idx_sel_in[8] = 'd2;
            else if (R16_w_BN3_idx    == 'd8)     R16_w_BN_idx_sel_in[8] = 'd3;
            else if (R16_w_BN4_idx    == 'd8)     R16_w_BN_idx_sel_in[8] = 'd4;
            else if (R16_w_BN5_idx    == 'd8)     R16_w_BN_idx_sel_in[8] = 'd5;
            else if (R16_w_BN6_idx    == 'd8)     R16_w_BN_idx_sel_in[8] = 'd6;
            else if (R16_w_BN7_idx    == 'd8)     R16_w_BN_idx_sel_in[8] = 'd7;
            else if (R16_w_BN8_idx    == 'd8)     R16_w_BN_idx_sel_in[8] = 'd8;
            else if (R16_w_BN9_idx    == 'd8)     R16_w_BN_idx_sel_in[8] = 'd9;
            else if (R16_w_BN10_idx   == 'd8)     R16_w_BN_idx_sel_in[8] = 'd10;
            else if (R16_w_BN11_idx   == 'd8)     R16_w_BN_idx_sel_in[8] = 'd11;
            else if (R16_w_BN12_idx   == 'd8)     R16_w_BN_idx_sel_in[8] = 'd12;
            else if (R16_w_BN13_idx   == 'd8)     R16_w_BN_idx_sel_in[8] = 'd13;
            else if (R16_w_BN14_idx   == 'd8)     R16_w_BN_idx_sel_in[8] = 'd14;
            else if (R16_w_BN15_idx   == 'd8)     R16_w_BN_idx_sel_in[8] = 'd15;
            else                                  R16_w_BN_idx_sel_in[8] = 'd16; // 16 is turn off
        end
        
    end

    always_comb begin
        if (LAST_STAGE) begin
            if      (R16_w_BN0_idx    == 'd9)     R16_w_BN_idx_sel_in[9] = 'd0;
            else if (R16_w_BN1_idx    == 'd9)     R16_w_BN_idx_sel_in[9] = 'd1;
            else if (R16_w_BN2_idx    == 'd9)     R16_w_BN_idx_sel_in[9] = 'd2;
            else if (R16_w_BN3_idx    == 'd9)     R16_w_BN_idx_sel_in[9] = 'd3;
            else if (R16_w_BN4_idx    == 'd9)     R16_w_BN_idx_sel_in[9] = 'd4;
            else if (R16_w_BN5_idx    == 'd9)     R16_w_BN_idx_sel_in[9] = 'd5;
            else if (R16_w_BN6_idx    == 'd9)     R16_w_BN_idx_sel_in[9] = 'd6;
            else if (R16_w_BN7_idx    == 'd9)     R16_w_BN_idx_sel_in[9] = 'd7;
            else if (R16_w_BN8_idx    == 'd9)     R16_w_BN_idx_sel_in[9] = 'd8;
            else if (R16_w_BN9_idx    == 'd9)     R16_w_BN_idx_sel_in[9] = 'd9;
            else if (R16_w_BN10_idx   == 'd9)     R16_w_BN_idx_sel_in[9] = 'd10;
            else if (R16_w_BN11_idx   == 'd9)     R16_w_BN_idx_sel_in[9] = 'd11;
            else if (R16_w_BN12_idx   == 'd9)     R16_w_BN_idx_sel_in[9] = 'd12;
            else if (R16_w_BN13_idx   == 'd9)     R16_w_BN_idx_sel_in[9] = 'd13;
            else if (R16_w_BN14_idx   == 'd9)     R16_w_BN_idx_sel_in[9] = 'd14;
            else if (R16_w_BN15_idx   == 'd9)     R16_w_BN_idx_sel_in[9] = 'd15;
            else                                  R16_w_BN_idx_sel_in[9] = 'd16; // 16 is turn off
        end else begin
            if      (R16_w_BN0_idx    == 'd9)     R16_w_BN_idx_sel_in[9] = 'd0;
            else if (R16_w_BN1_idx    == 'd9)     R16_w_BN_idx_sel_in[9] = 'd1;
            else if (R16_w_BN2_idx    == 'd9)     R16_w_BN_idx_sel_in[9] = 'd2;
            else if (R16_w_BN3_idx    == 'd9)     R16_w_BN_idx_sel_in[9] = 'd3;
            else if (R16_w_BN4_idx    == 'd9)     R16_w_BN_idx_sel_in[9] = 'd4;
            else if (R16_w_BN5_idx    == 'd9)     R16_w_BN_idx_sel_in[9] = 'd5;
            else if (R16_w_BN6_idx    == 'd9)     R16_w_BN_idx_sel_in[9] = 'd6;
            else if (R16_w_BN7_idx    == 'd9)     R16_w_BN_idx_sel_in[9] = 'd7;
            else if (R16_w_BN8_idx    == 'd9)     R16_w_BN_idx_sel_in[9] = 'd8;
            else if (R16_w_BN9_idx    == 'd9)     R16_w_BN_idx_sel_in[9] = 'd9;
            else if (R16_w_BN10_idx   == 'd9)     R16_w_BN_idx_sel_in[9] = 'd10;
            else if (R16_w_BN11_idx   == 'd9)     R16_w_BN_idx_sel_in[9] = 'd11;
            else if (R16_w_BN12_idx   == 'd9)     R16_w_BN_idx_sel_in[9] = 'd12;
            else if (R16_w_BN13_idx   == 'd9)     R16_w_BN_idx_sel_in[9] = 'd13;
            else if (R16_w_BN14_idx   == 'd9)     R16_w_BN_idx_sel_in[9] = 'd14;
            else if (R16_w_BN15_idx   == 'd9)     R16_w_BN_idx_sel_in[9] = 'd15;
            else                                  R16_w_BN_idx_sel_in[9] = 'd16; // 16 is turn off
        end 
    end

    always_comb begin
        if (LAST_STAGE) begin
            if      (R16_w_BN0_idx    == 'd10)     R16_w_BN_idx_sel_in[10] = 'd0;
            else if (R16_w_BN1_idx    == 'd10)     R16_w_BN_idx_sel_in[10] = 'd1;
            else if (R16_w_BN2_idx    == 'd10)     R16_w_BN_idx_sel_in[10] = 'd2;
            else if (R16_w_BN3_idx    == 'd10)     R16_w_BN_idx_sel_in[10] = 'd3;
            else if (R16_w_BN4_idx    == 'd10)     R16_w_BN_idx_sel_in[10] = 'd4;
            else if (R16_w_BN5_idx    == 'd10)     R16_w_BN_idx_sel_in[10] = 'd5;
            else if (R16_w_BN6_idx    == 'd10)     R16_w_BN_idx_sel_in[10] = 'd6;
            else if (R16_w_BN7_idx    == 'd10)     R16_w_BN_idx_sel_in[10] = 'd7;
            else if (R16_w_BN8_idx    == 'd10)     R16_w_BN_idx_sel_in[10] = 'd8;
            else if (R16_w_BN9_idx    == 'd10)     R16_w_BN_idx_sel_in[10] = 'd9;
            else if (R16_w_BN10_idx   == 'd10)     R16_w_BN_idx_sel_in[10] = 'd10;
            else if (R16_w_BN11_idx   == 'd10)     R16_w_BN_idx_sel_in[10] = 'd11;
            else if (R16_w_BN12_idx   == 'd10)     R16_w_BN_idx_sel_in[10] = 'd12;
            else if (R16_w_BN13_idx   == 'd10)     R16_w_BN_idx_sel_in[10] = 'd13;
            else if (R16_w_BN14_idx   == 'd10)     R16_w_BN_idx_sel_in[10] = 'd14;
            else if (R16_w_BN15_idx   == 'd10)     R16_w_BN_idx_sel_in[10] = 'd15;
            else                                   R16_w_BN_idx_sel_in[10] = 'd16; // 16 is turn off
        end else begin
            if      (R16_w_BN0_idx    == 'd10)     R16_w_BN_idx_sel_in[10] = 'd0;
            else if (R16_w_BN1_idx    == 'd10)     R16_w_BN_idx_sel_in[10] = 'd1;
            else if (R16_w_BN2_idx    == 'd10)     R16_w_BN_idx_sel_in[10] = 'd2;
            else if (R16_w_BN3_idx    == 'd10)     R16_w_BN_idx_sel_in[10] = 'd3;
            else if (R16_w_BN4_idx    == 'd10)     R16_w_BN_idx_sel_in[10] = 'd4;
            else if (R16_w_BN5_idx    == 'd10)     R16_w_BN_idx_sel_in[10] = 'd5;
            else if (R16_w_BN6_idx    == 'd10)     R16_w_BN_idx_sel_in[10] = 'd6;
            else if (R16_w_BN7_idx    == 'd10)     R16_w_BN_idx_sel_in[10] = 'd7;
            else if (R16_w_BN8_idx    == 'd10)     R16_w_BN_idx_sel_in[10] = 'd8;
            else if (R16_w_BN9_idx    == 'd10)     R16_w_BN_idx_sel_in[10] = 'd9;
            else if (R16_w_BN10_idx   == 'd10)     R16_w_BN_idx_sel_in[10] = 'd10;
            else if (R16_w_BN11_idx   == 'd10)     R16_w_BN_idx_sel_in[10] = 'd11;
            else if (R16_w_BN12_idx   == 'd10)     R16_w_BN_idx_sel_in[10] = 'd12;
            else if (R16_w_BN13_idx   == 'd10)     R16_w_BN_idx_sel_in[10] = 'd13;
            else if (R16_w_BN14_idx   == 'd10)     R16_w_BN_idx_sel_in[10] = 'd14;
            else if (R16_w_BN15_idx   == 'd10)     R16_w_BN_idx_sel_in[10] = 'd15;
            else                                   R16_w_BN_idx_sel_in[10] = 'd16; // 16 is turn off
        end
    end

    always_comb begin
        if (LAST_STAGE) begin
            if      (R16_w_BN0_idx    == 'd11)     R16_w_BN_idx_sel_in[11] = 'd0;
            else if (R16_w_BN1_idx    == 'd11)     R16_w_BN_idx_sel_in[11] = 'd1;
            else if (R16_w_BN2_idx    == 'd11)     R16_w_BN_idx_sel_in[11] = 'd2;
            else if (R16_w_BN3_idx    == 'd11)     R16_w_BN_idx_sel_in[11] = 'd3;
            else if (R16_w_BN4_idx    == 'd11)     R16_w_BN_idx_sel_in[11] = 'd4;
            else if (R16_w_BN5_idx    == 'd11)     R16_w_BN_idx_sel_in[11] = 'd5;
            else if (R16_w_BN6_idx    == 'd11)     R16_w_BN_idx_sel_in[11] = 'd6;
            else if (R16_w_BN7_idx    == 'd11)     R16_w_BN_idx_sel_in[11] = 'd7;
            else if (R16_w_BN8_idx    == 'd11)     R16_w_BN_idx_sel_in[11] = 'd8;
            else if (R16_w_BN9_idx    == 'd11)     R16_w_BN_idx_sel_in[11] = 'd9;
            else if (R16_w_BN10_idx   == 'd11)     R16_w_BN_idx_sel_in[11] = 'd10;
            else if (R16_w_BN11_idx   == 'd11)     R16_w_BN_idx_sel_in[11] = 'd11;
            else if (R16_w_BN12_idx   == 'd11)     R16_w_BN_idx_sel_in[11] = 'd12;
            else if (R16_w_BN13_idx   == 'd11)     R16_w_BN_idx_sel_in[11] = 'd13;
            else if (R16_w_BN14_idx   == 'd11)     R16_w_BN_idx_sel_in[11] = 'd14;
            else if (R16_w_BN15_idx   == 'd11)     R16_w_BN_idx_sel_in[11] = 'd15;
            else                                   R16_w_BN_idx_sel_in[11] = 'd16; // 16 is turn off
        end else begin
            if      (R16_w_BN0_idx    == 'd11)     R16_w_BN_idx_sel_in[11] = 'd0;
            else if (R16_w_BN1_idx    == 'd11)     R16_w_BN_idx_sel_in[11] = 'd1;
            else if (R16_w_BN2_idx    == 'd11)     R16_w_BN_idx_sel_in[11] = 'd2;
            else if (R16_w_BN3_idx    == 'd11)     R16_w_BN_idx_sel_in[11] = 'd3;
            else if (R16_w_BN4_idx    == 'd11)     R16_w_BN_idx_sel_in[11] = 'd4;
            else if (R16_w_BN5_idx    == 'd11)     R16_w_BN_idx_sel_in[11] = 'd5;
            else if (R16_w_BN6_idx    == 'd11)     R16_w_BN_idx_sel_in[11] = 'd6;
            else if (R16_w_BN7_idx    == 'd11)     R16_w_BN_idx_sel_in[11] = 'd7;
            else if (R16_w_BN8_idx    == 'd11)     R16_w_BN_idx_sel_in[11] = 'd8;
            else if (R16_w_BN9_idx    == 'd11)     R16_w_BN_idx_sel_in[11] = 'd9;
            else if (R16_w_BN10_idx   == 'd11)     R16_w_BN_idx_sel_in[11] = 'd10;
            else if (R16_w_BN11_idx   == 'd11)     R16_w_BN_idx_sel_in[11] = 'd11;
            else if (R16_w_BN12_idx   == 'd11)     R16_w_BN_idx_sel_in[11] = 'd12;
            else if (R16_w_BN13_idx   == 'd11)     R16_w_BN_idx_sel_in[11] = 'd13;
            else if (R16_w_BN14_idx   == 'd11)     R16_w_BN_idx_sel_in[11] = 'd14;
            else if (R16_w_BN15_idx   == 'd11)     R16_w_BN_idx_sel_in[11] = 'd15;
            else                                   R16_w_BN_idx_sel_in[11] = 'd16; // 16 is turn off
        end 
    end

    always_comb begin
        if (LAST_STAGE) begin
            if      (R16_w_BN0_idx    == 'd12)     R16_w_BN_idx_sel_in[12] = 'd0;
            else if (R16_w_BN1_idx    == 'd12)     R16_w_BN_idx_sel_in[12] = 'd1;
            else if (R16_w_BN2_idx    == 'd12)     R16_w_BN_idx_sel_in[12] = 'd2;
            else if (R16_w_BN3_idx    == 'd12)     R16_w_BN_idx_sel_in[12] = 'd3;
            else if (R16_w_BN4_idx    == 'd12)     R16_w_BN_idx_sel_in[12] = 'd4;
            else if (R16_w_BN5_idx    == 'd12)     R16_w_BN_idx_sel_in[12] = 'd5;
            else if (R16_w_BN6_idx    == 'd12)     R16_w_BN_idx_sel_in[12] = 'd6;
            else if (R16_w_BN7_idx    == 'd12)     R16_w_BN_idx_sel_in[12] = 'd7;
            else if (R16_w_BN8_idx    == 'd12)     R16_w_BN_idx_sel_in[12] = 'd8;
            else if (R16_w_BN9_idx    == 'd12)     R16_w_BN_idx_sel_in[12] = 'd9;
            else if (R16_w_BN10_idx   == 'd12)     R16_w_BN_idx_sel_in[12] = 'd10;
            else if (R16_w_BN11_idx   == 'd12)     R16_w_BN_idx_sel_in[12] = 'd11;
            else if (R16_w_BN12_idx   == 'd12)     R16_w_BN_idx_sel_in[12] = 'd12;
            else if (R16_w_BN13_idx   == 'd12)     R16_w_BN_idx_sel_in[12] = 'd13;
            else if (R16_w_BN14_idx   == 'd12)     R16_w_BN_idx_sel_in[12] = 'd14;
            else if (R16_w_BN15_idx   == 'd12)     R16_w_BN_idx_sel_in[12] = 'd15;
            else                                   R16_w_BN_idx_sel_in[12] = 'd16; // 16 is turn off
        end else begin
            if      (R16_w_BN0_idx    == 'd12)     R16_w_BN_idx_sel_in[12] = 'd0;
            else if (R16_w_BN1_idx    == 'd12)     R16_w_BN_idx_sel_in[12] = 'd1;
            else if (R16_w_BN2_idx    == 'd12)     R16_w_BN_idx_sel_in[12] = 'd2;
            else if (R16_w_BN3_idx    == 'd12)     R16_w_BN_idx_sel_in[12] = 'd3;
            else if (R16_w_BN4_idx    == 'd12)     R16_w_BN_idx_sel_in[12] = 'd4;
            else if (R16_w_BN5_idx    == 'd12)     R16_w_BN_idx_sel_in[12] = 'd5;
            else if (R16_w_BN6_idx    == 'd12)     R16_w_BN_idx_sel_in[12] = 'd6;
            else if (R16_w_BN7_idx    == 'd12)     R16_w_BN_idx_sel_in[12] = 'd7;
            else if (R16_w_BN8_idx    == 'd12)     R16_w_BN_idx_sel_in[12] = 'd8;
            else if (R16_w_BN9_idx    == 'd12)     R16_w_BN_idx_sel_in[12] = 'd9;
            else if (R16_w_BN10_idx   == 'd12)     R16_w_BN_idx_sel_in[12] = 'd10;
            else if (R16_w_BN11_idx   == 'd12)     R16_w_BN_idx_sel_in[12] = 'd11;
            else if (R16_w_BN12_idx   == 'd12)     R16_w_BN_idx_sel_in[12] = 'd12;
            else if (R16_w_BN13_idx   == 'd12)     R16_w_BN_idx_sel_in[12] = 'd13;
            else if (R16_w_BN14_idx   == 'd12)     R16_w_BN_idx_sel_in[12] = 'd14;
            else if (R16_w_BN15_idx   == 'd12)     R16_w_BN_idx_sel_in[12] = 'd15;
            else                                   R16_w_BN_idx_sel_in[12] = 'd16; // 16 is turn off
        end
    end

    always_comb begin
        if (LAST_STAGE) begin
            if      (R16_w_BN0_idx    == 'd13)     R16_w_BN_idx_sel_in[13] = 'd0;
            else if (R16_w_BN1_idx    == 'd13)     R16_w_BN_idx_sel_in[13] = 'd1;
            else if (R16_w_BN2_idx    == 'd13)     R16_w_BN_idx_sel_in[13] = 'd2;
            else if (R16_w_BN3_idx    == 'd13)     R16_w_BN_idx_sel_in[13] = 'd3;
            else if (R16_w_BN4_idx    == 'd13)     R16_w_BN_idx_sel_in[13] = 'd4;
            else if (R16_w_BN5_idx    == 'd13)     R16_w_BN_idx_sel_in[13] = 'd5;
            else if (R16_w_BN6_idx    == 'd13)     R16_w_BN_idx_sel_in[13] = 'd6;
            else if (R16_w_BN7_idx    == 'd13)     R16_w_BN_idx_sel_in[13] = 'd7;
            else if (R16_w_BN8_idx    == 'd13)     R16_w_BN_idx_sel_in[13] = 'd8;
            else if (R16_w_BN9_idx    == 'd13)     R16_w_BN_idx_sel_in[13] = 'd9;
            else if (R16_w_BN10_idx   == 'd13)     R16_w_BN_idx_sel_in[13] = 'd10;
            else if (R16_w_BN11_idx   == 'd13)     R16_w_BN_idx_sel_in[13] = 'd11;
            else if (R16_w_BN12_idx   == 'd13)     R16_w_BN_idx_sel_in[13] = 'd12;
            else if (R16_w_BN13_idx   == 'd13)     R16_w_BN_idx_sel_in[13] = 'd13;
            else if (R16_w_BN14_idx   == 'd13)     R16_w_BN_idx_sel_in[13] = 'd14;
            else if (R16_w_BN15_idx   == 'd13)     R16_w_BN_idx_sel_in[13] = 'd15;
            else                                   R16_w_BN_idx_sel_in[13] = 'd16; // 16 is turn off
        end else begin
            if      (R16_w_BN0_idx    == 'd13)     R16_w_BN_idx_sel_in[13] = 'd0;
            else if (R16_w_BN1_idx    == 'd13)     R16_w_BN_idx_sel_in[13] = 'd1;
            else if (R16_w_BN2_idx    == 'd13)     R16_w_BN_idx_sel_in[13] = 'd2;
            else if (R16_w_BN3_idx    == 'd13)     R16_w_BN_idx_sel_in[13] = 'd3;
            else if (R16_w_BN4_idx    == 'd13)     R16_w_BN_idx_sel_in[13] = 'd4;
            else if (R16_w_BN5_idx    == 'd13)     R16_w_BN_idx_sel_in[13] = 'd5;
            else if (R16_w_BN6_idx    == 'd13)     R16_w_BN_idx_sel_in[13] = 'd6;
            else if (R16_w_BN7_idx    == 'd13)     R16_w_BN_idx_sel_in[13] = 'd7;
            else if (R16_w_BN8_idx    == 'd13)     R16_w_BN_idx_sel_in[13] = 'd8;
            else if (R16_w_BN9_idx    == 'd13)     R16_w_BN_idx_sel_in[13] = 'd9;
            else if (R16_w_BN10_idx   == 'd13)     R16_w_BN_idx_sel_in[13] = 'd10;
            else if (R16_w_BN11_idx   == 'd13)     R16_w_BN_idx_sel_in[13] = 'd11;
            else if (R16_w_BN12_idx   == 'd13)     R16_w_BN_idx_sel_in[13] = 'd12;
            else if (R16_w_BN13_idx   == 'd13)     R16_w_BN_idx_sel_in[13] = 'd13;
            else if (R16_w_BN14_idx   == 'd13)     R16_w_BN_idx_sel_in[13] = 'd14;
            else if (R16_w_BN15_idx   == 'd13)     R16_w_BN_idx_sel_in[13] = 'd15;
            else                                   R16_w_BN_idx_sel_in[13] = 'd16; // 16 is turn off
        end
    end

    always_comb begin
        if (LAST_STAGE) begin
            if      (R16_w_BN0_idx    == 'd14)     R16_w_BN_idx_sel_in[14] = 'd0;
            else if (R16_w_BN1_idx    == 'd14)     R16_w_BN_idx_sel_in[14] = 'd1;
            else if (R16_w_BN2_idx    == 'd14)     R16_w_BN_idx_sel_in[14] = 'd2;
            else if (R16_w_BN3_idx    == 'd14)     R16_w_BN_idx_sel_in[14] = 'd3;
            else if (R16_w_BN4_idx    == 'd14)     R16_w_BN_idx_sel_in[14] = 'd4;
            else if (R16_w_BN5_idx    == 'd14)     R16_w_BN_idx_sel_in[14] = 'd5;
            else if (R16_w_BN6_idx    == 'd14)     R16_w_BN_idx_sel_in[14] = 'd6;
            else if (R16_w_BN7_idx    == 'd14)     R16_w_BN_idx_sel_in[14] = 'd7;
            else if (R16_w_BN8_idx    == 'd14)     R16_w_BN_idx_sel_in[14] = 'd8;
            else if (R16_w_BN9_idx    == 'd14)     R16_w_BN_idx_sel_in[14] = 'd9;
            else if (R16_w_BN10_idx   == 'd14)     R16_w_BN_idx_sel_in[14] = 'd10;
            else if (R16_w_BN11_idx   == 'd14)     R16_w_BN_idx_sel_in[14] = 'd11;
            else if (R16_w_BN12_idx   == 'd14)     R16_w_BN_idx_sel_in[14] = 'd12;
            else if (R16_w_BN13_idx   == 'd14)     R16_w_BN_idx_sel_in[14] = 'd13;
            else if (R16_w_BN14_idx   == 'd14)     R16_w_BN_idx_sel_in[14] = 'd14;
            else if (R16_w_BN15_idx   == 'd14)     R16_w_BN_idx_sel_in[14] = 'd15;
            else                                   R16_w_BN_idx_sel_in[14] = 'd16; // 16 is turn off
        end else begin
            if      (R16_w_BN0_idx    == 'd14)     R16_w_BN_idx_sel_in[14] = 'd0;
            else if (R16_w_BN1_idx    == 'd14)     R16_w_BN_idx_sel_in[14] = 'd1;
            else if (R16_w_BN2_idx    == 'd14)     R16_w_BN_idx_sel_in[14] = 'd2;
            else if (R16_w_BN3_idx    == 'd14)     R16_w_BN_idx_sel_in[14] = 'd3;
            else if (R16_w_BN4_idx    == 'd14)     R16_w_BN_idx_sel_in[14] = 'd4;
            else if (R16_w_BN5_idx    == 'd14)     R16_w_BN_idx_sel_in[14] = 'd5;
            else if (R16_w_BN6_idx    == 'd14)     R16_w_BN_idx_sel_in[14] = 'd6;
            else if (R16_w_BN7_idx    == 'd14)     R16_w_BN_idx_sel_in[14] = 'd7;
            else if (R16_w_BN8_idx    == 'd14)     R16_w_BN_idx_sel_in[14] = 'd8;
            else if (R16_w_BN9_idx    == 'd14)     R16_w_BN_idx_sel_in[14] = 'd9;
            else if (R16_w_BN10_idx   == 'd14)     R16_w_BN_idx_sel_in[14] = 'd10;
            else if (R16_w_BN11_idx   == 'd14)     R16_w_BN_idx_sel_in[14] = 'd11;
            else if (R16_w_BN12_idx   == 'd14)     R16_w_BN_idx_sel_in[14] = 'd12;
            else if (R16_w_BN13_idx   == 'd14)     R16_w_BN_idx_sel_in[14] = 'd13;
            else if (R16_w_BN14_idx   == 'd14)     R16_w_BN_idx_sel_in[14] = 'd14;
            else if (R16_w_BN15_idx   == 'd14)     R16_w_BN_idx_sel_in[14] = 'd15;
            else                                   R16_w_BN_idx_sel_in[14] = 'd16; // 16 is turn off
        end
    end

    always_comb begin
        if (LAST_STAGE) begin
            if      (R16_w_BN0_idx    == 'd15)     R16_w_BN_idx_sel_in[15] = 'd0;
            else if (R16_w_BN1_idx    == 'd15)     R16_w_BN_idx_sel_in[15] = 'd1;
            else if (R16_w_BN2_idx    == 'd15)     R16_w_BN_idx_sel_in[15] = 'd2;
            else if (R16_w_BN3_idx    == 'd15)     R16_w_BN_idx_sel_in[15] = 'd3;
            else if (R16_w_BN4_idx    == 'd15)     R16_w_BN_idx_sel_in[15] = 'd4;
            else if (R16_w_BN5_idx    == 'd15)     R16_w_BN_idx_sel_in[15] = 'd5;
            else if (R16_w_BN6_idx    == 'd15)     R16_w_BN_idx_sel_in[15] = 'd6;
            else if (R16_w_BN7_idx    == 'd15)     R16_w_BN_idx_sel_in[15] = 'd7;
            else if (R16_w_BN8_idx    == 'd15)     R16_w_BN_idx_sel_in[15] = 'd8;
            else if (R16_w_BN9_idx    == 'd15)     R16_w_BN_idx_sel_in[15] = 'd9;
            else if (R16_w_BN10_idx   == 'd15)     R16_w_BN_idx_sel_in[15] = 'd10;
            else if (R16_w_BN11_idx   == 'd15)     R16_w_BN_idx_sel_in[15] = 'd11;
            else if (R16_w_BN12_idx   == 'd15)     R16_w_BN_idx_sel_in[15] = 'd12;
            else if (R16_w_BN13_idx   == 'd15)     R16_w_BN_idx_sel_in[15] = 'd13;
            else if (R16_w_BN14_idx   == 'd15)     R16_w_BN_idx_sel_in[15] = 'd14;
            else if (R16_w_BN15_idx   == 'd15)     R16_w_BN_idx_sel_in[15] = 'd15;
            else                                   R16_w_BN_idx_sel_in[15] = 'd16; // 16 is turn off
        end else begin
            if      (R16_w_BN0_idx    == 'd15)     R16_w_BN_idx_sel_in[15] = 'd0;
            else if (R16_w_BN1_idx    == 'd15)     R16_w_BN_idx_sel_in[15] = 'd1;
            else if (R16_w_BN2_idx    == 'd15)     R16_w_BN_idx_sel_in[15] = 'd2;
            else if (R16_w_BN3_idx    == 'd15)     R16_w_BN_idx_sel_in[15] = 'd3;
            else if (R16_w_BN4_idx    == 'd15)     R16_w_BN_idx_sel_in[15] = 'd4;
            else if (R16_w_BN5_idx    == 'd15)     R16_w_BN_idx_sel_in[15] = 'd5;
            else if (R16_w_BN6_idx    == 'd15)     R16_w_BN_idx_sel_in[15] = 'd6;
            else if (R16_w_BN7_idx    == 'd15)     R16_w_BN_idx_sel_in[15] = 'd7;
            else if (R16_w_BN8_idx    == 'd15)     R16_w_BN_idx_sel_in[15] = 'd8;
            else if (R16_w_BN9_idx    == 'd15)     R16_w_BN_idx_sel_in[15] = 'd9;
            else if (R16_w_BN10_idx   == 'd15)     R16_w_BN_idx_sel_in[15] = 'd10;
            else if (R16_w_BN11_idx   == 'd15)     R16_w_BN_idx_sel_in[15] = 'd11;
            else if (R16_w_BN12_idx   == 'd15)     R16_w_BN_idx_sel_in[15] = 'd12;
            else if (R16_w_BN13_idx   == 'd15)     R16_w_BN_idx_sel_in[15] = 'd13;
            else if (R16_w_BN14_idx   == 'd15)     R16_w_BN_idx_sel_in[15] = 'd14;
            else if (R16_w_BN15_idx   == 'd15)     R16_w_BN_idx_sel_in[15] = 'd15;
            else                                   R16_w_BN_idx_sel_in[15] = 'd16; // 16 is turn off
        end    
    end


    //-----------Read by A port-------------
    generate
        for (i = 0; i < radix_16; i = i + 1) begin: Mux_16_1_in_A
            Mux_16_1_in Mux_16_1_in_A(
            //input
            .A_0    (MA0_idx),
            .A_1    (MA1_idx),
            .A_2    (MA2_idx),
            .A_3    (MA3_idx),
            .A_4    (MA4_idx),
            .A_5    (MA5_idx),
            .A_6    (MA6_idx),
            .A_7    (MA7_idx),
            .A_8    (MA8_idx),
            .A_9    (MA9_idx),
            .A_10   (MA10_idx),
            .A_11   (MA11_idx),
            .A_12   (MA12_idx),
            .A_13   (MA13_idx),
            .A_14   (MA14_idx),
            .A_15   (MA15_idx),

            .D_0    (zero_mux_16_in),
            .D_1    (zero_mux_16_in),
            .D_2    (zero_mux_16_in),
            .D_3    (zero_mux_16_in),
            .D_4    (zero_mux_16_in),
            .D_5    (zero_mux_16_in),
            .D_6    (zero_mux_16_in),
            .D_7    (zero_mux_16_in),
            .D_8    (zero_mux_16_in),
            .D_9    (zero_mux_16_in),
            .D_10   (zero_mux_16_in),
            .D_11   (zero_mux_16_in),
            .D_12   (zero_mux_16_in),
            .D_13   (zero_mux_16_in),
            .D_14   (zero_mux_16_in),
            .D_15   (zero_mux_16_in),
            .sel_in (BN_idx_sel_in[i]),
            .r_enable(r_enable),
            //output
            .CEN_out(CENA[i]),
            .A_out(AA[i]),
            .D_out(DA[i]),
            .WEN_out(WENA[i])
        );
        end
    endgenerate

    //----------write by B port-----------
    generate
        for (i = 0; i < radix_16; i = i + 1) begin: w_R16_Mux_16_1_in
            w_R16_Mux_16_1_in w_R16_Mux_16_1_in(
            //input
            .A_0    (R16_w_MA0_idx),
            .A_1    (R16_w_MA1_idx),
            .A_2    (R16_w_MA2_idx),
            .A_3    (R16_w_MA3_idx),
            .A_4    (R16_w_MA4_idx),
            .A_5    (R16_w_MA5_idx),
            .A_6    (R16_w_MA6_idx),
            .A_7    (R16_w_MA7_idx),
            .A_8    (R16_w_MA8_idx),
            .A_9    (R16_w_MA9_idx),
            .A_10   (R16_w_MA10_idx),
            .A_11   (R16_w_MA11_idx),
            .A_12   (R16_w_MA12_idx),
            .A_13   (R16_w_MA13_idx),
            .A_14   (R16_w_MA14_idx),
            .A_15   (R16_w_MA15_idx),

            .D_0    (data_in0),
            .D_1    (data_in1),
            .D_2    (data_in2),
            .D_3    (data_in3),
            .D_4    (data_in4),
            .D_5    (data_in5),
            .D_6    (data_in6),
            .D_7    (data_in7),
            .D_8    (data_in8),
            .D_9    (data_in9),
            .D_10   (data_in10),
            .D_11   (data_in11),
            .D_12   (data_in12),
            .D_13   (data_in13),
            .D_14   (data_in14),
            .D_15   (data_in15),
            .sel_in (R16_w_BN_idx_sel_in[i]),
            .w_enable(w_enable),
            //output
            .CEN_out(CENB[i]),
            .A_out(AB[i]),
            .D_out(DB[i]),
            .WEN_out(WENB[i])
        );
        end
    endgenerate

    // A port for read, B port for write
    generate
        for(i = 0; i < radix_16; i = i + 1) begin : gen_sram
            SRAM_DP_512 sram(
                .QA(QA[i]),
                .QB(QB[i]),
                .CLKA(clk),
                .CENA(CENA[i]),
                .WENA(WENA[i]),
                .AA(AA[i]),
                .DA({zero, DA[i]}),
                .CLKB(clk),
                .CENB(CENB[i]),
                .WENB(WENB[i]),
                .AB(AB[i]),
                .DB({zero, DB[i]}),
                .EMAA(EMAA),
                .EMAB(EMAB)
            );
            assign QA_out[i] = QA[i][`D_width-1:0];
        end
    endgenerate
    
    //-----------------------  
    assign sel_out[0] = BN0_idx_out;
    assign sel_out[1] = BN1_idx_out;
    assign sel_out[2] = BN2_idx_out;
    assign sel_out[3] = BN3_idx_out;
    assign sel_out[4] = BN4_idx_out;
    assign sel_out[5] = BN5_idx_out;
    assign sel_out[6] = BN6_idx_out;
    assign sel_out[7] = BN7_idx_out;
    assign sel_out[8] = BN8_idx_out;
    assign sel_out[9] = BN9_idx_out;
    assign sel_out[10] = BN10_idx_out;
    assign sel_out[11] = BN11_idx_out;
    assign sel_out[12] = BN12_idx_out;
    assign sel_out[13] = BN13_idx_out;
    assign sel_out[14] = BN14_idx_out;
    assign sel_out[15] = BN15_idx_out;
    
    generate
        for (i = 0; i < radix_16; i = i + 1) begin: Mux_16_1_out
            Mux_16_1_out Mux_16_1_out(
                //input
                .Q_0    (QA_out[0]),
                .Q_1    (QA_out[1]),
                .Q_2    (QA_out[2]),
                .Q_3    (QA_out[3]),
                .Q_4    (QA_out[4]),
                .Q_5    (QA_out[5]),
                .Q_6    (QA_out[6]),
                .Q_7    (QA_out[7]),
                .Q_8    (QA_out[8]),
                .Q_9    (QA_out[9]),
                .Q_10   (QA_out[10]),
                .Q_11   (QA_out[11]),
                .Q_12   (QA_out[12]),
                .Q_13   (QA_out[13]),
                .Q_14   (QA_out[14]),
                .Q_15   (QA_out[15]),
                .sel_out(sel_out[i]),
                //output
                .Q_out  (QA_out_sel[i])
            );
        end
    endgenerate

    
    //------------------------------------
    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            MA0_idx_out     <= 'd0;
            MA1_idx_out     <= 'd0;
            MA2_idx_out     <= 'd0;
            MA3_idx_out     <= 'd0;
            MA4_idx_out     <= 'd0;
            MA5_idx_out     <= 'd0;
            MA6_idx_out     <= 'd0;
            MA7_idx_out     <= 'd0;
            MA8_idx_out     <= 'd0;
            MA9_idx_out     <= 'd0;
            MA10_idx_out    <= 'd0;
            MA11_idx_out    <= 'd0;
            MA12_idx_out    <= 'd0;
            MA13_idx_out    <= 'd0;
            MA14_idx_out    <= 'd0;
            MA15_idx_out    <= 'd0;
            BN0_idx_out     <= 'd0;
            BN1_idx_out     <= 'd0;
            BN2_idx_out     <= 'd0;
            BN3_idx_out     <= 'd0;
            BN4_idx_out     <= 'd0;
            BN5_idx_out     <= 'd0;
            BN6_idx_out     <= 'd0;
            BN7_idx_out     <= 'd0;
            BN8_idx_out     <= 'd0;
            BN9_idx_out     <= 'd0;
            BN10_idx_out    <= 'd0;
            BN11_idx_out    <= 'd0;
            BN12_idx_out    <= 'd0;
            BN13_idx_out    <= 'd0;
            BN14_idx_out    <= 'd0;
            BN15_idx_out    <= 'd0;
            r_enable_out    <= 'd0;
            w_enable_out    <= 'd0;
        end else begin
            MA0_idx_out     <= MA0_idx;
            MA1_idx_out     <= MA1_idx;
            MA2_idx_out     <= MA2_idx;
            MA3_idx_out     <= MA3_idx;
            MA4_idx_out     <= MA4_idx;
            MA5_idx_out     <= MA5_idx;
            MA6_idx_out     <= MA6_idx;
            MA7_idx_out     <= MA7_idx;
            MA8_idx_out     <= MA8_idx;
            MA9_idx_out     <= MA9_idx;
            MA10_idx_out    <= MA10_idx;
            MA11_idx_out    <= MA11_idx;
            MA12_idx_out    <= MA12_idx;
            MA13_idx_out    <= MA13_idx;
            MA14_idx_out    <= MA14_idx;
            MA15_idx_out    <= MA15_idx;
            BN0_idx_out     <= BN0_idx;
            BN1_idx_out     <= BN1_idx;
            BN2_idx_out     <= BN2_idx;
            BN3_idx_out     <= BN3_idx;
            BN4_idx_out     <= BN4_idx;
            BN5_idx_out     <= BN5_idx;
            BN6_idx_out     <= BN6_idx;
            BN7_idx_out     <= BN7_idx;
            BN8_idx_out     <= BN8_idx;
            BN9_idx_out     <= BN9_idx;
            BN10_idx_out    <= BN10_idx;
            BN11_idx_out    <= BN11_idx;
            BN12_idx_out    <= BN12_idx;
            BN13_idx_out    <= BN13_idx;
            BN14_idx_out    <= BN14_idx;
            BN15_idx_out    <= BN15_idx;
            r_enable_out    <= r_enable;
            w_enable_out    <= w_enable;
        end
    end

    always_comb begin
        if (r_enable_out) begin
            memory_b0   =   QA_out_sel[0]   ; 
            memory_b1   =   QA_out_sel[1]   ; 
            memory_b2   =   QA_out_sel[2]   ; 
            memory_b3   =   QA_out_sel[3]   ; 
            memory_b4   =   QA_out_sel[4]   ; 
            memory_b5   =   QA_out_sel[5]   ; 
            memory_b6   =   QA_out_sel[6]   ; 
            memory_b7   =   QA_out_sel[7]   ; 
            memory_b8   =   QA_out_sel[8]   ; 
            memory_b9   =   QA_out_sel[9]   ; 
            memory_b10  =   QA_out_sel[10]  ;
            memory_b11  =   QA_out_sel[11]  ;
            memory_b12  =   QA_out_sel[12]  ;
            memory_b13  =   QA_out_sel[13]  ;
            memory_b14  =   QA_out_sel[14]  ;
            memory_b15  =   QA_out_sel[15]  ;     
        end else begin
            memory_b0   =   'd0   ; 
            memory_b1   =   'd0   ; 
            memory_b2   =   'd0  ; 
            memory_b3   =   'd0  ; 
            memory_b4   =   'd0  ; 
            memory_b5   =   'd0  ; 
            memory_b6   =   'd0  ; 
            memory_b7   =   'd0  ; 
            memory_b8   =   'd0  ; 
            memory_b9   =   'd0  ; 
            memory_b10  =   'd0  ;
            memory_b11  =   'd0  ;
            memory_b12  =   'd0  ;
            memory_b13  =   'd0  ;
            memory_b14  =   'd0  ;
            memory_b15  =   'd0  ;
        end
    end
    //--------------------------------

endmodule