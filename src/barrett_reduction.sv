`include "../include/define.svh"

module barrett_reduction (
    S_in,
    modulus,
    clk,
    rst,
    
    result

);
    parameter DATA_WIDTH = `D_width; //8
    parameter MODULUS_WIDTH = `Modulus_D_width;
    parameter DOUBLE_DATA_WIDTH = 2 * DATA_WIDTH;//16
    parameter alpha = MODULUS_WIDTH + 1;//9
    parameter beta = -2;
    parameter RS_FRI = MODULUS_WIDTH + beta;//6
    parameter RS_SEC = alpha - beta;//11
    parameter pre_computing_width = `pre_computing_width;//13
    parameter DATA_FRI_RS_WIDTH = DOUBLE_DATA_WIDTH - RS_FRI;//10
    parameter DATA_MULT_PRE_WIDTH = DATA_FRI_RS_WIDTH + pre_computing_width;//23
    parameter precompute  = `precompute;

    input [DOUBLE_DATA_WIDTH-1:0] S_in;
    input [DATA_WIDTH-1:0] modulus;
    input clk;
    input rst;

    output logic [DATA_WIDTH-1:0] result;


    logic [DOUBLE_DATA_WIDTH-1:0] a_mul_b;//16
    logic [DATA_FRI_RS_WIDTH-1:0] a_mul_b_RS;//10
    logic [DATA_MULT_PRE_WIDTH-1:0] a_mul_b_RS_mul_precompute;//23
    logic [DATA_WIDTH:0] Q;
    logic [DOUBLE_DATA_WIDTH-1:0] QM;
    logic [DATA_WIDTH:0] C_Minus_QM;
    logic [DATA_WIDTH:0] C_Minus_QM_1;
    logic [DATA_WIDTH-1:0]C_Minus_QM_MUX;

    logic [DATA_MULT_PRE_WIDTH-1:0] af_pre_delay1;
    logic [DOUBLE_DATA_WIDTH-1:0] S_in_delay1;
    logic [`D_width-1:0] modulus_reg_delay1; 
    

    always_comb begin
        a_mul_b_RS = S_in >> RS_FRI;
        a_mul_b_RS_mul_precompute = a_mul_b_RS * precompute;
        // pipeline
        Q = af_pre_delay1 >> RS_SEC;
        QM = Q * modulus_reg_delay1;
        //adder part
        C_Minus_QM = S_in_delay1 - QM;
        C_Minus_QM_1 = C_Minus_QM - modulus_reg_delay1;
        C_Minus_QM_MUX   = ((C_Minus_QM_1[DATA_WIDTH] == 1'b1)) ? C_Minus_QM : C_Minus_QM_1; 
    end
    
    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            result <= 'd0;
            modulus_reg_delay1 <= 'd0;
            af_pre_delay1 <= 'd0;
            S_in_delay1 <= 'd0;
        end else begin
            result <= C_Minus_QM_MUX;
            modulus_reg_delay1 <= modulus;
            af_pre_delay1 <= a_mul_b_RS_mul_precompute;
            S_in_delay1 <= S_in;
        end
    end
endmodule