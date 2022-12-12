`include "../include/define.svh"
`include "BU2_NWC.sv"
`include "delay_buffer.sv"
`include "TF_delay_buffer.sv"

module R16_BU (
    input LAST_STAGE,
    input [`D_width-1:0]    x0, x1, x2, x3, x4, x5, x6, x7,
                            x8, x9, x10, x11, x12, x13, x14, x15,

    input [`D_width-1:0]    twiddle_0, twiddle_1, twiddle_2, twiddle_3, twiddle_4, twiddle_5, twiddle_6,
                            twiddle_7, twiddle_8, twiddle_9, twiddle_10, twiddle_11, twiddle_12, twiddle_13,
                            twiddle_14, twiddle_15,
    input [`D_width-1:0] modulus,
    input clk,
    input rst,
    input ntt_enable,
    input [`MA_width-1:0] R16_MA0_idx,
    input [`MA_width-1:0] R16_MA1_idx,
    input [`MA_width-1:0] R16_MA2_idx,
    input [`MA_width-1:0] R16_MA3_idx,
    input [`MA_width-1:0] R16_MA4_idx,
    input [`MA_width-1:0] R16_MA5_idx,
    input [`MA_width-1:0] R16_MA6_idx,
    input [`MA_width-1:0] R16_MA7_idx,
    input [`MA_width-1:0] R16_MA8_idx,
    input [`MA_width-1:0] R16_MA9_idx,
    input [`MA_width-1:0] R16_MA10_idx,
    input [`MA_width-1:0] R16_MA11_idx,
    input [`MA_width-1:0] R16_MA12_idx,
    input [`MA_width-1:0] R16_MA13_idx,
    input [`MA_width-1:0] R16_MA14_idx,
    input [`MA_width-1:0] R16_MA15_idx,

    input [`BANK_width-1:0] R16_BN0_idx,
    input [`BANK_width-1:0] R16_BN1_idx,
    input [`BANK_width-1:0] R16_BN2_idx,
    input [`BANK_width-1:0] R16_BN3_idx,
    input [`BANK_width-1:0] R16_BN4_idx,
    input [`BANK_width-1:0] R16_BN5_idx,
    input [`BANK_width-1:0] R16_BN6_idx,
    input [`BANK_width-1:0] R16_BN7_idx,
    input [`BANK_width-1:0] R16_BN8_idx,
    input [`BANK_width-1:0] R16_BN9_idx,
    input [`BANK_width-1:0] R16_BN10_idx,
    input [`BANK_width-1:0] R16_BN11_idx,
    input [`BANK_width-1:0] R16_BN12_idx,
    input [`BANK_width-1:0] R16_BN13_idx,
    input [`BANK_width-1:0] R16_BN14_idx,
    input [`BANK_width-1:0] R16_BN15_idx,

    output logic [`D_width-1:0] y0, y1, y2, y3, y4, y5, y6, y7,
                                y8, y9, y10, y11, y12, y13, y14, y15,
    output logic [1:0] ntt_done,

    output logic [`MA_width-1:0] R16_MA0_idx_out ,
    output logic [`MA_width-1:0] R16_MA1_idx_out ,
    output logic [`MA_width-1:0] R16_MA2_idx_out ,
    output logic [`MA_width-1:0] R16_MA3_idx_out ,
    output logic [`MA_width-1:0] R16_MA4_idx_out ,
    output logic [`MA_width-1:0] R16_MA5_idx_out ,
    output logic [`MA_width-1:0] R16_MA6_idx_out ,
    output logic [`MA_width-1:0] R16_MA7_idx_out ,
    output logic [`MA_width-1:0] R16_MA8_idx_out ,
    output logic [`MA_width-1:0] R16_MA9_idx_out ,
    output logic [`MA_width-1:0] R16_MA10_idx_out,
    output logic [`MA_width-1:0] R16_MA11_idx_out,
    output logic [`MA_width-1:0] R16_MA12_idx_out,
    output logic [`MA_width-1:0] R16_MA13_idx_out,
    output logic [`MA_width-1:0] R16_MA14_idx_out,
    output logic [`MA_width-1:0] R16_MA15_idx_out,

    output logic [`BANK_width-1:0] R16_BN0_idx_out ,
    output logic [`BANK_width-1:0] R16_BN1_idx_out ,
    output logic [`BANK_width-1:0] R16_BN2_idx_out ,
    output logic [`BANK_width-1:0] R16_BN3_idx_out ,
    output logic [`BANK_width-1:0] R16_BN4_idx_out ,
    output logic [`BANK_width-1:0] R16_BN5_idx_out ,
    output logic [`BANK_width-1:0] R16_BN6_idx_out ,
    output logic [`BANK_width-1:0] R16_BN7_idx_out ,
    output logic [`BANK_width-1:0] R16_BN8_idx_out ,
    output logic [`BANK_width-1:0] R16_BN9_idx_out ,
    output logic [`BANK_width-1:0] R16_BN10_idx_out,
    output logic [`BANK_width-1:0] R16_BN11_idx_out,
    output logic [`BANK_width-1:0] R16_BN12_idx_out,
    output logic [`BANK_width-1:0] R16_BN13_idx_out,
    output logic [`BANK_width-1:0] R16_BN14_idx_out,
    output logic [`BANK_width-1:0] R16_BN15_idx_out
    

);

    logic [`MA_width-1:0]    R16_MA0_idx_pip_out ;
    logic [`MA_width-1:0]    R16_MA1_idx_pip_out ; 
    logic [`MA_width-1:0]    R16_MA2_idx_pip_out ; 
    logic [`MA_width-1:0]    R16_MA3_idx_pip_out ; 
    logic [`MA_width-1:0]    R16_MA4_idx_pip_out ; 
    logic [`MA_width-1:0]    R16_MA5_idx_pip_out ; 
    logic [`MA_width-1:0]    R16_MA6_idx_pip_out ; 
    logic [`MA_width-1:0]    R16_MA7_idx_pip_out ; 
    logic [`MA_width-1:0]    R16_MA8_idx_pip_out ; 
    logic [`MA_width-1:0]    R16_MA9_idx_pip_out ; 
    logic [`MA_width-1:0]    R16_MA10_idx_pip_out;
    logic [`MA_width-1:0]    R16_MA11_idx_pip_out;
    logic [`MA_width-1:0]    R16_MA12_idx_pip_out;
    logic [`MA_width-1:0]    R16_MA13_idx_pip_out;
    logic [`MA_width-1:0]    R16_MA14_idx_pip_out;
    logic [`MA_width-1:0]    R16_MA15_idx_pip_out;

    logic [`BANK_width-1:0]    R16_BN0_idx_pip_out ;
    logic [`BANK_width-1:0]    R16_BN1_idx_pip_out ;
    logic [`BANK_width-1:0]    R16_BN2_idx_pip_out ;
    logic [`BANK_width-1:0]    R16_BN3_idx_pip_out ;
    logic [`BANK_width-1:0]    R16_BN4_idx_pip_out ;
    logic [`BANK_width-1:0]    R16_BN5_idx_pip_out ;
    logic [`BANK_width-1:0]    R16_BN6_idx_pip_out ;
    logic [`BANK_width-1:0]    R16_BN7_idx_pip_out ;
    logic [`BANK_width-1:0]    R16_BN8_idx_pip_out ;
    logic [`BANK_width-1:0]    R16_BN9_idx_pip_out ;
    logic [`BANK_width-1:0]    R16_BN10_idx_pip_out;
    logic [`BANK_width-1:0]    R16_BN11_idx_pip_out;
    logic [`BANK_width-1:0]    R16_BN12_idx_pip_out;
    logic [`BANK_width-1:0]    R16_BN13_idx_pip_out;
    logic [`BANK_width-1:0]    R16_BN14_idx_pip_out;
    logic [`BANK_width-1:0]    R16_BN15_idx_pip_out;

    logic [1:0] ntt_done_pip_out;

    delay_buffer delay_buffer(
        //input
        .LAST_STAGE(LAST_STAGE),
        .clk(clk),
        .rst(rst),
        .ntt_enable(ntt_enable),
        .R16_MA0_idx (R16_MA0_idx ),
        .R16_MA1_idx (R16_MA1_idx ),
        .R16_MA2_idx (R16_MA2_idx ),
        .R16_MA3_idx (R16_MA3_idx ),
        .R16_MA4_idx (R16_MA4_idx ),
        .R16_MA5_idx (R16_MA5_idx ),
        .R16_MA6_idx (R16_MA6_idx ),
        .R16_MA7_idx (R16_MA7_idx ),
        .R16_MA8_idx (R16_MA8_idx ),
        .R16_MA9_idx (R16_MA9_idx ),
        .R16_MA10_idx(R16_MA10_idx),
        .R16_MA11_idx(R16_MA11_idx),
        .R16_MA12_idx(R16_MA12_idx),
        .R16_MA13_idx(R16_MA13_idx),
        .R16_MA14_idx(R16_MA14_idx),
        .R16_MA15_idx(R16_MA15_idx),

        .R16_BN0_idx (R16_BN0_idx ),
        .R16_BN1_idx (R16_BN1_idx ),
        .R16_BN2_idx (R16_BN2_idx ),
        .R16_BN3_idx (R16_BN3_idx ),
        .R16_BN4_idx (R16_BN4_idx ),
        .R16_BN5_idx (R16_BN5_idx ),
        .R16_BN6_idx (R16_BN6_idx ),
        .R16_BN7_idx (R16_BN7_idx ),
        .R16_BN8_idx (R16_BN8_idx ),
        .R16_BN9_idx (R16_BN9_idx ),
        .R16_BN10_idx(R16_BN10_idx),
        .R16_BN11_idx(R16_BN11_idx),
        .R16_BN12_idx(R16_BN12_idx),
        .R16_BN13_idx(R16_BN13_idx),
        .R16_BN14_idx(R16_BN14_idx),
        .R16_BN15_idx(R16_BN15_idx),

        //output
        .R16_MA0_idx_pip_out (R16_MA0_idx_pip_out ),
        .R16_MA1_idx_pip_out (R16_MA1_idx_pip_out ),
        .R16_MA2_idx_pip_out (R16_MA2_idx_pip_out ),
        .R16_MA3_idx_pip_out (R16_MA3_idx_pip_out ),
        .R16_MA4_idx_pip_out (R16_MA4_idx_pip_out ),
        .R16_MA5_idx_pip_out (R16_MA5_idx_pip_out ),
        .R16_MA6_idx_pip_out (R16_MA6_idx_pip_out ),
        .R16_MA7_idx_pip_out (R16_MA7_idx_pip_out ),
        .R16_MA8_idx_pip_out (R16_MA8_idx_pip_out ),
        .R16_MA9_idx_pip_out (R16_MA9_idx_pip_out ),
        .R16_MA10_idx_pip_out(R16_MA10_idx_pip_out),
        .R16_MA11_idx_pip_out(R16_MA11_idx_pip_out),
        .R16_MA12_idx_pip_out(R16_MA12_idx_pip_out),
        .R16_MA13_idx_pip_out(R16_MA13_idx_pip_out),
        .R16_MA14_idx_pip_out(R16_MA14_idx_pip_out),
        .R16_MA15_idx_pip_out(R16_MA15_idx_pip_out),

        .R16_BN0_idx_pip_out (R16_BN0_idx_pip_out ),
        .R16_BN1_idx_pip_out (R16_BN1_idx_pip_out ),
        .R16_BN2_idx_pip_out (R16_BN2_idx_pip_out ),
        .R16_BN3_idx_pip_out (R16_BN3_idx_pip_out ),
        .R16_BN4_idx_pip_out (R16_BN4_idx_pip_out ),
        .R16_BN5_idx_pip_out (R16_BN5_idx_pip_out ),
        .R16_BN6_idx_pip_out (R16_BN6_idx_pip_out ),
        .R16_BN7_idx_pip_out (R16_BN7_idx_pip_out ),
        .R16_BN8_idx_pip_out (R16_BN8_idx_pip_out ),
        .R16_BN9_idx_pip_out (R16_BN9_idx_pip_out ),
        .R16_BN10_idx_pip_out(R16_BN10_idx_pip_out),
        .R16_BN11_idx_pip_out(R16_BN11_idx_pip_out),
        .R16_BN12_idx_pip_out(R16_BN12_idx_pip_out),
        .R16_BN13_idx_pip_out(R16_BN13_idx_pip_out),
        .R16_BN14_idx_pip_out(R16_BN14_idx_pip_out),
        .R16_BN15_idx_pip_out(R16_BN15_idx_pip_out),

        .ntt_done_pip_out(ntt_done_pip_out)
    );

    assign R16_MA0_idx_out  =   R16_MA0_idx_pip_out ; 
    assign R16_MA1_idx_out  =   R16_MA1_idx_pip_out ; 
    assign R16_MA2_idx_out  =   R16_MA2_idx_pip_out ; 
    assign R16_MA3_idx_out  =   R16_MA3_idx_pip_out ; 
    assign R16_MA4_idx_out  =   R16_MA4_idx_pip_out ; 
    assign R16_MA5_idx_out  =   R16_MA5_idx_pip_out ; 
    assign R16_MA6_idx_out  =   R16_MA6_idx_pip_out ; 
    assign R16_MA7_idx_out  =   R16_MA7_idx_pip_out ; 
    assign R16_MA8_idx_out  =   R16_MA8_idx_pip_out ; 
    assign R16_MA9_idx_out  =   R16_MA9_idx_pip_out ; 
    assign R16_MA10_idx_out =   R16_MA10_idx_pip_out;
    assign R16_MA11_idx_out =   R16_MA11_idx_pip_out;
    assign R16_MA12_idx_out =   R16_MA12_idx_pip_out;
    assign R16_MA13_idx_out =   R16_MA13_idx_pip_out;
    assign R16_MA14_idx_out =   R16_MA14_idx_pip_out;
    assign R16_MA15_idx_out =   R16_MA15_idx_pip_out;

    assign R16_BN0_idx_out  =   R16_BN0_idx_pip_out ; 
    assign R16_BN1_idx_out  =   R16_BN1_idx_pip_out ; 
    assign R16_BN2_idx_out  =   R16_BN2_idx_pip_out ; 
    assign R16_BN3_idx_out  =   R16_BN3_idx_pip_out ; 
    assign R16_BN4_idx_out  =   R16_BN4_idx_pip_out ; 
    assign R16_BN5_idx_out  =   R16_BN5_idx_pip_out ; 
    assign R16_BN6_idx_out  =   R16_BN6_idx_pip_out ; 
    assign R16_BN7_idx_out  =   R16_BN7_idx_pip_out ; 
    assign R16_BN8_idx_out  =   R16_BN8_idx_pip_out ; 
    assign R16_BN9_idx_out  =   R16_BN9_idx_pip_out ; 
    assign R16_BN10_idx_out =   R16_BN10_idx_pip_out;
    assign R16_BN11_idx_out =   R16_BN11_idx_pip_out;
    assign R16_BN12_idx_out =   R16_BN12_idx_pip_out;
    assign R16_BN13_idx_out =   R16_BN13_idx_pip_out;
    assign R16_BN14_idx_out =   R16_BN14_idx_pip_out;
    assign R16_BN15_idx_out =   R16_BN15_idx_pip_out;

    assign ntt_done         =   ntt_done_pip_out;

    //stage 0 output
    logic [`D_width-1:0] stage0_fft_a0, stage0_fft_b0;
    logic [`D_width-1:0] stage0_fft_a1, stage0_fft_b1;
    logic [`D_width-1:0] stage0_fft_a2, stage0_fft_b2;
    logic [`D_width-1:0] stage0_fft_a3, stage0_fft_b3;
    logic [`D_width-1:0] stage0_fft_a4, stage0_fft_b4;
    logic [`D_width-1:0] stage0_fft_a5, stage0_fft_b5;
    logic [`D_width-1:0] stage0_fft_a6, stage0_fft_b6;
    logic [`D_width-1:0] stage0_fft_a7, stage0_fft_b7;

    logic [`D_width-1:0] BU0_stage0_twiddle_out;
    logic [`D_width-1:0] BU1_stage0_twiddle_out;
    logic [`D_width-1:0] BU2_stage0_twiddle_out;
    logic [`D_width-1:0] BU3_stage0_twiddle_out;
    logic [`D_width-1:0] BU4_stage0_twiddle_out;
    logic [`D_width-1:0] BU5_stage0_twiddle_out;
    logic [`D_width-1:0] BU6_stage0_twiddle_out;
    logic [`D_width-1:0] BU7_stage0_twiddle_out;

    logic [`D_width-1:0] BU0_stage0_modulus_out;
    logic [`D_width-1:0] BU1_stage0_modulus_out;
    logic [`D_width-1:0] BU2_stage0_modulus_out;
    logic [`D_width-1:0] BU3_stage0_modulus_out;
    logic [`D_width-1:0] BU4_stage0_modulus_out;
    logic [`D_width-1:0] BU5_stage0_modulus_out;
    logic [`D_width-1:0] BU6_stage0_modulus_out;
    logic [`D_width-1:0] BU7_stage0_modulus_out;

    // stage 1 input
    logic [`D_width-1:0] pip0_twiddle_0;
    logic [`D_width-1:0] pip0_twiddle_1;
    logic [`D_width-1:0] pip0_twiddle_2;
    logic [`D_width-1:0] pip0_twiddle_3;
    logic [`D_width-1:0] pip0_twiddle_4;
    logic [`D_width-1:0] pip0_twiddle_5;
    logic [`D_width-1:0] pip0_twiddle_6;
    logic [`D_width-1:0] pip0_twiddle_7;
    logic [`D_width-1:0] pip0_twiddle_8;
    logic [`D_width-1:0] pip0_twiddle_9;
    logic [`D_width-1:0] pip0_twiddle_10;
    logic [`D_width-1:0] pip0_twiddle_11;
    logic [`D_width-1:0] pip0_twiddle_12;
    logic [`D_width-1:0] pip0_twiddle_13;
    logic [`D_width-1:0] pip0_twiddle_14;
    logic [`D_width-1:0] pip0_twiddle_15;

    logic [`D_width-1:0] pip0_fft_a0, pip0_fft_b0;
    logic [`D_width-1:0] pip0_fft_a1, pip0_fft_b1;
    logic [`D_width-1:0] pip0_fft_a2, pip0_fft_b2;
    logic [`D_width-1:0] pip0_fft_a3, pip0_fft_b3;
    logic [`D_width-1:0] pip0_fft_a4, pip0_fft_b4;
    logic [`D_width-1:0] pip0_fft_a5, pip0_fft_b5;
    logic [`D_width-1:0] pip0_fft_a6, pip0_fft_b6;
    logic [`D_width-1:0] pip0_fft_a7, pip0_fft_b7;

    logic [`D_width-1:0] pip0_modulus;
    //stage 1 output
    logic [`D_width-1:0] stage1_fft_a0, stage1_fft_b0;
    logic [`D_width-1:0] stage1_fft_a1, stage1_fft_b1;
    logic [`D_width-1:0] stage1_fft_a2, stage1_fft_b2;
    logic [`D_width-1:0] stage1_fft_a3, stage1_fft_b3;
    logic [`D_width-1:0] stage1_fft_a4, stage1_fft_b4;
    logic [`D_width-1:0] stage1_fft_a5, stage1_fft_b5;
    logic [`D_width-1:0] stage1_fft_a6, stage1_fft_b6;
    logic [`D_width-1:0] stage1_fft_a7, stage1_fft_b7;

    logic [`D_width-1:0] BU0_stage1_twiddle_out;
    logic [`D_width-1:0] BU1_stage1_twiddle_out;
    logic [`D_width-1:0] BU2_stage1_twiddle_out;
    logic [`D_width-1:0] BU3_stage1_twiddle_out;
    logic [`D_width-1:0] BU4_stage1_twiddle_out;
    logic [`D_width-1:0] BU5_stage1_twiddle_out;
    logic [`D_width-1:0] BU6_stage1_twiddle_out;
    logic [`D_width-1:0] BU7_stage1_twiddle_out;

    logic [`D_width-1:0] BU0_stage1_modulus_out;
    logic [`D_width-1:0] BU1_stage1_modulus_out;
    logic [`D_width-1:0] BU2_stage1_modulus_out;
    logic [`D_width-1:0] BU3_stage1_modulus_out;
    logic [`D_width-1:0] BU4_stage1_modulus_out;
    logic [`D_width-1:0] BU5_stage1_modulus_out;
    logic [`D_width-1:0] BU6_stage1_modulus_out;
    logic [`D_width-1:0] BU7_stage1_modulus_out;

    // stage 2 input
    logic [`D_width-1:0] pip1_twiddle_0;
    logic [`D_width-1:0] pip1_twiddle_1;
    logic [`D_width-1:0] pip1_twiddle_2;
    logic [`D_width-1:0] pip1_twiddle_3;
    logic [`D_width-1:0] pip1_twiddle_4;
    logic [`D_width-1:0] pip1_twiddle_5;
    logic [`D_width-1:0] pip1_twiddle_6;
    logic [`D_width-1:0] pip1_twiddle_7;
    logic [`D_width-1:0] pip1_twiddle_8;
    logic [`D_width-1:0] pip1_twiddle_9;
    logic [`D_width-1:0] pip1_twiddle_10;
    logic [`D_width-1:0] pip1_twiddle_11;
    logic [`D_width-1:0] pip1_twiddle_12;
    logic [`D_width-1:0] pip1_twiddle_13;
    logic [`D_width-1:0] pip1_twiddle_14;
    logic [`D_width-1:0] pip1_twiddle_15;

    logic [`D_width-1:0] pip1_fft_a0, pip1_fft_b0;
    logic [`D_width-1:0] pip1_fft_a1, pip1_fft_b1;
    logic [`D_width-1:0] pip1_fft_a2, pip1_fft_b2;
    logic [`D_width-1:0] pip1_fft_a3, pip1_fft_b3;
    logic [`D_width-1:0] pip1_fft_a4, pip1_fft_b4;
    logic [`D_width-1:0] pip1_fft_a5, pip1_fft_b5;
    logic [`D_width-1:0] pip1_fft_a6, pip1_fft_b6;
    logic [`D_width-1:0] pip1_fft_a7, pip1_fft_b7;

    logic [`D_width-1:0] pip1_modulus;
    // stage 2 output
    logic [`D_width-1:0] BU0_stage2_twiddle_out;
    logic [`D_width-1:0] BU1_stage2_twiddle_out;
    logic [`D_width-1:0] BU2_stage2_twiddle_out;
    logic [`D_width-1:0] BU3_stage2_twiddle_out;
    logic [`D_width-1:0] BU4_stage2_twiddle_out;
    logic [`D_width-1:0] BU5_stage2_twiddle_out;
    logic [`D_width-1:0] BU6_stage2_twiddle_out;
    logic [`D_width-1:0] BU7_stage2_twiddle_out;

    logic [`D_width-1:0] BU0_stage2_modulus_out;
    logic [`D_width-1:0] BU1_stage2_modulus_out;
    logic [`D_width-1:0] BU2_stage2_modulus_out;
    logic [`D_width-1:0] BU3_stage2_modulus_out;
    logic [`D_width-1:0] BU4_stage2_modulus_out;
    logic [`D_width-1:0] BU5_stage2_modulus_out;
    logic [`D_width-1:0] BU6_stage2_modulus_out;
    logic [`D_width-1:0] BU7_stage2_modulus_out;

    logic [`D_width-1:0] stage2_fft_a0, stage2_fft_b0;
    logic [`D_width-1:0] stage2_fft_a1, stage2_fft_b1;
    logic [`D_width-1:0] stage2_fft_a2, stage2_fft_b2;
    logic [`D_width-1:0] stage2_fft_a3, stage2_fft_b3;
    logic [`D_width-1:0] stage2_fft_a4, stage2_fft_b4;
    logic [`D_width-1:0] stage2_fft_a5, stage2_fft_b5;
    logic [`D_width-1:0] stage2_fft_a6, stage2_fft_b6;
    logic [`D_width-1:0] stage2_fft_a7, stage2_fft_b7;
    // stage 3 input 
    logic [`D_width-1:0] pip2_twiddle_0;
    logic [`D_width-1:0] pip2_twiddle_1;
    logic [`D_width-1:0] pip2_twiddle_2;
    logic [`D_width-1:0] pip2_twiddle_3;
    logic [`D_width-1:0] pip2_twiddle_4;
    logic [`D_width-1:0] pip2_twiddle_5;
    logic [`D_width-1:0] pip2_twiddle_6;
    logic [`D_width-1:0] pip2_twiddle_7;
    logic [`D_width-1:0] pip2_twiddle_8;
    logic [`D_width-1:0] pip2_twiddle_9;
    logic [`D_width-1:0] pip2_twiddle_10;
    logic [`D_width-1:0] pip2_twiddle_11;
    logic [`D_width-1:0] pip2_twiddle_12;
    logic [`D_width-1:0] pip2_twiddle_13;
    logic [`D_width-1:0] pip2_twiddle_14;
    logic [`D_width-1:0] pip2_twiddle_15;

    logic [`D_width-1:0] pip2_fft_a0, pip2_fft_b0;
    logic [`D_width-1:0] pip2_fft_a1, pip2_fft_b1;
    logic [`D_width-1:0] pip2_fft_a2, pip2_fft_b2;
    logic [`D_width-1:0] pip2_fft_a3, pip2_fft_b3;
    logic [`D_width-1:0] pip2_fft_a4, pip2_fft_b4;
    logic [`D_width-1:0] pip2_fft_a5, pip2_fft_b5;
    logic [`D_width-1:0] pip2_fft_a6, pip2_fft_b6;
    logic [`D_width-1:0] pip2_fft_a7, pip2_fft_b7;

    logic [`D_width-1:0] pip2_modulus;

    // stage 3 output
    logic [`D_width-1:0] BU0_stage3_twiddle_out;
    logic [`D_width-1:0] BU1_stage3_twiddle_out;
    logic [`D_width-1:0] BU2_stage3_twiddle_out;
    logic [`D_width-1:0] BU3_stage3_twiddle_out;
    logic [`D_width-1:0] BU4_stage3_twiddle_out;
    logic [`D_width-1:0] BU5_stage3_twiddle_out;
    logic [`D_width-1:0] BU6_stage3_twiddle_out;
    logic [`D_width-1:0] BU7_stage3_twiddle_out;

    logic [`D_width-1:0] BU0_stage3_modulus_out;
    logic [`D_width-1:0] BU1_stage3_modulus_out;
    logic [`D_width-1:0] BU2_stage3_modulus_out;
    logic [`D_width-1:0] BU3_stage3_modulus_out;
    logic [`D_width-1:0] BU4_stage3_modulus_out;
    logic [`D_width-1:0] BU5_stage3_modulus_out;
    logic [`D_width-1:0] BU6_stage3_modulus_out;
    logic [`D_width-1:0] BU7_stage3_modulus_out;

    logic [`D_width-1:0] stage3_fft_a0, stage3_fft_b0;
    logic [`D_width-1:0] stage3_fft_a1, stage3_fft_b1;
    logic [`D_width-1:0] stage3_fft_a2, stage3_fft_b2;
    logic [`D_width-1:0] stage3_fft_a3, stage3_fft_b3;
    logic [`D_width-1:0] stage3_fft_a4, stage3_fft_b4;
    logic [`D_width-1:0] stage3_fft_a5, stage3_fft_b5;
    logic [`D_width-1:0] stage3_fft_a6, stage3_fft_b6;
    logic [`D_width-1:0] stage3_fft_a7, stage3_fft_b7;

    //-----------------------
    logic [`D_width-1:0] stage0_BU0_TF_mux;
    logic [`D_width-1:0] stage0_BU1_TF_mux;
    logic [`D_width-1:0] stage0_BU2_TF_mux;
    logic [`D_width-1:0] stage0_BU3_TF_mux;
    logic [`D_width-1:0] stage0_BU4_TF_mux; //-------next 4 BU----------
    logic [`D_width-1:0] stage0_BU5_TF_mux;
    logic [`D_width-1:0] stage0_BU6_TF_mux;
    logic [`D_width-1:0] stage0_BU7_TF_mux;
    always_comb begin
        if (LAST_STAGE) begin
            stage0_BU0_TF_mux = twiddle_1;
            stage0_BU1_TF_mux = twiddle_2;
            stage0_BU2_TF_mux = twiddle_3;
            stage0_BU3_TF_mux = twiddle_4;
            stage0_BU4_TF_mux = twiddle_5;
            stage0_BU5_TF_mux = twiddle_6;
            stage0_BU6_TF_mux = twiddle_7;
            stage0_BU7_TF_mux = twiddle_8;
        end else begin
            stage0_BU0_TF_mux = twiddle_1;
            stage0_BU1_TF_mux = twiddle_1;
            stage0_BU2_TF_mux = twiddle_1;
            stage0_BU3_TF_mux = twiddle_1;
            stage0_BU4_TF_mux = twiddle_1;
            stage0_BU5_TF_mux = twiddle_1;
            stage0_BU6_TF_mux = twiddle_1;
            stage0_BU7_TF_mux = twiddle_1;
        end
    end

    //-----------------------

    // ----------------stage 0------------------
    BU2_NWC stage0_BU0(
        .in1(x0),
        .in2(x8),
        .twiddle(stage0_BU0_TF_mux),
        .modulus(modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage0_fft_a0),
        .BU_b(stage0_fft_b0),
        .twiddle_BU_out(BU0_stage0_twiddle_out),
        .modulus_BU_out(BU0_stage0_modulus_out)
    );

    BU2_NWC stage0_BU1(
        .in1(x1),
        .in2(x9),
        .twiddle(stage0_BU1_TF_mux),
        .modulus(modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage0_fft_a1),
        .BU_b(stage0_fft_b1),
        .twiddle_BU_out(BU1_stage0_twiddle_out),
        .modulus_BU_out(BU1_stage0_modulus_out)
    );

    BU2_NWC stage0_BU2(
        .in1(x2),
        .in2(x10),
        .twiddle(stage0_BU2_TF_mux),
        .modulus(modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage0_fft_a2),
        .BU_b(stage0_fft_b2),
        .twiddle_BU_out(BU2_stage0_twiddle_out),
        .modulus_BU_out(BU2_stage0_modulus_out)
    );
    
    BU2_NWC stage0_BU3(
        .in1(x3),
        .in2(x11),
        .twiddle(stage0_BU3_TF_mux),
        .modulus(modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage0_fft_a3),
        .BU_b(stage0_fft_b3),
        .twiddle_BU_out(BU3_stage0_twiddle_out),
        .modulus_BU_out(BU3_stage0_modulus_out)
    );

    BU2_NWC stage0_BU4(
        .in1(x4),
        .in2(x12),
        .twiddle(stage0_BU4_TF_mux),
        .modulus(modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage0_fft_a4),
        .BU_b(stage0_fft_b4),
        .twiddle_BU_out(BU4_stage0_twiddle_out),
        .modulus_BU_out(BU4_stage0_modulus_out)
    );

    BU2_NWC stage0_BU5(
        .in1(x5),
        .in2(x13),
        .twiddle(stage0_BU5_TF_mux),
        .modulus(modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage0_fft_a5),
        .BU_b(stage0_fft_b5),
        .twiddle_BU_out(BU5_stage0_twiddle_out),
        .modulus_BU_out(BU5_stage0_modulus_out)
    );

    BU2_NWC stage0_BU6(
        .in1(x6),
        .in2(x14),
        .twiddle(stage0_BU6_TF_mux),
        .modulus(modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage0_fft_a6),
        .BU_b(stage0_fft_b6),
        .twiddle_BU_out(BU6_stage0_twiddle_out),
        .modulus_BU_out(BU6_stage0_modulus_out)
    );

    BU2_NWC stage0_BU7(
        .in1(x7),
        .in2(x15),
        .twiddle(stage0_BU7_TF_mux),
        .modulus(modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage0_fft_a7),
        .BU_b(stage0_fft_b7),
        .twiddle_BU_out(BU7_stage0_twiddle_out),
        .modulus_BU_out(BU7_stage0_modulus_out)
    );


    always_ff @( posedge clk or posedge rst ) begin : stage0
        if (rst) begin
            pip0_fft_a0 <= 'd0; pip0_fft_b0 <= 'd0;
            pip0_fft_a1 <= 'd0; pip0_fft_b1 <= 'd0;
            pip0_fft_a2 <= 'd0; pip0_fft_b2 <= 'd0;
            pip0_fft_a3 <= 'd0; pip0_fft_b3 <= 'd0;
            pip0_fft_a4 <= 'd0; pip0_fft_b4 <= 'd0;
            pip0_fft_a5 <= 'd0; pip0_fft_b5 <= 'd0;
            pip0_fft_a6 <= 'd0; pip0_fft_b6 <= 'd0;
            pip0_fft_a7 <= 'd0; pip0_fft_b7 <= 'd0;
     
        end else begin
            pip0_fft_a0 <= stage0_fft_a0;   pip0_fft_b0 <= stage0_fft_b0;
            pip0_fft_a1 <= stage0_fft_a1;   pip0_fft_b1 <= stage0_fft_b1;
            pip0_fft_a2 <= stage0_fft_a2;   pip0_fft_b2 <= stage0_fft_b2;
            pip0_fft_a3 <= stage0_fft_a3;   pip0_fft_b3 <= stage0_fft_b3;
            pip0_fft_a4 <= stage0_fft_a4;   pip0_fft_b4 <= stage0_fft_b4;
            pip0_fft_a5 <= stage0_fft_a5;   pip0_fft_b5 <= stage0_fft_b5;
            pip0_fft_a6 <= stage0_fft_a6;   pip0_fft_b6 <= stage0_fft_b6;
            pip0_fft_a7 <= stage0_fft_a7;   pip0_fft_b7 <= stage0_fft_b7;

        end
    end

    TF_delay_buffer TF_D0(
        //input
        .clk(clk),
        .rst(rst),
        .TF0_in (twiddle_0),
        .TF1_in (twiddle_1),
        .TF2_in (twiddle_2),
        .TF3_in (twiddle_3),
        .TF4_in (twiddle_4),
        .TF5_in (twiddle_5),
        .TF6_in (twiddle_6),
        .TF7_in (twiddle_7),
        .TF8_in (twiddle_8),
        .TF9_in (twiddle_9),
        .TF10_in(twiddle_10),
        .TF11_in(twiddle_11),
        .TF12_in(twiddle_12),
        .TF13_in(twiddle_13),
        .TF14_in(twiddle_14),
        .TF15_in(twiddle_15),

        .modulus(modulus),

        //output
        .TF0_pip_out    (pip0_twiddle_0),
        .TF1_pip_out    (pip0_twiddle_1),
        .TF2_pip_out    (pip0_twiddle_2),
        .TF3_pip_out    (pip0_twiddle_3),
        .TF4_pip_out    (pip0_twiddle_4),
        .TF5_pip_out    (pip0_twiddle_5),
        .TF6_pip_out    (pip0_twiddle_6),
        .TF7_pip_out    (pip0_twiddle_7),
        .TF8_pip_out    (pip0_twiddle_8),
        .TF9_pip_out    (pip0_twiddle_9),
        .TF10_pip_out   (pip0_twiddle_10),
        .TF11_pip_out   (pip0_twiddle_11),
        .TF12_pip_out   (pip0_twiddle_12),
        .TF13_pip_out   (pip0_twiddle_13),
        .TF14_pip_out   (pip0_twiddle_14),
        .TF15_pip_out   (pip0_twiddle_15),
        
        .modulus_pip_out(pip0_modulus)
    );

    //-----------stage 1------------------
    BU2_NWC stage1_BU0(
        .in1(pip0_fft_a0),
        .in2(pip0_fft_a4),
        .twiddle(pip0_twiddle_2),
        .modulus(pip0_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage1_fft_a0),
        .BU_b(stage1_fft_b0),
        .twiddle_BU_out(BU0_stage1_twiddle_out),
        .modulus_BU_out(BU0_stage1_modulus_out)
    );

    BU2_NWC stage1_BU1(
        .in1(pip0_fft_a1),
        .in2(pip0_fft_a5),
        .twiddle(pip0_twiddle_2),
        .modulus(pip0_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage1_fft_a1),
        .BU_b(stage1_fft_b1),
        .twiddle_BU_out(BU1_stage1_twiddle_out),
        .modulus_BU_out(BU1_stage1_modulus_out)
    );
    BU2_NWC stage1_BU2(
        .in1(pip0_fft_a2),
        .in2(pip0_fft_a6),
        .twiddle(pip0_twiddle_2),
        .modulus(pip0_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage1_fft_a2),
        .BU_b(stage1_fft_b2),
        .twiddle_BU_out(BU2_stage1_twiddle_out),
        .modulus_BU_out(BU2_stage1_modulus_out)
    );
    BU2_NWC stage1_BU3(
        .in1(pip0_fft_a3),
        .in2(pip0_fft_a7),
        .twiddle(pip0_twiddle_2),
        .modulus(pip0_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage1_fft_a3),
        .BU_b(stage1_fft_b3),
        .twiddle_BU_out(BU3_stage1_twiddle_out),
        .modulus_BU_out(BU3_stage1_modulus_out)
    );
    BU2_NWC stage1_BU4(
        .in1(pip0_fft_b0),
        .in2(pip0_fft_b4),
        .twiddle(pip0_twiddle_3),
        .modulus(pip0_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage1_fft_a4),
        .BU_b(stage1_fft_b4),
        .twiddle_BU_out(BU4_stage1_twiddle_out),
        .modulus_BU_out(BU4_stage1_modulus_out)
    );
    BU2_NWC stage1_BU5(
        .in1(pip0_fft_b1),
        .in2(pip0_fft_b5),
        .twiddle(pip0_twiddle_3),
        .modulus(pip0_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage1_fft_a5),
        .BU_b(stage1_fft_b5),
        .twiddle_BU_out(BU5_stage1_twiddle_out),
        .modulus_BU_out(BU5_stage1_modulus_out)
    );
    BU2_NWC stage1_BU6(
        .in1(pip0_fft_b2),
        .in2(pip0_fft_b6),
        .twiddle(pip0_twiddle_3),
        .modulus(pip0_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage1_fft_a6),
        .BU_b(stage1_fft_b6),
        .twiddle_BU_out(BU6_stage1_twiddle_out),
        .modulus_BU_out(BU6_stage1_modulus_out)
    );
    BU2_NWC stage1_BU7(
        .in1(pip0_fft_b3),
        .in2(pip0_fft_b7),
        .twiddle(pip0_twiddle_3),
        .modulus(pip0_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage1_fft_a7),
        .BU_b(stage1_fft_b7),
        .twiddle_BU_out(BU7_stage1_twiddle_out),
        .modulus_BU_out(BU7_stage1_modulus_out)
    );


    always_ff @( posedge clk or posedge rst ) begin : stage2
        if (rst) begin
            pip1_fft_a0 <= 'd0; pip1_fft_b0 <= 'd0;
            pip1_fft_a1 <= 'd0; pip1_fft_b1 <= 'd0;
            pip1_fft_a2 <= 'd0; pip1_fft_b2 <= 'd0;
            pip1_fft_a3 <= 'd0; pip1_fft_b3 <= 'd0;
            pip1_fft_a4 <= 'd0; pip1_fft_b4 <= 'd0;
            pip1_fft_a5 <= 'd0; pip1_fft_b5 <= 'd0;
            pip1_fft_a6 <= 'd0; pip1_fft_b6 <= 'd0;
            pip1_fft_a7 <= 'd0; pip1_fft_b7 <= 'd0;
        end else begin
            pip1_fft_a0 <= stage1_fft_a0; pip1_fft_b0 <= stage1_fft_b0;
            pip1_fft_a1 <= stage1_fft_a1; pip1_fft_b1 <= stage1_fft_b1;
            pip1_fft_a2 <= stage1_fft_a2; pip1_fft_b2 <= stage1_fft_b2;
            pip1_fft_a3 <= stage1_fft_a3; pip1_fft_b3 <= stage1_fft_b3;
            pip1_fft_a4 <= stage1_fft_a4; pip1_fft_b4 <= stage1_fft_b4;
            pip1_fft_a5 <= stage1_fft_a5; pip1_fft_b5 <= stage1_fft_b5;
            pip1_fft_a6 <= stage1_fft_a6; pip1_fft_b6 <= stage1_fft_b6;
            pip1_fft_a7 <= stage1_fft_a7; pip1_fft_b7 <= stage1_fft_b7;
        end
    end

    TF_delay_buffer TF_D1(
        //input
        .clk(clk),
        .rst(rst),
        .TF0_in (pip0_twiddle_0),
        .TF1_in (pip0_twiddle_1),
        .TF2_in (pip0_twiddle_2),
        .TF3_in (pip0_twiddle_3),
        .TF4_in (pip0_twiddle_4),
        .TF5_in (pip0_twiddle_5),
        .TF6_in (pip0_twiddle_6),
        .TF7_in (pip0_twiddle_7),
        .TF8_in (pip0_twiddle_8),
        .TF9_in (pip0_twiddle_9),
        .TF10_in(pip0_twiddle_10),
        .TF11_in(pip0_twiddle_11),
        .TF12_in(pip0_twiddle_12),
        .TF13_in(pip0_twiddle_13),
        .TF14_in(pip0_twiddle_14),
        .TF15_in(pip0_twiddle_15),

        .modulus(pip0_modulus),

        //output
        .TF0_pip_out    (pip1_twiddle_0),
        .TF1_pip_out    (pip1_twiddle_1),
        .TF2_pip_out    (pip1_twiddle_2),
        .TF3_pip_out    (pip1_twiddle_3),
        .TF4_pip_out    (pip1_twiddle_4),
        .TF5_pip_out    (pip1_twiddle_5),
        .TF6_pip_out    (pip1_twiddle_6),
        .TF7_pip_out    (pip1_twiddle_7),
        .TF8_pip_out    (pip1_twiddle_8),
        .TF9_pip_out    (pip1_twiddle_9),
        .TF10_pip_out   (pip1_twiddle_10),
        .TF11_pip_out   (pip1_twiddle_11),
        .TF12_pip_out   (pip1_twiddle_12),
        .TF13_pip_out   (pip1_twiddle_13),
        .TF14_pip_out   (pip1_twiddle_14),
        .TF15_pip_out   (pip1_twiddle_15),
        
        .modulus_pip_out(pip1_modulus)
    );

    //-------------------------stage 2---------------------------------
    BU2_NWC stage2_BU0(
        .in1(pip1_fft_a0),
        .in2(pip1_fft_a2),
        .twiddle(pip1_twiddle_4),
        .modulus(pip1_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage2_fft_a0),
        .BU_b(stage2_fft_b0),
        .twiddle_BU_out(BU0_stage2_twiddle_out),
        .modulus_BU_out(BU0_stage2_modulus_out)
    );
    BU2_NWC stage2_BU1(
        .in1(pip1_fft_a1),
        .in2(pip1_fft_a3),
        .twiddle(pip1_twiddle_4),
        .modulus(pip1_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage2_fft_a1),
        .BU_b(stage2_fft_b1),
        .twiddle_BU_out(BU1_stage2_twiddle_out),
        .modulus_BU_out(BU1_stage2_modulus_out)
    );
    BU2_NWC stage2_BU2(
        .in1(pip1_fft_b0),
        .in2(pip1_fft_b2),
        .twiddle(pip1_twiddle_5),
        .modulus(pip1_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage2_fft_a2),
        .BU_b(stage2_fft_b2),
        .twiddle_BU_out(BU2_stage2_twiddle_out),
        .modulus_BU_out(BU2_stage2_modulus_out)
    );
    BU2_NWC stage2_BU3(
        .in1(pip1_fft_b1),
        .in2(pip1_fft_b3),
        .twiddle(pip1_twiddle_5),
        .modulus(pip1_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage2_fft_a3),
        .BU_b(stage2_fft_b3),
        .twiddle_BU_out(BU3_stage2_twiddle_out),
        .modulus_BU_out(BU3_stage2_modulus_out)
    );
    BU2_NWC stage2_BU4(
        .in1(pip1_fft_a4),
        .in2(pip1_fft_a6),
        .twiddle(pip1_twiddle_6),
        .modulus(pip1_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage2_fft_a4),
        .BU_b(stage2_fft_b4),
        .twiddle_BU_out(BU4_stage2_twiddle_out),
        .modulus_BU_out(BU4_stage2_modulus_out)
    );
    BU2_NWC stage2_BU5(
        .in1(pip1_fft_a5),
        .in2(pip1_fft_a7),
        .twiddle(pip1_twiddle_6),
        .modulus(pip1_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage2_fft_a5),
        .BU_b(stage2_fft_b5),
        .twiddle_BU_out(BU5_stage2_twiddle_out),
        .modulus_BU_out(BU5_stage2_modulus_out)
    );
    BU2_NWC stage2_BU6(
        .in1(pip1_fft_b4),
        .in2(pip1_fft_b6),
        .twiddle(pip1_twiddle_7),
        .modulus(pip1_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage2_fft_a6),
        .BU_b(stage2_fft_b6),
        .twiddle_BU_out(BU6_stage2_twiddle_out),
        .modulus_BU_out(BU6_stage2_modulus_out)
    );
    BU2_NWC stage2_BU7(
        .in1(pip1_fft_b5),
        .in2(pip1_fft_b7),
        .twiddle(pip1_twiddle_7),
        .modulus(pip1_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage2_fft_a7),
        .BU_b(stage2_fft_b7),
        .twiddle_BU_out(BU7_stage2_twiddle_out),
        .modulus_BU_out(BU7_stage2_modulus_out)
    );
    

    always_ff @( posedge clk or posedge rst ) begin : stage3
        if (rst) begin
            pip2_fft_a0 <= 'd0; pip2_fft_b0 <= 'd0;
            pip2_fft_a1 <= 'd0; pip2_fft_b1 <= 'd0;
            pip2_fft_a2 <= 'd0; pip2_fft_b2 <= 'd0;
            pip2_fft_a3 <= 'd0; pip2_fft_b3 <= 'd0;
            pip2_fft_a4 <= 'd0; pip2_fft_b4 <= 'd0;
            pip2_fft_a5 <= 'd0; pip2_fft_b5 <= 'd0;
            pip2_fft_a6 <= 'd0; pip2_fft_b6 <= 'd0;
            pip2_fft_a7 <= 'd0; pip2_fft_b7 <= 'd0;
        end else begin
            pip2_fft_a0 <= stage2_fft_a0; pip2_fft_b0 <= stage2_fft_b0;
            pip2_fft_a1 <= stage2_fft_a1; pip2_fft_b1 <= stage2_fft_b1;
            pip2_fft_a2 <= stage2_fft_a2; pip2_fft_b2 <= stage2_fft_b2;
            pip2_fft_a3 <= stage2_fft_a3; pip2_fft_b3 <= stage2_fft_b3;
            pip2_fft_a4 <= stage2_fft_a4; pip2_fft_b4 <= stage2_fft_b4;
            pip2_fft_a5 <= stage2_fft_a5; pip2_fft_b5 <= stage2_fft_b5;
            pip2_fft_a6 <= stage2_fft_a6; pip2_fft_b6 <= stage2_fft_b6;
            pip2_fft_a7 <= stage2_fft_a7; pip2_fft_b7 <= stage2_fft_b7;
        end
    end

    TF_delay_buffer TF_D2(
        //input
        .clk(clk),
        .rst(rst),
        .TF0_in (pip1_twiddle_0),
        .TF1_in (pip1_twiddle_1),
        .TF2_in (pip1_twiddle_2),
        .TF3_in (pip1_twiddle_3),
        .TF4_in (pip1_twiddle_4),
        .TF5_in (pip1_twiddle_5),
        .TF6_in (pip1_twiddle_6),
        .TF7_in (pip1_twiddle_7),
        .TF8_in (pip1_twiddle_8),
        .TF9_in (pip1_twiddle_9),
        .TF10_in(pip1_twiddle_10),
        .TF11_in(pip1_twiddle_11),
        .TF12_in(pip1_twiddle_12),
        .TF13_in(pip1_twiddle_13),
        .TF14_in(pip1_twiddle_14),
        .TF15_in(pip1_twiddle_15),

        .modulus(pip1_modulus),

        //output
        .TF0_pip_out    (pip2_twiddle_0),
        .TF1_pip_out    (pip2_twiddle_1),
        .TF2_pip_out    (pip2_twiddle_2),
        .TF3_pip_out    (pip2_twiddle_3),
        .TF4_pip_out    (pip2_twiddle_4),
        .TF5_pip_out    (pip2_twiddle_5),
        .TF6_pip_out    (pip2_twiddle_6),
        .TF7_pip_out    (pip2_twiddle_7),
        .TF8_pip_out    (pip2_twiddle_8),
        .TF9_pip_out    (pip2_twiddle_9),
        .TF10_pip_out   (pip2_twiddle_10),
        .TF11_pip_out   (pip2_twiddle_11),
        .TF12_pip_out   (pip2_twiddle_12),
        .TF13_pip_out   (pip2_twiddle_13),
        .TF14_pip_out   (pip2_twiddle_14),
        .TF15_pip_out   (pip2_twiddle_15),
        
        .modulus_pip_out(pip2_modulus)
    );
    
    //-------------------stage 3 ---------------------
    BU2_NWC stage3_BU0(
        .in1(pip2_fft_a0),
        .in2(pip2_fft_a1),
        .twiddle(pip2_twiddle_8),
        .modulus(pip2_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage3_fft_a0),
        .BU_b(stage3_fft_b0),
        .twiddle_BU_out(BU0_stage3_twiddle_out),
        .modulus_BU_out(BU0_stage3_modulus_out)
    );
    BU2_NWC stage3_BU1(
        .in1(pip2_fft_b0),
        .in2(pip2_fft_b1),
        .twiddle(pip2_twiddle_9),
        .modulus(pip2_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage3_fft_a1),
        .BU_b(stage3_fft_b1),
        .twiddle_BU_out(BU1_stage3_twiddle_out),
        .modulus_BU_out(BU1_stage3_modulus_out)
    );
    BU2_NWC stage3_BU2(
        .in1(pip2_fft_a2),
        .in2(pip2_fft_a3),
        .twiddle(pip2_twiddle_10),
        .modulus(pip2_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage3_fft_a2),
        .BU_b(stage3_fft_b2),
        .twiddle_BU_out(BU2_stage3_twiddle_out),
        .modulus_BU_out(BU2_stage3_modulus_out)
    );
    BU2_NWC stage3_BU3(
        .in1(pip2_fft_b2),
        .in2(pip2_fft_b3),
        .twiddle(pip2_twiddle_11),
        .modulus(pip2_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage3_fft_a3),
        .BU_b(stage3_fft_b3),
        .twiddle_BU_out(BU3_stage3_twiddle_out),
        .modulus_BU_out(BU3_stage3_modulus_out)
    );
    BU2_NWC stage3_BU4(
        .in1(pip2_fft_a4),
        .in2(pip2_fft_a5),
        .twiddle(pip2_twiddle_12),
        .modulus(pip2_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage3_fft_a4),
        .BU_b(stage3_fft_b4),
        .twiddle_BU_out(BU4_stage3_twiddle_out),
        .modulus_BU_out(BU4_stage3_modulus_out)
    );
    BU2_NWC stage3_BU5(
        .in1(pip2_fft_b4),
        .in2(pip2_fft_b5),
        .twiddle(pip2_twiddle_13),
        .modulus(pip2_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage3_fft_a5),
        .BU_b(stage3_fft_b5),
        .twiddle_BU_out(BU5_stage3_twiddle_out),
        .modulus_BU_out(BU5_stage3_modulus_out)
    );
    BU2_NWC stage3_BU6(
        .in1(pip2_fft_a6),
        .in2(pip2_fft_a7),
        .twiddle(pip2_twiddle_14),
        .modulus(pip2_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage3_fft_a6),
        .BU_b(stage3_fft_b6),
        .twiddle_BU_out(BU6_stage3_twiddle_out),
        .modulus_BU_out(BU6_stage3_modulus_out)
    );
    BU2_NWC stage3_BU7(
        .in1(pip2_fft_b6),
        .in2(pip2_fft_b7),
        .twiddle(pip2_twiddle_15),
        .modulus(pip2_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage3_fft_a7),
        .BU_b(stage3_fft_b7),
        .twiddle_BU_out(BU7_stage3_twiddle_out),
        .modulus_BU_out(BU7_stage3_modulus_out)
    );

    always_ff @( posedge clk or posedge rst ) begin : output_pip
        if (rst) begin
            y0 <= 'd0;  y8 <=  'd0;  
            y1 <= 'd0;  y9 <=  'd0;   
            y2 <= 'd0;  y10 <= 'd0; 
            y3 <= 'd0;  y11 <= 'd0;  
            y4 <= 'd0;  y12 <= 'd0;  
            y5 <= 'd0;  y13 <= 'd0;
            y6 <= 'd0;  y14 <= 'd0;  
            y7 <= 'd0;  y15 <= 'd0;  
        end else begin
            y0 <= (LAST_STAGE) ? stage0_fft_a0 : stage3_fft_a0; 
            y1 <= (LAST_STAGE) ? stage0_fft_b0 : stage3_fft_b0; 
            y2 <= (LAST_STAGE) ? stage0_fft_a1 : stage3_fft_a1; 
            y3 <= (LAST_STAGE) ? stage0_fft_b1 : stage3_fft_b1; 
            y4 <= (LAST_STAGE) ? stage0_fft_a2 : stage3_fft_a2; 
            y5 <= (LAST_STAGE) ? stage0_fft_b2 : stage3_fft_b2; 
            y6 <= (LAST_STAGE) ? stage0_fft_a3 : stage3_fft_a3; 
            y7 <= (LAST_STAGE) ? stage0_fft_b3 : stage3_fft_b3; 

            y8 <=  (LAST_STAGE) ? stage0_fft_a4 : stage3_fft_a4;
            y9 <=  (LAST_STAGE) ? stage0_fft_b4 : stage3_fft_b4; 
            y10 <= (LAST_STAGE) ? stage0_fft_a5 : stage3_fft_a5;
            y11 <= (LAST_STAGE) ? stage0_fft_b5 : stage3_fft_b5;
            y12 <= (LAST_STAGE) ? stage0_fft_a6 : stage3_fft_a6;
            y13 <= (LAST_STAGE) ? stage0_fft_b6 : stage3_fft_b6;
            y14 <= (LAST_STAGE) ? stage0_fft_a7 : stage3_fft_a7;
            y15 <= (LAST_STAGE) ? stage0_fft_b7 : stage3_fft_b7;
        end
    end

endmodule