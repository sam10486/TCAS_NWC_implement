`include "../include/define.svh"

module Mux_16_1_out (
    input [`D_width-1:0] Q_0    ,
    input [`D_width-1:0] Q_1    ,
    input [`D_width-1:0] Q_2    ,
    input [`D_width-1:0] Q_3    ,
    input [`D_width-1:0] Q_4    ,
    input [`D_width-1:0] Q_5    ,
    input [`D_width-1:0] Q_6    ,
    input [`D_width-1:0] Q_7    ,
    input [`D_width-1:0] Q_8    ,
    input [`D_width-1:0] Q_9    ,
    input [`D_width-1:0] Q_10   ,
    input [`D_width-1:0] Q_11   ,
    input [`D_width-1:0] Q_12   ,
    input [`D_width-1:0] Q_13   ,
    input [`D_width-1:0] Q_14   ,
    input [`D_width-1:0] Q_15   ,
    input [4:0] sel_out,

    output logic [`D_width-1:0] Q_out
);

    always_comb begin
        case (sel_out)
            'd0:    Q_out = Q_0 ;
            'd1:    Q_out = Q_1 ;
            'd2:    Q_out = Q_2 ;
            'd3:    Q_out = Q_3 ;
            'd4:    Q_out = Q_4 ;
            'd5:    Q_out = Q_5 ;
            'd6:    Q_out = Q_6 ;
            'd7:    Q_out = Q_7 ;
            'd8:    Q_out = Q_8 ;
            'd9:    Q_out = Q_9 ;
            'd10:   Q_out = Q_10;
            'd11:   Q_out = Q_11;
            'd12:   Q_out = Q_12;
            'd13:   Q_out = Q_13;
            'd14:   Q_out = Q_14;
            'd15:   Q_out = Q_15;
            default: Q_out = 'd0;
        endcase
    end
    
endmodule