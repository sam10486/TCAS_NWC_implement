`include "../include/define.svh"
`include "AGU_top.sv"
`include "AGU_top_k2.sv"

module AGU_integrate (
    input LAST_STAGE    ,
    input clk           ,
    input rst           ,
    input AGU_enable    ,
    input AGU_enable_k2 ,

    output logic [`MA_width-1:0] MA0_idx ,
    output logic [`MA_width-1:0] MA1_idx ,
    output logic [`MA_width-1:0] MA2_idx ,
    output logic [`MA_width-1:0] MA3_idx ,
    output logic [`MA_width-1:0] MA4_idx ,
    output logic [`MA_width-1:0] MA5_idx ,
    output logic [`MA_width-1:0] MA6_idx ,
    output logic [`MA_width-1:0] MA7_idx ,
    output logic [`MA_width-1:0] MA8_idx ,
    output logic [`MA_width-1:0] MA9_idx ,
    output logic [`MA_width-1:0] MA10_idx,
    output logic [`MA_width-1:0] MA11_idx,
    output logic [`MA_width-1:0] MA12_idx,
    output logic [`MA_width-1:0] MA13_idx,
    output logic [`MA_width-1:0] MA14_idx,
    output logic [`MA_width-1:0] MA15_idx,

    output logic [`BANK_width-1:0] BN0_idx ,
    output logic [`BANK_width-1:0] BN1_idx ,
    output logic [`BANK_width-1:0] BN2_idx ,
    output logic [`BANK_width-1:0] BN3_idx ,
    output logic [`BANK_width-1:0] BN4_idx ,
    output logic [`BANK_width-1:0] BN5_idx ,
    output logic [`BANK_width-1:0] BN6_idx ,
    output logic [`BANK_width-1:0] BN7_idx ,
    output logic [`BANK_width-1:0] BN8_idx ,
    output logic [`BANK_width-1:0] BN9_idx ,
    output logic [`BANK_width-1:0] BN10_idx,
    output logic [`BANK_width-1:0] BN11_idx,
    output logic [`BANK_width-1:0] BN12_idx,
    output logic [`BANK_width-1:0] BN13_idx,
    output logic [`BANK_width-1:0] BN14_idx,
    output logic [`BANK_width-1:0] BN15_idx,

    output logic AGU_done_out               ,
    output logic BN_MA_out_en               ,
    output logic [2:0] l_AGU_out   

);
    logic [`MA_width-1:0] k1_MA0_idx ;
    logic [`MA_width-1:0] k1_MA1_idx ;
    logic [`MA_width-1:0] k1_MA2_idx ;
    logic [`MA_width-1:0] k1_MA3_idx ;
    logic [`MA_width-1:0] k1_MA4_idx ;
    logic [`MA_width-1:0] k1_MA5_idx ;
    logic [`MA_width-1:0] k1_MA6_idx ;
    logic [`MA_width-1:0] k1_MA7_idx ;
    logic [`MA_width-1:0] k1_MA8_idx ;
    logic [`MA_width-1:0] k1_MA9_idx ;
    logic [`MA_width-1:0] k1_MA10_idx;
    logic [`MA_width-1:0] k1_MA11_idx;
    logic [`MA_width-1:0] k1_MA12_idx;
    logic [`MA_width-1:0] k1_MA13_idx;
    logic [`MA_width-1:0] k1_MA14_idx;
    logic [`MA_width-1:0] k1_MA15_idx;

    logic [`BANK_width-1:0] k1_BN0_idx ;
    logic [`BANK_width-1:0] k1_BN1_idx ;
    logic [`BANK_width-1:0] k1_BN2_idx ;
    logic [`BANK_width-1:0] k1_BN3_idx ;
    logic [`BANK_width-1:0] k1_BN4_idx ;
    logic [`BANK_width-1:0] k1_BN5_idx ;
    logic [`BANK_width-1:0] k1_BN6_idx ;
    logic [`BANK_width-1:0] k1_BN7_idx ;
    logic [`BANK_width-1:0] k1_BN8_idx ;
    logic [`BANK_width-1:0] k1_BN9_idx ;
    logic [`BANK_width-1:0] k1_BN10_idx;
    logic [`BANK_width-1:0] k1_BN11_idx;
    logic [`BANK_width-1:0] k1_BN12_idx;
    logic [`BANK_width-1:0] k1_BN13_idx;
    logic [`BANK_width-1:0] k1_BN14_idx;
    logic [`BANK_width-1:0] k1_BN15_idx;

    logic k1_AGU_done_out;
    logic k1_BN_MA_out_en;
    logic [2:0] k1_l_AGU_out;

    AGU_top AGU_top (
        //input
        .clk       (clk),    
        .rst       (rst),    
        .AGU_enable(AGU_enable),

        //output
        .MA0_idx    (k1_MA0_idx ),
        .MA1_idx    (k1_MA1_idx ),
        .MA2_idx    (k1_MA2_idx ),
        .MA3_idx    (k1_MA3_idx ),
        .MA4_idx    (k1_MA4_idx ),
        .MA5_idx    (k1_MA5_idx ),
        .MA6_idx    (k1_MA6_idx ),
        .MA7_idx    (k1_MA7_idx ),
        .MA8_idx    (k1_MA8_idx ),
        .MA9_idx    (k1_MA9_idx ),
        .MA10_idx   (k1_MA10_idx),
        .MA11_idx   (k1_MA11_idx),
        .MA12_idx   (k1_MA12_idx),
        .MA13_idx   (k1_MA13_idx),
        .MA14_idx   (k1_MA14_idx),
        .MA15_idx   (k1_MA15_idx),
        
        .BN0_idx    (k1_BN0_idx ),
        .BN1_idx    (k1_BN1_idx ),
        .BN2_idx    (k1_BN2_idx ),
        .BN3_idx    (k1_BN3_idx ),
        .BN4_idx    (k1_BN4_idx ),
        .BN5_idx    (k1_BN5_idx ),
        .BN6_idx    (k1_BN6_idx ),
        .BN7_idx    (k1_BN7_idx ),
        .BN8_idx    (k1_BN8_idx ),
        .BN9_idx    (k1_BN9_idx ),
        .BN10_idx   (k1_BN10_idx),
        .BN11_idx   (k1_BN11_idx),
        .BN12_idx   (k1_BN12_idx),
        .BN13_idx   (k1_BN13_idx),
        .BN14_idx   (k1_BN14_idx),
        .BN15_idx   (k1_BN15_idx),

        .AGU_done_out (k1_AGU_done_out  ),
        .BN_MA_out_en (k1_BN_MA_out_en  ),
        .l_AGU_out    (k1_l_AGU_out     )

    );

    logic [`MA_width-1:0] k2_MA0_idx_k2;
    logic [`MA_width-1:0] k2_MA1_idx_k2;
    logic [`MA_width-1:0] k2_MA0_idx_k2_add1;
    logic [`MA_width-1:0] k2_MA1_idx_k2_add1;
    logic [`MA_width-1:0] k2_MA0_idx_k2_add2;
    logic [`MA_width-1:0] k2_MA1_idx_k2_add2;
    logic [`MA_width-1:0] k2_MA0_idx_k2_add3;
    logic [`MA_width-1:0] k2_MA1_idx_k2_add3;
    logic [`MA_width-1:0] k2_MA0_idx_k2_add4;
    logic [`MA_width-1:0] k2_MA1_idx_k2_add4;
    logic [`MA_width-1:0] k2_MA0_idx_k2_add5;
    logic [`MA_width-1:0] k2_MA1_idx_k2_add5;
    logic [`MA_width-1:0] k2_MA0_idx_k2_add6;
    logic [`MA_width-1:0] k2_MA1_idx_k2_add6;
    logic [`MA_width-1:0] k2_MA0_idx_k2_add7;
    logic [`MA_width-1:0] k2_MA1_idx_k2_add7;
    
    logic [`BANK_width-1:0] k2_BN0_idx_k2;
    logic [`BANK_width-1:0] k2_BN1_idx_k2;
    logic [`BANK_width-1:0] k2_BN0_idx_k2_add1;
    logic [`BANK_width-1:0] k2_BN1_idx_k2_add1;
    logic [`BANK_width-1:0] k2_BN0_idx_k2_add2;
    logic [`BANK_width-1:0] k2_BN1_idx_k2_add2;
    logic [`BANK_width-1:0] k2_BN0_idx_k2_add3;
    logic [`BANK_width-1:0] k2_BN1_idx_k2_add3;
    logic [`BANK_width-1:0] k2_BN0_idx_k2_add4;
    logic [`BANK_width-1:0] k2_BN1_idx_k2_add4;
    logic [`BANK_width-1:0] k2_BN0_idx_k2_add5;
    logic [`BANK_width-1:0] k2_BN1_idx_k2_add5;
    logic [`BANK_width-1:0] k2_BN0_idx_k2_add6;
    logic [`BANK_width-1:0] k2_BN1_idx_k2_add6;
    logic [`BANK_width-1:0] k2_BN0_idx_k2_add7;
    logic [`BANK_width-1:0] k2_BN1_idx_k2_add7;

    logic k2_AGU_done_out_k2;   
    logic k2_BN_MA_out_en_k2;   
    logic [2:0] k2_l_AGU_out_k2;

    AGU_top_k2 AGU_top_k2 (
        .clk            (clk),
        .rst            (rst),
        .AGU_enable_k2  (AGU_enable_k2),

        .MA0_idx_k2             (k2_MA0_idx_k2),
        .MA1_idx_k2             (k2_MA1_idx_k2),
        .MA0_idx_k2_add1        (k2_MA0_idx_k2_add1),
        .MA1_idx_k2_add1        (k2_MA1_idx_k2_add1),
        .MA0_idx_k2_add2        (k2_MA0_idx_k2_add2),
        .MA1_idx_k2_add2        (k2_MA1_idx_k2_add2),
        .MA0_idx_k2_add3        (k2_MA0_idx_k2_add3),
        .MA1_idx_k2_add3        (k2_MA1_idx_k2_add3),
        .MA0_idx_k2_add4        (k2_MA0_idx_k2_add4),
        .MA1_idx_k2_add4        (k2_MA1_idx_k2_add4),
        .MA0_idx_k2_add5        (k2_MA0_idx_k2_add5),
        .MA1_idx_k2_add5        (k2_MA1_idx_k2_add5),
        .MA0_idx_k2_add6        (k2_MA0_idx_k2_add6),
        .MA1_idx_k2_add6        (k2_MA1_idx_k2_add6),
        .MA0_idx_k2_add7        (k2_MA0_idx_k2_add7),
        .MA1_idx_k2_add7        (k2_MA1_idx_k2_add7),

        .BN0_idx_k2             (k2_BN0_idx_k2),
        .BN1_idx_k2             (k2_BN1_idx_k2),
        .BN0_idx_k2_add1        (k2_BN0_idx_k2_add1),
        .BN1_idx_k2_add1        (k2_BN1_idx_k2_add1),
        .BN0_idx_k2_add2        (k2_BN0_idx_k2_add2),
        .BN1_idx_k2_add2        (k2_BN1_idx_k2_add2),
        .BN0_idx_k2_add3        (k2_BN0_idx_k2_add3),
        .BN1_idx_k2_add3        (k2_BN1_idx_k2_add3),
        .BN0_idx_k2_add4        (k2_BN0_idx_k2_add4),
        .BN1_idx_k2_add4        (k2_BN1_idx_k2_add4),
        .BN0_idx_k2_add5        (k2_BN0_idx_k2_add5),
        .BN1_idx_k2_add5        (k2_BN1_idx_k2_add5),
        .BN0_idx_k2_add6        (k2_BN0_idx_k2_add6),
        .BN1_idx_k2_add6        (k2_BN1_idx_k2_add6),
        .BN0_idx_k2_add7        (k2_BN0_idx_k2_add7),
        .BN1_idx_k2_add7        (k2_BN1_idx_k2_add7),

        .AGU_done_out_k2(k2_AGU_done_out_k2),
        .BN_MA_out_en_k2(k2_BN_MA_out_en_k2),
        .l_AGU_out_k2   (k2_l_AGU_out_k2)
    );

    always_comb begin 
        if (LAST_STAGE) begin
            MA0_idx     =   k2_MA0_idx_k2       ;
            MA1_idx     =   k2_MA1_idx_k2       ;
            MA2_idx     =   k2_MA0_idx_k2_add1  ;
            MA3_idx     =   k2_MA1_idx_k2_add1  ;
            MA4_idx     =   k2_MA0_idx_k2_add2  ;
            MA5_idx     =   k2_MA1_idx_k2_add2  ;
            MA6_idx     =   k2_MA0_idx_k2_add3  ;
            MA7_idx     =   k2_MA1_idx_k2_add3  ;
            MA8_idx     =   k2_MA0_idx_k2_add4  ;
            MA9_idx     =   k2_MA1_idx_k2_add4  ;
            MA10_idx    =   k2_MA0_idx_k2_add5  ;
            MA11_idx    =   k2_MA1_idx_k2_add5  ;
            MA12_idx    =   k2_MA0_idx_k2_add6  ;
            MA13_idx    =   k2_MA1_idx_k2_add6  ;
            MA14_idx    =   k2_MA0_idx_k2_add7  ;
            MA15_idx    =   k2_MA1_idx_k2_add7  ;

            BN0_idx     =   k2_BN0_idx_k2       ;
            BN1_idx     =   k2_BN1_idx_k2       ;
            BN2_idx     =   k2_BN0_idx_k2_add1  ;
            BN3_idx     =   k2_BN1_idx_k2_add1  ;
            BN4_idx     =   k2_BN0_idx_k2_add2  ;
            BN5_idx     =   k2_BN1_idx_k2_add2  ;
            BN6_idx     =   k2_BN0_idx_k2_add3  ;
            BN7_idx     =   k2_BN1_idx_k2_add3  ;
            BN8_idx     =   k2_BN0_idx_k2_add4  ;
            BN9_idx     =   k2_BN1_idx_k2_add4  ;
            BN10_idx    =   k2_BN0_idx_k2_add5  ;
            BN11_idx    =   k2_BN1_idx_k2_add5  ;
            BN12_idx    =   k2_BN0_idx_k2_add6  ;
            BN13_idx    =   k2_BN1_idx_k2_add6  ;
            BN14_idx    =   k2_BN0_idx_k2_add7  ;
            BN15_idx    =   k2_BN1_idx_k2_add7  ;

            AGU_done_out    =   k2_AGU_done_out_k2;
            BN_MA_out_en    =   k2_BN_MA_out_en_k2;
            l_AGU_out       =   k2_l_AGU_out_k2 ;
        end else begin
            MA0_idx     =   k1_MA0_idx  ;
            MA1_idx     =   k1_MA1_idx  ;
            MA2_idx     =   k1_MA2_idx  ;
            MA3_idx     =   k1_MA3_idx  ;
            MA4_idx     =   k1_MA4_idx  ;
            MA5_idx     =   k1_MA5_idx  ;
            MA6_idx     =   k1_MA6_idx  ;
            MA7_idx     =   k1_MA7_idx  ;
            MA8_idx     =   k1_MA8_idx  ;
            MA9_idx     =   k1_MA9_idx  ;
            MA10_idx    =   k1_MA10_idx ;
            MA11_idx    =   k1_MA11_idx ;
            MA12_idx    =   k1_MA12_idx ;
            MA13_idx    =   k1_MA13_idx ;
            MA14_idx    =   k1_MA14_idx ;
            MA15_idx    =   k1_MA15_idx ;

            BN0_idx  =   k1_BN0_idx  ;   
            BN1_idx  =   k1_BN1_idx  ;   
            BN2_idx  =   k1_BN2_idx  ;   
            BN3_idx  =   k1_BN3_idx  ;   
            BN4_idx  =   k1_BN4_idx  ;   
            BN5_idx  =   k1_BN5_idx  ;   
            BN6_idx  =   k1_BN6_idx  ;   
            BN7_idx  =   k1_BN7_idx  ;   
            BN8_idx  =   k1_BN8_idx  ;   
            BN9_idx  =   k1_BN9_idx  ;   
            BN10_idx =   k1_BN10_idx ;   
            BN11_idx =   k1_BN11_idx ;   
            BN12_idx =   k1_BN12_idx ;   
            BN13_idx =   k1_BN13_idx ;   
            BN14_idx =   k1_BN14_idx ;   
            BN15_idx =   k1_BN15_idx ;   

            AGU_done_out    =   k1_AGU_done_out ;
            BN_MA_out_en    =   k1_BN_MA_out_en ;
            l_AGU_out       =   k1_l_AGU_out    ;
        end
    end
endmodule