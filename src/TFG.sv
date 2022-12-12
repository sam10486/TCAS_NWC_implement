`include "../include/define.svh"
//`include "MulMod.sv"

module TFG (
    input [`D_width-1:0] W_B        ,
    input [`D_width-1:0] W_C        ,
    input [`D_width-1:0] Moulus     ,
    input [`D_width-1:0] ite_sw_cnt , 
    input TF_wen                    ,
    input TF_ren                    ,
    input clk                       ,  
    input rst                       ,
    input [2:0] l                   ,

    output logic [`D_width-1:0] result

);

    logic [`D_width-1:0] Mul_A_in;
    logic [`D_width-1:0] Mul_B_in;
    logic [`D_width-1:0] Mul_ans;
    logic [`D_width-1:0] A_in_reg;
    logic flag_pip0, flag_pip1, flag_pip2;
    logic [`D_width-1:0] cnt;
    logic by_pass_flag;
    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            cnt <= 'd0;
        end else begin
            if (TF_ren) begin
                cnt <= cnt + 'd1;
            end else begin
                cnt <= 'd0;
            end
        end
    end
    always_comb begin
        if (cnt == 'd1) begin
            by_pass_flag = 'd1;
        end else begin
            by_pass_flag = 'd0;
        end
    end

    always_comb begin 
        if (TF_wen) begin
            Mul_B_in = W_C;
        end else begin
            Mul_B_in = 'd1;
        end
    end

    always_ff @( posedge clk or posedge rst ) begin 
        if (rst) begin
        end else begin
            if (ite_sw_cnt == 'd5) begin
                case (l)
                    'd0: A_in_reg <= W_B;
                    'd1: A_in_reg <= W_B;
                    'd2: A_in_reg <= W_B;
                    default: A_in_reg <= W_B;
                endcase
            end else begin
                if (flag_pip2) begin
                    A_in_reg <= Mul_ans;
                end
            end
        end
    end

    always_comb begin
        if (by_pass_flag) begin
            Mul_A_in = W_B;
        end else if (l == 'd2 && cnt < 'd5 && cnt > 'd1) begin
            Mul_A_in = W_B;
        end else if (l == 'd4 && cnt < 'd5 && cnt > 'd1) begin
            Mul_A_in = W_B;
        end else begin
            Mul_A_in = A_in_reg;
        end
    end

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            flag_pip0 <= 'd0;
            flag_pip1 <= 'd0;
            flag_pip2 <= 'd0;
        end else begin
            if (TF_wen) begin
                flag_pip0 <= TF_wen;
            end else begin
                flag_pip0 <= 'd0;
            end
            flag_pip1 <= flag_pip0;
            flag_pip2 <= flag_pip1;
        end
    end

    //---------
    MulMod MulMod(
        .A_in       (Mul_A_in      ),
        .B_in       (Mul_B_in      ),
        .modulus    (Moulus      ),
        .clk        (clk      ),
        .rst        (rst      ),

        .result     (Mul_ans      )
    );
    //--------------

    always_comb begin
        result = Mul_A_in;
    end
endmodule