`include "../include/define.svh"

module BitRev(
    input [`D_width-1:0] input_idx,
    input BitRev_enable,
    input [2:0] l,
    input clk,
    input rst,

    output logic [`D_width-1:0] BitRev_out
);

    logic [5:0] BitRev_width;



    logic [2:0] radix_k1 ;
    assign radix_k1= `radix_k1;
    assign BitRev_width = radix_k1 * l;

    always_ff @(posedge clk or posedge rst) begin
        integer i;
        if (rst) begin
            for (i = 0; i<`D_width; i=i+1) begin
                BitRev_out[i] <= 'd0;
            end
        end else begin
            if (BitRev_enable) begin
                for (i = 0; i < `D_width; i = i+1) begin
                    if (i < BitRev_width) begin
                        BitRev_out[BitRev_width - 'd1 - i] <= input_idx[i];
                    end
                end
            end 
        end
    end


endmodule