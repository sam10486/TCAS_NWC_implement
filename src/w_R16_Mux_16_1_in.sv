`include "../include/define.svh"

module w_R16_Mux_16_1_in (
    input [`MA_width-1:0] A_0    ,
    input [`MA_width-1:0] A_1    ,
    input [`MA_width-1:0] A_2    ,
    input [`MA_width-1:0] A_3    ,
    input [`MA_width-1:0] A_4    ,
    input [`MA_width-1:0] A_5    ,
    input [`MA_width-1:0] A_6    ,
    input [`MA_width-1:0] A_7    ,
    input [`MA_width-1:0] A_8    ,
    input [`MA_width-1:0] A_9    ,
    input [`MA_width-1:0] A_10   ,
    input [`MA_width-1:0] A_11   ,
    input [`MA_width-1:0] A_12   ,
    input [`MA_width-1:0] A_13   ,
    input [`MA_width-1:0] A_14   ,
    input [`MA_width-1:0] A_15   ,

    input [`D_width-1:0] D_0    ,
    input [`D_width-1:0] D_1    ,
    input [`D_width-1:0] D_2    ,
    input [`D_width-1:0] D_3    ,
    input [`D_width-1:0] D_4    ,
    input [`D_width-1:0] D_5    ,
    input [`D_width-1:0] D_6    ,
    input [`D_width-1:0] D_7    ,
    input [`D_width-1:0] D_8    ,
    input [`D_width-1:0] D_9    ,
    input [`D_width-1:0] D_10   ,
    input [`D_width-1:0] D_11   ,
    input [`D_width-1:0] D_12   ,
    input [`D_width-1:0] D_13   ,
    input [`D_width-1:0] D_14   ,
    input [`D_width-1:0] D_15   ,
    input [4:0] sel_in          ,
    input w_enable              ,
    
    output logic CEN_out,
    output logic [`MA_width-1:0] A_out,
    output logic [`D_width-1:0] D_out,
    output logic WEN_out
  
);
    always_comb begin
        case (sel_in)
            'd0: begin
                if (w_enable) begin
                    CEN_out = 'd0;
                end else begin
                    CEN_out = 'd1;
                end
                A_out = A_0;
                D_out = D_0;
                WEN_out = ~w_enable;
            end 
            'd1: begin
                if (w_enable) begin
                    CEN_out = 'd0;
                end else begin
                    CEN_out = 'd1;
                end
                A_out = A_1;
                D_out = D_1;
                WEN_out = ~w_enable;
            end
            'd2: begin
                if (w_enable) begin
                    CEN_out = 'd0;
                end else begin
                    CEN_out = 'd1;
                end
                A_out = A_2;
                D_out = D_2;
                WEN_out = ~w_enable;
            end
            'd3: begin
                if (w_enable) begin
                    CEN_out = 'd0;
                end else begin
                    CEN_out = 'd1;
                end
                A_out = A_3;
                D_out = D_3;
                WEN_out = ~w_enable;
            end
            'd4: begin
                if (w_enable) begin
                    CEN_out = 'd0;
                end else begin
                    CEN_out = 'd1;
                end
                A_out = A_4;
                D_out = D_4;
                WEN_out = ~w_enable;
            end
            'd5: begin
                if (w_enable) begin
                    CEN_out = 'd0;
                end else begin
                    CEN_out = 'd1;
                end
                A_out = A_5;
                D_out = D_5;
                WEN_out = ~w_enable;
            end
            'd6: begin
                if (w_enable) begin
                    CEN_out = 'd0;
                end else begin
                    CEN_out = 'd1;
                end
                A_out = A_6;
                D_out = D_6;
                WEN_out = ~w_enable;
            end
            'd7: begin
                if (w_enable) begin
                    CEN_out = 'd0;
                end else begin
                    CEN_out = 'd1;
                end
                A_out = A_7;
                D_out = D_7;
                WEN_out = ~w_enable;
            end
            'd8: begin
                if (w_enable) begin
                    CEN_out = 'd0;
                end else begin
                    CEN_out = 'd1;
                end
                A_out = A_8;
                D_out = D_8;
                WEN_out = ~w_enable;
            end
            'd9: begin
                if (w_enable) begin
                    CEN_out = 'd0;
                end else begin
                    CEN_out = 'd1;
                end
                A_out = A_9;
                D_out = D_9;
                WEN_out = ~w_enable;
            end
            'd10: begin
                if (w_enable) begin
                    CEN_out = 'd0;
                end else begin
                    CEN_out = 'd1;
                end
                A_out = A_10;
                D_out = D_10;
                WEN_out = ~w_enable;
            end
            'd11: begin
                if (w_enable) begin
                    CEN_out = 'd0;
                end else begin
                    CEN_out = 'd1;
                end
                A_out = A_11;
                D_out = D_11;
                WEN_out = ~w_enable;
            end
            'd12: begin
                if (w_enable) begin
                    CEN_out = 'd0;
                end else begin
                    CEN_out = 'd1;
                end
                A_out = A_12;
                D_out = D_12;
                WEN_out = ~w_enable;
            end
            'd13: begin
                if (w_enable) begin
                    CEN_out = 'd0;
                end else begin
                    CEN_out = 'd1;
                end
                A_out = A_13;
                D_out = D_13;
                WEN_out = ~w_enable;
            end
            'd14: begin
                if (w_enable) begin
                    CEN_out = 'd0;
                end else begin
                    CEN_out = 'd1;
                end
                A_out = A_14;
                D_out = D_14;
                WEN_out = ~w_enable;
            end
            'd15: begin
                if (w_enable) begin
                    CEN_out = 'd0;
                end else begin
                    CEN_out = 'd1;
                end
                A_out = A_15;
                D_out = D_15;
                WEN_out = ~w_enable;
            end
            default: begin
                CEN_out = 'd1; //off
                A_out = 'd0;
                D_out = 'd0;
                WEN_out = 'd1;
            end
        endcase
    end
endmodule