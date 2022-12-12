`include "../include/define.svh"
//`include "ModAdd.sv"


module Order_translate_k2 (
    input clk,
    input rst,

    //0
    input [`D_width-1:0] Order_0,
    input [`D_width-1:0] Order_1,
    //1
    input [`D_width-1:0] Order_0_add1,
    input [`D_width-1:0] Order_1_add1,
    //2
    input [`D_width-1:0] Order_0_add2,
    input [`D_width-1:0] Order_1_add2,
    //3
    input [`D_width-1:0] Order_0_add3,
    input [`D_width-1:0] Order_1_add3,
    //4
    input [`D_width-1:0] Order_0_add4,
    input [`D_width-1:0] Order_1_add4,
    //5
    input [`D_width-1:0] Order_0_add5,
    input [`D_width-1:0] Order_1_add5,
    //6
    input [`D_width-1:0] Order_0_add6,
    input [`D_width-1:0] Order_1_add6,
    //7
    input [`D_width-1:0] Order_0_add7,
    input [`D_width-1:0] Order_1_add7,

    input r_enable_k2,
    input AGU_done_k2,
    input [2:0] l,

    //0
    output logic [`MA_width-1:0]    MA0_idx_k2,
    output logic [`MA_width-1:0]    MA1_idx_k2,
    output logic [`BANK_width-1:0]  BN0_idx_k2,
    output logic [`BANK_width-1:0]  BN1_idx_k2,
    //1
    output logic [`MA_width-1:0]    MA0_idx_k2_add1,
    output logic [`MA_width-1:0]    MA1_idx_k2_add1,
    output logic [`BANK_width-1:0]  BN0_idx_k2_add1,
    output logic [`BANK_width-1:0]  BN1_idx_k2_add1,
    //2
    output logic [`MA_width-1:0]    MA0_idx_k2_add2,
    output logic [`MA_width-1:0]    MA1_idx_k2_add2,
    output logic [`BANK_width-1:0]  BN0_idx_k2_add2,
    output logic [`BANK_width-1:0]  BN1_idx_k2_add2,
    //3
    output logic [`MA_width-1:0]    MA0_idx_k2_add3,
    output logic [`MA_width-1:0]    MA1_idx_k2_add3,
    output logic [`BANK_width-1:0]  BN0_idx_k2_add3,
    output logic [`BANK_width-1:0]  BN1_idx_k2_add3,
    //4
    output logic [`MA_width-1:0]    MA0_idx_k2_add4,
    output logic [`MA_width-1:0]    MA1_idx_k2_add4,
    output logic [`BANK_width-1:0]  BN0_idx_k2_add4,
    output logic [`BANK_width-1:0]  BN1_idx_k2_add4,
    //5
    output logic [`MA_width-1:0]    MA0_idx_k2_add5,
    output logic [`MA_width-1:0]    MA1_idx_k2_add5,
    output logic [`BANK_width-1:0]  BN0_idx_k2_add5,
    output logic [`BANK_width-1:0]  BN1_idx_k2_add5,
    //6
    output logic [`MA_width-1:0]    MA0_idx_k2_add6,
    output logic [`MA_width-1:0]    MA1_idx_k2_add6,
    output logic [`BANK_width-1:0]  BN0_idx_k2_add6,
    output logic [`BANK_width-1:0]  BN1_idx_k2_add6,
    //7
    output logic [`MA_width-1:0]    MA0_idx_k2_add7,
    output logic [`MA_width-1:0]    MA1_idx_k2_add7,
    output logic [`BANK_width-1:0]  BN0_idx_k2_add7,
    output logic [`BANK_width-1:0]  BN1_idx_k2_add7,

    output logic AGU_done_out_k2,
    output logic BN_MA_out_en_k2,
    output logic [2:0] l_AGU_out_k2
);


    logic [`D_width-1:0] Order0_tmp0_pip0,  Order0_tmp1_pip0, Order0_tmp2_pip0, Order0_tmp3_pip0;
    logic [`D_width-1:0] Order0_tmp2_pip1, Order0_tmp3_pip1;
    logic [`D_width-1:0] Order0_tmp3_pip2;
    logic [`D_width-1:0] Order0_tmp_out_pip0, Order0_tmp_out_pip1;
    logic [`D_width-1:0] Order0_pip0, Order0_pip1, Order0_pip2;
    //1
    logic [`D_width-1:0] Order0_add1_tmp0_pip0,     Order0_add1_tmp1_pip0,   Order0_add1_tmp2_pip0, Order0_add1_tmp3_pip0;
    logic [`D_width-1:0] Order0_add1_tmp2_pip1,     Order0_add1_tmp3_pip1;
    logic [`D_width-1:0] Order0_add1_tmp3_pip2;
    logic [`D_width-1:0] Order0_add1_tmp_out_pip0,  Order0_add1_tmp_out_pip1;
    logic [`D_width-1:0] Order0_add1_pip0,          Order0_add1_pip1,        Order0_add1_pip2;
    //2
    logic [`D_width-1:0] Order0_add2_tmp0_pip0,     Order0_add2_tmp1_pip0,   Order0_add2_tmp2_pip0, Order0_add2_tmp3_pip0;
    logic [`D_width-1:0] Order0_add2_tmp2_pip1,     Order0_add2_tmp3_pip1;
    logic [`D_width-1:0] Order0_add2_tmp3_pip2;
    logic [`D_width-1:0] Order0_add2_tmp_out_pip0,  Order0_add2_tmp_out_pip1;
    logic [`D_width-1:0] Order0_add2_pip0,          Order0_add2_pip1,        Order0_add2_pip2;
    //3
    logic [`D_width-1:0] Order0_add3_tmp0_pip0,     Order0_add3_tmp1_pip0,   Order0_add3_tmp2_pip0, Order0_add3_tmp3_pip0;
    logic [`D_width-1:0] Order0_add3_tmp2_pip1,     Order0_add3_tmp3_pip1;
    logic [`D_width-1:0] Order0_add3_tmp3_pip2;
    logic [`D_width-1:0] Order0_add3_tmp_out_pip0,  Order0_add3_tmp_out_pip1;
    logic [`D_width-1:0] Order0_add3_pip0,          Order0_add3_pip1,        Order0_add3_pip2;
    //4
    logic [`D_width-1:0] Order0_add4_tmp0_pip0,     Order0_add4_tmp1_pip0,   Order0_add4_tmp2_pip0, Order0_add4_tmp3_pip0;
    logic [`D_width-1:0] Order0_add4_tmp2_pip1,     Order0_add4_tmp3_pip1;
    logic [`D_width-1:0] Order0_add4_tmp3_pip2;
    logic [`D_width-1:0] Order0_add4_tmp_out_pip0,  Order0_add4_tmp_out_pip1;
    logic [`D_width-1:0] Order0_add4_pip0,          Order0_add4_pip1,        Order0_add4_pip2;
    //5
    logic [`D_width-1:0] Order0_add5_tmp0_pip0,     Order0_add5_tmp1_pip0,   Order0_add5_tmp2_pip0, Order0_add5_tmp3_pip0;
    logic [`D_width-1:0] Order0_add5_tmp2_pip1,     Order0_add5_tmp3_pip1;
    logic [`D_width-1:0] Order0_add5_tmp3_pip2;
    logic [`D_width-1:0] Order0_add5_tmp_out_pip0,  Order0_add5_tmp_out_pip1;
    logic [`D_width-1:0] Order0_add5_pip0,          Order0_add5_pip1,        Order0_add5_pip2;
    //6
    logic [`D_width-1:0] Order0_add6_tmp0_pip0,     Order0_add6_tmp1_pip0,   Order0_add6_tmp2_pip0, Order0_add6_tmp3_pip0;
    logic [`D_width-1:0] Order0_add6_tmp2_pip1,     Order0_add6_tmp3_pip1;
    logic [`D_width-1:0] Order0_add6_tmp3_pip2;
    logic [`D_width-1:0] Order0_add6_tmp_out_pip0,  Order0_add6_tmp_out_pip1;
    logic [`D_width-1:0] Order0_add6_pip0,          Order0_add6_pip1,        Order0_add6_pip2;
    //7
    logic [`D_width-1:0] Order0_add7_tmp0_pip0,     Order0_add7_tmp1_pip0,   Order0_add7_tmp2_pip0, Order0_add7_tmp3_pip0;
    logic [`D_width-1:0] Order0_add7_tmp2_pip1,     Order0_add7_tmp3_pip1;
    logic [`D_width-1:0] Order0_add7_tmp3_pip2;
    logic [`D_width-1:0] Order0_add7_tmp_out_pip0,  Order0_add7_tmp_out_pip1;
    logic [`D_width-1:0] Order0_add7_pip0,          Order0_add7_pip1,        Order0_add7_pip2;

    //0
    logic [`D_width-1:0] Order1_tmp0_pip0,  Order1_tmp1_pip0, Order1_tmp2_pip0, Order1_tmp3_pip0;
    logic [`D_width-1:0] Order1_tmp2_pip1,  Order1_tmp3_pip1;
    logic [`D_width-1:0] Order1_tmp3_pip2;
    logic [`D_width-1:0] Order1_tmp_out_pip0, Order1_tmp_out_pip1;
    logic [`D_width-1:0] Order1_pip0, Order1_pip1, Order1_pip2;
    //1
    logic [`D_width-1:0] Order1_add1_tmp0_pip0,     Order1_add1_tmp1_pip0,  Order1_add1_tmp2_pip0, Order1_add1_tmp3_pip0;
    logic [`D_width-1:0] Order1_add1_tmp2_pip1,     Order1_add1_tmp3_pip1;
    logic [`D_width-1:0] Order1_add1_tmp3_pip2;
    logic [`D_width-1:0] Order1_add1_tmp_out_pip0,  Order1_add1_tmp_out_pip1;
    logic [`D_width-1:0] Order1_add1_pip0,          Order1_add1_pip1,       Order1_add1_pip2;
    //2
    logic [`D_width-1:0] Order1_add2_tmp0_pip0,     Order1_add2_tmp1_pip0,  Order1_add2_tmp2_pip0, Order1_add2_tmp3_pip0;
    logic [`D_width-1:0] Order1_add2_tmp2_pip1,     Order1_add2_tmp3_pip1;
    logic [`D_width-1:0] Order1_add2_tmp3_pip2;
    logic [`D_width-1:0] Order1_add2_tmp_out_pip0,  Order1_add2_tmp_out_pip1;
    logic [`D_width-1:0] Order1_add2_pip0,          Order1_add2_pip1,       Order1_add2_pip2;
    //3
    logic [`D_width-1:0] Order1_add3_tmp0_pip0,     Order1_add3_tmp1_pip0,  Order1_add3_tmp2_pip0, Order1_add3_tmp3_pip0;
    logic [`D_width-1:0] Order1_add3_tmp2_pip1,     Order1_add3_tmp3_pip1;
    logic [`D_width-1:0] Order1_add3_tmp3_pip2;
    logic [`D_width-1:0] Order1_add3_tmp_out_pip0,  Order1_add3_tmp_out_pip1;
    logic [`D_width-1:0] Order1_add3_pip0,          Order1_add3_pip1,       Order1_add3_pip2;
    //4
    logic [`D_width-1:0] Order1_add4_tmp0_pip0,     Order1_add4_tmp1_pip0,  Order1_add4_tmp2_pip0, Order1_add4_tmp3_pip0;
    logic [`D_width-1:0] Order1_add4_tmp2_pip1,     Order1_add4_tmp3_pip1;
    logic [`D_width-1:0] Order1_add4_tmp3_pip2;
    logic [`D_width-1:0] Order1_add4_tmp_out_pip0,  Order1_add4_tmp_out_pip1;
    logic [`D_width-1:0] Order1_add4_pip0,          Order1_add4_pip1,       Order1_add4_pip2;
    //5
    logic [`D_width-1:0] Order1_add5_tmp0_pip0,     Order1_add5_tmp1_pip0,  Order1_add5_tmp2_pip0, Order1_add5_tmp3_pip0;
    logic [`D_width-1:0] Order1_add5_tmp2_pip1,     Order1_add5_tmp3_pip1;
    logic [`D_width-1:0] Order1_add5_tmp3_pip2;
    logic [`D_width-1:0] Order1_add5_tmp_out_pip0,  Order1_add5_tmp_out_pip1;
    logic [`D_width-1:0] Order1_add5_pip0,          Order1_add5_pip1,       Order1_add5_pip2;
    //6
    logic [`D_width-1:0] Order1_add6_tmp0_pip0,     Order1_add6_tmp1_pip0,  Order1_add6_tmp2_pip0, Order1_add6_tmp3_pip0;
    logic [`D_width-1:0] Order1_add6_tmp2_pip1,     Order1_add6_tmp3_pip1;
    logic [`D_width-1:0] Order1_add6_tmp3_pip2;
    logic [`D_width-1:0] Order1_add6_tmp_out_pip0,  Order1_add6_tmp_out_pip1;
    logic [`D_width-1:0] Order1_add6_pip0,          Order1_add6_pip1,       Order1_add6_pip2;
    //7
    logic [`D_width-1:0] Order1_add7_tmp0_pip0,     Order1_add7_tmp1_pip0,  Order1_add7_tmp2_pip0, Order1_add7_tmp3_pip0;
    logic [`D_width-1:0] Order1_add7_tmp2_pip1,     Order1_add7_tmp3_pip1;
    logic [`D_width-1:0] Order1_add7_tmp3_pip2;
    logic [`D_width-1:0] Order1_add7_tmp_out_pip0,  Order1_add7_tmp_out_pip1;
    logic [`D_width-1:0] Order1_add7_pip0,          Order1_add7_pip1,       Order1_add7_pip2;

    logic r_enable_k2_pip0, r_enable_k2_pip1, r_enable_k2_pip2;
    logic AGU_done_k2_pip0, AGU_done_k2_pip1, AGU_done_k2_pip2;

    logic [`D_width-1:0] Order0_tmp_out_stage0, Order0_tmp_out_stage1,  Order0_tmp_out_stage2;
    logic [`D_width-1:0] Order1_tmp_out_stage0, Order1_tmp_out_stage1,  Order1_tmp_out_stage2;
    logic [`D_width-1:0] Order0_add1_tmp_out_stage0, Order0_add1_tmp_out_stage1,  Order0_add1_tmp_out_stage2;
    logic [`D_width-1:0] Order1_add1_tmp_out_stage0, Order1_add1_tmp_out_stage1,  Order1_add1_tmp_out_stage2;
    logic [`D_width-1:0] Order0_add2_tmp_out_stage0, Order0_add2_tmp_out_stage1,  Order0_add2_tmp_out_stage2;
    logic [`D_width-1:0] Order1_add2_tmp_out_stage0, Order1_add2_tmp_out_stage1,  Order1_add2_tmp_out_stage2;
    logic [`D_width-1:0] Order0_add3_tmp_out_stage0, Order0_add3_tmp_out_stage1,  Order0_add3_tmp_out_stage2;
    logic [`D_width-1:0] Order1_add3_tmp_out_stage0, Order1_add3_tmp_out_stage1,  Order1_add3_tmp_out_stage2;
    logic [`D_width-1:0] Order0_add4_tmp_out_stage0, Order0_add4_tmp_out_stage1,  Order0_add4_tmp_out_stage2;
    logic [`D_width-1:0] Order1_add4_tmp_out_stage0, Order1_add4_tmp_out_stage1,  Order1_add4_tmp_out_stage2;
    logic [`D_width-1:0] Order0_add5_tmp_out_stage0, Order0_add5_tmp_out_stage1,  Order0_add5_tmp_out_stage2;
    logic [`D_width-1:0] Order1_add5_tmp_out_stage0, Order1_add5_tmp_out_stage1,  Order1_add5_tmp_out_stage2;
    logic [`D_width-1:0] Order0_add6_tmp_out_stage0, Order0_add6_tmp_out_stage1,  Order0_add6_tmp_out_stage2;
    logic [`D_width-1:0] Order1_add6_tmp_out_stage0, Order1_add6_tmp_out_stage1,  Order1_add6_tmp_out_stage2;
    logic [`D_width-1:0] Order0_add7_tmp_out_stage0, Order0_add7_tmp_out_stage1,  Order0_add7_tmp_out_stage2;
    logic [`D_width-1:0] Order1_add7_tmp_out_stage0, Order1_add7_tmp_out_stage1,  Order1_add7_tmp_out_stage2;

    logic [2:0] l_pip0, l_pip1, l_pip2;

    parameter DW_sub_16 = `D_width-16;
    parameter DW_sub_4 = `D_width-4;
    parameter DW_sub_delta = `delta;

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            Order0_tmp0_pip0 <= `D_width'd0;
            Order0_tmp1_pip0 <= `D_width'd0;
            Order0_tmp2_pip0 <= `D_width'd0;
            Order0_tmp3_pip0 <= `D_width'd0;
            Order0_pip0 <=      `D_width'd0;

            Order1_tmp0_pip0 <= `D_width'd0;
            Order1_tmp1_pip0 <= `D_width'd0;
            Order1_tmp2_pip0 <= `D_width'd0;
            Order1_tmp3_pip0 <= `D_width'd0;
            Order1_pip0 <=      `D_width'd0;

            //1
            Order0_add1_tmp0_pip0 <= `D_width'd0;
            Order0_add1_tmp1_pip0 <= `D_width'd0;
            Order0_add1_tmp2_pip0 <= `D_width'd0;
            Order0_add1_tmp3_pip0 <= `D_width'd0;
            Order0_add1_pip0 <=      `D_width'd0;

            Order1_add1_tmp0_pip0 <= `D_width'd0;
            Order1_add1_tmp1_pip0 <= `D_width'd0;
            Order1_add1_tmp2_pip0 <= `D_width'd0;
            Order1_add1_tmp3_pip0 <= `D_width'd0;
            Order1_add1_pip0 <=      `D_width'd0;
            //2
            Order0_add2_tmp0_pip0 <= `D_width'd0;
            Order0_add2_tmp1_pip0 <= `D_width'd0;
            Order0_add2_tmp2_pip0 <= `D_width'd0;
            Order0_add2_tmp3_pip0 <= `D_width'd0;
            Order0_add2_pip0 <=      `D_width'd0;
            Order1_add2_tmp0_pip0 <= `D_width'd0;
            Order1_add2_tmp1_pip0 <= `D_width'd0;
            Order1_add2_tmp2_pip0 <= `D_width'd0;
            Order1_add2_tmp3_pip0 <= `D_width'd0;
            Order1_add2_pip0 <=      `D_width'd0;
            //3
            Order0_add3_tmp0_pip0 <= `D_width'd0;
            Order0_add3_tmp1_pip0 <= `D_width'd0;
            Order0_add3_tmp2_pip0 <= `D_width'd0;
            Order0_add3_tmp3_pip0 <= `D_width'd0;
            Order0_add3_pip0 <=      `D_width'd0;
            Order1_add3_tmp0_pip0 <= `D_width'd0;
            Order1_add3_tmp1_pip0 <= `D_width'd0;
            Order1_add3_tmp2_pip0 <= `D_width'd0;
            Order1_add3_tmp3_pip0 <= `D_width'd0;
            Order1_add3_pip0 <=      `D_width'd0;
            //4
            Order0_add4_tmp0_pip0 <= `D_width'd0;
            Order0_add4_tmp1_pip0 <= `D_width'd0;
            Order0_add4_tmp2_pip0 <= `D_width'd0;
            Order0_add4_tmp3_pip0 <= `D_width'd0;
            Order0_add4_pip0 <=      `D_width'd0;
            Order1_add4_tmp0_pip0 <= `D_width'd0;
            Order1_add4_tmp1_pip0 <= `D_width'd0;
            Order1_add4_tmp2_pip0 <= `D_width'd0;
            Order1_add4_tmp3_pip0 <= `D_width'd0;
            Order1_add4_pip0 <=      `D_width'd0;
            //5
            Order0_add5_tmp0_pip0 <= `D_width'd0;
            Order0_add5_tmp1_pip0 <= `D_width'd0;
            Order0_add5_tmp2_pip0 <= `D_width'd0;
            Order0_add5_tmp3_pip0 <= `D_width'd0;
            Order0_add5_pip0 <=      `D_width'd0;
            Order1_add5_tmp0_pip0 <= `D_width'd0;
            Order1_add5_tmp1_pip0 <= `D_width'd0;
            Order1_add5_tmp2_pip0 <= `D_width'd0;
            Order1_add5_tmp3_pip0 <= `D_width'd0;
            Order1_add5_pip0 <=      `D_width'd0;
            //6
            Order0_add6_tmp0_pip0 <= `D_width'd0;
            Order0_add6_tmp1_pip0 <= `D_width'd0;
            Order0_add6_tmp2_pip0 <= `D_width'd0;
            Order0_add6_tmp3_pip0 <= `D_width'd0;
            Order0_add6_pip0 <=      `D_width'd0;
            Order1_add6_tmp0_pip0 <= `D_width'd0;
            Order1_add6_tmp1_pip0 <= `D_width'd0;
            Order1_add6_tmp2_pip0 <= `D_width'd0;
            Order1_add6_tmp3_pip0 <= `D_width'd0;
            Order1_add6_pip0 <=      `D_width'd0;
            //7
            Order0_add7_tmp0_pip0 <= `D_width'd0;
            Order0_add7_tmp1_pip0 <= `D_width'd0;
            Order0_add7_tmp2_pip0 <= `D_width'd0;
            Order0_add7_tmp3_pip0 <= `D_width'd0;
            Order0_add7_pip0 <=      `D_width'd0;
            Order1_add7_tmp0_pip0 <= `D_width'd0;
            Order1_add7_tmp1_pip0 <= `D_width'd0;
            Order1_add7_tmp2_pip0 <= `D_width'd0;
            Order1_add7_tmp3_pip0 <= `D_width'd0;
            Order1_add7_pip0 <=      `D_width'd0;

            r_enable_k2_pip0 <= 1'd0;
            AGU_done_k2_pip0 <= 1'd0;
            l_pip0 <= 'd0;
        end else begin
            //0
            Order0_tmp0_pip0 <= {{DW_sub_4{1'b0}}, Order_0[3:0]     };
            Order0_tmp1_pip0 <= {{DW_sub_4{1'b0}}, Order_0[7:4]     };
            Order0_tmp2_pip0 <= {{DW_sub_4{1'b0}}, Order_0[11:8]    };
            Order0_tmp3_pip0 <= {{DW_sub_4{1'b0}}, Order_0[15:12]   };
            Order0_pip0 <=      Order_0;

            Order1_tmp0_pip0 <= {{DW_sub_4{1'b0}}, Order_1[3:0]     };
            Order1_tmp1_pip0 <= {{DW_sub_4{1'b0}}, Order_1[7:4]     };
            Order1_tmp2_pip0 <= {{DW_sub_4{1'b0}}, Order_1[11:8]    };
            Order1_tmp3_pip0 <= {{DW_sub_4{1'b0}}, Order_1[15:12]   };
            Order1_pip0 <=      Order_1;
            //1
            Order0_add1_tmp0_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add1[3:0]       };
            Order0_add1_tmp1_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add1[7:4]       };
            Order0_add1_tmp2_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add1[11:8]      };
            Order0_add1_tmp3_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add1[15:12]     };
            Order0_add1_pip0 <=      Order_0_add1;

            Order1_add1_tmp0_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add1[3:0]       };
            Order1_add1_tmp1_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add1[7:4]       };
            Order1_add1_tmp2_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add1[11:8]      };
            Order1_add1_tmp3_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add1[15:12]     };
            Order1_add1_pip0 <=      Order_1_add1;
            //2
            Order0_add2_tmp0_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add2[3:0]       };
            Order0_add2_tmp1_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add2[7:4]       };
            Order0_add2_tmp2_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add2[11:8]      };
            Order0_add2_tmp3_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add2[15:12]     };
            Order0_add2_pip0 <=      Order_0_add2;

            Order1_add2_tmp0_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add2[3:0]       };
            Order1_add2_tmp1_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add2[7:4]       };
            Order1_add2_tmp2_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add2[11:8]      };
            Order1_add2_tmp3_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add2[15:12]     };
            Order1_add2_pip0 <=      Order_1_add2;
            //3
            Order0_add3_tmp0_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add3[3:0]       };
            Order0_add3_tmp1_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add3[7:4]       };
            Order0_add3_tmp2_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add3[11:8]      };
            Order0_add3_tmp3_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add3[15:12]     };
            Order0_add3_pip0 <=      Order_0_add3;

            Order1_add3_tmp0_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add3[3:0]       };
            Order1_add3_tmp1_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add3[7:4]       };
            Order1_add3_tmp2_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add3[11:8]      };
            Order1_add3_tmp3_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add3[15:12]     };
            Order1_add3_pip0 <=      Order_1_add3;
            //4
            Order0_add4_tmp0_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add4[3:0]       };
            Order0_add4_tmp1_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add4[7:4]       };
            Order0_add4_tmp2_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add4[11:8]      };
            Order0_add4_tmp3_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add4[15:12]     };
            Order0_add4_pip0 <=      Order_0_add4;

            Order1_add4_tmp0_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add4[3:0]       };
            Order1_add4_tmp1_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add4[7:4]       };
            Order1_add4_tmp2_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add4[11:8]      };
            Order1_add4_tmp3_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add4[15:12]     };
            Order1_add4_pip0 <=      Order_1_add4;
            //5
            Order0_add5_tmp0_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add5[3:0]       };
            Order0_add5_tmp1_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add5[7:4]       };
            Order0_add5_tmp2_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add5[11:8]      };
            Order0_add5_tmp3_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add5[15:12]     };
            Order0_add5_pip0 <=      Order_0_add5;

            Order1_add5_tmp0_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add5[3:0]       };
            Order1_add5_tmp1_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add5[7:4]       };
            Order1_add5_tmp2_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add5[11:8]      };
            Order1_add5_tmp3_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add5[15:12]     };
            Order1_add5_pip0 <=      Order_1_add5;
            //6
            Order0_add6_tmp0_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add6[3:0]       };
            Order0_add6_tmp1_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add6[7:4]       };
            Order0_add6_tmp2_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add6[11:8]      };
            Order0_add6_tmp3_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add6[15:12]     };
            Order0_add6_pip0 <=      Order_0_add6;

            Order1_add6_tmp0_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add6[3:0]       };
            Order1_add6_tmp1_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add6[7:4]       };
            Order1_add6_tmp2_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add6[11:8]      };
            Order1_add6_tmp3_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add6[15:12]     };
            Order1_add6_pip0 <=      Order_1_add6;
            //7
            Order0_add7_tmp0_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add7[3:0]       };
            Order0_add7_tmp1_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add7[7:4]       };
            Order0_add7_tmp2_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add7[11:8]      };
            Order0_add7_tmp3_pip0 <= {{DW_sub_4{1'b0}}, Order_0_add7[15:12]     };
            Order0_add7_pip0 <=      Order_0_add7;

            Order1_add7_tmp0_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add7[3:0]       };
            Order1_add7_tmp1_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add7[7:4]       };
            Order1_add7_tmp2_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add7[11:8]      };
            Order1_add7_tmp3_pip0 <= {{DW_sub_4{1'b0}}, Order_1_add7[15:12]     };
            Order1_add7_pip0 <=      Order_1_add7;

            r_enable_k2_pip0 <= r_enable_k2;
            AGU_done_k2_pip0 <= AGU_done_k2;
            l_pip0 <= l;
        end
    end

    // 0
    ModAdd add0_0(
        .in_1({Order0_tmp0_pip0 }),
        .in_2({Order0_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order0_tmp_out_stage0)
    );

    ModAdd add0_1(
        .in_1({Order1_tmp0_pip0 }),
        .in_2({Order1_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_tmp_out_stage0)
    );
    //1
     ModAdd add0_0_add1(
        .in_1({Order0_add1_tmp0_pip0 }),
        .in_2({Order0_add1_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order0_add1_tmp_out_stage0)
    );

    ModAdd add0_1_add1(
        .in_1({Order1_add1_tmp0_pip0 }),
        .in_2({Order1_add1_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add1_tmp_out_stage0)
    );
    //2
     ModAdd add0_0_add2(
        .in_1({Order0_add2_tmp0_pip0 }),
        .in_2({Order0_add2_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order0_add2_tmp_out_stage0)
    );

    ModAdd add0_1_add2(
        .in_1({Order1_add2_tmp0_pip0 }),
        .in_2({Order1_add2_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add2_tmp_out_stage0)
    );
    //3
     ModAdd add0_0_add3(
        .in_1({Order0_add3_tmp0_pip0 }),
        .in_2({Order0_add3_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order0_add3_tmp_out_stage0)
    );

    ModAdd add0_1_add3(
        .in_1({Order1_add3_tmp0_pip0 }),
        .in_2({Order1_add3_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add3_tmp_out_stage0)
    );
    //4
     ModAdd add0_0_add4(
        .in_1({Order0_add4_tmp0_pip0 }),
        .in_2({Order0_add4_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order0_add4_tmp_out_stage0)
    );

    ModAdd add0_1_add4(
        .in_1({Order1_add4_tmp0_pip0 }),
        .in_2({Order1_add4_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add4_tmp_out_stage0)
    );
    //5
     ModAdd add0_0_add5(
        .in_1({Order0_add5_tmp0_pip0 }),
        .in_2({Order0_add5_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order0_add5_tmp_out_stage0)
    );

    ModAdd add0_1_add5(
        .in_1({Order1_add5_tmp0_pip0 }),
        .in_2({Order1_add5_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add5_tmp_out_stage0)
    );
    //6
     ModAdd add0_0_add6(
        .in_1({Order0_add6_tmp0_pip0 }),
        .in_2({Order0_add6_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order0_add6_tmp_out_stage0)
    );

    ModAdd add0_1_add6(
        .in_1({Order1_add6_tmp0_pip0 }),
        .in_2({Order1_add6_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add6_tmp_out_stage0)
    );
    //7
     ModAdd add0_0_add7(
        .in_1({Order0_add7_tmp0_pip0 }),
        .in_2({Order0_add7_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order0_add7_tmp_out_stage0)
    );

    ModAdd add0_1_add7(
        .in_1({Order1_add7_tmp0_pip0 }),
        .in_2({Order1_add7_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add7_tmp_out_stage0)
    );

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            //0
            Order0_tmp2_pip1        <= `D_width'd0;
            Order0_tmp3_pip1        <= `D_width'd0;
            Order0_pip1             <= `D_width'd0;
            Order0_tmp_out_pip0     <= `D_width'd0;   

            Order1_tmp2_pip1        <= `D_width'd0;
            Order1_tmp3_pip1        <= `D_width'd0;
            Order1_pip1             <= `D_width'd0;
            Order1_tmp_out_pip0     <= `D_width'd0;
            //1
            Order0_add1_tmp2_pip1        <= `D_width'd0;
            Order0_add1_tmp3_pip1        <= `D_width'd0;
            Order0_add1_pip1             <= `D_width'd0;
            Order0_add1_tmp_out_pip0     <= `D_width'd0;    

            Order1_add1_tmp2_pip1        <= `D_width'd0;
            Order1_add1_tmp3_pip1        <= `D_width'd0;
            Order1_add1_pip1             <= `D_width'd0;
            Order1_add1_tmp_out_pip0     <= `D_width'd0;
            //2
            Order0_add2_tmp2_pip1        <= `D_width'd0;
            Order0_add2_tmp3_pip1        <= `D_width'd0;
            Order0_add2_pip1             <= `D_width'd0;
            Order0_add2_tmp_out_pip0     <= `D_width'd0;

            Order1_add2_tmp2_pip1        <= `D_width'd0;
            Order1_add2_tmp3_pip1        <= `D_width'd0;
            Order1_add2_pip1             <= `D_width'd0;
            Order1_add2_tmp_out_pip0     <= `D_width'd0;
            //3
            Order0_add3_tmp2_pip1        <= `D_width'd0;
            Order0_add3_tmp3_pip1        <= `D_width'd0;
            Order0_add3_pip1             <= `D_width'd0;
            Order0_add3_tmp_out_pip0     <= `D_width'd0;

            Order1_add3_tmp2_pip1        <= `D_width'd0;
            Order1_add3_tmp3_pip1        <= `D_width'd0;
            Order1_add3_pip1             <= `D_width'd0;
            Order1_add3_tmp_out_pip0     <= `D_width'd0;
            //4
            Order0_add4_tmp2_pip1        <= `D_width'd0;
            Order0_add4_tmp3_pip1        <= `D_width'd0;
            Order0_add4_pip1             <= `D_width'd0;
            Order0_add4_tmp_out_pip0     <= `D_width'd0;

            Order1_add4_tmp2_pip1        <= `D_width'd0;
            Order1_add4_tmp3_pip1        <= `D_width'd0;
            Order1_add4_pip1             <= `D_width'd0;
            Order1_add4_tmp_out_pip0     <= `D_width'd0;
            //5
            Order0_add5_tmp2_pip1        <= `D_width'd0;
            Order0_add5_tmp3_pip1        <= `D_width'd0;
            Order0_add5_pip1             <= `D_width'd0;
            Order0_add5_tmp_out_pip0     <= `D_width'd0;

            Order1_add5_tmp2_pip1        <= `D_width'd0;
            Order1_add5_tmp3_pip1        <= `D_width'd0;
            Order1_add5_pip1             <= `D_width'd0;
            Order1_add5_tmp_out_pip0     <= `D_width'd0;
            //6
            Order0_add6_tmp2_pip1        <= `D_width'd0;
            Order0_add6_tmp3_pip1        <= `D_width'd0;
            Order0_add6_pip1             <= `D_width'd0;
            Order0_add6_tmp_out_pip0     <= `D_width'd0;

            Order1_add6_tmp2_pip1        <= `D_width'd0;
            Order1_add6_tmp3_pip1        <= `D_width'd0;
            Order1_add6_pip1             <= `D_width'd0;
            Order1_add6_tmp_out_pip0     <= `D_width'd0;
            //7
            Order0_add7_tmp2_pip1        <= `D_width'd0;
            Order0_add7_tmp3_pip1        <= `D_width'd0;
            Order0_add7_pip1             <= `D_width'd0;
            Order0_add7_tmp_out_pip0     <= `D_width'd0;

            Order1_add7_tmp2_pip1        <= `D_width'd0;
            Order1_add7_tmp3_pip1        <= `D_width'd0;
            Order1_add7_pip1             <= `D_width'd0;
            Order1_add7_tmp_out_pip0     <= `D_width'd0;

            r_enable_k2_pip1        <= 1'd0;
            AGU_done_k2_pip1        <= 1'd0;

            l_pip1 <= 'd0;
        end else begin
            //0
            Order0_tmp2_pip1        <= Order0_tmp2_pip0;
            Order0_tmp3_pip1        <= Order0_tmp3_pip0;
            Order0_pip1             <= Order0_pip0;
            Order0_tmp_out_pip0     <= {{DW_sub_16{1'b0}}, Order0_tmp_out_stage0[15:0]};       

            Order1_tmp2_pip1        <= Order1_tmp2_pip0;
            Order1_tmp3_pip1        <= Order1_tmp3_pip0;
            Order1_pip1             <= Order1_pip0;
            Order1_tmp_out_pip0     <= {{DW_sub_16{1'b0}}, Order1_tmp_out_stage0[15:0]};   
            //1
            Order0_add1_tmp2_pip1        <= Order0_add1_tmp2_pip0;
            Order0_add1_tmp3_pip1        <= Order0_add1_tmp3_pip0;
            Order0_add1_pip1             <= Order0_add1_pip0;
            Order0_add1_tmp_out_pip0     <= {{DW_sub_16{1'b0}}, Order0_add1_tmp_out_stage0[15:0]};       

            Order1_add1_tmp2_pip1        <= Order1_add1_tmp2_pip0;
            Order1_add1_tmp3_pip1        <= Order1_add1_tmp3_pip0;
            Order1_add1_pip1             <= Order1_add1_pip0;
            Order1_add1_tmp_out_pip0     <= {{DW_sub_16{1'b0}}, Order1_add1_tmp_out_stage0[15:0]}; 
            //2
            Order0_add2_tmp2_pip1        <= Order0_add2_tmp2_pip0;
            Order0_add2_tmp3_pip1        <= Order0_add2_tmp3_pip0;
            Order0_add2_pip1             <= Order0_add2_pip0;
            Order0_add2_tmp_out_pip0     <= {{DW_sub_16{1'b0}}, Order0_add2_tmp_out_stage0[15:0]};       

            Order1_add2_tmp2_pip1        <= Order1_add2_tmp2_pip0;
            Order1_add2_tmp3_pip1        <= Order1_add2_tmp3_pip0;
            Order1_add2_pip1             <= Order1_add2_pip0;
            Order1_add2_tmp_out_pip0     <= {{DW_sub_16{1'b0}}, Order1_add2_tmp_out_stage0[15:0]}; 
            //3
            Order0_add3_tmp2_pip1        <= Order0_add3_tmp2_pip0;
            Order0_add3_tmp3_pip1        <= Order0_add3_tmp3_pip0;
            Order0_add3_pip1             <= Order0_add3_pip0;
            Order0_add3_tmp_out_pip0     <= {{DW_sub_16{1'b0}}, Order0_add3_tmp_out_stage0[15:0]};       

            Order1_add3_tmp2_pip1        <= Order1_add3_tmp2_pip0;
            Order1_add3_tmp3_pip1        <= Order1_add3_tmp3_pip0;
            Order1_add3_pip1             <= Order1_add3_pip0;
            Order1_add3_tmp_out_pip0     <= {{DW_sub_16{1'b0}}, Order1_add3_tmp_out_stage0[15:0]};
            //4
            Order0_add4_tmp2_pip1        <= Order0_add4_tmp2_pip0;
            Order0_add4_tmp3_pip1        <= Order0_add4_tmp3_pip0;
            Order0_add4_pip1             <= Order0_add4_pip0;
            Order0_add4_tmp_out_pip0     <= {{DW_sub_16{1'b0}}, Order0_add4_tmp_out_stage0[15:0]};       

            Order1_add4_tmp2_pip1        <= Order1_add4_tmp2_pip0;
            Order1_add4_tmp3_pip1        <= Order1_add4_tmp3_pip0;
            Order1_add4_pip1             <= Order1_add4_pip0;
            Order1_add4_tmp_out_pip0     <= {{DW_sub_16{1'b0}}, Order1_add4_tmp_out_stage0[15:0]};
            //5
            Order0_add5_tmp2_pip1        <= Order0_add5_tmp2_pip0;
            Order0_add5_tmp3_pip1        <= Order0_add5_tmp3_pip0;
            Order0_add5_pip1             <= Order0_add5_pip0;
            Order0_add5_tmp_out_pip0     <= {{DW_sub_16{1'b0}}, Order0_add5_tmp_out_stage0[15:0]};       

            Order1_add5_tmp2_pip1        <= Order1_add5_tmp2_pip0;
            Order1_add5_tmp3_pip1        <= Order1_add5_tmp3_pip0;
            Order1_add5_pip1             <= Order1_add5_pip0;
            Order1_add5_tmp_out_pip0     <= {{DW_sub_16{1'b0}}, Order1_add5_tmp_out_stage0[15:0]};
            //6
            Order0_add6_tmp2_pip1        <= Order0_add6_tmp2_pip0;
            Order0_add6_tmp3_pip1        <= Order0_add6_tmp3_pip0;
            Order0_add6_pip1             <= Order0_add6_pip0;
            Order0_add6_tmp_out_pip0     <= {{DW_sub_16{1'b0}}, Order0_add6_tmp_out_stage0[15:0]};       

            Order1_add6_tmp2_pip1        <= Order1_add6_tmp2_pip0;
            Order1_add6_tmp3_pip1        <= Order1_add6_tmp3_pip0;
            Order1_add6_pip1             <= Order1_add6_pip0;
            Order1_add6_tmp_out_pip0     <= {{DW_sub_16{1'b0}}, Order1_add6_tmp_out_stage0[15:0]};
            //7
            Order0_add7_tmp2_pip1        <= Order0_add7_tmp2_pip0;
            Order0_add7_tmp3_pip1        <= Order0_add7_tmp3_pip0;
            Order0_add7_pip1             <= Order0_add7_pip0;
            Order0_add7_tmp_out_pip0     <= {{DW_sub_16{1'b0}}, Order0_add7_tmp_out_stage0[15:0]};       

            Order1_add7_tmp2_pip1        <= Order1_add7_tmp2_pip0;
            Order1_add7_tmp3_pip1        <= Order1_add7_tmp3_pip0;
            Order1_add7_pip1             <= Order1_add7_pip0;
            Order1_add7_tmp_out_pip0     <= {{DW_sub_16{1'b0}}, Order1_add7_tmp_out_stage0[15:0]};

            r_enable_k2_pip1        <= r_enable_k2_pip0;
            AGU_done_k2_pip1        <= AGU_done_k2_pip0;
            l_pip1 <= l_pip0;
        end
    end

    //0
    ModAdd add1_0(
    .in_1({Order0_tmp_out_pip0}),
    .in_2({Order0_tmp2_pip1 }),
    .modulus(`D_width'd`Radix),
    .out(Order0_tmp_out_stage1)
    );

    ModAdd add1_1(
        .in_1({Order1_tmp_out_pip0}),
        .in_2({Order1_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_tmp_out_stage1)
    );
    //1
    ModAdd add1_0_add1(
    .in_1({Order0_add1_tmp_out_pip0}),
    .in_2({Order0_add1_tmp2_pip1 }),
    .modulus(`D_width'd`Radix),
    .out(Order0_add1_tmp_out_stage1)
    );

    ModAdd add1_1_add1(
        .in_1({Order1_add1_tmp_out_pip0}),
        .in_2({Order1_add1_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add1_tmp_out_stage1)
    );
    //2
    ModAdd add1_0_add2(
    .in_1({Order0_add2_tmp_out_pip0}),
    .in_2({Order0_add2_tmp2_pip1 }),
    .modulus(`D_width'd`Radix),
    .out(Order0_add2_tmp_out_stage1)
    );

    ModAdd add1_1_add2(
        .in_1({Order1_add2_tmp_out_pip0}),
        .in_2({Order1_add2_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add2_tmp_out_stage1)
    );
    //3
    ModAdd add1_0_add3(
    .in_1({Order0_add3_tmp_out_pip0}),
    .in_2({Order0_add3_tmp2_pip1 }),
    .modulus(`D_width'd`Radix),
    .out(Order0_add3_tmp_out_stage1)
    );

    ModAdd add1_1_add3(
        .in_1({Order1_add3_tmp_out_pip0}),
        .in_2({Order1_add3_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add3_tmp_out_stage1)
    );
    //4
    ModAdd add1_0_add4(
    .in_1({Order0_add4_tmp_out_pip0}),
    .in_2({Order0_add4_tmp2_pip1 }),
    .modulus(`D_width'd`Radix),
    .out(Order0_add4_tmp_out_stage1)
    );

    ModAdd add1_1_add4(
        .in_1({Order1_add4_tmp_out_pip0}),
        .in_2({Order1_add4_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add4_tmp_out_stage1)
    );
    //5
    ModAdd add1_0_add5(
    .in_1({Order0_add5_tmp_out_pip0}),
    .in_2({Order0_add5_tmp2_pip1 }),
    .modulus(`D_width'd`Radix),
    .out(Order0_add5_tmp_out_stage1)
    );

    ModAdd add1_1_add5(
        .in_1({Order1_add5_tmp_out_pip0}),
        .in_2({Order1_add5_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add5_tmp_out_stage1)
    );
    //6
    ModAdd add1_0_add6(
    .in_1({Order0_add6_tmp_out_pip0}),
    .in_2({Order0_add6_tmp2_pip1 }),
    .modulus(`D_width'd`Radix),
    .out(Order0_add6_tmp_out_stage1)
    );

    ModAdd add1_1_add6(
        .in_1({Order1_add6_tmp_out_pip0}),
        .in_2({Order1_add6_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add6_tmp_out_stage1)
    );
    //7
    ModAdd add1_0_add7(
    .in_1({Order0_add7_tmp_out_pip0}),
    .in_2({Order0_add7_tmp2_pip1 }),
    .modulus(`D_width'd`Radix),
    .out(Order0_add7_tmp_out_stage1)
    );

    ModAdd add1_1_add7(
        .in_1({Order1_add7_tmp_out_pip0}),
        .in_2({Order1_add7_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add7_tmp_out_stage1)
    );

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            //0
            Order0_tmp3_pip2    <= `D_width'd0;
            Order0_pip2         <= `D_width'd0;
            Order0_tmp_out_pip1 <= `D_width'd0;

            Order1_tmp3_pip2    <= `D_width'd0;
            Order1_pip2         <= `D_width'd0;
            Order1_tmp_out_pip1 <= `D_width'd0;
            //1
            Order0_add1_tmp3_pip2    <= `D_width'd0;
            Order0_add1_pip2         <= `D_width'd0;
            Order0_add1_tmp_out_pip1 <= `D_width'd0;
            Order1_add1_tmp3_pip2    <= `D_width'd0;
            Order1_add1_pip2         <= `D_width'd0;
            Order1_add1_tmp_out_pip1 <= `D_width'd0;
            //2
            Order0_add2_tmp3_pip2    <= `D_width'd0;
            Order0_add2_pip2         <= `D_width'd0;
            Order0_add2_tmp_out_pip1 <= `D_width'd0;
            Order1_add2_tmp3_pip2    <= `D_width'd0;
            Order1_add2_pip2         <= `D_width'd0;
            Order1_add2_tmp_out_pip1 <= `D_width'd0;
            //3
            Order0_add3_tmp3_pip2    <= `D_width'd0;
            Order0_add3_pip2         <= `D_width'd0;
            Order0_add3_tmp_out_pip1 <= `D_width'd0;
            Order1_add3_tmp3_pip2    <= `D_width'd0;
            Order1_add3_pip2         <= `D_width'd0;
            Order1_add3_tmp_out_pip1 <= `D_width'd0;
            //4
            Order0_add4_tmp3_pip2    <= `D_width'd0;
            Order0_add4_pip2         <= `D_width'd0;
            Order0_add4_tmp_out_pip1 <= `D_width'd0;
            Order1_add4_tmp3_pip2    <= `D_width'd0;
            Order1_add4_pip2         <= `D_width'd0;
            Order1_add4_tmp_out_pip1 <= `D_width'd0;
            //5
            Order0_add5_tmp3_pip2    <= `D_width'd0;
            Order0_add5_pip2         <= `D_width'd0;
            Order0_add5_tmp_out_pip1 <= `D_width'd0;
            Order1_add5_tmp3_pip2    <= `D_width'd0;
            Order1_add5_pip2         <= `D_width'd0;
            Order1_add5_tmp_out_pip1 <= `D_width'd0;
            //6
            Order0_add6_tmp3_pip2    <= `D_width'd0;
            Order0_add6_pip2         <= `D_width'd0;
            Order0_add6_tmp_out_pip1 <= `D_width'd0;
            Order1_add6_tmp3_pip2    <= `D_width'd0;
            Order1_add6_pip2         <= `D_width'd0;
            Order1_add6_tmp_out_pip1 <= `D_width'd0;
            //7
            Order0_add7_tmp3_pip2    <= `D_width'd0;
            Order0_add7_pip2         <= `D_width'd0;
            Order0_add7_tmp_out_pip1 <= `D_width'd0;
            Order1_add7_tmp3_pip2    <= `D_width'd0;
            Order1_add7_pip2         <= `D_width'd0;
            Order1_add7_tmp_out_pip1 <= `D_width'd0;

            r_enable_k2_pip2 <= 1'd0;
            AGU_done_k2_pip2 <= 1'd0;
            l_pip2 <= 'd0;
        end else begin
            //0
            Order0_tmp3_pip2    <= Order0_tmp3_pip1;
            Order0_pip2         <= Order0_pip1 >> `delta;
            Order0_tmp_out_pip1 <= {{DW_sub_16{1'b0}}, Order0_tmp_out_stage1[15:0]};

            Order1_tmp3_pip2    <= Order1_tmp3_pip1;
            Order1_pip2         <= Order1_pip1 >> `delta;
            Order1_tmp_out_pip1 <= {{DW_sub_16{1'b0}}, Order1_tmp_out_stage1[15:0]};
            //1
            Order0_add1_tmp3_pip2    <= Order0_add1_tmp3_pip1;
            Order0_add1_pip2         <= Order0_add1_pip1 >> `delta;
            Order0_add1_tmp_out_pip1 <= {{DW_sub_16{1'b0}}, Order0_add1_tmp_out_stage1[15:0]};
            Order1_add1_tmp3_pip2    <= Order1_add1_tmp3_pip1;
            Order1_add1_pip2         <= Order1_add1_pip1 >> `delta;
            Order1_add1_tmp_out_pip1 <= {{DW_sub_16{1'b0}}, Order1_add1_tmp_out_stage1[15:0]};
            //2
            Order0_add2_tmp3_pip2    <= Order0_add2_tmp3_pip1;
            Order0_add2_pip2         <= Order0_add2_pip1 >> `delta;
            Order0_add2_tmp_out_pip1 <= {{DW_sub_16{1'b0}}, Order0_add2_tmp_out_stage1[15:0]};
            Order1_add2_tmp3_pip2    <= Order1_add2_tmp3_pip1;
            Order1_add2_pip2         <= Order1_add2_pip1 >> `delta;
            Order1_add2_tmp_out_pip1 <= {{DW_sub_16{1'b0}}, Order1_add2_tmp_out_stage1[15:0]};
            //3
            Order0_add3_tmp3_pip2    <= Order0_add3_tmp3_pip1;
            Order0_add3_pip2         <= Order0_add3_pip1 >> `delta;
            Order0_add3_tmp_out_pip1 <= {{DW_sub_16{1'b0}}, Order0_add3_tmp_out_stage1[15:0]};
            Order1_add3_tmp3_pip2    <= Order1_add3_tmp3_pip1;
            Order1_add3_pip2         <= Order1_add3_pip1 >> `delta;
            Order1_add3_tmp_out_pip1 <= {{DW_sub_16{1'b0}}, Order1_add3_tmp_out_stage1[15:0]};
            //4
            Order0_add4_tmp3_pip2    <= Order0_add4_tmp3_pip1;
            Order0_add4_pip2         <= Order0_add4_pip1 >> `delta;
            Order0_add4_tmp_out_pip1 <= {{DW_sub_16{1'b0}}, Order0_add4_tmp_out_stage1[15:0]};
            Order1_add4_tmp3_pip2    <= Order1_add4_tmp3_pip1;
            Order1_add4_pip2         <= Order1_add4_pip1 >> `delta;
            Order1_add4_tmp_out_pip1 <= {{DW_sub_16{1'b0}}, Order1_add4_tmp_out_stage1[15:0]};
            //5
            Order0_add5_tmp3_pip2    <= Order0_add5_tmp3_pip1;
            Order0_add5_pip2         <= Order0_add5_pip1 >> `delta;
            Order0_add5_tmp_out_pip1 <= {{DW_sub_16{1'b0}}, Order0_add5_tmp_out_stage1[15:0]};
            Order1_add5_tmp3_pip2    <= Order1_add5_tmp3_pip1;
            Order1_add5_pip2         <= Order1_add5_pip1 >> `delta;
            Order1_add5_tmp_out_pip1 <= {{DW_sub_16{1'b0}}, Order1_add5_tmp_out_stage1[15:0]};
            //6
            Order0_add6_tmp3_pip2    <= Order0_add6_tmp3_pip1;
            Order0_add6_pip2         <= Order0_add6_pip1 >> `delta;
            Order0_add6_tmp_out_pip1 <= {{DW_sub_16{1'b0}}, Order0_add6_tmp_out_stage1[15:0]};
            Order1_add6_tmp3_pip2    <= Order1_add6_tmp3_pip1;
            Order1_add6_pip2         <= Order1_add6_pip1 >> `delta;
            Order1_add6_tmp_out_pip1 <= {{DW_sub_16{1'b0}}, Order1_add6_tmp_out_stage1[15:0]};
            //7
            Order0_add7_tmp3_pip2    <= Order0_add7_tmp3_pip1;
            Order0_add7_pip2         <= Order0_add7_pip1 >> `delta;
            Order0_add7_tmp_out_pip1 <= {{DW_sub_16{1'b0}}, Order0_add7_tmp_out_stage1[15:0]};
            Order1_add7_tmp3_pip2    <= Order1_add7_tmp3_pip1;
            Order1_add7_pip2         <= Order1_add7_pip1 >> `delta;
            Order1_add7_tmp_out_pip1 <= {{DW_sub_16{1'b0}}, Order1_add7_tmp_out_stage1[15:0]};

            r_enable_k2_pip2    <= r_enable_k2_pip1;
            AGU_done_k2_pip2    <= AGU_done_k2_pip1;
            l_pip2 <= l_pip1;
        end
    end

    //0
    ModAdd add2_0(
        .in_1({ Order0_tmp_out_pip1 }),
        .in_2({ Order0_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order0_tmp_out_stage2)
    );

    ModAdd add2_1(
        .in_1({ Order1_tmp_out_pip1 }),
        .in_2({ Order1_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_tmp_out_stage2)
    );
    //1
    ModAdd add2_0_add1(
        .in_1({ Order0_add1_tmp_out_pip1 }),
        .in_2({ Order0_add1_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order0_add1_tmp_out_stage2)
    );

    ModAdd add2_1_add1(
        .in_1({ Order1_add1_tmp_out_pip1 }),
        .in_2({ Order1_add1_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add1_tmp_out_stage2)
    );
    //2
    ModAdd add2_0_add2(
        .in_1({ Order0_add2_tmp_out_pip1 }),
        .in_2({ Order0_add2_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order0_add2_tmp_out_stage2)
    );

    ModAdd add2_1_add2(
        .in_1({ Order1_add2_tmp_out_pip1 }),
        .in_2({ Order1_add2_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add2_tmp_out_stage2)
    );
    //3
    ModAdd add2_0_add3(
        .in_1({ Order0_add3_tmp_out_pip1 }),
        .in_2({ Order0_add3_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order0_add3_tmp_out_stage2)
    );

    ModAdd add2_1_add3(
        .in_1({ Order1_add3_tmp_out_pip1 }),
        .in_2({ Order1_add3_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add3_tmp_out_stage2)
    );
    //4
    ModAdd add2_0_add4(
        .in_1({ Order0_add4_tmp_out_pip1 }),
        .in_2({ Order0_add4_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order0_add4_tmp_out_stage2)
    );

    ModAdd add2_1_add4(
        .in_1({ Order1_add4_tmp_out_pip1 }),
        .in_2({ Order1_add4_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add4_tmp_out_stage2)
    );
    //5
    ModAdd add2_0_add5(
        .in_1({ Order0_add5_tmp_out_pip1 }),
        .in_2({ Order0_add5_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order0_add5_tmp_out_stage2)
    );

    ModAdd add2_1_add5(
        .in_1({ Order1_add5_tmp_out_pip1 }),
        .in_2({ Order1_add5_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add5_tmp_out_stage2)
    );
    //6
    ModAdd add2_0_add6(
        .in_1({ Order0_add6_tmp_out_pip1 }),
        .in_2({ Order0_add6_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order0_add6_tmp_out_stage2)
    );

    ModAdd add2_1_add6(
        .in_1({ Order1_add6_tmp_out_pip1 }),
        .in_2({ Order1_add6_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add6_tmp_out_stage2)
    );
    //7
    ModAdd add2_0_add7(
        .in_1({ Order0_add7_tmp_out_pip1 }),
        .in_2({ Order0_add7_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order0_add7_tmp_out_stage2)
    );

    ModAdd add2_1_add7(
        .in_1({ Order1_add7_tmp_out_pip1 }),
        .in_2({ Order1_add7_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_add7_tmp_out_stage2)
    );

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            MA0_idx_k2  <= {`MA_width{1'd0}};
            BN0_idx_k2  <= {`BANK_width{1'd0}};

            MA1_idx_k2  <= {`MA_width{1'd0}};
            BN1_idx_k2  <= {`BANK_width{1'd0}};
             //1
            MA0_idx_k2_add1  <= {`MA_width{1'd0}};
            BN0_idx_k2_add1  <= {`BANK_width{1'd0}};
            MA1_idx_k2_add1  <= {`MA_width{1'd0}};
            BN1_idx_k2_add1  <= {`BANK_width{1'd0}};
            //2
            MA0_idx_k2_add2  <= {`MA_width{1'd0}};
            BN0_idx_k2_add2  <= {`BANK_width{1'd0}};
            MA1_idx_k2_add2  <= {`MA_width{1'd0}};
            BN1_idx_k2_add2  <= {`BANK_width{1'd0}};
            //3
            MA0_idx_k2_add3  <= {`MA_width{1'd0}};
            BN0_idx_k2_add3  <= {`BANK_width{1'd0}};
            MA1_idx_k2_add3  <= {`MA_width{1'd0}};
            BN1_idx_k2_add3  <= {`BANK_width{1'd0}};
            //4
            MA0_idx_k2_add4  <= {`MA_width{1'd0}};
            BN0_idx_k2_add4  <= {`BANK_width{1'd0}};
            MA1_idx_k2_add4  <= {`MA_width{1'd0}};
            BN1_idx_k2_add4  <= {`BANK_width{1'd0}};
            //5
            MA0_idx_k2_add5  <= {`MA_width{1'd0}};
            BN0_idx_k2_add5  <= {`BANK_width{1'd0}};
            MA1_idx_k2_add5  <= {`MA_width{1'd0}};
            BN1_idx_k2_add5  <= {`BANK_width{1'd0}};
            //6
            MA0_idx_k2_add6  <= {`MA_width{1'd0}};
            BN0_idx_k2_add6  <= {`BANK_width{1'd0}};
            MA1_idx_k2_add6  <= {`MA_width{1'd0}};
            BN1_idx_k2_add6  <= {`BANK_width{1'd0}};
            //7
            MA0_idx_k2_add7  <= {`MA_width{1'd0}};
            BN0_idx_k2_add7  <= {`BANK_width{1'd0}};
            MA1_idx_k2_add7  <= {`MA_width{1'd0}};
            BN1_idx_k2_add7  <= {`BANK_width{1'd0}};


            AGU_done_out_k2 <= 1'd0;
            BN_MA_out_en_k2 <= 1'd0;
            l_AGU_out_k2 <= 'd0;
        end else begin
            if (r_enable_k2_pip2) begin
                //0
                MA0_idx_k2  <= Order0_pip2[`MA_width-1:0];
                BN0_idx_k2  <= Order0_tmp_out_stage2[`BANK_width-1:0];

                MA1_idx_k2  <= Order1_pip2[`MA_width-1:0];
                BN1_idx_k2  <= Order1_tmp_out_stage2[`BANK_width-1:0];
                //1
                MA0_idx_k2_add1  <= Order0_add1_pip2[`MA_width-1:0];
                BN0_idx_k2_add1  <= Order0_add1_tmp_out_stage2[`BANK_width-1:0];
                MA1_idx_k2_add1  <= Order1_add1_pip2[`MA_width-1:0];
                BN1_idx_k2_add1  <= Order1_add1_tmp_out_stage2[`BANK_width-1:0];
                //2
                MA0_idx_k2_add2  <= Order0_add2_pip2[`MA_width-1:0];
                BN0_idx_k2_add2  <= Order0_add2_tmp_out_stage2[`BANK_width-1:0];
                MA1_idx_k2_add2  <= Order1_add2_pip2[`MA_width-1:0];
                BN1_idx_k2_add2  <= Order1_add2_tmp_out_stage2[`BANK_width-1:0];
                //3
                MA0_idx_k2_add3  <= Order0_add3_pip2[`MA_width-1:0];
                BN0_idx_k2_add3  <= Order0_add3_tmp_out_stage2[`BANK_width-1:0];
                MA1_idx_k2_add3  <= Order1_add3_pip2[`MA_width-1:0];
                BN1_idx_k2_add3  <= Order1_add3_tmp_out_stage2[`BANK_width-1:0];
                //4
                MA0_idx_k2_add4  <= Order0_add4_pip2[`MA_width-1:0];
                BN0_idx_k2_add4  <= Order0_add4_tmp_out_stage2[`BANK_width-1:0];
                MA1_idx_k2_add4  <= Order1_add4_pip2[`MA_width-1:0];
                BN1_idx_k2_add4  <= Order1_add4_tmp_out_stage2[`BANK_width-1:0];
                //5
                MA0_idx_k2_add5  <= Order0_add5_pip2[`MA_width-1:0];
                BN0_idx_k2_add5  <= Order0_add5_tmp_out_stage2[`BANK_width-1:0];
                MA1_idx_k2_add5  <= Order1_add5_pip2[`MA_width-1:0];
                BN1_idx_k2_add5  <= Order1_add5_tmp_out_stage2[`BANK_width-1:0];
                //6
                MA0_idx_k2_add6  <= Order0_add6_pip2[`MA_width-1:0];
                BN0_idx_k2_add6  <= Order0_add6_tmp_out_stage2[`BANK_width-1:0];
                MA1_idx_k2_add6  <= Order1_add6_pip2[`MA_width-1:0];
                BN1_idx_k2_add6  <= Order1_add6_tmp_out_stage2[`BANK_width-1:0];
                //7
                MA0_idx_k2_add7  <= Order0_add7_pip2[`MA_width-1:0];
                BN0_idx_k2_add7  <= Order0_add7_tmp_out_stage2[`BANK_width-1:0];
                MA1_idx_k2_add7  <= Order1_add7_pip2[`MA_width-1:0];
                BN1_idx_k2_add7  <= Order1_add7_tmp_out_stage2[`BANK_width-1:0];

                AGU_done_out_k2 <= AGU_done_k2_pip2;
                BN_MA_out_en_k2 <= 1'd1;
                l_AGU_out_k2 <= l_pip2;
            end else begin
                MA0_idx_k2  <= {`MA_width{1'd0}};
                BN0_idx_k2  <= {`BANK_width{1'd0}};

                MA1_idx_k2  <= {`MA_width{1'd0}};
                BN1_idx_k2  <= {`BANK_width{1'd0}};
                //1
                MA0_idx_k2_add1  <= {`MA_width{1'd0}};
                BN0_idx_k2_add1  <= {`BANK_width{1'd0}};
                MA1_idx_k2_add1  <= {`MA_width{1'd0}};
                BN1_idx_k2_add1  <= {`BANK_width{1'd0}};
                //2
                MA0_idx_k2_add2  <= {`MA_width{1'd0}};
                BN0_idx_k2_add2  <= {`BANK_width{1'd0}};
                MA1_idx_k2_add2  <= {`MA_width{1'd0}};
                BN1_idx_k2_add2  <= {`BANK_width{1'd0}};
                //3
                MA0_idx_k2_add3  <= {`MA_width{1'd0}};
                BN0_idx_k2_add3  <= {`BANK_width{1'd0}};
                MA1_idx_k2_add3  <= {`MA_width{1'd0}};
                BN1_idx_k2_add3  <= {`BANK_width{1'd0}};
                //4
                MA0_idx_k2_add4  <= {`MA_width{1'd0}};
                BN0_idx_k2_add4  <= {`BANK_width{1'd0}};
                MA1_idx_k2_add4  <= {`MA_width{1'd0}};
                BN1_idx_k2_add4  <= {`BANK_width{1'd0}};
                //5
                MA0_idx_k2_add5  <= {`MA_width{1'd0}};
                BN0_idx_k2_add5  <= {`BANK_width{1'd0}};
                MA1_idx_k2_add5  <= {`MA_width{1'd0}};
                BN1_idx_k2_add5  <= {`BANK_width{1'd0}};
                //6
                MA0_idx_k2_add6  <= {`MA_width{1'd0}};
                BN0_idx_k2_add6  <= {`BANK_width{1'd0}};
                MA1_idx_k2_add6  <= {`MA_width{1'd0}};
                BN1_idx_k2_add6  <= {`BANK_width{1'd0}};
                //7
                MA0_idx_k2_add7  <= {`MA_width{1'd0}};
                BN0_idx_k2_add7  <= {`BANK_width{1'd0}};
                MA1_idx_k2_add7  <= {`MA_width{1'd0}};
                BN1_idx_k2_add7  <= {`BANK_width{1'd0}};

                AGU_done_out_k2 <= 1'd0;
                BN_MA_out_en_k2 <= 1'd0;
                l_AGU_out_k2 <= 'd0;
            end
        end
    end


endmodule