`include "../include/define.svh"
`include "ModAdd.sv"
`include "ModSub.sv"
`include "MulMod.sv"

module BU2_NWC (
    input [`D_width-1:0] in1,
    input [`D_width-1:0] in2,
    input [`D_width-1:0] twiddle,
    input [`D_width-1:0] modulus,
    input rst,
    input clk,

    output logic [`D_width-1:0] BU_a,
    output logic [`D_width-1:0] BU_b,
    output logic [`D_width-1:0] twiddle_BU_out,
    output logic [`D_width-1:0] modulus_BU_out
);
    
    logic [`D_width-1:0] pip0_in1       [0:3];
    logic [`D_width-1:0] pip0_modulus   [0:3];
    logic [`D_width-1:0] pip0_twiddle   [0:3];
    logic [`D_width-1:0] add_out;
    logic [`D_width-1:0] sub_out;

    parameter DOUBLE_DATA_WIDTH   = 2*(`D_width);
    logic [DOUBLE_DATA_WIDTH-1:0]S_wire;

    logic [`D_width-1:0] barrett_result_in2;

    /*Mul Mul(
        .A_in   (in2)       , 
        .B_in   (twiddle)   , 
        .clk    (clk)       ,  
        .rst    (rst)       ,  
        .S_out  (S_wire) 
    );

    barrett_reduction barrett_reduction(
        .S_in(S_wire),
        .modulus(modulus),
        .clk(clk),
        .rst(rst),

        .result(barrett_result_in2)
    );*/

    MulMod MulMod (
        .A_in       (in2),   
        .B_in       (twiddle),   
        .modulus    (modulus),
        .clk        (clk),    
        .rst        (rst),    
        .result     (barrett_result_in2) 
    );

    assign pip0_in1    [0] =  in1       ;
    assign pip0_modulus[0] = modulus    ;
    assign pip0_twiddle[0] = twiddle    ;

    integer i;
    always_ff @( posedge clk or posedge rst ) begin 
        if (rst) begin
            for (i = 0; i < 3 ; i = i + 1) begin
                pip0_in1    [i+1] <= 'd0;
                pip0_modulus[i+1] <= 'd0;
                pip0_twiddle[i+1] <= 'd0;
            end
        end else begin
            for (i = 0; i < 3 ; i = i + 1) begin
                pip0_in1    [i+1] <= pip0_in1    [i];
                pip0_modulus[i+1] <= pip0_modulus[i];
                pip0_twiddle[i+1] <= pip0_twiddle[i];
            end
        end
    end

    ModAdd add1(
        .in_1(pip0_in1[3]),
        .in_2(barrett_result_in2),
        .modulus(pip0_modulus[3]),
        .out(add_out)
    );

    ModSub sub1(
        .in_1(pip0_in1[3]),
        .in_2(barrett_result_in2),
        .modulus(pip0_modulus[3]),
        .out(sub_out)
    );

    always_ff @( posedge clk or posedge rst ) begin 
        if (rst) begin
            BU_a <= 'd0;
            BU_b <= 'd0;
            twiddle_BU_out <= 'd0;
            modulus_BU_out <= 'd0;
        end else begin
            BU_a <= add_out;
            BU_b <= sub_out;
            twiddle_BU_out <= pip0_twiddle[3];
            modulus_BU_out <= pip0_modulus[3];
        end
    end



endmodule