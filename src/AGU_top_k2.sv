`include "../include/define.svh"
`include "AGU_k2.sv"
`include "Order_translate_k2.sv"

module AGU_top_k2 (
    input clk,
    input rst,
    input AGU_enable_k2,

    output logic [`MA_width-1:0] MA0_idx_k2,
    output logic [`MA_width-1:0] MA1_idx_k2,
    output logic [`MA_width-1:0] MA0_idx_k2_add1,
    output logic [`MA_width-1:0] MA1_idx_k2_add1,
    output logic [`MA_width-1:0] MA0_idx_k2_add2,
    output logic [`MA_width-1:0] MA1_idx_k2_add2,
    output logic [`MA_width-1:0] MA0_idx_k2_add3,
    output logic [`MA_width-1:0] MA1_idx_k2_add3,
    output logic [`MA_width-1:0] MA0_idx_k2_add4,
    output logic [`MA_width-1:0] MA1_idx_k2_add4,
    output logic [`MA_width-1:0] MA0_idx_k2_add5,
    output logic [`MA_width-1:0] MA1_idx_k2_add5,
    output logic [`MA_width-1:0] MA0_idx_k2_add6,
    output logic [`MA_width-1:0] MA1_idx_k2_add6,
    output logic [`MA_width-1:0] MA0_idx_k2_add7,
    output logic [`MA_width-1:0] MA1_idx_k2_add7,

    output logic [`BANK_width-1:0] BN0_idx_k2,
    output logic [`BANK_width-1:0] BN1_idx_k2,
    output logic [`BANK_width-1:0] BN0_idx_k2_add1,
    output logic [`BANK_width-1:0] BN1_idx_k2_add1,
    output logic [`BANK_width-1:0] BN0_idx_k2_add2,
    output logic [`BANK_width-1:0] BN1_idx_k2_add2,
    output logic [`BANK_width-1:0] BN0_idx_k2_add3,
    output logic [`BANK_width-1:0] BN1_idx_k2_add3,
    output logic [`BANK_width-1:0] BN0_idx_k2_add4,
    output logic [`BANK_width-1:0] BN1_idx_k2_add4,
    output logic [`BANK_width-1:0] BN0_idx_k2_add5,
    output logic [`BANK_width-1:0] BN1_idx_k2_add5,
    output logic [`BANK_width-1:0] BN0_idx_k2_add6,
    output logic [`BANK_width-1:0] BN1_idx_k2_add6,
    output logic [`BANK_width-1:0] BN0_idx_k2_add7,
    output logic [`BANK_width-1:0] BN1_idx_k2_add7,

    output logic AGU_done_out_k2,
    output logic BN_MA_out_en_k2,
    output logic [2:0] l_AGU_out_k2
);

    logic [`D_width-1:0] AGU_Order_0_k2;
    logic [`D_width-1:0] AGU_Order_1_k2;
    logic [`D_width-1:0] AGU_Order_0_k2_add1;
    logic [`D_width-1:0] AGU_Order_1_k2_add1;
    logic [`D_width-1:0] AGU_Order_0_k2_add2;
    logic [`D_width-1:0] AGU_Order_1_k2_add2;
    logic [`D_width-1:0] AGU_Order_0_k2_add3;
    logic [`D_width-1:0] AGU_Order_1_k2_add3;
    logic [`D_width-1:0] AGU_Order_0_k2_add4;
    logic [`D_width-1:0] AGU_Order_1_k2_add4;
    logic [`D_width-1:0] AGU_Order_0_k2_add5;
    logic [`D_width-1:0] AGU_Order_1_k2_add5;
    logic [`D_width-1:0] AGU_Order_0_k2_add6;
    logic [`D_width-1:0] AGU_Order_1_k2_add6;
    logic [`D_width-1:0] AGU_Order_0_k2_add7;
    logic [`D_width-1:0] AGU_Order_1_k2_add7;
    //--------------------------------
    logic [`D_width-1:0]    AGU_Order_0_k2_cnt16        ;
    logic [`D_width-1:0]    AGU_Order_1_k2_cnt16        ;
    logic [`D_width-1:0]    AGU_Order_0_k2_cnt16_add1   ;
    logic [`D_width-1:0]    AGU_Order_1_k2_cnt16_add1   ;
    logic [`D_width-1:0]    AGU_Order_0_k2_cnt16_add2   ;
    logic [`D_width-1:0]    AGU_Order_1_k2_cnt16_add2   ;
    logic [`D_width-1:0]    AGU_Order_0_k2_cnt16_add3   ;
    logic [`D_width-1:0]    AGU_Order_1_k2_cnt16_add3   ;
    logic [`D_width-1:0]    AGU_Order_0_k2_cnt16_add4   ;
    logic [`D_width-1:0]    AGU_Order_1_k2_cnt16_add4   ;
    logic [`D_width-1:0]    AGU_Order_0_k2_cnt16_add5   ;
    logic [`D_width-1:0]    AGU_Order_1_k2_cnt16_add5   ;
    logic [`D_width-1:0]    AGU_Order_0_k2_cnt16_add6   ;
    logic [`D_width-1:0]    AGU_Order_1_k2_cnt16_add6   ;
    logic [`D_width-1:0]    AGU_Order_0_k2_cnt16_add7   ;
    logic [`D_width-1:0]    AGU_Order_1_k2_cnt16_add7   ;


    //---------------------------------

    logic AGU_out_en_k2;
    logic AGU_done_k2;
    logic [2:0] AGU_l_out_k2;


    logic [`D_width-1:0] AGU_Order_0_k2_pip0;
    logic [`D_width-1:0] AGU_Order_1_k2_pip0;
    logic [`D_width-1:0] AGU_Order_0_k2_add1_pip0;
    logic [`D_width-1:0] AGU_Order_1_k2_add1_pip0;
    logic [`D_width-1:0] AGU_Order_0_k2_add2_pip0;
    logic [`D_width-1:0] AGU_Order_1_k2_add2_pip0;
    logic [`D_width-1:0] AGU_Order_0_k2_add3_pip0;
    logic [`D_width-1:0] AGU_Order_1_k2_add3_pip0;
    logic [`D_width-1:0] AGU_Order_0_k2_add4_pip0;
    logic [`D_width-1:0] AGU_Order_1_k2_add4_pip0;
    logic [`D_width-1:0] AGU_Order_0_k2_add5_pip0;
    logic [`D_width-1:0] AGU_Order_1_k2_add5_pip0;
    logic [`D_width-1:0] AGU_Order_0_k2_add6_pip0;
    logic [`D_width-1:0] AGU_Order_1_k2_add6_pip0;
    logic [`D_width-1:0] AGU_Order_0_k2_add7_pip0;
    logic [`D_width-1:0] AGU_Order_1_k2_add7_pip0;

    //-------------cnt16---------------
    logic           AGU_done_out_k2_cnt16   ;
    logic           BN_MA_out_en_k2_cnt16   ;
    logic [2:0]     l_AGU_out_k2_cnt16      ;
    logic [`D_width-1:0]    AGU_Order_0_k2_cnt16_pip0       ;
    logic [`D_width-1:0]    AGU_Order_1_k2_cnt16_pip0       ;
    logic [`D_width-1:0]    AGU_Order_0_k2_cnt16_add1_pip0  ;
    logic [`D_width-1:0]    AGU_Order_1_k2_cnt16_add1_pip0  ;
    logic [`D_width-1:0]    AGU_Order_0_k2_cnt16_add2_pip0  ;
    logic [`D_width-1:0]    AGU_Order_1_k2_cnt16_add2_pip0  ;
    logic [`D_width-1:0]    AGU_Order_0_k2_cnt16_add3_pip0  ;
    logic [`D_width-1:0]    AGU_Order_1_k2_cnt16_add3_pip0  ;
    logic [`D_width-1:0]    AGU_Order_0_k2_cnt16_add4_pip0  ;
    logic [`D_width-1:0]    AGU_Order_1_k2_cnt16_add4_pip0  ;
    logic [`D_width-1:0]    AGU_Order_0_k2_cnt16_add5_pip0  ;
    logic [`D_width-1:0]    AGU_Order_1_k2_cnt16_add5_pip0  ;
    logic [`D_width-1:0]    AGU_Order_0_k2_cnt16_add6_pip0  ;
    logic [`D_width-1:0]    AGU_Order_1_k2_cnt16_add6_pip0  ;
    logic [`D_width-1:0]    AGU_Order_0_k2_cnt16_add7_pip0  ;
    logic [`D_width-1:0]    AGU_Order_1_k2_cnt16_add7_pip0  ;

    //-----------------------------------------

    logic AGU_out_en_k2_pip0;
    logic AGU_done_k2_pip0;
    logic [2:0] AGU_l_out_k2_pip0;

    //------------
    logic cnt;
    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            cnt <= 'd0;
        end else begin
            if (BN_MA_out_en_k2) begin
                cnt <= cnt + 'd1;
            end else begin
                cnt <= 'd0;
            end
        end
    end

    logic [`MA_width-1:0] MA0_idx_k2_tmp        ;
    logic [`MA_width-1:0] MA1_idx_k2_tmp        ;
    logic [`MA_width-1:0] MA0_idx_k2_add1_tmp   ;
    logic [`MA_width-1:0] MA1_idx_k2_add1_tmp   ;
    logic [`MA_width-1:0] MA0_idx_k2_add2_tmp   ;
    logic [`MA_width-1:0] MA1_idx_k2_add2_tmp   ;
    logic [`MA_width-1:0] MA0_idx_k2_add3_tmp   ;
    logic [`MA_width-1:0] MA1_idx_k2_add3_tmp   ;
    logic [`MA_width-1:0] MA0_idx_k2_add4_tmp   ;
    logic [`MA_width-1:0] MA1_idx_k2_add4_tmp   ;
    logic [`MA_width-1:0] MA0_idx_k2_add5_tmp   ;
    logic [`MA_width-1:0] MA1_idx_k2_add5_tmp   ;
    logic [`MA_width-1:0] MA0_idx_k2_add6_tmp   ;
    logic [`MA_width-1:0] MA1_idx_k2_add6_tmp   ;
    logic [`MA_width-1:0] MA0_idx_k2_add7_tmp   ;
    logic [`MA_width-1:0] MA1_idx_k2_add7_tmp   ;

    logic [`BANK_width-1:0] BN0_idx_k2_tmp      ;
    logic [`BANK_width-1:0] BN1_idx_k2_tmp      ;
    logic [`BANK_width-1:0] BN0_idx_k2_add1_tmp ;
    logic [`BANK_width-1:0] BN1_idx_k2_add1_tmp ;
    logic [`BANK_width-1:0] BN0_idx_k2_add2_tmp ;
    logic [`BANK_width-1:0] BN1_idx_k2_add2_tmp ;
    logic [`BANK_width-1:0] BN0_idx_k2_add3_tmp ;
    logic [`BANK_width-1:0] BN1_idx_k2_add3_tmp ;
    logic [`BANK_width-1:0] BN0_idx_k2_add4_tmp ;
    logic [`BANK_width-1:0] BN1_idx_k2_add4_tmp ;
    logic [`BANK_width-1:0] BN0_idx_k2_add5_tmp ;
    logic [`BANK_width-1:0] BN1_idx_k2_add5_tmp ;
    logic [`BANK_width-1:0] BN0_idx_k2_add6_tmp ;
    logic [`BANK_width-1:0] BN1_idx_k2_add6_tmp ;
    logic [`BANK_width-1:0] BN0_idx_k2_add7_tmp ;
    logic [`BANK_width-1:0] BN1_idx_k2_add7_tmp ;

    //------cnt16----------
    logic [`MA_width-1:0] MA0_idx_k2_cnt16_tmp        ;
    logic [`MA_width-1:0] MA1_idx_k2_cnt16_tmp        ;
    logic [`MA_width-1:0] MA0_idx_k2_cnt16_add1_tmp   ;
    logic [`MA_width-1:0] MA1_idx_k2_cnt16_add1_tmp   ;
    logic [`MA_width-1:0] MA0_idx_k2_cnt16_add2_tmp   ;
    logic [`MA_width-1:0] MA1_idx_k2_cnt16_add2_tmp   ;
    logic [`MA_width-1:0] MA0_idx_k2_cnt16_add3_tmp   ;
    logic [`MA_width-1:0] MA1_idx_k2_cnt16_add3_tmp   ;
    logic [`MA_width-1:0] MA0_idx_k2_cnt16_add4_tmp   ;
    logic [`MA_width-1:0] MA1_idx_k2_cnt16_add4_tmp   ;
    logic [`MA_width-1:0] MA0_idx_k2_cnt16_add5_tmp   ;
    logic [`MA_width-1:0] MA1_idx_k2_cnt16_add5_tmp   ;
    logic [`MA_width-1:0] MA0_idx_k2_cnt16_add6_tmp   ;
    logic [`MA_width-1:0] MA1_idx_k2_cnt16_add6_tmp   ;
    logic [`MA_width-1:0] MA0_idx_k2_cnt16_add7_tmp   ;
    logic [`MA_width-1:0] MA1_idx_k2_cnt16_add7_tmp   ;

    logic [`BANK_width-1:0] BN0_idx_k2_cnt16_tmp      ;
    logic [`BANK_width-1:0] BN1_idx_k2_cnt16_tmp      ;
    logic [`BANK_width-1:0] BN0_idx_k2_cnt16_add1_tmp ;
    logic [`BANK_width-1:0] BN1_idx_k2_cnt16_add1_tmp ;
    logic [`BANK_width-1:0] BN0_idx_k2_cnt16_add2_tmp ;
    logic [`BANK_width-1:0] BN1_idx_k2_cnt16_add2_tmp ;
    logic [`BANK_width-1:0] BN0_idx_k2_cnt16_add3_tmp ;
    logic [`BANK_width-1:0] BN1_idx_k2_cnt16_add3_tmp ;
    logic [`BANK_width-1:0] BN0_idx_k2_cnt16_add4_tmp ;
    logic [`BANK_width-1:0] BN1_idx_k2_cnt16_add4_tmp ;
    logic [`BANK_width-1:0] BN0_idx_k2_cnt16_add5_tmp ;
    logic [`BANK_width-1:0] BN1_idx_k2_cnt16_add5_tmp ;
    logic [`BANK_width-1:0] BN0_idx_k2_cnt16_add6_tmp ;
    logic [`BANK_width-1:0] BN1_idx_k2_cnt16_add6_tmp ;
    logic [`BANK_width-1:0] BN0_idx_k2_cnt16_add7_tmp ;
    logic [`BANK_width-1:0] BN1_idx_k2_cnt16_add7_tmp ;


    //-------------------------

    //------------------

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            AGU_Order_0_k2_pip0     <= 'd0;
            AGU_Order_1_k2_pip0     <= 'd0;

            AGU_Order_0_k2_add1_pip0     <= 'd0;
            AGU_Order_1_k2_add1_pip0     <= 'd0;

            AGU_Order_0_k2_add2_pip0     <= 'd0;
            AGU_Order_1_k2_add2_pip0     <= 'd0;

            AGU_Order_0_k2_add3_pip0     <= 'd0;
            AGU_Order_1_k2_add3_pip0     <= 'd0;

            AGU_Order_0_k2_add4_pip0     <= 'd0;
            AGU_Order_1_k2_add4_pip0     <= 'd0;

            AGU_Order_0_k2_add5_pip0     <= 'd0;
            AGU_Order_1_k2_add5_pip0     <= 'd0;

            AGU_Order_0_k2_add6_pip0     <= 'd0;
            AGU_Order_1_k2_add6_pip0     <= 'd0;

            AGU_Order_0_k2_add7_pip0     <= 'd0;
            AGU_Order_1_k2_add7_pip0     <= 'd0;

            AGU_out_en_k2_pip0      <= 'd0;
            AGU_done_k2_pip0        <= 'd0;

            AGU_l_out_k2_pip0       <= 'd0;
        end else begin
            AGU_Order_0_k2_pip0     <= AGU_Order_0_k2;
            AGU_Order_1_k2_pip0     <= AGU_Order_1_k2;

            AGU_Order_0_k2_add1_pip0     <= AGU_Order_0_k2_add1;
            AGU_Order_1_k2_add1_pip0     <= AGU_Order_1_k2_add1;

            AGU_Order_0_k2_add2_pip0     <= AGU_Order_0_k2_add2;
            AGU_Order_1_k2_add2_pip0     <= AGU_Order_1_k2_add2;

            AGU_Order_0_k2_add3_pip0     <= AGU_Order_0_k2_add3;
            AGU_Order_1_k2_add3_pip0     <= AGU_Order_1_k2_add3;

            AGU_Order_0_k2_add4_pip0     <= AGU_Order_0_k2_add4;
            AGU_Order_1_k2_add4_pip0     <= AGU_Order_1_k2_add4;

            AGU_Order_0_k2_add5_pip0     <= AGU_Order_0_k2_add5;
            AGU_Order_1_k2_add5_pip0     <= AGU_Order_1_k2_add5;

            AGU_Order_0_k2_add6_pip0     <= AGU_Order_0_k2_add6;
            AGU_Order_1_k2_add6_pip0     <= AGU_Order_1_k2_add6;

            AGU_Order_0_k2_add7_pip0     <= AGU_Order_0_k2_add7;
            AGU_Order_1_k2_add7_pip0     <= AGU_Order_1_k2_add7;


            //---------------------------------------
            AGU_Order_0_k2_cnt16_pip0        <=  AGU_Order_0_k2_cnt16        ;     
            AGU_Order_1_k2_cnt16_pip0        <=  AGU_Order_1_k2_cnt16        ;     
            AGU_Order_0_k2_cnt16_add1_pip0   <=  AGU_Order_0_k2_cnt16_add1   ;
            AGU_Order_1_k2_cnt16_add1_pip0   <=  AGU_Order_1_k2_cnt16_add1   ;
            AGU_Order_0_k2_cnt16_add2_pip0   <=  AGU_Order_0_k2_cnt16_add2   ;
            AGU_Order_1_k2_cnt16_add2_pip0   <=  AGU_Order_1_k2_cnt16_add2   ;
            AGU_Order_0_k2_cnt16_add3_pip0   <=  AGU_Order_0_k2_cnt16_add3   ;
            AGU_Order_1_k2_cnt16_add3_pip0   <=  AGU_Order_1_k2_cnt16_add3   ;
            AGU_Order_0_k2_cnt16_add4_pip0   <=  AGU_Order_0_k2_cnt16_add4   ;
            AGU_Order_1_k2_cnt16_add4_pip0   <=  AGU_Order_1_k2_cnt16_add4   ;
            AGU_Order_0_k2_cnt16_add5_pip0   <=  AGU_Order_0_k2_cnt16_add5   ;
            AGU_Order_1_k2_cnt16_add5_pip0   <=  AGU_Order_1_k2_cnt16_add5   ;
            AGU_Order_0_k2_cnt16_add6_pip0   <=  AGU_Order_0_k2_cnt16_add6   ;
            AGU_Order_1_k2_cnt16_add6_pip0   <=  AGU_Order_1_k2_cnt16_add6   ;
            AGU_Order_0_k2_cnt16_add7_pip0   <=  AGU_Order_0_k2_cnt16_add7   ;
            AGU_Order_1_k2_cnt16_add7_pip0   <=  AGU_Order_1_k2_cnt16_add7   ;

            //---------------------------------------

            AGU_out_en_k2_pip0      <= AGU_out_en_k2;
            AGU_done_k2_pip0        <= AGU_done_k2;

            AGU_l_out_k2_pip0       <= AGU_l_out_k2;
        end
    end

    AGU_k2 AGU_k2(
        //input 
        .clk(clk),
        .rst(rst),
        .AGU_enable_k2(AGU_enable_k2),
        //output
        .Order_0_k2             (AGU_Order_0_k2),
        .Order_1_k2             (AGU_Order_1_k2),
        .Order_0_k2_add1        (AGU_Order_0_k2_add1),
        .Order_1_k2_add1        (AGU_Order_1_k2_add1),
        .Order_0_k2_add2        (AGU_Order_0_k2_add2),
        .Order_1_k2_add2        (AGU_Order_1_k2_add2),
        .Order_0_k2_add3        (AGU_Order_0_k2_add3),
        .Order_1_k2_add3        (AGU_Order_1_k2_add3),
        .Order_0_k2_add4        (AGU_Order_0_k2_add4),
        .Order_1_k2_add4        (AGU_Order_1_k2_add4),
        .Order_0_k2_add5        (AGU_Order_0_k2_add5),
        .Order_1_k2_add5        (AGU_Order_1_k2_add5),
        .Order_0_k2_add6        (AGU_Order_0_k2_add6),
        .Order_1_k2_add6        (AGU_Order_1_k2_add6),
        .Order_0_k2_add7        (AGU_Order_0_k2_add7),
        .Order_1_k2_add7        (AGU_Order_1_k2_add7),

        //----------------
        .Order_0_k2_cnt16        (AGU_Order_0_k2_cnt16     ),
        .Order_1_k2_cnt16        (AGU_Order_1_k2_cnt16     ),
        .Order_0_k2_cnt16_add1   (AGU_Order_0_k2_cnt16_add1),
        .Order_1_k2_cnt16_add1   (AGU_Order_1_k2_cnt16_add1),
        .Order_0_k2_cnt16_add2   (AGU_Order_0_k2_cnt16_add2),
        .Order_1_k2_cnt16_add2   (AGU_Order_1_k2_cnt16_add2),
        .Order_0_k2_cnt16_add3   (AGU_Order_0_k2_cnt16_add3),
        .Order_1_k2_cnt16_add3   (AGU_Order_1_k2_cnt16_add3),
        .Order_0_k2_cnt16_add4   (AGU_Order_0_k2_cnt16_add4),
        .Order_1_k2_cnt16_add4   (AGU_Order_1_k2_cnt16_add4),
        .Order_0_k2_cnt16_add5   (AGU_Order_0_k2_cnt16_add5),
        .Order_1_k2_cnt16_add5   (AGU_Order_1_k2_cnt16_add5),
        .Order_0_k2_cnt16_add6   (AGU_Order_0_k2_cnt16_add6),
        .Order_1_k2_cnt16_add6   (AGU_Order_1_k2_cnt16_add6),
        .Order_0_k2_cnt16_add7   (AGU_Order_0_k2_cnt16_add7),
        .Order_1_k2_cnt16_add7   (AGU_Order_1_k2_cnt16_add7),


        //-----------------
        .AGU_out_en_k2  (AGU_out_en_k2),
        .AGU_done_k2    (AGU_done_k2),
        .l_k2           (AGU_l_out_k2)
    );

    Order_translate_k2 Order_translate_k2(
        //input
        .clk(clk),
        .rst(rst),
        .Order_0(AGU_Order_0_k2_pip0),
        .Order_1(AGU_Order_1_k2_pip0),
        .Order_0_add1(AGU_Order_0_k2_add1_pip0),
        .Order_1_add1(AGU_Order_1_k2_add1_pip0),
        .Order_0_add2(AGU_Order_0_k2_add2_pip0),
        .Order_1_add2(AGU_Order_1_k2_add2_pip0),
        .Order_0_add3(AGU_Order_0_k2_add3_pip0),
        .Order_1_add3(AGU_Order_1_k2_add3_pip0),
        .Order_0_add4(AGU_Order_0_k2_add4_pip0),
        .Order_1_add4(AGU_Order_1_k2_add4_pip0),
        .Order_0_add5(AGU_Order_0_k2_add5_pip0),
        .Order_1_add5(AGU_Order_1_k2_add5_pip0),
        .Order_0_add6(AGU_Order_0_k2_add6_pip0),
        .Order_1_add6(AGU_Order_1_k2_add6_pip0),
        .Order_0_add7(AGU_Order_0_k2_add7_pip0),
        .Order_1_add7(AGU_Order_1_k2_add7_pip0),
        .r_enable_k2(AGU_out_en_k2_pip0),
        .AGU_done_k2(AGU_done_k2_pip0),
        .l(AGU_l_out_k2_pip0),

        //output
        .MA0_idx_k2(MA0_idx_k2_tmp),
        .MA1_idx_k2(MA1_idx_k2_tmp),
        .BN0_idx_k2(BN0_idx_k2_tmp),
        .BN1_idx_k2(BN1_idx_k2_tmp),

        .MA0_idx_k2_add1(MA0_idx_k2_add1_tmp),
        .MA1_idx_k2_add1(MA1_idx_k2_add1_tmp),
        .BN0_idx_k2_add1(BN0_idx_k2_add1_tmp),
        .BN1_idx_k2_add1(BN1_idx_k2_add1_tmp),

        .MA0_idx_k2_add2(MA0_idx_k2_add2_tmp),
        .MA1_idx_k2_add2(MA1_idx_k2_add2_tmp),
        .BN0_idx_k2_add2(BN0_idx_k2_add2_tmp),
        .BN1_idx_k2_add2(BN1_idx_k2_add2_tmp),

        .MA0_idx_k2_add3(MA0_idx_k2_add3_tmp),
        .MA1_idx_k2_add3(MA1_idx_k2_add3_tmp),
        .BN0_idx_k2_add3(BN0_idx_k2_add3_tmp),
        .BN1_idx_k2_add3(BN1_idx_k2_add3_tmp),

        .MA0_idx_k2_add4(MA0_idx_k2_add4_tmp),
        .MA1_idx_k2_add4(MA1_idx_k2_add4_tmp),
        .BN0_idx_k2_add4(BN0_idx_k2_add4_tmp),
        .BN1_idx_k2_add4(BN1_idx_k2_add4_tmp),

        .MA0_idx_k2_add5(MA0_idx_k2_add5_tmp),
        .MA1_idx_k2_add5(MA1_idx_k2_add5_tmp),
        .BN0_idx_k2_add5(BN0_idx_k2_add5_tmp),
        .BN1_idx_k2_add5(BN1_idx_k2_add5_tmp),

        .MA0_idx_k2_add6(MA0_idx_k2_add6_tmp),
        .MA1_idx_k2_add6(MA1_idx_k2_add6_tmp),
        .BN0_idx_k2_add6(BN0_idx_k2_add6_tmp),
        .BN1_idx_k2_add6(BN1_idx_k2_add6_tmp),

        .MA0_idx_k2_add7(MA0_idx_k2_add7_tmp),
        .MA1_idx_k2_add7(MA1_idx_k2_add7_tmp),
        .BN0_idx_k2_add7(BN0_idx_k2_add7_tmp),
        .BN1_idx_k2_add7(BN1_idx_k2_add7_tmp),
        
        .AGU_done_out_k2(AGU_done_out_k2),
        .BN_MA_out_en_k2(BN_MA_out_en_k2),
        .l_AGU_out_k2(l_AGU_out_k2)

    );
    
    Order_translate_k2 Order_translate_k2_cnt16(
        //input
        .clk(clk),
        .rst(rst),
        .Order_0     (AGU_Order_0_k2_cnt16_pip0),
        .Order_1     (AGU_Order_1_k2_cnt16_pip0),
        .Order_0_add1(AGU_Order_0_k2_cnt16_add1_pip0),
        .Order_1_add1(AGU_Order_1_k2_cnt16_add1_pip0),
        .Order_0_add2(AGU_Order_0_k2_cnt16_add2_pip0),
        .Order_1_add2(AGU_Order_1_k2_cnt16_add2_pip0),
        .Order_0_add3(AGU_Order_0_k2_cnt16_add3_pip0),
        .Order_1_add3(AGU_Order_1_k2_cnt16_add3_pip0),
        .Order_0_add4(AGU_Order_0_k2_cnt16_add4_pip0),
        .Order_1_add4(AGU_Order_1_k2_cnt16_add4_pip0),
        .Order_0_add5(AGU_Order_0_k2_cnt16_add5_pip0),
        .Order_1_add5(AGU_Order_1_k2_cnt16_add5_pip0),
        .Order_0_add6(AGU_Order_0_k2_cnt16_add6_pip0),
        .Order_1_add6(AGU_Order_1_k2_cnt16_add6_pip0),
        .Order_0_add7(AGU_Order_0_k2_cnt16_add7_pip0),
        .Order_1_add7(AGU_Order_1_k2_cnt16_add7_pip0),
        .r_enable_k2(AGU_out_en_k2_pip0),
        .AGU_done_k2(AGU_done_k2_pip0),
        .l(AGU_l_out_k2_pip0),

        //output
        .MA0_idx_k2(MA0_idx_k2_cnt16_tmp),
        .MA1_idx_k2(MA1_idx_k2_cnt16_tmp),
        .BN0_idx_k2(BN0_idx_k2_cnt16_tmp),
        .BN1_idx_k2(BN1_idx_k2_cnt16_tmp),

        .MA0_idx_k2_add1(MA0_idx_k2_cnt16_add1_tmp),
        .MA1_idx_k2_add1(MA1_idx_k2_cnt16_add1_tmp),
        .BN0_idx_k2_add1(BN0_idx_k2_cnt16_add1_tmp),
        .BN1_idx_k2_add1(BN1_idx_k2_cnt16_add1_tmp),

        .MA0_idx_k2_add2(MA0_idx_k2_cnt16_add2_tmp),
        .MA1_idx_k2_add2(MA1_idx_k2_cnt16_add2_tmp),
        .BN0_idx_k2_add2(BN0_idx_k2_cnt16_add2_tmp),
        .BN1_idx_k2_add2(BN1_idx_k2_cnt16_add2_tmp),

        .MA0_idx_k2_add3(MA0_idx_k2_cnt16_add3_tmp),
        .MA1_idx_k2_add3(MA1_idx_k2_cnt16_add3_tmp),
        .BN0_idx_k2_add3(BN0_idx_k2_cnt16_add3_tmp),
        .BN1_idx_k2_add3(BN1_idx_k2_cnt16_add3_tmp),

        .MA0_idx_k2_add4(MA0_idx_k2_cnt16_add4_tmp),
        .MA1_idx_k2_add4(MA1_idx_k2_cnt16_add4_tmp),
        .BN0_idx_k2_add4(BN0_idx_k2_cnt16_add4_tmp),
        .BN1_idx_k2_add4(BN1_idx_k2_cnt16_add4_tmp),

        .MA0_idx_k2_add5(MA0_idx_k2_cnt16_add5_tmp),
        .MA1_idx_k2_add5(MA1_idx_k2_cnt16_add5_tmp),
        .BN0_idx_k2_add5(BN0_idx_k2_cnt16_add5_tmp),
        .BN1_idx_k2_add5(BN1_idx_k2_cnt16_add5_tmp),

        .MA0_idx_k2_add6(MA0_idx_k2_cnt16_add6_tmp),
        .MA1_idx_k2_add6(MA1_idx_k2_cnt16_add6_tmp),
        .BN0_idx_k2_add6(BN0_idx_k2_cnt16_add6_tmp),
        .BN1_idx_k2_add6(BN1_idx_k2_cnt16_add6_tmp),

        .MA0_idx_k2_add7(MA0_idx_k2_cnt16_add7_tmp),
        .MA1_idx_k2_add7(MA1_idx_k2_cnt16_add7_tmp),
        .BN0_idx_k2_add7(BN0_idx_k2_cnt16_add7_tmp),
        .BN1_idx_k2_add7(BN1_idx_k2_cnt16_add7_tmp),

        .AGU_done_out_k2    (AGU_done_out_k2_cnt16),
        .BN_MA_out_en_k2    (BN_MA_out_en_k2_cnt16),
        .l_AGU_out_k2       (l_AGU_out_k2_cnt16)
    );


    always_comb begin
        if (cnt) begin
            MA0_idx_k2      <=  MA0_idx_k2_add1_tmp; // 16 means not work
            MA1_idx_k2      <=  MA1_idx_k2_add1_tmp;
            BN0_idx_k2      <=  BN0_idx_k2_add1_tmp;
            BN1_idx_k2      <=  BN1_idx_k2_add1_tmp;

            MA0_idx_k2_add1 <=  MA0_idx_k2_add3_tmp;
            MA1_idx_k2_add1 <=  MA1_idx_k2_add3_tmp;
            BN0_idx_k2_add1 <=  BN0_idx_k2_add3_tmp;
            BN1_idx_k2_add1 <=  BN1_idx_k2_add3_tmp;

            MA0_idx_k2_add2 <=  MA0_idx_k2_add5_tmp;
            MA1_idx_k2_add2 <=  MA1_idx_k2_add5_tmp;
            BN0_idx_k2_add2 <=  BN0_idx_k2_add5_tmp;
            BN1_idx_k2_add2 <=  BN1_idx_k2_add5_tmp;

            MA0_idx_k2_add3 <=   MA0_idx_k2_add7_tmp;
            MA1_idx_k2_add3 <=   MA1_idx_k2_add7_tmp;
            BN0_idx_k2_add3 <=   BN0_idx_k2_add7_tmp;
            BN1_idx_k2_add3 <=   BN1_idx_k2_add7_tmp;

            MA0_idx_k2_add4 <=  MA0_idx_k2_cnt16_add1_tmp;
            MA1_idx_k2_add4 <=  MA1_idx_k2_cnt16_add1_tmp;
            BN0_idx_k2_add4 <=  BN0_idx_k2_cnt16_add1_tmp;
            BN1_idx_k2_add4 <=  BN1_idx_k2_cnt16_add1_tmp;

            MA0_idx_k2_add5 <=  MA0_idx_k2_cnt16_add3_tmp;
            MA1_idx_k2_add5 <=  MA1_idx_k2_cnt16_add3_tmp;
            BN0_idx_k2_add5 <=  BN0_idx_k2_cnt16_add3_tmp;
            BN1_idx_k2_add5 <=  BN1_idx_k2_cnt16_add3_tmp;

            MA0_idx_k2_add6 <=  MA0_idx_k2_cnt16_add5_tmp;
            MA1_idx_k2_add6 <=  MA1_idx_k2_cnt16_add5_tmp;
            BN0_idx_k2_add6 <=  BN0_idx_k2_cnt16_add5_tmp;
            BN1_idx_k2_add6 <=  BN1_idx_k2_cnt16_add5_tmp;
            
            MA0_idx_k2_add7 <=  MA0_idx_k2_cnt16_add7_tmp;
            MA1_idx_k2_add7 <=  MA1_idx_k2_cnt16_add7_tmp;
            BN0_idx_k2_add7 <=  BN0_idx_k2_cnt16_add7_tmp;
            BN1_idx_k2_add7 <=  BN1_idx_k2_cnt16_add7_tmp;
        end else begin
            MA0_idx_k2  <= MA0_idx_k2_tmp;
            MA1_idx_k2  <= MA1_idx_k2_tmp;
            BN0_idx_k2  <= BN0_idx_k2_tmp;
            BN1_idx_k2  <= BN1_idx_k2_tmp;

            MA0_idx_k2_add1 <=  MA0_idx_k2_add2_tmp; 
            MA1_idx_k2_add1 <=  MA1_idx_k2_add2_tmp; 
            BN0_idx_k2_add1 <=  BN0_idx_k2_add2_tmp; 
            BN1_idx_k2_add1 <=  BN1_idx_k2_add2_tmp; 

            MA0_idx_k2_add2 <= MA0_idx_k2_add4_tmp; 
            MA1_idx_k2_add2 <= MA1_idx_k2_add4_tmp; 
            BN0_idx_k2_add2 <= BN0_idx_k2_add4_tmp; 
            BN1_idx_k2_add2 <= BN1_idx_k2_add4_tmp; 

            MA0_idx_k2_add3 <=  MA0_idx_k2_add6_tmp; 
            MA1_idx_k2_add3 <=  MA1_idx_k2_add6_tmp; 
            BN0_idx_k2_add3 <=  BN0_idx_k2_add6_tmp; 
            BN1_idx_k2_add3 <=  BN1_idx_k2_add6_tmp; 

            MA0_idx_k2_add4 <=  MA0_idx_k2_cnt16_tmp;
            MA1_idx_k2_add4 <=  MA1_idx_k2_cnt16_tmp;
            BN0_idx_k2_add4 <=  BN0_idx_k2_cnt16_tmp;
            BN1_idx_k2_add4 <=  BN1_idx_k2_cnt16_tmp;

            MA0_idx_k2_add5 <=  MA0_idx_k2_cnt16_add2_tmp;
            MA1_idx_k2_add5 <=  MA1_idx_k2_cnt16_add2_tmp;
            BN0_idx_k2_add5 <=  BN0_idx_k2_cnt16_add2_tmp;
            BN1_idx_k2_add5 <=  BN1_idx_k2_cnt16_add2_tmp;

            MA0_idx_k2_add6 <=  MA0_idx_k2_cnt16_add4_tmp;
            MA1_idx_k2_add6 <=  MA1_idx_k2_cnt16_add4_tmp;
            BN0_idx_k2_add6 <=  BN0_idx_k2_cnt16_add4_tmp;
            BN1_idx_k2_add6 <=  BN1_idx_k2_cnt16_add4_tmp;
            
            MA0_idx_k2_add7 <=  MA0_idx_k2_cnt16_add6_tmp;
            MA1_idx_k2_add7 <=  MA1_idx_k2_cnt16_add6_tmp;
            BN0_idx_k2_add7 <=  BN0_idx_k2_cnt16_add6_tmp;
            BN1_idx_k2_add7 <=  BN1_idx_k2_cnt16_add6_tmp;
        end
    end

endmodule