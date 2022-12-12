`include "../include/define.svh"
//`include "BitRev.sv"

module AGU_k2 (
    input clk,
    input rst,
    input AGU_enable_k2,


    output logic [`D_width-1:0] Order_0_k2,
    output logic [`D_width-1:0] Order_1_k2,

    output logic [`D_width-1:0] Order_0_k2_add1,
    output logic [`D_width-1:0] Order_1_k2_add1,

    output logic [`D_width-1:0] Order_0_k2_add2,
    output logic [`D_width-1:0] Order_1_k2_add2,

    output logic [`D_width-1:0] Order_0_k2_add3,
    output logic [`D_width-1:0] Order_1_k2_add3,

    output logic [`D_width-1:0] Order_0_k2_add4,
    output logic [`D_width-1:0] Order_1_k2_add4,

    output logic [`D_width-1:0] Order_0_k2_add5,
    output logic [`D_width-1:0] Order_1_k2_add5,

    output logic [`D_width-1:0] Order_0_k2_add6,
    output logic [`D_width-1:0] Order_1_k2_add6,

    output logic [`D_width-1:0] Order_0_k2_add7,
    output logic [`D_width-1:0] Order_1_k2_add7,

    //--------------------
    output logic [`D_width-1:0] Order_0_k2_cnt16        ,
    output logic [`D_width-1:0] Order_1_k2_cnt16        ,
    output logic [`D_width-1:0] Order_0_k2_cnt16_add1   ,
    output logic [`D_width-1:0] Order_1_k2_cnt16_add1   ,
    output logic [`D_width-1:0] Order_0_k2_cnt16_add2   ,
    output logic [`D_width-1:0] Order_1_k2_cnt16_add2   ,
    output logic [`D_width-1:0] Order_0_k2_cnt16_add3   ,
    output logic [`D_width-1:0] Order_1_k2_cnt16_add3   ,
    output logic [`D_width-1:0] Order_0_k2_cnt16_add4   ,
    output logic [`D_width-1:0] Order_1_k2_cnt16_add4   ,
    output logic [`D_width-1:0] Order_0_k2_cnt16_add5   ,
    output logic [`D_width-1:0] Order_1_k2_cnt16_add5   ,
    output logic [`D_width-1:0] Order_0_k2_cnt16_add6   ,
    output logic [`D_width-1:0] Order_1_k2_cnt16_add6   ,
    output logic [`D_width-1:0] Order_0_k2_cnt16_add7   ,
    output logic [`D_width-1:0] Order_1_k2_cnt16_add7   ,

    //--------------------

    output logic AGU_out_en_k2,
    output logic AGU_done_k2,
    
    output logic [2:0] l_k2
);

   
    parameter radix_k1 = `radix_k1;
    parameter radix_k2 = `radix_k2;

    logic [`D_width-1:0]    j, j_add1, j_add2, j_add3, j_add4, j_add5, j_add6, j_add7;
    logic [`D_width-1:0]    BitRev_out_j, BitRev_out_j_add1, BitRev_out_j_add2, BitRev_out_j_add3, BitRev_out_j_add4, 
                            BitRev_out_j_add5, BitRev_out_j_add6 ,BitRev_out_j_add7;

    logic [`D_width-1:0] tmp1, tmp1_pip;
    logic [`D_width-1:0] m0_pip, m1_pip;
    logic [2:0] k;
    assign k = `k;
    logic [`D_width-1:0] j_upper_k2; 
    assign j_upper_k2 = (1 << (radix_k1 * k) );
    
    assign l_k2 = `Last_l;

    //-----------
    logic  cnt;
    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            cnt <= 'd0;
        end else begin
            if (AGU_enable_k2) begin
                cnt <= cnt + 'd1;
            end else begin
                cnt <= 'd0;
            end
        end
    end
    //--------------------


    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            j <= 'd0;
            AGU_done_k2 <= 'd0;
        end else begin
            if (AGU_enable_k2) begin
                
                if (cnt == 'd1) begin
                    if (j < j_upper_k2) begin
                        j <= j + 'd16;
                        AGU_done_k2 <= 'd0;
                    end else begin
                        j <= 'd0;
                        AGU_done_k2 <= 'd1;
                    end
                end
                
            end else begin
                j <= 'd0;
                AGU_done_k2 <= 'd0;
            end
        end
    end

    assign j_add1 = j + 'd1;
    assign j_add2 = j + 'd2;
    assign j_add3 = j + 'd3;
    assign j_add4 = j + 'd4;
    assign j_add5 = j + 'd5;
    assign j_add6 = j + 'd6;
    assign j_add7 = j + 'd7;

    BitRev BitRev0(
        .input_idx(j),
        .BitRev_enable(AGU_enable_k2),
        .l(k),
        .clk(clk),
        .rst(rst),

        .BitRev_out(BitRev_out_j)
    );
    BitRev BitRev1(
        .input_idx(j_add1),
        .BitRev_enable(AGU_enable_k2),
        .l(k),
        .clk(clk),
        .rst(rst),

        .BitRev_out(BitRev_out_j_add1)
    );
    BitRev BitRev2(
        .input_idx(j_add2),
        .BitRev_enable(AGU_enable_k2),
        .l(k),
        .clk(clk),
        .rst(rst),

        .BitRev_out(BitRev_out_j_add2)
    );
    BitRev BitRev3(
        .input_idx(j_add3),
        .BitRev_enable(AGU_enable_k2),
        .l(k),
        .clk(clk),
        .rst(rst),

        .BitRev_out(BitRev_out_j_add3)
    );
    BitRev BitRev4(
        .input_idx(j_add4),
        .BitRev_enable(AGU_enable_k2),
        .l(k),
        .clk(clk),
        .rst(rst),

        .BitRev_out(BitRev_out_j_add4)
    );
    BitRev BitRev5(
        .input_idx(j_add5),
        .BitRev_enable(AGU_enable_k2),
        .l(k),
        .clk(clk),
        .rst(rst),

        .BitRev_out(BitRev_out_j_add5)
    );
    BitRev BitRev6(
        .input_idx(j_add6),
        .BitRev_enable(AGU_enable_k2),
        .l(k),
        .clk(clk),
        .rst(rst),

        .BitRev_out(BitRev_out_j_add6)
    );
    BitRev BitRev7(
        .input_idx(j_add7),
        .BitRev_enable(AGU_enable_k2),
        .l(k),
        .clk(clk),
        .rst(rst),

        .BitRev_out(BitRev_out_j_add7)
    );

    always_comb begin
        if (AGU_enable_k2) begin
            tmp1 = ('d1 << radix_k2);
        end else begin
            tmp1 = 'd0;
        end
    end

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            tmp1_pip <= 'd0;
            AGU_out_en_k2 <= 'd0;

            m0_pip <= 'd0;
            m1_pip <= 'd0;
        end else begin
            tmp1_pip <= tmp1;
            AGU_out_en_k2 <= AGU_enable_k2;

            m0_pip <= 'd0;
            m1_pip <= 'd1;
        end
    end

    always_comb begin
        Order_0_k2 = (BitRev_out_j * tmp1_pip) + m0_pip;
        Order_1_k2 = (BitRev_out_j * tmp1_pip) + m1_pip;

        Order_0_k2_add1 = (BitRev_out_j_add1 * tmp1_pip) + m0_pip;
        Order_1_k2_add1 = (BitRev_out_j_add1 * tmp1_pip) + m1_pip;
        
        Order_0_k2_add2 = (BitRev_out_j_add2 * tmp1_pip) + m0_pip;
        Order_1_k2_add2 = (BitRev_out_j_add2 * tmp1_pip) + m1_pip;

        Order_0_k2_add3 = (BitRev_out_j_add3 * tmp1_pip) + m0_pip;
        Order_1_k2_add3 = (BitRev_out_j_add3 * tmp1_pip) + m1_pip;

        Order_0_k2_add4 = (BitRev_out_j_add4 * tmp1_pip) + m0_pip;
        Order_1_k2_add4 = (BitRev_out_j_add4 * tmp1_pip) + m1_pip;

        Order_0_k2_add5 = (BitRev_out_j_add5 * tmp1_pip) + m0_pip;
        Order_1_k2_add5 = (BitRev_out_j_add5 * tmp1_pip) + m1_pip;

        Order_0_k2_add6 = (BitRev_out_j_add6 * tmp1_pip) + m0_pip;
        Order_1_k2_add6 = (BitRev_out_j_add6 * tmp1_pip) + m1_pip;

        Order_0_k2_add7 = (BitRev_out_j_add7 * tmp1_pip) + m0_pip;
        Order_1_k2_add7 = (BitRev_out_j_add7 * tmp1_pip) + m1_pip;      
    end




    //------------------------
    logic [`D_width-1:0] j_cnt_16;
    logic [`D_width-1:0] j_cnt_16_add1, j_cnt_16_add2, j_cnt_16_add3, j_cnt_16_add4,
                         j_cnt_16_add5, j_cnt_16_add6, j_cnt_16_add7;
    logic [`D_width-1:0] BitRev_out_j_cnt16, BitRev_out_j_cnt16_add1, BitRev_out_j_cnt16_add2, BitRev_out_j_cnt16_add3, BitRev_out_j_cnt16_add4,
                         BitRev_out_j_cnt16_add5, BitRev_out_j_cnt16_add6, BitRev_out_j_cnt16_add7;
    always_comb begin
        if (AGU_enable_k2) begin
            j_cnt_16 <= j + 'd8;
        end else begin
            j_cnt_16 <= 'd0;
        end
    end
    
    assign j_cnt_16_add1 = j_cnt_16 + 'd1;
    assign j_cnt_16_add2 = j_cnt_16 + 'd2;
    assign j_cnt_16_add3 = j_cnt_16 + 'd3;
    assign j_cnt_16_add4 = j_cnt_16 + 'd4;
    assign j_cnt_16_add5 = j_cnt_16 + 'd5;
    assign j_cnt_16_add6 = j_cnt_16 + 'd6;
    assign j_cnt_16_add7 = j_cnt_16 + 'd7;

    BitRev BitRev_cnt_0(
        .input_idx(j_cnt_16),
        .BitRev_enable(AGU_enable_k2),
        .l(k),
        .clk(clk),
        .rst(rst),

        .BitRev_out(BitRev_out_j_cnt16)
    );

    BitRev BitRev_cnt_1(
        .input_idx(j_cnt_16_add1),
        .BitRev_enable(AGU_enable_k2),
        .l(k),
        .clk(clk),
        .rst(rst),

        .BitRev_out(BitRev_out_j_cnt16_add1)
    );

    BitRev BitRev_cnt_2(
        .input_idx(j_cnt_16_add2),
        .BitRev_enable(AGU_enable_k2),
        .l(k),
        .clk(clk),
        .rst(rst),

        .BitRev_out(BitRev_out_j_cnt16_add2)
    );

    BitRev BitRev_cnt_3(
        .input_idx(j_cnt_16_add3),
        .BitRev_enable(AGU_enable_k2),
        .l(k),
        .clk(clk),
        .rst(rst),

        .BitRev_out(BitRev_out_j_cnt16_add3)
    );

    BitRev BitRev_cnt_4(
        .input_idx(j_cnt_16_add4),
        .BitRev_enable(AGU_enable_k2),
        .l(k),
        .clk(clk),
        .rst(rst),

        .BitRev_out(BitRev_out_j_cnt16_add4)
    );

    BitRev BitRev_cnt_5(
        .input_idx(j_cnt_16_add5),
        .BitRev_enable(AGU_enable_k2),
        .l(k),
        .clk(clk),
        .rst(rst),

        .BitRev_out(BitRev_out_j_cnt16_add5)
    );

    BitRev BitRev_cnt_6(
        .input_idx(j_cnt_16_add6),
        .BitRev_enable(AGU_enable_k2),
        .l(k),
        .clk(clk),
        .rst(rst),

        .BitRev_out(BitRev_out_j_cnt16_add6)
    );

    BitRev BitRev_cnt_7(
        .input_idx(j_cnt_16_add7),
        .BitRev_enable(AGU_enable_k2),
        .l(k),
        .clk(clk),
        .rst(rst),

        .BitRev_out(BitRev_out_j_cnt16_add7)
    );

    always_comb begin
        Order_0_k2_cnt16      = (BitRev_out_j_cnt16 * tmp1_pip) + m0_pip;
        Order_1_k2_cnt16      = (BitRev_out_j_cnt16 * tmp1_pip) + m1_pip;

        Order_0_k2_cnt16_add1 = (BitRev_out_j_cnt16_add1 * tmp1_pip) + m0_pip;
        Order_1_k2_cnt16_add1 = (BitRev_out_j_cnt16_add1 * tmp1_pip) + m1_pip;
        
        Order_0_k2_cnt16_add2 = (BitRev_out_j_cnt16_add2 * tmp1_pip) + m0_pip;
        Order_1_k2_cnt16_add2 = (BitRev_out_j_cnt16_add2 * tmp1_pip) + m1_pip;

        Order_0_k2_cnt16_add3 = (BitRev_out_j_cnt16_add3 * tmp1_pip) + m0_pip;
        Order_1_k2_cnt16_add3 = (BitRev_out_j_cnt16_add3 * tmp1_pip) + m1_pip;

        Order_0_k2_cnt16_add4 = (BitRev_out_j_cnt16_add4 * tmp1_pip) + m0_pip;
        Order_1_k2_cnt16_add4 = (BitRev_out_j_cnt16_add4 * tmp1_pip) + m1_pip;

        Order_0_k2_cnt16_add5 = (BitRev_out_j_cnt16_add5 * tmp1_pip) + m0_pip;
        Order_1_k2_cnt16_add5 = (BitRev_out_j_cnt16_add5 * tmp1_pip) + m1_pip;

        Order_0_k2_cnt16_add6 = (BitRev_out_j_cnt16_add6 * tmp1_pip) + m0_pip;
        Order_1_k2_cnt16_add6 = (BitRev_out_j_cnt16_add6 * tmp1_pip) + m1_pip;

        Order_0_k2_cnt16_add7 = (BitRev_out_j_cnt16_add7 * tmp1_pip) + m0_pip;
        Order_1_k2_cnt16_add7 = (BitRev_out_j_cnt16_add7 * tmp1_pip) + m1_pip;      
    end
    //--------------------------



endmodule