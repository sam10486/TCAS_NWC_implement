`include "../include/define.svh"

module TF_delay_buffer (
    input clk,
    input rst,
    input [`D_width-1:0] TF0_in,
    input [`D_width-1:0] TF1_in,
    input [`D_width-1:0] TF2_in,
    input [`D_width-1:0] TF3_in,
    input [`D_width-1:0] TF4_in,
    input [`D_width-1:0] TF5_in,
    input [`D_width-1:0] TF6_in,
    input [`D_width-1:0] TF7_in,
    input [`D_width-1:0] TF8_in,
    input [`D_width-1:0] TF9_in,
    input [`D_width-1:0] TF10_in,
    input [`D_width-1:0] TF11_in,
    input [`D_width-1:0] TF12_in,
    input [`D_width-1:0] TF13_in,
    input [`D_width-1:0] TF14_in,
    input [`D_width-1:0] TF15_in,

    input [`D_width-1:0] modulus,

    output logic [`D_width-1:0] TF0_pip_out,
    output logic [`D_width-1:0] TF1_pip_out,
    output logic [`D_width-1:0] TF2_pip_out,
    output logic [`D_width-1:0] TF3_pip_out,
    output logic [`D_width-1:0] TF4_pip_out,
    output logic [`D_width-1:0] TF5_pip_out,
    output logic [`D_width-1:0] TF6_pip_out,
    output logic [`D_width-1:0] TF7_pip_out,
    output logic [`D_width-1:0] TF8_pip_out,
    output logic [`D_width-1:0] TF9_pip_out,
    output logic [`D_width-1:0] TF10_pip_out,
    output logic [`D_width-1:0] TF11_pip_out,
    output logic [`D_width-1:0] TF12_pip_out,
    output logic [`D_width-1:0] TF13_pip_out,
    output logic [`D_width-1:0] TF14_pip_out,
    output logic [`D_width-1:0] TF15_pip_out,

    output logic [`D_width-1:0] modulus_pip_out
    
);

    logic [`D_width-1:0] TF0_pip[0:5]      ;
    logic [`D_width-1:0] TF1_pip[0:5]      ;
    logic [`D_width-1:0] TF2_pip[0:5]      ;
    logic [`D_width-1:0] TF3_pip[0:5]      ;
    logic [`D_width-1:0] TF4_pip[0:5]      ;
    logic [`D_width-1:0] TF5_pip[0:5]      ;
    logic [`D_width-1:0] TF6_pip[0:5]      ;
    logic [`D_width-1:0] TF7_pip[0:5]      ;
    logic [`D_width-1:0] TF8_pip[0:5]      ;
    logic [`D_width-1:0] TF9_pip[0:5]      ;
    logic [`D_width-1:0] TF10_pip[0:5]     ;
    logic [`D_width-1:0] TF11_pip[0:5]     ;
    logic [`D_width-1:0] TF12_pip[0:5]     ;
    logic [`D_width-1:0] TF13_pip[0:5]     ;
    logic [`D_width-1:0] TF14_pip[0:5]     ;
    logic [`D_width-1:0] TF15_pip[0:5]     ;

    logic [`D_width-1:0] modulus_pip[0:5]     ;


    assign TF0_pip[0]   = TF0_in    ;
    assign TF1_pip[0]   = TF1_in    ;
    assign TF2_pip[0]   = TF2_in    ;
    assign TF3_pip[0]   = TF3_in    ;
    assign TF4_pip[0]   = TF4_in    ;
    assign TF5_pip[0]   = TF5_in    ;
    assign TF6_pip[0]   = TF6_in    ;
    assign TF7_pip[0]   = TF7_in    ;
    assign TF8_pip[0]   = TF8_in    ;
    assign TF9_pip[0]   = TF9_in    ;
    assign TF10_pip[0]  = TF10_in   ;
    assign TF11_pip[0]  = TF11_in   ;
    assign TF12_pip[0]  = TF12_in   ;
    assign TF13_pip[0]  = TF13_in   ;
    assign TF14_pip[0]  = TF14_in   ;
    assign TF15_pip[0]  = TF15_in   ;
    assign modulus_pip[0] = modulus ;

    integer i;
    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            for (i = 0; i <= 4; i = i+1) begin
                TF0_pip[i+1] <=     'd0;
                TF1_pip[i+1] <=     'd0;
                TF2_pip[i+1] <=     'd0;
                TF3_pip[i+1] <=     'd0;
                TF4_pip[i+1] <=     'd0;
                TF5_pip[i+1] <=     'd0;
                TF6_pip[i+1] <=     'd0;
                TF7_pip[i+1] <=     'd0;
                TF8_pip[i+1] <=     'd0;
                TF9_pip[i+1] <=     'd0;
                TF10_pip[i+1] <=    'd0;
                TF11_pip[i+1] <=    'd0;
                TF12_pip[i+1] <=    'd0;
                TF13_pip[i+1] <=    'd0;
                TF14_pip[i+1] <=    'd0;
                TF15_pip[i+1] <=    'd0;
    
                modulus_pip[i+1] <=    'd0;
            end
        end else begin
            for (i = 0; i<5 ; i = i+1 ) begin
                TF0_pip[i+1] <=     TF0_pip[i] ;
                TF1_pip[i+1] <=     TF1_pip[i] ;
                TF2_pip[i+1] <=     TF2_pip[i] ;
                TF3_pip[i+1] <=     TF3_pip[i] ;
                TF4_pip[i+1] <=     TF4_pip[i] ;
                TF5_pip[i+1] <=     TF5_pip[i] ;
                TF6_pip[i+1] <=     TF6_pip[i] ;
                TF7_pip[i+1] <=     TF7_pip[i] ;
                TF8_pip[i+1] <=     TF8_pip[i] ;
                TF9_pip[i+1] <=     TF9_pip[i] ;
                TF10_pip[i+1] <=    TF10_pip[i];
                TF11_pip[i+1] <=    TF11_pip[i];
                TF12_pip[i+1] <=    TF12_pip[i];
                TF13_pip[i+1] <=    TF13_pip[i];
                TF14_pip[i+1] <=    TF14_pip[i];
                TF15_pip[i+1] <=    TF15_pip[i];

                modulus_pip[i+1] <=   modulus_pip[i];
            end
        end
    end

    assign TF0_pip_out   = TF0_pip [5]   ;
    assign TF1_pip_out   = TF1_pip [5]   ;
    assign TF2_pip_out   = TF2_pip [5]   ;
    assign TF3_pip_out   = TF3_pip [5]   ;
    assign TF4_pip_out   = TF4_pip [5]   ;
    assign TF5_pip_out   = TF5_pip [5]   ;
    assign TF6_pip_out   = TF6_pip [5]   ;
    assign TF7_pip_out   = TF7_pip [5]   ;
    assign TF8_pip_out   = TF8_pip [5]   ;
    assign TF9_pip_out   = TF9_pip [5]   ;
    assign TF10_pip_out  = TF10_pip[5]   ;
    assign TF11_pip_out  = TF11_pip[5]   ;
    assign TF12_pip_out  = TF12_pip[5]   ;
    assign TF13_pip_out  = TF13_pip[5]   ;
    assign TF14_pip_out  = TF14_pip[5]   ;
    assign TF15_pip_out  = TF15_pip[5]   ;

    assign modulus_pip_out  = modulus_pip[5]   ;
endmodule