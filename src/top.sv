`include "../include/define.svh"
`include "R16_top.sv"
`include "Controller.sv"
`include "AGU_integrate.sv"
`include "TF_top.sv"
`include "memory_wrapper.sv"

module top (
    input clk,
    input rst,
    input [`D_width-1:0] modulus,

    output logic DONE
    
);

    logic ctr_AGU_done;
    logic ctr_BN_MA_out_en;
    logic ctr_r_enable_out;
    logic ctr_w_enable_out;
    logic [1:0] ctr_ntt_done;
    logic ctr_TF_ren;
    logic ctr_TF_wen;
    logic [2:0] ctr_it_depth_cnt;
    logic [`D_width-1:0] ctr_ite_sw_cnt;
    logic [`D_width-1:0] ctr_ite_sw_cnt_ite3;
    logic ctr_AGU_enable;
    logic ctr_AGU_enable_k2;
    logic ctr_r_enable;
    logic ctr_w_enable;
    logic ctr_LAST_STAGE;
    logic ctr_ntt_enable;
    logic ctr_DONE;

    Controller Controller(
        //input
        .clk            (clk),
        .rst            (rst),
        .AGU_done       (ctr_AGU_done),
        .BN_MA_out_en   (ctr_BN_MA_out_en),
        .r_enable_out   (ctr_r_enable_out),
        .w_enable_out   (ctr_w_enable_out),
        .ntt_done       (ctr_ntt_done),
        //output
        .TF_ren         (ctr_TF_ren),
        .TF_wen         (ctr_TF_wen),
        .it_depth_cnt   (ctr_it_depth_cnt),
        .ite_sw_cnt     (ctr_ite_sw_cnt),
        .ite_sw_cnt_ite3(ctr_ite_sw_cnt_ite3),
        .AGU_enable     (ctr_AGU_enable),
        .AGU_enable_k2  (ctr_AGU_enable_k2),
        .r_enable       (ctr_r_enable),
        .w_enable       (ctr_w_enable),
        .LAST_STAGE     (ctr_LAST_STAGE),
        .ntt_enable     (ctr_ntt_enable),
        .DONE           (ctr_DONE)
    );

    //input
    logic                TF_gen_LAST_STAGE     ;
    logic                TF_gen_TF_ren         ;
    logic                TF_gen_TF_wen         ;
    logic [2:0] TF_gen_it_depth_cnt;
    logic [2:0] TF_l;
    logic [`D_width-1:0] TF_ite_sw_cnt          ;
    logic [`D_width-1:0] TF_ite_sw_cnt_ite3     ;

    //output
    logic [`D_width-1:0] TF_gen_TF_base_b1     ;
    logic [`D_width-1:0] TF_gen_TF_base_b2     ;
    logic [`D_width-1:0] TF_gen_TF_base_b3     ;
    logic [`D_width-1:0] TF_gen_TF_base_b4     ;
    logic [`D_width-1:0] TF_gen_TF_base_b5     ;
    logic [`D_width-1:0] TF_gen_TF_base_b6     ;
    logic [`D_width-1:0] TF_gen_TF_base_b7     ;
    logic [`D_width-1:0] TF_gen_TF_base_b8     ;
    logic [`D_width-1:0] TF_gen_TF_base_b9     ;
    logic [`D_width-1:0] TF_gen_TF_base_b10    ;
    logic [`D_width-1:0] TF_gen_TF_base_b11    ;
    logic [`D_width-1:0] TF_gen_TF_base_b12    ;
    logic [`D_width-1:0] TF_gen_TF_base_b13    ;
    logic [`D_width-1:0] TF_gen_TF_base_b14    ;
    logic [`D_width-1:0] TF_gen_TF_base_b15    ;
    TF_top TF_top(
        //input 
        .LAST_STAGE     (TF_gen_LAST_STAGE),
        .clk            (clk),
        .rst            (rst),
        .TF_ren         (TF_gen_TF_ren),
        .TF_wen         (TF_gen_TF_wen),
        .it_depth_cnt   (TF_gen_it_depth_cnt),
        .modulus(modulus),
        .l(TF_l),
        .ite_sw_cnt(TF_ite_sw_cnt),
        .ite_sw_cnt_ite3(TF_ite_sw_cnt_ite3),
        //output
        .TF_base_b1 (TF_gen_TF_base_b1 ),
        .TF_base_b2 (TF_gen_TF_base_b2 ),
        .TF_base_b3 (TF_gen_TF_base_b3 ),
        .TF_base_b4 (TF_gen_TF_base_b4 ),
        .TF_base_b5 (TF_gen_TF_base_b5 ),
        .TF_base_b6 (TF_gen_TF_base_b6 ),
        .TF_base_b7 (TF_gen_TF_base_b7 ),
        .TF_base_b8 (TF_gen_TF_base_b8 ),
        .TF_base_b9 (TF_gen_TF_base_b9 ),
        .TF_base_b10(TF_gen_TF_base_b10),
        .TF_base_b11(TF_gen_TF_base_b11),
        .TF_base_b12(TF_gen_TF_base_b12),
        .TF_base_b13(TF_gen_TF_base_b13),
        .TF_base_b14(TF_gen_TF_base_b14),
        .TF_base_b15(TF_gen_TF_base_b15)
    );

    logic AGU_top_LAST_STAGE;
    logic AGU_top_AGU_enable;
    logic AGU_top_AGU_enable_k2;
    logic [`MA_width-1:0] AGU_top_MA0_idx    ;
    logic [`MA_width-1:0] AGU_top_MA1_idx    ;
    logic [`MA_width-1:0] AGU_top_MA2_idx    ;
    logic [`MA_width-1:0] AGU_top_MA3_idx    ;
    logic [`MA_width-1:0] AGU_top_MA4_idx    ;
    logic [`MA_width-1:0] AGU_top_MA5_idx    ;
    logic [`MA_width-1:0] AGU_top_MA6_idx    ;
    logic [`MA_width-1:0] AGU_top_MA7_idx    ;
    logic [`MA_width-1:0] AGU_top_MA8_idx    ;
    logic [`MA_width-1:0] AGU_top_MA9_idx    ;
    logic [`MA_width-1:0] AGU_top_MA10_idx   ;
    logic [`MA_width-1:0] AGU_top_MA11_idx   ;
    logic [`MA_width-1:0] AGU_top_MA12_idx   ;
    logic [`MA_width-1:0] AGU_top_MA13_idx   ;
    logic [`MA_width-1:0] AGU_top_MA14_idx   ;
    logic [`MA_width-1:0] AGU_top_MA15_idx   ;

    logic [`BANK_width-1:0] AGU_top_BN0_idx    ;
    logic [`BANK_width-1:0] AGU_top_BN1_idx    ;
    logic [`BANK_width-1:0] AGU_top_BN2_idx    ;
    logic [`BANK_width-1:0] AGU_top_BN3_idx    ;
    logic [`BANK_width-1:0] AGU_top_BN4_idx    ;
    logic [`BANK_width-1:0] AGU_top_BN5_idx    ;
    logic [`BANK_width-1:0] AGU_top_BN6_idx    ;
    logic [`BANK_width-1:0] AGU_top_BN7_idx    ;
    logic [`BANK_width-1:0] AGU_top_BN8_idx    ;
    logic [`BANK_width-1:0] AGU_top_BN9_idx    ;
    logic [`BANK_width-1:0] AGU_top_BN10_idx   ;
    logic [`BANK_width-1:0] AGU_top_BN11_idx   ;
    logic [`BANK_width-1:0] AGU_top_BN12_idx   ;
    logic [`BANK_width-1:0] AGU_top_BN13_idx   ;
    logic [`BANK_width-1:0] AGU_top_BN14_idx   ;
    logic [`BANK_width-1:0] AGU_top_BN15_idx   ;

    logic AGU_top_AGU_done_out;
    logic AGU_top_BN_MA_out_en;
    logic [2:0] AGU_l_AGU_out;

    AGU_integrate AGU_integrate(
        //input
        .LAST_STAGE(AGU_top_LAST_STAGE),
        .clk(clk),
        .rst(rst),
        .AGU_enable(AGU_top_AGU_enable),
        .AGU_enable_k2(AGU_top_AGU_enable_k2),
        //output
        .MA0_idx    (AGU_top_MA0_idx ),
        .MA1_idx    (AGU_top_MA1_idx ),
        .MA2_idx    (AGU_top_MA2_idx ),
        .MA3_idx    (AGU_top_MA3_idx ),
        .MA4_idx    (AGU_top_MA4_idx ),
        .MA5_idx    (AGU_top_MA5_idx ),
        .MA6_idx    (AGU_top_MA6_idx ),
        .MA7_idx    (AGU_top_MA7_idx ),
        .MA8_idx    (AGU_top_MA8_idx ),
        .MA9_idx    (AGU_top_MA9_idx ),
        .MA10_idx   (AGU_top_MA10_idx),
        .MA11_idx   (AGU_top_MA11_idx),
        .MA12_idx   (AGU_top_MA12_idx),
        .MA13_idx   (AGU_top_MA13_idx),
        .MA14_idx   (AGU_top_MA14_idx),
        .MA15_idx   (AGU_top_MA15_idx),

        .BN0_idx    (AGU_top_BN0_idx ),
        .BN1_idx    (AGU_top_BN1_idx ),
        .BN2_idx    (AGU_top_BN2_idx ),
        .BN3_idx    (AGU_top_BN3_idx ),
        .BN4_idx    (AGU_top_BN4_idx ),
        .BN5_idx    (AGU_top_BN5_idx ),
        .BN6_idx    (AGU_top_BN6_idx ),
        .BN7_idx    (AGU_top_BN7_idx ),
        .BN8_idx    (AGU_top_BN8_idx ),
        .BN9_idx    (AGU_top_BN9_idx ),
        .BN10_idx   (AGU_top_BN10_idx),
        .BN11_idx   (AGU_top_BN11_idx),
        .BN12_idx   (AGU_top_BN12_idx),
        .BN13_idx   (AGU_top_BN13_idx),
        .BN14_idx   (AGU_top_BN14_idx),
        .BN15_idx   (AGU_top_BN15_idx),

        .AGU_done_out(AGU_top_AGU_done_out),
        .BN_MA_out_en(AGU_top_BN_MA_out_en),
        .l_AGU_out(AGU_l_AGU_out)
    );

    //input
    logic mem_LAST_STAGE;
    logic [`D_width-1:0] mem_data_in0   ;
    logic [`D_width-1:0] mem_data_in1   ;
    logic [`D_width-1:0] mem_data_in2   ;
    logic [`D_width-1:0] mem_data_in3   ;
    logic [`D_width-1:0] mem_data_in4   ;
    logic [`D_width-1:0] mem_data_in5   ;
    logic [`D_width-1:0] mem_data_in6   ;
    logic [`D_width-1:0] mem_data_in7   ;
    logic [`D_width-1:0] mem_data_in8   ;
    logic [`D_width-1:0] mem_data_in9   ;
    logic [`D_width-1:0] mem_data_in10  ;
    logic [`D_width-1:0] mem_data_in11  ;
    logic [`D_width-1:0] mem_data_in12  ;
    logic [`D_width-1:0] mem_data_in13  ;
    logic [`D_width-1:0] mem_data_in14  ;
    logic [`D_width-1:0] mem_data_in15  ;
    logic [`MA_width-1:0] mem_MA0_idx    ;
    logic [`MA_width-1:0] mem_MA1_idx    ;
    logic [`MA_width-1:0] mem_MA2_idx    ;
    logic [`MA_width-1:0] mem_MA3_idx    ;
    logic [`MA_width-1:0] mem_MA4_idx    ;
    logic [`MA_width-1:0] mem_MA5_idx    ;
    logic [`MA_width-1:0] mem_MA6_idx    ;
    logic [`MA_width-1:0] mem_MA7_idx    ;
    logic [`MA_width-1:0] mem_MA8_idx    ;
    logic [`MA_width-1:0] mem_MA9_idx    ;
    logic [`MA_width-1:0] mem_MA10_idx   ;
    logic [`MA_width-1:0] mem_MA11_idx   ;
    logic [`MA_width-1:0] mem_MA12_idx   ;
    logic [`MA_width-1:0] mem_MA13_idx   ;
    logic [`MA_width-1:0] mem_MA14_idx   ;
    logic [`MA_width-1:0] mem_MA15_idx   ;
    logic [`BANK_width-1:0] mem_BN0_idx    ;
    logic [`BANK_width-1:0] mem_BN1_idx    ;
    logic [`BANK_width-1:0] mem_BN2_idx    ;
    logic [`BANK_width-1:0] mem_BN3_idx    ;
    logic [`BANK_width-1:0] mem_BN4_idx    ;
    logic [`BANK_width-1:0] mem_BN5_idx    ;
    logic [`BANK_width-1:0] mem_BN6_idx    ;
    logic [`BANK_width-1:0] mem_BN7_idx    ;
    logic [`BANK_width-1:0] mem_BN8_idx    ;
    logic [`BANK_width-1:0] mem_BN9_idx    ;
    logic [`BANK_width-1:0] mem_BN10_idx   ;
    logic [`BANK_width-1:0] mem_BN11_idx   ;
    logic [`BANK_width-1:0] mem_BN12_idx   ;
    logic [`BANK_width-1:0] mem_BN13_idx   ;
    logic [`BANK_width-1:0] mem_BN14_idx   ;
    logic [`BANK_width-1:0] mem_BN15_idx   ;
    
    logic  mem_r_enable                 ;
    logic  mem_w_enable                 ;
    logic  [`MA_width-1:0] mem_R16_w_MA0_idx     ;
    logic  [`MA_width-1:0] mem_R16_w_MA1_idx     ;
    logic  [`MA_width-1:0] mem_R16_w_MA2_idx     ;
    logic  [`MA_width-1:0] mem_R16_w_MA3_idx     ;
    logic  [`MA_width-1:0] mem_R16_w_MA4_idx     ;
    logic  [`MA_width-1:0] mem_R16_w_MA5_idx     ;
    logic  [`MA_width-1:0] mem_R16_w_MA6_idx     ;
    logic  [`MA_width-1:0] mem_R16_w_MA7_idx     ;
    logic  [`MA_width-1:0] mem_R16_w_MA8_idx     ;
    logic  [`MA_width-1:0] mem_R16_w_MA9_idx     ;
    logic  [`MA_width-1:0] mem_R16_w_MA10_idx    ;
    logic  [`MA_width-1:0] mem_R16_w_MA11_idx    ;
    logic  [`MA_width-1:0] mem_R16_w_MA12_idx    ;
    logic  [`MA_width-1:0] mem_R16_w_MA13_idx    ;
    logic  [`MA_width-1:0] mem_R16_w_MA14_idx    ;
    logic  [`MA_width-1:0] mem_R16_w_MA15_idx    ;
    logic  [`BANK_width-1:0] mem_R16_w_BN0_idx     ;
    logic  [`BANK_width-1:0] mem_R16_w_BN1_idx     ;
    logic  [`BANK_width-1:0] mem_R16_w_BN2_idx     ;
    logic  [`BANK_width-1:0] mem_R16_w_BN3_idx     ;
    logic  [`BANK_width-1:0] mem_R16_w_BN4_idx     ;
    logic  [`BANK_width-1:0] mem_R16_w_BN5_idx     ;
    logic  [`BANK_width-1:0] mem_R16_w_BN6_idx     ;
    logic  [`BANK_width-1:0] mem_R16_w_BN7_idx     ;
    logic  [`BANK_width-1:0] mem_R16_w_BN8_idx     ;
    logic  [`BANK_width-1:0] mem_R16_w_BN9_idx     ;
    logic  [`BANK_width-1:0] mem_R16_w_BN10_idx    ;
    logic  [`BANK_width-1:0] mem_R16_w_BN11_idx    ;
    logic  [`BANK_width-1:0] mem_R16_w_BN12_idx    ;
    logic  [`BANK_width-1:0] mem_R16_w_BN13_idx    ;
    logic  [`BANK_width-1:0] mem_R16_w_BN14_idx    ;
    logic  [`BANK_width-1:0] mem_R16_w_BN15_idx    ;

    //output
    logic [`D_width-1:0] mem_memory_b0              ;
    logic [`D_width-1:0] mem_memory_b1              ;
    logic [`D_width-1:0] mem_memory_b2              ;
    logic [`D_width-1:0] mem_memory_b3              ;
    logic [`D_width-1:0] mem_memory_b4              ;
    logic [`D_width-1:0] mem_memory_b5              ;
    logic [`D_width-1:0] mem_memory_b6              ;
    logic [`D_width-1:0] mem_memory_b7              ;
    logic [`D_width-1:0] mem_memory_b8              ;
    logic [`D_width-1:0] mem_memory_b9              ;
    logic [`D_width-1:0] mem_memory_b10             ;
    logic [`D_width-1:0] mem_memory_b11             ;
    logic [`D_width-1:0] mem_memory_b12             ;
    logic [`D_width-1:0] mem_memory_b13             ;
    logic [`D_width-1:0] mem_memory_b14             ;
    logic [`D_width-1:0] mem_memory_b15             ;

    logic mem_r_enable_out                          ;
    logic mem_w_enable_out                          ;
    logic [`MA_width-1:0] mem_MA0_idx_out            ;
    logic [`MA_width-1:0] mem_MA1_idx_out            ;
    logic [`MA_width-1:0] mem_MA2_idx_out            ;
    logic [`MA_width-1:0] mem_MA3_idx_out            ;
    logic [`MA_width-1:0] mem_MA4_idx_out            ;
    logic [`MA_width-1:0] mem_MA5_idx_out            ;
    logic [`MA_width-1:0] mem_MA6_idx_out            ;
    logic [`MA_width-1:0] mem_MA7_idx_out            ;
    logic [`MA_width-1:0] mem_MA8_idx_out            ;
    logic [`MA_width-1:0] mem_MA9_idx_out            ;
    logic [`MA_width-1:0] mem_MA10_idx_out           ;
    logic [`MA_width-1:0] mem_MA11_idx_out           ;
    logic [`MA_width-1:0] mem_MA12_idx_out           ;
    logic [`MA_width-1:0] mem_MA13_idx_out           ;
    logic [`MA_width-1:0] mem_MA14_idx_out           ;
    logic [`MA_width-1:0] mem_MA15_idx_out           ;

    logic [`BANK_width-1:0] mem_BN0_idx_out            ;
    logic [`BANK_width-1:0] mem_BN1_idx_out            ;
    logic [`BANK_width-1:0] mem_BN2_idx_out            ;
    logic [`BANK_width-1:0] mem_BN3_idx_out            ;
    logic [`BANK_width-1:0] mem_BN4_idx_out            ;
    logic [`BANK_width-1:0] mem_BN5_idx_out            ;
    logic [`BANK_width-1:0] mem_BN6_idx_out            ;
    logic [`BANK_width-1:0] mem_BN7_idx_out            ;
    logic [`BANK_width-1:0] mem_BN8_idx_out            ;
    logic [`BANK_width-1:0] mem_BN9_idx_out            ;
    logic [`BANK_width-1:0] mem_BN10_idx_out           ;
    logic [`BANK_width-1:0] mem_BN11_idx_out           ;
    logic [`BANK_width-1:0] mem_BN12_idx_out           ;
    logic [`BANK_width-1:0] mem_BN13_idx_out           ;
    logic [`BANK_width-1:0] mem_BN14_idx_out           ;
    logic [`BANK_width-1:0] mem_BN15_idx_out           ;
    memory_wrapper memory_wrapper(
        //input
        .LAST_STAGE     (mem_LAST_STAGE),
        .data_in0       (mem_data_in0 ),
        .data_in1       (mem_data_in1 ),
        .data_in2       (mem_data_in2 ),
        .data_in3       (mem_data_in3 ),
        .data_in4       (mem_data_in4 ),
        .data_in5       (mem_data_in5 ),
        .data_in6       (mem_data_in6 ),
        .data_in7       (mem_data_in7 ),
        .data_in8       (mem_data_in8 ),
        .data_in9       (mem_data_in9 ),
        .data_in10      (mem_data_in10),
        .data_in11      (mem_data_in11),
        .data_in12      (mem_data_in12),
        .data_in13      (mem_data_in13),
        .data_in14      (mem_data_in14),
        .data_in15      (mem_data_in15),

        .MA0_idx        (mem_MA0_idx ),
        .MA1_idx        (mem_MA1_idx ),
        .MA2_idx        (mem_MA2_idx ),
        .MA3_idx        (mem_MA3_idx ),
        .MA4_idx        (mem_MA4_idx ),
        .MA5_idx        (mem_MA5_idx ),
        .MA6_idx        (mem_MA6_idx ),
        .MA7_idx        (mem_MA7_idx ),
        .MA8_idx        (mem_MA8_idx ),
        .MA9_idx        (mem_MA9_idx ),
        .MA10_idx       (mem_MA10_idx),
        .MA11_idx       (mem_MA11_idx),
        .MA12_idx       (mem_MA12_idx),
        .MA13_idx       (mem_MA13_idx),
        .MA14_idx       (mem_MA14_idx),
        .MA15_idx       (mem_MA15_idx),

        .BN0_idx        (mem_BN0_idx ),
        .BN1_idx        (mem_BN1_idx ),
        .BN2_idx        (mem_BN2_idx ),
        .BN3_idx        (mem_BN3_idx ),
        .BN4_idx        (mem_BN4_idx ),
        .BN5_idx        (mem_BN5_idx ),
        .BN6_idx        (mem_BN6_idx ),
        .BN7_idx        (mem_BN7_idx ),
        .BN8_idx        (mem_BN8_idx ),
        .BN9_idx        (mem_BN9_idx ),
        .BN10_idx       (mem_BN10_idx),
        .BN11_idx       (mem_BN11_idx),
        .BN12_idx       (mem_BN12_idx),
        .BN13_idx       (mem_BN13_idx),
        .BN14_idx       (mem_BN14_idx),
        .BN15_idx       (mem_BN15_idx),

        .r_enable       (mem_r_enable),
        .w_enable       (mem_w_enable),
        .clk            (clk     ),
        .rst            (rst     ),

        .R16_w_MA0_idx  (mem_R16_w_MA0_idx ),
        .R16_w_MA1_idx  (mem_R16_w_MA1_idx ),
        .R16_w_MA2_idx  (mem_R16_w_MA2_idx ),
        .R16_w_MA3_idx  (mem_R16_w_MA3_idx ),
        .R16_w_MA4_idx  (mem_R16_w_MA4_idx ),
        .R16_w_MA5_idx  (mem_R16_w_MA5_idx ),
        .R16_w_MA6_idx  (mem_R16_w_MA6_idx ),
        .R16_w_MA7_idx  (mem_R16_w_MA7_idx ),
        .R16_w_MA8_idx  (mem_R16_w_MA8_idx ),
        .R16_w_MA9_idx  (mem_R16_w_MA9_idx ),
        .R16_w_MA10_idx (mem_R16_w_MA10_idx),
        .R16_w_MA11_idx (mem_R16_w_MA11_idx),
        .R16_w_MA12_idx (mem_R16_w_MA12_idx),
        .R16_w_MA13_idx (mem_R16_w_MA13_idx),
        .R16_w_MA14_idx (mem_R16_w_MA14_idx),
        .R16_w_MA15_idx (mem_R16_w_MA15_idx),

        .R16_w_BN0_idx  (mem_R16_w_BN0_idx ),
        .R16_w_BN1_idx  (mem_R16_w_BN1_idx ),
        .R16_w_BN2_idx  (mem_R16_w_BN2_idx ),
        .R16_w_BN3_idx  (mem_R16_w_BN3_idx ),
        .R16_w_BN4_idx  (mem_R16_w_BN4_idx ),
        .R16_w_BN5_idx  (mem_R16_w_BN5_idx ),
        .R16_w_BN6_idx  (mem_R16_w_BN6_idx ),
        .R16_w_BN7_idx  (mem_R16_w_BN7_idx ),
        .R16_w_BN8_idx  (mem_R16_w_BN8_idx ),
        .R16_w_BN9_idx  (mem_R16_w_BN9_idx ),
        .R16_w_BN10_idx (mem_R16_w_BN10_idx),
        .R16_w_BN11_idx (mem_R16_w_BN11_idx),
        .R16_w_BN12_idx (mem_R16_w_BN12_idx),
        .R16_w_BN13_idx (mem_R16_w_BN13_idx),
        .R16_w_BN14_idx (mem_R16_w_BN14_idx),
        .R16_w_BN15_idx (mem_R16_w_BN15_idx),
        //output
        .memory_b0      (mem_memory_b0 ),
        .memory_b1      (mem_memory_b1 ),
        .memory_b2      (mem_memory_b2 ),
        .memory_b3      (mem_memory_b3 ),
        .memory_b4      (mem_memory_b4 ),
        .memory_b5      (mem_memory_b5 ),
        .memory_b6      (mem_memory_b6 ),
        .memory_b7      (mem_memory_b7 ),
        .memory_b8      (mem_memory_b8 ),
        .memory_b9      (mem_memory_b9 ),
        .memory_b10     (mem_memory_b10),
        .memory_b11     (mem_memory_b11),
        .memory_b12     (mem_memory_b12),
        .memory_b13     (mem_memory_b13),
        .memory_b14     (mem_memory_b14),
        .memory_b15     (mem_memory_b15),

        .r_enable_out   (mem_r_enable_out),
        .w_enable_out   (mem_w_enable_out),

        .MA0_idx_out    (mem_MA0_idx_out ),
        .MA1_idx_out    (mem_MA1_idx_out ),
        .MA2_idx_out    (mem_MA2_idx_out ),
        .MA3_idx_out    (mem_MA3_idx_out ),
        .MA4_idx_out    (mem_MA4_idx_out ),
        .MA5_idx_out    (mem_MA5_idx_out ),
        .MA6_idx_out    (mem_MA6_idx_out ),
        .MA7_idx_out    (mem_MA7_idx_out ),
        .MA8_idx_out    (mem_MA8_idx_out ),
        .MA9_idx_out    (mem_MA9_idx_out ),
        .MA10_idx_out   (mem_MA10_idx_out),
        .MA11_idx_out   (mem_MA11_idx_out),
        .MA12_idx_out   (mem_MA12_idx_out),
        .MA13_idx_out   (mem_MA13_idx_out),
        .MA14_idx_out   (mem_MA14_idx_out),
        .MA15_idx_out   (mem_MA15_idx_out),

        .BN0_idx_out    (mem_BN0_idx_out ),
        .BN1_idx_out    (mem_BN1_idx_out ),
        .BN2_idx_out    (mem_BN2_idx_out ),
        .BN3_idx_out    (mem_BN3_idx_out ),
        .BN4_idx_out    (mem_BN4_idx_out ),
        .BN5_idx_out    (mem_BN5_idx_out ),
        .BN6_idx_out    (mem_BN6_idx_out ),
        .BN7_idx_out    (mem_BN7_idx_out ),
        .BN8_idx_out    (mem_BN8_idx_out ),
        .BN9_idx_out    (mem_BN9_idx_out ),
        .BN10_idx_out   (mem_BN10_idx_out),
        .BN11_idx_out   (mem_BN11_idx_out),
        .BN12_idx_out   (mem_BN12_idx_out),
        .BN13_idx_out   (mem_BN13_idx_out),
        .BN14_idx_out   (mem_BN14_idx_out),
        .BN15_idx_out   (mem_BN15_idx_out)
    );
    
    //input
    logic  R16_LAST_STAGE ;
    logic [`D_width-1:0] R16_data_in0   ;
    logic [`D_width-1:0] R16_data_in1   ;
    logic [`D_width-1:0] R16_data_in2   ;
    logic [`D_width-1:0] R16_data_in3   ;
    logic [`D_width-1:0] R16_data_in4   ;
    logic [`D_width-1:0] R16_data_in5   ;
    logic [`D_width-1:0] R16_data_in6   ;
    logic [`D_width-1:0] R16_data_in7   ;
    logic [`D_width-1:0] R16_data_in8   ;
    logic [`D_width-1:0] R16_data_in9   ;
    logic [`D_width-1:0] R16_data_in10  ;
    logic [`D_width-1:0] R16_data_in11  ;
    logic [`D_width-1:0] R16_data_in12  ;
    logic [`D_width-1:0] R16_data_in13  ;
    logic [`D_width-1:0] R16_data_in14  ;
    logic [`D_width-1:0] R16_data_in15  ;

    logic [`D_width-1:0] R16_TF0        ;
    logic [`D_width-1:0] R16_TF1        ;
    logic [`D_width-1:0] R16_TF2        ;
    logic [`D_width-1:0] R16_TF3        ;
    logic [`D_width-1:0] R16_TF4        ;
    logic [`D_width-1:0] R16_TF5        ;
    logic [`D_width-1:0] R16_TF6        ;
    logic [`D_width-1:0] R16_TF7        ;
    logic [`D_width-1:0] R16_TF8        ;
    logic [`D_width-1:0] R16_TF9        ;
    logic [`D_width-1:0] R16_TF10       ;
    logic [`D_width-1:0] R16_TF11       ;
    logic [`D_width-1:0] R16_TF12       ;
    logic [`D_width-1:0] R16_TF13       ;
    logic [`D_width-1:0] R16_TF14       ;
    logic [`D_width-1:0] R16_TF15       ;

    logic R16_ntt_enable                 ;
    logic [`MA_width-1:0] R16_MA0_idx    ;
    logic [`MA_width-1:0] R16_MA1_idx    ;
    logic [`MA_width-1:0] R16_MA2_idx    ;
    logic [`MA_width-1:0] R16_MA3_idx    ;
    logic [`MA_width-1:0] R16_MA4_idx    ;
    logic [`MA_width-1:0] R16_MA5_idx    ;
    logic [`MA_width-1:0] R16_MA6_idx    ;
    logic [`MA_width-1:0] R16_MA7_idx    ;
    logic [`MA_width-1:0] R16_MA8_idx    ;
    logic [`MA_width-1:0] R16_MA9_idx    ;
    logic [`MA_width-1:0] R16_MA10_idx   ;
    logic [`MA_width-1:0] R16_MA11_idx   ;
    logic [`MA_width-1:0] R16_MA12_idx   ;
    logic [`MA_width-1:0] R16_MA13_idx   ;
    logic [`MA_width-1:0] R16_MA14_idx   ;
    logic [`MA_width-1:0] R16_MA15_idx   ;

    logic [`BANK_width-1:0] R16_BN0_idx    ;
    logic [`BANK_width-1:0] R16_BN1_idx    ;
    logic [`BANK_width-1:0] R16_BN2_idx    ;
    logic [`BANK_width-1:0] R16_BN3_idx    ;
    logic [`BANK_width-1:0] R16_BN4_idx    ;
    logic [`BANK_width-1:0] R16_BN5_idx    ;
    logic [`BANK_width-1:0] R16_BN6_idx    ;
    logic [`BANK_width-1:0] R16_BN7_idx    ;
    logic [`BANK_width-1:0] R16_BN8_idx    ;
    logic [`BANK_width-1:0] R16_BN9_idx    ;
    logic [`BANK_width-1:0] R16_BN10_idx   ;
    logic [`BANK_width-1:0] R16_BN11_idx   ;
    logic [`BANK_width-1:0] R16_BN12_idx   ;
    logic [`BANK_width-1:0] R16_BN13_idx   ;
    logic [`BANK_width-1:0] R16_BN14_idx   ;
    logic [`BANK_width-1:0] R16_BN15_idx   ;

    //output 
    logic ntt_enable;

    logic [`D_width-1:0] R16_data_out0  ;
    logic [`D_width-1:0] R16_data_out1  ;
    logic [`D_width-1:0] R16_data_out2  ;
    logic [`D_width-1:0] R16_data_out3  ;
    logic [`D_width-1:0] R16_data_out4  ;
    logic [`D_width-1:0] R16_data_out5  ;
    logic [`D_width-1:0] R16_data_out6  ;
    logic [`D_width-1:0] R16_data_out7  ;
    logic [`D_width-1:0] R16_data_out8  ;
    logic [`D_width-1:0] R16_data_out9  ;
    logic [`D_width-1:0] R16_data_out10 ;
    logic [`D_width-1:0] R16_data_out11 ;
    logic [`D_width-1:0] R16_data_out12 ;
    logic [`D_width-1:0] R16_data_out13 ;
    logic [`D_width-1:0] R16_data_out14 ;
    logic [`D_width-1:0] R16_data_out15 ;
    logic [1:0] R16_ntt_done;

    logic [`MA_width-1:0] R16_MA0_idx_out    ;
    logic [`MA_width-1:0] R16_MA1_idx_out    ;
    logic [`MA_width-1:0] R16_MA2_idx_out    ;
    logic [`MA_width-1:0] R16_MA3_idx_out    ;
    logic [`MA_width-1:0] R16_MA4_idx_out    ;
    logic [`MA_width-1:0] R16_MA5_idx_out    ;
    logic [`MA_width-1:0] R16_MA6_idx_out    ;
    logic [`MA_width-1:0] R16_MA7_idx_out    ;
    logic [`MA_width-1:0] R16_MA8_idx_out    ;
    logic [`MA_width-1:0] R16_MA9_idx_out    ;
    logic [`MA_width-1:0] R16_MA10_idx_out   ;
    logic [`MA_width-1:0] R16_MA11_idx_out   ;
    logic [`MA_width-1:0] R16_MA12_idx_out   ;
    logic [`MA_width-1:0] R16_MA13_idx_out   ;
    logic [`MA_width-1:0] R16_MA14_idx_out   ;
    logic [`MA_width-1:0] R16_MA15_idx_out   ;

    logic [`BANK_width-1:0] R16_BN0_idx_out    ;
    logic [`BANK_width-1:0] R16_BN1_idx_out    ;
    logic [`BANK_width-1:0] R16_BN2_idx_out    ;
    logic [`BANK_width-1:0] R16_BN3_idx_out    ;
    logic [`BANK_width-1:0] R16_BN4_idx_out    ;
    logic [`BANK_width-1:0] R16_BN5_idx_out    ;
    logic [`BANK_width-1:0] R16_BN6_idx_out    ;
    logic [`BANK_width-1:0] R16_BN7_idx_out    ;
    logic [`BANK_width-1:0] R16_BN8_idx_out    ;
    logic [`BANK_width-1:0] R16_BN9_idx_out    ;
    logic [`BANK_width-1:0] R16_BN10_idx_out   ;
    logic [`BANK_width-1:0] R16_BN11_idx_out   ;
    logic [`BANK_width-1:0] R16_BN12_idx_out   ;
    logic [`BANK_width-1:0] R16_BN13_idx_out   ;
    logic [`BANK_width-1:0] R16_BN14_idx_out   ;
    logic [`BANK_width-1:0] R16_BN15_idx_out   ;

    R16_top R16_top(
        //input
        .LAST_STAGE         (R16_LAST_STAGE ),
        .x0                 (R16_data_in0   ),
        .x1                 (R16_data_in1   ),
        .x2                 (R16_data_in2   ),
        .x3                 (R16_data_in3   ),
        .x4                 (R16_data_in4   ),
        .x5                 (R16_data_in5   ),
        .x6                 (R16_data_in6   ),
        .x7                 (R16_data_in7   ),
        .x8                 (R16_data_in8   ),
        .x9                 (R16_data_in9   ),
        .x10                (R16_data_in10  ),
        .x11                (R16_data_in11  ),
        .x12                (R16_data_in12  ),
        .x13                (R16_data_in13  ),
        .x14                (R16_data_in14  ),
        .x15                (R16_data_in15  ),

        .twiddle_0          (R16_TF0    ),
        .twiddle_1          (R16_TF1    ),
        .twiddle_2          (R16_TF2    ),
        .twiddle_3          (R16_TF3    ),
        .twiddle_4          (R16_TF4    ),
        .twiddle_5          (R16_TF5    ),
        .twiddle_6          (R16_TF6    ),
        .twiddle_7          (R16_TF7    ),
        .twiddle_8          (R16_TF8    ),
        .twiddle_9          (R16_TF9    ),
        .twiddle_10         (R16_TF10   ),
        .twiddle_11         (R16_TF11   ),
        .twiddle_12         (R16_TF12   ),
        .twiddle_13         (R16_TF13   ),
        .twiddle_14         (R16_TF14   ),
        .twiddle_15         (R16_TF15   ),

        .modulus(modulus),
        .clk(clk),
        .rst(rst),
        .ntt_enable(R16_ntt_enable),

        .R16_MA0_idx            (R16_MA0_idx ),
        .R16_MA1_idx            (R16_MA1_idx ),
        .R16_MA2_idx            (R16_MA2_idx ),
        .R16_MA3_idx            (R16_MA3_idx ),
        .R16_MA4_idx            (R16_MA4_idx ),
        .R16_MA5_idx            (R16_MA5_idx ),
        .R16_MA6_idx            (R16_MA6_idx ),
        .R16_MA7_idx            (R16_MA7_idx ),
        .R16_MA8_idx            (R16_MA8_idx ),
        .R16_MA9_idx            (R16_MA9_idx ),
        .R16_MA10_idx           (R16_MA10_idx),
        .R16_MA11_idx           (R16_MA11_idx),
        .R16_MA12_idx           (R16_MA12_idx),
        .R16_MA13_idx           (R16_MA13_idx),
        .R16_MA14_idx           (R16_MA14_idx),
        .R16_MA15_idx           (R16_MA15_idx),

        .R16_BN0_idx            (R16_BN0_idx ),
        .R16_BN1_idx            (R16_BN1_idx ),
        .R16_BN2_idx            (R16_BN2_idx ),
        .R16_BN3_idx            (R16_BN3_idx ),
        .R16_BN4_idx            (R16_BN4_idx ),
        .R16_BN5_idx            (R16_BN5_idx ),
        .R16_BN6_idx            (R16_BN6_idx ),
        .R16_BN7_idx            (R16_BN7_idx ),
        .R16_BN8_idx            (R16_BN8_idx ),
        .R16_BN9_idx            (R16_BN9_idx ),
        .R16_BN10_idx           (R16_BN10_idx),
        .R16_BN11_idx           (R16_BN11_idx),
        .R16_BN12_idx           (R16_BN12_idx),
        .R16_BN13_idx           (R16_BN13_idx),
        .R16_BN14_idx           (R16_BN14_idx),
        .R16_BN15_idx           (R16_BN15_idx),

        //output
        .y0                     (R16_data_out0  ),
        .y1                     (R16_data_out1  ),
        .y2                     (R16_data_out2  ),
        .y3                     (R16_data_out3  ),
        .y4                     (R16_data_out4  ),
        .y5                     (R16_data_out5  ),
        .y6                     (R16_data_out6  ),
        .y7                     (R16_data_out7  ),
        .y8                     (R16_data_out8  ),
        .y9                     (R16_data_out9  ),
        .y10                    (R16_data_out10 ),
        .y11                    (R16_data_out11 ),
        .y12                    (R16_data_out12 ),
        .y13                    (R16_data_out13 ),
        .y14                    (R16_data_out14 ),
        .y15                    (R16_data_out15 ),

        .ntt_done(R16_ntt_done),

        .R16_MA0_idx_out    (R16_MA0_idx_out ),
        .R16_MA1_idx_out    (R16_MA1_idx_out ),
        .R16_MA2_idx_out    (R16_MA2_idx_out ),
        .R16_MA3_idx_out    (R16_MA3_idx_out ),
        .R16_MA4_idx_out    (R16_MA4_idx_out ),
        .R16_MA5_idx_out    (R16_MA5_idx_out ),
        .R16_MA6_idx_out    (R16_MA6_idx_out ),
        .R16_MA7_idx_out    (R16_MA7_idx_out ),
        .R16_MA8_idx_out    (R16_MA8_idx_out ),
        .R16_MA9_idx_out    (R16_MA9_idx_out ),
        .R16_MA10_idx_out   (R16_MA10_idx_out),
        .R16_MA11_idx_out   (R16_MA11_idx_out),
        .R16_MA12_idx_out   (R16_MA12_idx_out),
        .R16_MA13_idx_out   (R16_MA13_idx_out),
        .R16_MA14_idx_out   (R16_MA14_idx_out),
        .R16_MA15_idx_out   (R16_MA15_idx_out),

        .R16_BN0_idx_out    (R16_BN0_idx_out ),
        .R16_BN1_idx_out    (R16_BN1_idx_out ),
        .R16_BN2_idx_out    (R16_BN2_idx_out ),
        .R16_BN3_idx_out    (R16_BN3_idx_out ),
        .R16_BN4_idx_out    (R16_BN4_idx_out ),
        .R16_BN5_idx_out    (R16_BN5_idx_out ),
        .R16_BN6_idx_out    (R16_BN6_idx_out ),
        .R16_BN7_idx_out    (R16_BN7_idx_out ),
        .R16_BN8_idx_out    (R16_BN8_idx_out ),
        .R16_BN9_idx_out    (R16_BN9_idx_out ),
        .R16_BN10_idx_out   (R16_BN10_idx_out),
        .R16_BN11_idx_out   (R16_BN11_idx_out),
        .R16_BN12_idx_out   (R16_BN12_idx_out),
        .R16_BN13_idx_out   (R16_BN13_idx_out),
        .R16_BN14_idx_out   (R16_BN14_idx_out),
        .R16_BN15_idx_out   (R16_BN15_idx_out)
    );

    //Controll
    //input
    assign ctr_AGU_done     = AGU_top_AGU_done_out  ;
    assign ctr_BN_MA_out_en = AGU_top_BN_MA_out_en  ;
    assign ctr_r_enable_out = mem_r_enable_out      ;
    assign ctr_w_enable_out = mem_w_enable_out      ;
    assign ctr_ntt_done     = R16_ntt_done          ;

    //output
    assign DONE = ctr_DONE;
  
    //TF_gen
    assign TF_gen_LAST_STAGE    = ctr_LAST_STAGE    ;
    assign TF_gen_TF_ren        = ctr_TF_ren        ;
    assign TF_gen_TF_wen        = ctr_TF_wen        ;
    assign TF_gen_it_depth_cnt  = ctr_it_depth_cnt  ; 

    assign TF_l                 = AGU_l_AGU_out ;
    assign TF_ite_sw_cnt        = ctr_ite_sw_cnt ;
    assign TF_ite_sw_cnt_ite3   = ctr_ite_sw_cnt_ite3   ;
    
    //AGU_top
    //input 
    assign AGU_top_AGU_enable       = ctr_AGU_enable    ;
    assign AGU_top_AGU_enable_k2    = ctr_AGU_enable_k2 ;
    assign AGU_top_LAST_STAGE       = ctr_LAST_STAGE    ;
    //memory_rtl
    //input 
    assign mem_data_in0         = (mem_w_enable) ? R16_data_out0    :   'd0;
    assign mem_data_in1         = (mem_w_enable) ? R16_data_out1    :   'd0;
    assign mem_data_in2         = (mem_w_enable) ? R16_data_out2    :   'd0;
    assign mem_data_in3         = (mem_w_enable) ? R16_data_out3    :   'd0;
    assign mem_data_in4         = (mem_w_enable) ? R16_data_out4    :   'd0;
    assign mem_data_in5         = (mem_w_enable) ? R16_data_out5    :   'd0;
    assign mem_data_in6         = (mem_w_enable) ? R16_data_out6    :   'd0;
    assign mem_data_in7         = (mem_w_enable) ? R16_data_out7    :   'd0;
    assign mem_data_in8         = (mem_w_enable) ? R16_data_out8    :   'd0;
    assign mem_data_in9         = (mem_w_enable) ? R16_data_out9    :   'd0;
    assign mem_data_in10        = (mem_w_enable) ? R16_data_out10   :   'd0;
    assign mem_data_in11        = (mem_w_enable) ? R16_data_out11   :   'd0;
    assign mem_data_in12        = (mem_w_enable) ? R16_data_out12   :   'd0;
    assign mem_data_in13        = (mem_w_enable) ? R16_data_out13   :   'd0;
    assign mem_data_in14        = (mem_w_enable) ? R16_data_out14   :   'd0;
    assign mem_data_in15        = (mem_w_enable) ? R16_data_out15   :   'd0;
    
    assign mem_MA0_idx          = AGU_top_MA0_idx   ;
    assign mem_MA1_idx          = AGU_top_MA1_idx   ;
    assign mem_MA2_idx          = AGU_top_MA2_idx   ;
    assign mem_MA3_idx          = AGU_top_MA3_idx   ;
    assign mem_MA4_idx          = AGU_top_MA4_idx   ;
    assign mem_MA5_idx          = AGU_top_MA5_idx   ;
    assign mem_MA6_idx          = AGU_top_MA6_idx   ;
    assign mem_MA7_idx          = AGU_top_MA7_idx   ;
    assign mem_MA8_idx          = AGU_top_MA8_idx   ;
    assign mem_MA9_idx          = AGU_top_MA9_idx   ;
    assign mem_MA10_idx         = AGU_top_MA10_idx  ;
    assign mem_MA11_idx         = AGU_top_MA11_idx  ;
    assign mem_MA12_idx         = AGU_top_MA12_idx  ;
    assign mem_MA13_idx         = AGU_top_MA13_idx  ;
    assign mem_MA14_idx         = AGU_top_MA14_idx  ;
    assign mem_MA15_idx         = AGU_top_MA15_idx  ;

    assign mem_BN0_idx          = AGU_top_BN0_idx   ;
    assign mem_BN1_idx          = AGU_top_BN1_idx   ;
    assign mem_BN2_idx          = AGU_top_BN2_idx   ;
    assign mem_BN3_idx          = AGU_top_BN3_idx   ;
    assign mem_BN4_idx          = AGU_top_BN4_idx   ;
    assign mem_BN5_idx          = AGU_top_BN5_idx   ;
    assign mem_BN6_idx          = AGU_top_BN6_idx   ;
    assign mem_BN7_idx          = AGU_top_BN7_idx   ;
    assign mem_BN8_idx          = AGU_top_BN8_idx   ;
    assign mem_BN9_idx          = AGU_top_BN9_idx   ;
    assign mem_BN10_idx         = AGU_top_BN10_idx  ;
    assign mem_BN11_idx         = AGU_top_BN11_idx  ;
    assign mem_BN12_idx         = AGU_top_BN12_idx  ;
    assign mem_BN13_idx         = AGU_top_BN13_idx  ;
    assign mem_BN14_idx         = AGU_top_BN14_idx  ;
    assign mem_BN15_idx         = AGU_top_BN15_idx  ;

    assign mem_r_enable         = ctr_r_enable;
    assign mem_w_enable         = ctr_w_enable;
    assign mem_LAST_STAGE       = ctr_LAST_STAGE;

    assign mem_R16_w_MA0_idx    = (mem_w_enable) ? R16_MA0_idx_out  :   'd0;
    assign mem_R16_w_MA1_idx    = (mem_w_enable) ? R16_MA1_idx_out  :   'd0;
    assign mem_R16_w_MA2_idx    = (mem_w_enable) ? R16_MA2_idx_out  :   'd0;
    assign mem_R16_w_MA3_idx    = (mem_w_enable) ? R16_MA3_idx_out  :   'd0;
    assign mem_R16_w_MA4_idx    = (mem_w_enable) ? R16_MA4_idx_out  :   'd0;
    assign mem_R16_w_MA5_idx    = (mem_w_enable) ? R16_MA5_idx_out  :   'd0;
    assign mem_R16_w_MA6_idx    = (mem_w_enable) ? R16_MA6_idx_out  :   'd0;
    assign mem_R16_w_MA7_idx    = (mem_w_enable) ? R16_MA7_idx_out  :   'd0;
    assign mem_R16_w_MA8_idx    = (mem_w_enable) ? R16_MA8_idx_out  :   'd0;
    assign mem_R16_w_MA9_idx    = (mem_w_enable) ? R16_MA9_idx_out  :   'd0;
    assign mem_R16_w_MA10_idx   = (mem_w_enable) ? R16_MA10_idx_out :   'd0;
    assign mem_R16_w_MA11_idx   = (mem_w_enable) ? R16_MA11_idx_out :   'd0;
    assign mem_R16_w_MA12_idx   = (mem_w_enable) ? R16_MA12_idx_out :   'd0;
    assign mem_R16_w_MA13_idx   = (mem_w_enable) ? R16_MA13_idx_out :   'd0;
    assign mem_R16_w_MA14_idx   = (mem_w_enable) ? R16_MA14_idx_out :   'd0;
    assign mem_R16_w_MA15_idx   = (mem_w_enable) ? R16_MA15_idx_out :   'd0;

    assign mem_R16_w_BN0_idx    = (mem_w_enable) ? R16_BN0_idx_out  :   'd0;
    assign mem_R16_w_BN1_idx    = (mem_w_enable) ? R16_BN1_idx_out  :   'd0;
    assign mem_R16_w_BN2_idx    = (mem_w_enable) ? R16_BN2_idx_out  :   'd0;
    assign mem_R16_w_BN3_idx    = (mem_w_enable) ? R16_BN3_idx_out  :   'd0;
    assign mem_R16_w_BN4_idx    = (mem_w_enable) ? R16_BN4_idx_out  :   'd0;
    assign mem_R16_w_BN5_idx    = (mem_w_enable) ? R16_BN5_idx_out  :   'd0;
    assign mem_R16_w_BN6_idx    = (mem_w_enable) ? R16_BN6_idx_out  :   'd0;
    assign mem_R16_w_BN7_idx    = (mem_w_enable) ? R16_BN7_idx_out  :   'd0;
    assign mem_R16_w_BN8_idx    = (mem_w_enable) ? R16_BN8_idx_out  :   'd0;
    assign mem_R16_w_BN9_idx    = (mem_w_enable) ? R16_BN9_idx_out  :   'd0;
    assign mem_R16_w_BN10_idx   = (mem_w_enable) ? R16_BN10_idx_out :   'd0;
    assign mem_R16_w_BN11_idx   = (mem_w_enable) ? R16_BN11_idx_out :   'd0;
    assign mem_R16_w_BN12_idx   = (mem_w_enable) ? R16_BN12_idx_out :   'd0;
    assign mem_R16_w_BN13_idx   = (mem_w_enable) ? R16_BN13_idx_out :   'd0;
    assign mem_R16_w_BN14_idx   = (mem_w_enable) ? R16_BN14_idx_out :   'd0;
    assign mem_R16_w_BN15_idx   = (mem_w_enable) ? R16_BN15_idx_out :   'd0;

    //R16_BU
    //input
    assign R16_LAST_STAGE       = ctr_LAST_STAGE;
    assign R16_data_in0         = mem_memory_b0;
    assign R16_data_in1         = mem_memory_b1;
    assign R16_data_in2         = mem_memory_b2;
    assign R16_data_in3         = mem_memory_b3;
    assign R16_data_in4         = mem_memory_b4;
    assign R16_data_in5         = mem_memory_b5;
    assign R16_data_in6         = mem_memory_b6;
    assign R16_data_in7         = mem_memory_b7;
    assign R16_data_in8         = mem_memory_b8;
    assign R16_data_in9         = mem_memory_b9;
    assign R16_data_in10        = mem_memory_b10;
    assign R16_data_in11        = mem_memory_b11;
    assign R16_data_in12        = mem_memory_b12;
    assign R16_data_in13        = mem_memory_b13;
    assign R16_data_in14        = mem_memory_b14;
    assign R16_data_in15        = mem_memory_b15;

    assign R16_TF0              = 'd0;
    assign R16_TF1              = TF_gen_TF_base_b1;
    assign R16_TF2              = TF_gen_TF_base_b2;
    assign R16_TF3              = TF_gen_TF_base_b3;
    assign R16_TF4              = TF_gen_TF_base_b4;
    assign R16_TF5              = TF_gen_TF_base_b5;
    assign R16_TF6              = TF_gen_TF_base_b6;
    assign R16_TF7              = TF_gen_TF_base_b7;
    assign R16_TF8              = TF_gen_TF_base_b8;
    assign R16_TF9              = TF_gen_TF_base_b9;
    assign R16_TF10             = TF_gen_TF_base_b10;
    assign R16_TF11             = TF_gen_TF_base_b11;
    assign R16_TF12             = TF_gen_TF_base_b12;
    assign R16_TF13             = TF_gen_TF_base_b13;
    assign R16_TF14             = TF_gen_TF_base_b14;
    assign R16_TF15             = TF_gen_TF_base_b15;

    assign R16_ntt_enable       = ctr_ntt_enable;
    assign R16_MA0_idx          = mem_MA0_idx_out;
    assign R16_MA1_idx          = mem_MA1_idx_out;
    assign R16_MA2_idx          = mem_MA2_idx_out;
    assign R16_MA3_idx          = mem_MA3_idx_out;
    assign R16_MA4_idx          = mem_MA4_idx_out;
    assign R16_MA5_idx          = mem_MA5_idx_out;
    assign R16_MA6_idx          = mem_MA6_idx_out;
    assign R16_MA7_idx          = mem_MA7_idx_out;
    assign R16_MA8_idx          = mem_MA8_idx_out;
    assign R16_MA9_idx          = mem_MA9_idx_out;
    assign R16_MA10_idx         = mem_MA10_idx_out;
    assign R16_MA11_idx         = mem_MA11_idx_out;
    assign R16_MA12_idx         = mem_MA12_idx_out;
    assign R16_MA13_idx         = mem_MA13_idx_out;
    assign R16_MA14_idx         = mem_MA14_idx_out;
    assign R16_MA15_idx         = mem_MA15_idx_out;

    assign R16_BN0_idx          = mem_BN0_idx_out;
    assign R16_BN1_idx          = mem_BN1_idx_out;
    assign R16_BN2_idx          = mem_BN2_idx_out;
    assign R16_BN3_idx          = mem_BN3_idx_out;
    assign R16_BN4_idx          = mem_BN4_idx_out;
    assign R16_BN5_idx          = mem_BN5_idx_out;
    assign R16_BN6_idx          = mem_BN6_idx_out;
    assign R16_BN7_idx          = mem_BN7_idx_out;
    assign R16_BN8_idx          = mem_BN8_idx_out;
    assign R16_BN9_idx          = mem_BN9_idx_out;
    assign R16_BN10_idx         = mem_BN10_idx_out;
    assign R16_BN11_idx         = mem_BN11_idx_out;
    assign R16_BN12_idx         = mem_BN12_idx_out;
    assign R16_BN13_idx         = mem_BN13_idx_out;
    assign R16_BN14_idx         = mem_BN14_idx_out;
    assign R16_BN15_idx         = mem_BN15_idx_out;

endmodule