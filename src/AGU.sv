`include "../include/define.svh"
`include "BitRev.sv"

module AGU(
    input clk,
    input rst,
    input AGU_enable,

    output logic [`D_width-1:0] Order_0,
    output logic [`D_width-1:0] Order_1,
    output logic [`D_width-1:0] Order_2,
    output logic [`D_width-1:0] Order_3,
    output logic [`D_width-1:0] Order_4,
    output logic [`D_width-1:0] Order_5,
    output logic [`D_width-1:0] Order_6,
    output logic [`D_width-1:0] Order_7,
    output logic [`D_width-1:0] Order_8,
    output logic [`D_width-1:0] Order_9,
    output logic [`D_width-1:0] Order_10,
    output logic [`D_width-1:0] Order_11,
    output logic [`D_width-1:0] Order_12,
    output logic [`D_width-1:0] Order_13,
    output logic [`D_width-1:0] Order_14,
    output logic [`D_width-1:0] Order_15,
    output logic AGU_out_en,
    output logic AGU_done,
    output logic [2:0] l
);

    logic [`D_width-1:0] j, i;
    logic [`D_width-1:0] m0_pip, m1_pip, m2_pip, m3_pip, m4_pip, m5_pip, m6_pip, m7_pip, m8_pip, m9_pip, m10_pip,
                         m11_pip, m12_pip, m13_pip, m14_pip, m15_pip;
    logic [`D_width-1:0] j_upper, i_upper;
    logic [`D_width-1:0] tmp1, tmp2, BitRev_out_j;
    logic [`D_width-1:0] tmp1_pip, tmp2_pip, i_pip;

    parameter l_upper = `k - 1;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            i_upper <= 'd0;
        end else begin
            i_upper <= (1 << (`logn - `radix_k1*(l+1)) ) - 'd1;
        end
    end

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            j_upper <= 'd0;
        end else begin
            j_upper <= (1 << (`radix_k1*l) ) - 'd1;
        end
    end


    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            l <= 'd0;
            AGU_done <= 'd0;
        end else begin
            if (AGU_enable) begin
                if (j == j_upper && i == i_upper && l < l_upper) begin
                    l <= l + 'd1;
                    AGU_done <= 'd0;
                end else begin
                    if (i == i_upper && j == j_upper && l == l_upper) begin
                        l <= 'd0;
                        AGU_done <= 'd1;
                    end else begin
                        l <= l;
                        AGU_done <= 'd0;
                    end
                end
            end else begin
                l <= l;
                AGU_done <= 'd0;
            end
        end
    end

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            j <= 'd0;
        end else begin
            if (AGU_enable) begin
                if (i == i_upper && j < j_upper) begin
                    j <= j + 'd1;
                end else begin
                    if (i == i_upper && j == j_upper) begin
                        j <= 'd0;
                    end else begin
                        j <= j;
                    end
                end
            end else begin
                j <= 'd0;
            end
        end
    end

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            i <= 'd0;
        end else begin
            if (AGU_enable) begin
                if (i < i_upper) begin
                    i <= i + 'd1;
                end else begin
                    if (i == i_upper) begin
                        i <= 'd0;
                    end else begin
                        i <= i;
                    end
                end
            end else begin
                i <= 'd0;
            end
        end
    end

    BitRev BitRev1(
        .input_idx(j),
        .BitRev_enable(AGU_enable),
        .l(l),
        .clk(clk),
        .rst(rst),

        .BitRev_out(BitRev_out_j)
    );

    always_comb begin
        if (AGU_enable) begin
            tmp1 = 'd1 << ((`logn) - `radix_k1*l);
            tmp2 = 'd1 << ((`logn) - `radix_k1*(l+1));
        end else begin
            tmp1 = 'd0;
            tmp2 = 'd0;
        end
    end

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            tmp1_pip <= 'd0;
            tmp2_pip <= 'd0;
            i_pip <= 'd0;
            AGU_out_en <= 'd0;

            m0_pip <= 'd0;
            m1_pip <= 'd0;
            m2_pip <= 'd0;
            m3_pip <= 'd0;
            m4_pip <= 'd0;
            m5_pip <= 'd0;
            m6_pip <= 'd0;
            m7_pip <= 'd0;
            m8_pip <= 'd0;
            m9_pip <= 'd0;
            m10_pip <= 'd0;
            m11_pip <= 'd0;
            m12_pip <= 'd0;
            m13_pip <= 'd0;
            m14_pip <= 'd0;
            m15_pip <= 'd0;
        end else begin
            tmp1_pip <= tmp1;
            tmp2_pip <= tmp2;
            i_pip <= i;
            AGU_out_en <= AGU_enable;

            m0_pip <= 'd0;
            m1_pip <= 'd1;
            m2_pip <= 'd2;
            m3_pip <= 'd3;
            m4_pip <= 'd4;
            m5_pip <= 'd5;
            m6_pip <= 'd6;
            m7_pip <= 'd7;
            m8_pip <= 'd8;
            m9_pip <= 'd9;
            m10_pip <= 'd10;
            m11_pip <= 'd11;
            m12_pip <= 'd12;
            m13_pip <= 'd13;
            m14_pip <= 'd14;
            m15_pip <= 'd15;
        end
    end

    always_comb begin
        Order_0 = (BitRev_out_j * tmp1_pip) + (m0_pip * tmp2_pip) + i_pip;
        Order_1 = (BitRev_out_j * tmp1_pip) + (m1_pip * tmp2_pip) + i_pip;
        Order_2 = (BitRev_out_j * tmp1_pip) + (m2_pip * tmp2_pip) + i_pip;
        Order_3 = (BitRev_out_j * tmp1_pip) + (m3_pip * tmp2_pip) + i_pip;
        Order_4 = (BitRev_out_j * tmp1_pip) + (m4_pip * tmp2_pip) + i_pip;
        Order_5 = (BitRev_out_j * tmp1_pip) + (m5_pip * tmp2_pip) + i_pip;
        Order_6 = (BitRev_out_j * tmp1_pip) + (m6_pip * tmp2_pip) + i_pip;
        Order_7 = (BitRev_out_j * tmp1_pip) + (m7_pip * tmp2_pip) + i_pip;
        Order_8 = (BitRev_out_j * tmp1_pip) + (m8_pip * tmp2_pip) + i_pip;
        Order_9 = (BitRev_out_j * tmp1_pip) + (m9_pip * tmp2_pip) + i_pip;
        Order_10 = (BitRev_out_j * tmp1_pip) + (m10_pip * tmp2_pip) + i_pip;
        Order_11 = (BitRev_out_j * tmp1_pip) + (m11_pip * tmp2_pip) + i_pip;
        Order_12 = (BitRev_out_j * tmp1_pip) + (m12_pip * tmp2_pip) + i_pip;
        Order_13 = (BitRev_out_j * tmp1_pip) + (m13_pip * tmp2_pip) + i_pip;
        Order_14 = (BitRev_out_j * tmp1_pip) + (m14_pip * tmp2_pip) + i_pip;
        Order_15 = (BitRev_out_j * tmp1_pip) + (m15_pip * tmp2_pip) + i_pip;
    end

endmodule