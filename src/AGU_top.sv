`include "../include/define.svh"
`include "AGU.sv"
`include "Order_translate.sv"

module AGU_top(
    input clk,
    input rst,
    input AGU_enable,

    output logic [`MA_width-1:0] MA0_idx,
    output logic [`MA_width-1:0] MA1_idx,
    output logic [`MA_width-1:0] MA2_idx,
    output logic [`MA_width-1:0] MA3_idx,
    output logic [`MA_width-1:0] MA4_idx,
    output logic [`MA_width-1:0] MA5_idx,
    output logic [`MA_width-1:0] MA6_idx,
    output logic [`MA_width-1:0] MA7_idx,
    output logic [`MA_width-1:0] MA8_idx,
    output logic [`MA_width-1:0] MA9_idx,
    output logic [`MA_width-1:0] MA10_idx,
    output logic [`MA_width-1:0] MA11_idx,
    output logic [`MA_width-1:0] MA12_idx,
    output logic [`MA_width-1:0] MA13_idx,
    output logic [`MA_width-1:0] MA14_idx,
    output logic [`MA_width-1:0] MA15_idx,

    output logic [`BANK_width-1:0] BN0_idx,
    output logic [`BANK_width-1:0] BN1_idx,
    output logic [`BANK_width-1:0] BN2_idx,
    output logic [`BANK_width-1:0] BN3_idx,
    output logic [`BANK_width-1:0] BN4_idx,
    output logic [`BANK_width-1:0] BN5_idx,
    output logic [`BANK_width-1:0] BN6_idx,
    output logic [`BANK_width-1:0] BN7_idx,
    output logic [`BANK_width-1:0] BN8_idx,
    output logic [`BANK_width-1:0] BN9_idx,
    output logic [`BANK_width-1:0] BN10_idx,
    output logic [`BANK_width-1:0] BN11_idx,
    output logic [`BANK_width-1:0] BN12_idx,
    output logic [`BANK_width-1:0] BN13_idx,
    output logic [`BANK_width-1:0] BN14_idx,
    output logic [`BANK_width-1:0] BN15_idx,

    output logic AGU_done_out,
    output logic BN_MA_out_en,

    output logic [2:0] l_AGU_out
);

    logic [`D_width-1:0] AGU_order0_out;
    logic [`D_width-1:0] AGU_order1_out;
    logic [`D_width-1:0] AGU_order2_out;
    logic [`D_width-1:0] AGU_order3_out;
    logic [`D_width-1:0] AGU_order4_out;
    logic [`D_width-1:0] AGU_order5_out;
    logic [`D_width-1:0] AGU_order6_out;
    logic [`D_width-1:0] AGU_order7_out;
    logic [`D_width-1:0] AGU_order8_out;
    logic [`D_width-1:0] AGU_order9_out;
    logic [`D_width-1:0] AGU_order10_out;
    logic [`D_width-1:0] AGU_order11_out;
    logic [`D_width-1:0] AGU_order12_out;
    logic [`D_width-1:0] AGU_order13_out;
    logic [`D_width-1:0] AGU_order14_out;
    logic [`D_width-1:0] AGU_order15_out;
    logic AGU_out_en;
    logic AGU_done;

    logic [`D_width-1:0] AGU_order0_out_pip;
    logic [`D_width-1:0] AGU_order1_out_pip;
    logic [`D_width-1:0] AGU_order2_out_pip;
    logic [`D_width-1:0] AGU_order3_out_pip;
    logic [`D_width-1:0] AGU_order4_out_pip;
    logic [`D_width-1:0] AGU_order5_out_pip;
    logic [`D_width-1:0] AGU_order6_out_pip;
    logic [`D_width-1:0] AGU_order7_out_pip;
    logic [`D_width-1:0] AGU_order8_out_pip;
    logic [`D_width-1:0] AGU_order9_out_pip;
    logic [`D_width-1:0] AGU_order10_out_pip;
    logic [`D_width-1:0] AGU_order11_out_pip;
    logic [`D_width-1:0] AGU_order12_out_pip;
    logic [`D_width-1:0] AGU_order13_out_pip;
    logic [`D_width-1:0] AGU_order14_out_pip;
    logic [`D_width-1:0] AGU_order15_out_pip;

    logic AGU_out_en_pip;
    logic AGU_done_pip;

    logic [2:0] l_out, l_out_pip;

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            AGU_order0_out_pip <= 'd0;
            AGU_order1_out_pip <= 'd0;
            AGU_order2_out_pip <= 'd0;
            AGU_order3_out_pip <= 'd0;
            AGU_order4_out_pip <= 'd0;
            AGU_order5_out_pip <= 'd0;
            AGU_order6_out_pip <= 'd0;
            AGU_order7_out_pip <= 'd0;
            AGU_order8_out_pip <= 'd0;
            AGU_order9_out_pip <= 'd0;
            AGU_order10_out_pip <= 'd0;
            AGU_order11_out_pip <= 'd0;
            AGU_order12_out_pip <= 'd0;
            AGU_order13_out_pip <= 'd0;
            AGU_order14_out_pip <= 'd0;
            AGU_order15_out_pip <= 'd0;

            AGU_out_en_pip <= 'd0;
            AGU_done_pip <= 'd0;

            l_out_pip <= 'd0;
        end else begin
            AGU_order0_out_pip <= AGU_order0_out;
            AGU_order1_out_pip <= AGU_order1_out;
            AGU_order2_out_pip <= AGU_order2_out;
            AGU_order3_out_pip <= AGU_order3_out;
            AGU_order4_out_pip <= AGU_order4_out;
            AGU_order5_out_pip <= AGU_order5_out;
            AGU_order6_out_pip <= AGU_order6_out;
            AGU_order7_out_pip <= AGU_order7_out;
            AGU_order8_out_pip <= AGU_order8_out;
            AGU_order9_out_pip <= AGU_order9_out;
            AGU_order10_out_pip <= AGU_order10_out;
            AGU_order11_out_pip <= AGU_order11_out;
            AGU_order12_out_pip <= AGU_order12_out;
            AGU_order13_out_pip <= AGU_order13_out;
            AGU_order14_out_pip <= AGU_order14_out;
            AGU_order15_out_pip <= AGU_order15_out;
            
            AGU_out_en_pip <= AGU_out_en;
            AGU_done_pip <= AGU_done;

            l_out_pip <= l_out;
        end
    end

    AGU AGU1(
        .clk(clk),
        .rst(rst),
        .AGU_enable(AGU_enable),

        .Order_0(AGU_order0_out),
        .Order_1(AGU_order1_out),
        .Order_2(AGU_order2_out),
        .Order_3(AGU_order3_out),
        .Order_4(AGU_order4_out),
        .Order_5(AGU_order5_out),
        .Order_6(AGU_order6_out),
        .Order_7(AGU_order7_out),
        .Order_8(AGU_order8_out),
        .Order_9(AGU_order9_out),
        .Order_10(AGU_order10_out),
        .Order_11(AGU_order11_out),
        .Order_12(AGU_order12_out),
        .Order_13(AGU_order13_out),
        .Order_14(AGU_order14_out),
        .Order_15(AGU_order15_out),
        .AGU_out_en(AGU_out_en),
        .AGU_done(AGU_done),
        .l(l_out)
    );

    Order_translate Order_translate(
        .clk(clk),
        .rst(rst),

        .Order_0(AGU_order0_out_pip),
        .Order_1(AGU_order1_out_pip),
        .Order_2(AGU_order2_out_pip),
        .Order_3(AGU_order3_out_pip),
        .Order_4(AGU_order4_out_pip),
        .Order_5(AGU_order5_out_pip),
        .Order_6(AGU_order6_out_pip),
        .Order_7(AGU_order7_out_pip),
        .Order_8(AGU_order8_out_pip),
        .Order_9(AGU_order9_out_pip),
        .Order_10(AGU_order10_out_pip),
        .Order_11(AGU_order11_out_pip),
        .Order_12(AGU_order12_out_pip),
        .Order_13(AGU_order13_out_pip),
        .Order_14(AGU_order14_out_pip),
        .Order_15(AGU_order15_out_pip),

        .r_enable(AGU_out_en_pip),
        .AGU_done(AGU_done_pip),
        .l(l_out_pip),

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
        .BN_MA_out_en(BN_MA_out_en),
        .l_AGU_out(l_AGU_out)
    );



endmodule