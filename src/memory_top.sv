`include "../include/define.svh"
`include "memory_rtl.sv"
module memory_top(
    input LAST_STAGE,

    input [`D_width-1:0] data_in0   ,
    input [`D_width-1:0] data_in1   ,
    input [`D_width-1:0] data_in2   ,
    input [`D_width-1:0] data_in3   ,
    input [`D_width-1:0] data_in4   ,
    input [`D_width-1:0] data_in5   ,
    input [`D_width-1:0] data_in6   ,
    input [`D_width-1:0] data_in7   ,
    input [`D_width-1:0] data_in8   ,
    input [`D_width-1:0] data_in9   ,
    input [`D_width-1:0] data_in10  ,
    input [`D_width-1:0] data_in11  ,
    input [`D_width-1:0] data_in12  ,
    input [`D_width-1:0] data_in13  ,
    input [`D_width-1:0] data_in14  ,
    input [`D_width-1:0] data_in15  ,

    input [`MA_width-1:0] MA0_idx    ,
    input [`MA_width-1:0] MA1_idx    ,
    input [`MA_width-1:0] MA2_idx    ,
    input [`MA_width-1:0] MA3_idx    ,
    input [`MA_width-1:0] MA4_idx    ,
    input [`MA_width-1:0] MA5_idx    ,
    input [`MA_width-1:0] MA6_idx    ,
    input [`MA_width-1:0] MA7_idx    ,
    input [`MA_width-1:0] MA8_idx    ,
    input [`MA_width-1:0] MA9_idx    ,
    input [`MA_width-1:0] MA10_idx   ,
    input [`MA_width-1:0] MA11_idx   ,
    input [`MA_width-1:0] MA12_idx   ,
    input [`MA_width-1:0] MA13_idx   ,
    input [`MA_width-1:0] MA14_idx   ,
    input [`MA_width-1:0] MA15_idx   ,

    input [`BANK_width-1:0] BN0_idx    ,
    input [`BANK_width-1:0] BN1_idx    ,
    input [`BANK_width-1:0] BN2_idx    ,
    input [`BANK_width-1:0] BN3_idx    ,
    input [`BANK_width-1:0] BN4_idx    ,
    input [`BANK_width-1:0] BN5_idx    ,
    input [`BANK_width-1:0] BN6_idx    ,
    input [`BANK_width-1:0] BN7_idx    ,
    input [`BANK_width-1:0] BN8_idx    ,
    input [`BANK_width-1:0] BN9_idx    ,
    input [`BANK_width-1:0] BN10_idx   ,
    input [`BANK_width-1:0] BN11_idx   ,
    input [`BANK_width-1:0] BN12_idx   ,
    input [`BANK_width-1:0] BN13_idx   ,
    input [`BANK_width-1:0] BN14_idx   ,
    input [`BANK_width-1:0] BN15_idx   ,

    input r_enable,
    input w_enable,
    input clk,
    input rst,

    input [`MA_width-1:0] R16_w_MA0_idx  ,
    input [`MA_width-1:0] R16_w_MA1_idx  ,
    input [`MA_width-1:0] R16_w_MA2_idx  ,
    input [`MA_width-1:0] R16_w_MA3_idx  ,
    input [`MA_width-1:0] R16_w_MA4_idx  ,
    input [`MA_width-1:0] R16_w_MA5_idx  ,
    input [`MA_width-1:0] R16_w_MA6_idx  ,
    input [`MA_width-1:0] R16_w_MA7_idx  ,
    input [`MA_width-1:0] R16_w_MA8_idx  ,
    input [`MA_width-1:0] R16_w_MA9_idx  ,
    input [`MA_width-1:0] R16_w_MA10_idx ,
    input [`MA_width-1:0] R16_w_MA11_idx ,
    input [`MA_width-1:0] R16_w_MA12_idx ,
    input [`MA_width-1:0] R16_w_MA13_idx ,
    input [`MA_width-1:0] R16_w_MA14_idx ,
    input [`MA_width-1:0] R16_w_MA15_idx ,

    input [`BANK_width-1:0] R16_w_BN0_idx  ,
    input [`BANK_width-1:0] R16_w_BN1_idx  ,
    input [`BANK_width-1:0] R16_w_BN2_idx  ,
    input [`BANK_width-1:0] R16_w_BN3_idx  ,
    input [`BANK_width-1:0] R16_w_BN4_idx  ,
    input [`BANK_width-1:0] R16_w_BN5_idx  ,
    input [`BANK_width-1:0] R16_w_BN6_idx  ,
    input [`BANK_width-1:0] R16_w_BN7_idx  ,
    input [`BANK_width-1:0] R16_w_BN8_idx  ,
    input [`BANK_width-1:0] R16_w_BN9_idx  ,
    input [`BANK_width-1:0] R16_w_BN10_idx ,
    input [`BANK_width-1:0] R16_w_BN11_idx ,
    input [`BANK_width-1:0] R16_w_BN12_idx ,
    input [`BANK_width-1:0] R16_w_BN13_idx ,
    input [`BANK_width-1:0] R16_w_BN14_idx ,
    input [`BANK_width-1:0] R16_w_BN15_idx ,

    //output
    output logic [`D_width-1:0] memory_b0   ,
    output logic [`D_width-1:0] memory_b1   ,
    output logic [`D_width-1:0] memory_b2   ,
    output logic [`D_width-1:0] memory_b3   ,
    output logic [`D_width-1:0] memory_b4   ,
    output logic [`D_width-1:0] memory_b5   ,
    output logic [`D_width-1:0] memory_b6   ,
    output logic [`D_width-1:0] memory_b7   ,
    output logic [`D_width-1:0] memory_b8   ,
    output logic [`D_width-1:0] memory_b9   ,
    output logic [`D_width-1:0] memory_b10  ,
    output logic [`D_width-1:0] memory_b11  ,
    output logic [`D_width-1:0] memory_b12  ,
    output logic [`D_width-1:0] memory_b13  ,
    output logic [`D_width-1:0] memory_b14  ,
    output logic [`D_width-1:0] memory_b15  ,

    output logic r_enable_out,
    output logic w_enable_out,
    output logic [`MA_width-1:0] MA0_idx_out ,
    output logic [`MA_width-1:0] MA1_idx_out ,
    output logic [`MA_width-1:0] MA2_idx_out ,
    output logic [`MA_width-1:0] MA3_idx_out ,
    output logic [`MA_width-1:0] MA4_idx_out ,
    output logic [`MA_width-1:0] MA5_idx_out ,
    output logic [`MA_width-1:0] MA6_idx_out ,
    output logic [`MA_width-1:0] MA7_idx_out ,
    output logic [`MA_width-1:0] MA8_idx_out ,
    output logic [`MA_width-1:0] MA9_idx_out ,
    output logic [`MA_width-1:0] MA10_idx_out,
    output logic [`MA_width-1:0] MA11_idx_out,
    output logic [`MA_width-1:0] MA12_idx_out,
    output logic [`MA_width-1:0] MA13_idx_out,
    output logic [`MA_width-1:0] MA14_idx_out,
    output logic [`MA_width-1:0] MA15_idx_out,

    output logic [`BANK_width-1:0] BN0_idx_out ,
    output logic [`BANK_width-1:0] BN1_idx_out ,
    output logic [`BANK_width-1:0] BN2_idx_out ,
    output logic [`BANK_width-1:0] BN3_idx_out ,
    output logic [`BANK_width-1:0] BN4_idx_out ,
    output logic [`BANK_width-1:0] BN5_idx_out ,
    output logic [`BANK_width-1:0] BN6_idx_out ,
    output logic [`BANK_width-1:0] BN7_idx_out ,
    output logic [`BANK_width-1:0] BN8_idx_out ,
    output logic [`BANK_width-1:0] BN9_idx_out ,
    output logic [`BANK_width-1:0] BN10_idx_out,
    output logic [`BANK_width-1:0] BN11_idx_out,
    output logic [`BANK_width-1:0] BN12_idx_out,
    output logic [`BANK_width-1:0] BN13_idx_out,
    output logic [`BANK_width-1:0] BN14_idx_out,
    output logic [`BANK_width-1:0] BN15_idx_out

);

    logic [`D_width-1:0]    data_in0_pip_in ;
    logic [`D_width-1:0]    data_in1_pip_in ;
    logic [`D_width-1:0]    data_in2_pip_in ;
    logic [`D_width-1:0]    data_in3_pip_in ;
    logic [`D_width-1:0]    data_in4_pip_in ;
    logic [`D_width-1:0]    data_in5_pip_in ;
    logic [`D_width-1:0]    data_in6_pip_in ;
    logic [`D_width-1:0]    data_in7_pip_in ;
    logic [`D_width-1:0]    data_in8_pip_in ;
    logic [`D_width-1:0]    data_in9_pip_in ;
    logic [`D_width-1:0]    data_in10_pip_in;
    logic [`D_width-1:0]    data_in11_pip_in;
    logic [`D_width-1:0]    data_in12_pip_in;
    logic [`D_width-1:0]    data_in13_pip_in;
    logic [`D_width-1:0]    data_in14_pip_in;
    logic [`D_width-1:0]    data_in15_pip_in;
       
    logic [`MA_width-1:0]    MA0_idx_pip_in ;
    logic [`MA_width-1:0]    MA1_idx_pip_in ;
    logic [`MA_width-1:0]    MA2_idx_pip_in ;
    logic [`MA_width-1:0]    MA3_idx_pip_in ;
    logic [`MA_width-1:0]    MA4_idx_pip_in ;
    logic [`MA_width-1:0]    MA5_idx_pip_in ;
    logic [`MA_width-1:0]    MA6_idx_pip_in ;
    logic [`MA_width-1:0]    MA7_idx_pip_in ;
    logic [`MA_width-1:0]    MA8_idx_pip_in ;
    logic [`MA_width-1:0]    MA9_idx_pip_in ;
    logic [`MA_width-1:0]    MA10_idx_pip_in;
    logic [`MA_width-1:0]    MA11_idx_pip_in;
    logic [`MA_width-1:0]    MA12_idx_pip_in;
    logic [`MA_width-1:0]    MA13_idx_pip_in;
    logic [`MA_width-1:0]    MA14_idx_pip_in;
    logic [`MA_width-1:0]    MA15_idx_pip_in;
        
    logic [`BANK_width-1:0]    BN0_idx_pip_in ;
    logic [`BANK_width-1:0]    BN1_idx_pip_in ;
    logic [`BANK_width-1:0]    BN2_idx_pip_in ;
    logic [`BANK_width-1:0]    BN3_idx_pip_in ;
    logic [`BANK_width-1:0]    BN4_idx_pip_in ;
    logic [`BANK_width-1:0]    BN5_idx_pip_in ;
    logic [`BANK_width-1:0]    BN6_idx_pip_in ;
    logic [`BANK_width-1:0]    BN7_idx_pip_in ;
    logic [`BANK_width-1:0]    BN8_idx_pip_in ;
    logic [`BANK_width-1:0]    BN9_idx_pip_in ;
    logic [`BANK_width-1:0]    BN10_idx_pip_in;
    logic [`BANK_width-1:0]    BN11_idx_pip_in;
    logic [`BANK_width-1:0]    BN12_idx_pip_in;
    logic [`BANK_width-1:0]    BN13_idx_pip_in;
    logic [`BANK_width-1:0]    BN14_idx_pip_in;
    logic [`BANK_width-1:0]    BN15_idx_pip_in;
        
    logic r_enable_pip_in;
    logic w_enable_pip_in;
        
    logic [`MA_width-1:0]    R16_w_MA0_idx_pip_in ;
    logic [`MA_width-1:0]    R16_w_MA1_idx_pip_in ;
    logic [`MA_width-1:0]    R16_w_MA2_idx_pip_in ;
    logic [`MA_width-1:0]    R16_w_MA3_idx_pip_in ;
    logic [`MA_width-1:0]    R16_w_MA4_idx_pip_in ;
    logic [`MA_width-1:0]    R16_w_MA5_idx_pip_in ;
    logic [`MA_width-1:0]    R16_w_MA6_idx_pip_in ;
    logic [`MA_width-1:0]    R16_w_MA7_idx_pip_in ;
    logic [`MA_width-1:0]    R16_w_MA8_idx_pip_in ;
    logic [`MA_width-1:0]    R16_w_MA9_idx_pip_in ;
    logic [`MA_width-1:0]    R16_w_MA10_idx_pip_in;
    logic [`MA_width-1:0]    R16_w_MA11_idx_pip_in;
    logic [`MA_width-1:0]    R16_w_MA12_idx_pip_in;
    logic [`MA_width-1:0]    R16_w_MA13_idx_pip_in;
    logic [`MA_width-1:0]    R16_w_MA14_idx_pip_in;
    logic [`MA_width-1:0]    R16_w_MA15_idx_pip_in;
        
    logic [`BANK_width-1:0]    R16_w_BN0_idx_pip_in ;
    logic [`BANK_width-1:0]    R16_w_BN1_idx_pip_in ;
    logic [`BANK_width-1:0]    R16_w_BN2_idx_pip_in ;
    logic [`BANK_width-1:0]    R16_w_BN3_idx_pip_in ;
    logic [`BANK_width-1:0]    R16_w_BN4_idx_pip_in ;
    logic [`BANK_width-1:0]    R16_w_BN5_idx_pip_in ;
    logic [`BANK_width-1:0]    R16_w_BN6_idx_pip_in ;
    logic [`BANK_width-1:0]    R16_w_BN7_idx_pip_in ;
    logic [`BANK_width-1:0]    R16_w_BN8_idx_pip_in ;
    logic [`BANK_width-1:0]    R16_w_BN9_idx_pip_in ;
    logic [`BANK_width-1:0]    R16_w_BN10_idx_pip_in;
    logic [`BANK_width-1:0]    R16_w_BN11_idx_pip_in;
    logic [`BANK_width-1:0]    R16_w_BN12_idx_pip_in;
    logic [`BANK_width-1:0]    R16_w_BN13_idx_pip_in;
    logic [`BANK_width-1:0]    R16_w_BN14_idx_pip_in;
    logic [`BANK_width-1:0]    R16_w_BN15_idx_pip_in;



    logic [`D_width-1:0]    memory_b0_pip_out   ;
    logic [`D_width-1:0]    memory_b1_pip_out   ;
    logic [`D_width-1:0]    memory_b2_pip_out   ;
    logic [`D_width-1:0]    memory_b3_pip_out   ;
    logic [`D_width-1:0]    memory_b4_pip_out   ;
    logic [`D_width-1:0]    memory_b5_pip_out   ;
    logic [`D_width-1:0]    memory_b6_pip_out   ;
    logic [`D_width-1:0]    memory_b7_pip_out   ;
    logic [`D_width-1:0]    memory_b8_pip_out   ;
    logic [`D_width-1:0]    memory_b9_pip_out   ;
    logic [`D_width-1:0]    memory_b10_pip_out  ;
    logic [`D_width-1:0]    memory_b11_pip_out  ;
    logic [`D_width-1:0]    memory_b12_pip_out  ;
    logic [`D_width-1:0]    memory_b13_pip_out  ;
    logic [`D_width-1:0]    memory_b14_pip_out  ;
    logic [`D_width-1:0]    memory_b15_pip_out  ;

    logic r_enable_out_pip_out    ;
    logic w_enable_out_pip_out    ;

    logic [`MA_width-1:0]    MA0_idx_out_pip_out     ;
    logic [`MA_width-1:0]    MA1_idx_out_pip_out     ;
    logic [`MA_width-1:0]    MA2_idx_out_pip_out     ;
    logic [`MA_width-1:0]    MA3_idx_out_pip_out     ;
    logic [`MA_width-1:0]    MA4_idx_out_pip_out     ;
    logic [`MA_width-1:0]    MA5_idx_out_pip_out     ;
    logic [`MA_width-1:0]    MA6_idx_out_pip_out     ;
    logic [`MA_width-1:0]    MA7_idx_out_pip_out     ;
    logic [`MA_width-1:0]    MA8_idx_out_pip_out     ;
    logic [`MA_width-1:0]    MA9_idx_out_pip_out     ;
    logic [`MA_width-1:0]    MA10_idx_out_pip_out    ;
    logic [`MA_width-1:0]    MA11_idx_out_pip_out    ;
    logic [`MA_width-1:0]    MA12_idx_out_pip_out    ;
    logic [`MA_width-1:0]    MA13_idx_out_pip_out    ;
    logic [`MA_width-1:0]    MA14_idx_out_pip_out    ;
    logic [`MA_width-1:0]    MA15_idx_out_pip_out    ;

    logic [`BANK_width-1:0]    BN0_idx_out_pip_out     ;
    logic [`BANK_width-1:0]    BN1_idx_out_pip_out     ;
    logic [`BANK_width-1:0]    BN2_idx_out_pip_out     ;
    logic [`BANK_width-1:0]    BN3_idx_out_pip_out     ;
    logic [`BANK_width-1:0]    BN4_idx_out_pip_out     ;
    logic [`BANK_width-1:0]    BN5_idx_out_pip_out     ;
    logic [`BANK_width-1:0]    BN6_idx_out_pip_out     ;
    logic [`BANK_width-1:0]    BN7_idx_out_pip_out     ;
    logic [`BANK_width-1:0]    BN8_idx_out_pip_out     ;
    logic [`BANK_width-1:0]    BN9_idx_out_pip_out     ;
    logic [`BANK_width-1:0]    BN10_idx_out_pip_out    ;
    logic [`BANK_width-1:0]    BN11_idx_out_pip_out    ;
    logic [`BANK_width-1:0]    BN12_idx_out_pip_out    ;
    logic [`BANK_width-1:0]    BN13_idx_out_pip_out    ;
    logic [`BANK_width-1:0]    BN14_idx_out_pip_out    ;
    logic [`BANK_width-1:0]    BN15_idx_out_pip_out    ;

    always_comb begin
        if (LAST_STAGE) begin
            data_in0_pip_in    =   data_in0  ;
            data_in1_pip_in    =   data_in1  ;
            data_in2_pip_in    =   'd0 ;
            data_in3_pip_in    =   'd0 ;
            data_in4_pip_in    =   'd0 ;
            data_in5_pip_in    =   'd0 ;
            data_in6_pip_in    =   'd0 ;
            data_in7_pip_in    =   'd0 ;
            data_in8_pip_in    =   'd0 ;
            data_in9_pip_in    =   'd0 ;
            data_in10_pip_in   =   'd0 ;
            data_in11_pip_in   =   'd0 ;
            data_in12_pip_in   =   'd0 ;
            data_in13_pip_in   =   'd0 ;
            data_in14_pip_in   =   'd0 ;
            data_in15_pip_in   =   'd0 ;

            MA0_idx_pip_in     =   MA0_idx     ;
            MA1_idx_pip_in     =   MA1_idx     ;
            MA2_idx_pip_in     =   'd0    ;
            MA3_idx_pip_in     =   'd0    ;
            MA4_idx_pip_in     =   'd0    ;
            MA5_idx_pip_in     =   'd0    ;
            MA6_idx_pip_in     =   'd0    ;
            MA7_idx_pip_in     =   'd0    ;
            MA8_idx_pip_in     =   'd0    ;
            MA9_idx_pip_in     =   'd0    ;
            MA10_idx_pip_in    =   'd0    ;
            MA11_idx_pip_in    =   'd0    ;
            MA12_idx_pip_in    =   'd0    ;
            MA13_idx_pip_in    =   'd0    ;
            MA14_idx_pip_in    =   'd0    ;
            MA15_idx_pip_in    =   'd0    ;

            BN0_idx_pip_in     =   BN0_idx     ;
            BN1_idx_pip_in     =   BN1_idx     ;
            BN2_idx_pip_in     =   'd0    ;
            BN3_idx_pip_in     =   'd0    ;
            BN4_idx_pip_in     =   'd0    ;
            BN5_idx_pip_in     =   'd0    ;
            BN6_idx_pip_in     =   'd0    ;
            BN7_idx_pip_in     =   'd0    ;
            BN8_idx_pip_in     =   'd0    ;
            BN9_idx_pip_in     =   'd0    ;
            BN10_idx_pip_in    =   'd0    ;
            BN11_idx_pip_in    =   'd0    ;
            BN12_idx_pip_in    =   'd0    ;
            BN13_idx_pip_in    =   'd0    ;
            BN14_idx_pip_in    =   'd0    ;
            BN15_idx_pip_in    =   'd0    ;

            r_enable_pip_in    =   r_enable    ;
            w_enable_pip_in    =   w_enable    ;

            R16_w_MA0_idx_pip_in   =   R16_w_MA0_idx   ;
            R16_w_MA1_idx_pip_in   =   R16_w_MA1_idx   ;
            R16_w_MA2_idx_pip_in   =   'd0  ;
            R16_w_MA3_idx_pip_in   =   'd0  ;
            R16_w_MA4_idx_pip_in   =   'd0  ;
            R16_w_MA5_idx_pip_in   =   'd0  ;
            R16_w_MA6_idx_pip_in   =   'd0  ;
            R16_w_MA7_idx_pip_in   =   'd0  ;
            R16_w_MA8_idx_pip_in   =   'd0  ;
            R16_w_MA9_idx_pip_in   =   'd0  ;
            R16_w_MA10_idx_pip_in  =   'd0  ;
            R16_w_MA11_idx_pip_in  =   'd0  ;
            R16_w_MA12_idx_pip_in  =   'd0  ;
            R16_w_MA13_idx_pip_in  =   'd0  ;
            R16_w_MA14_idx_pip_in  =   'd0  ;
            R16_w_MA15_idx_pip_in  =   'd0  ;

            R16_w_BN0_idx_pip_in   =   R16_w_BN0_idx   ; 
            R16_w_BN1_idx_pip_in   =   R16_w_BN1_idx   ; 
            R16_w_BN2_idx_pip_in   =   'd0  ; 
            R16_w_BN3_idx_pip_in   =   'd0  ; 
            R16_w_BN4_idx_pip_in   =   'd0  ; 
            R16_w_BN5_idx_pip_in   =   'd0  ; 
            R16_w_BN6_idx_pip_in   =   'd0  ; 
            R16_w_BN7_idx_pip_in   =   'd0  ; 
            R16_w_BN8_idx_pip_in   =   'd0  ; 
            R16_w_BN9_idx_pip_in   =   'd0  ; 
            R16_w_BN10_idx_pip_in  =   'd0  ; 
            R16_w_BN11_idx_pip_in  =   'd0  ; 
            R16_w_BN12_idx_pip_in  =   'd0  ; 
            R16_w_BN13_idx_pip_in  =   'd0  ; 
            R16_w_BN14_idx_pip_in  =   'd0  ; 
            R16_w_BN15_idx_pip_in  =   'd0  ; 
        end else begin
            data_in0_pip_in    =   data_in0  ;
            data_in1_pip_in    =   data_in1  ;
            data_in2_pip_in    =   data_in2  ;
            data_in3_pip_in    =   data_in3  ;
            data_in4_pip_in    =   data_in4  ;
            data_in5_pip_in    =   data_in5  ;
            data_in6_pip_in    =   data_in6  ;
            data_in7_pip_in    =   data_in7  ;
            data_in8_pip_in    =   data_in8  ;
            data_in9_pip_in    =   data_in9  ;
            data_in10_pip_in   =   data_in10 ;
            data_in11_pip_in   =   data_in11 ;
            data_in12_pip_in   =   data_in12 ;
            data_in13_pip_in   =   data_in13 ;
            data_in14_pip_in   =   data_in14 ;
            data_in15_pip_in   =   data_in15 ;

            MA0_idx_pip_in     =   MA0_idx     ;
            MA1_idx_pip_in     =   MA1_idx     ;
            MA2_idx_pip_in     =   MA2_idx     ;
            MA3_idx_pip_in     =   MA3_idx     ;
            MA4_idx_pip_in     =   MA4_idx     ;
            MA5_idx_pip_in     =   MA5_idx     ;
            MA6_idx_pip_in     =   MA6_idx     ;
            MA7_idx_pip_in     =   MA7_idx     ;
            MA8_idx_pip_in     =   MA8_idx     ;
            MA9_idx_pip_in     =   MA9_idx     ;
            MA10_idx_pip_in    =   MA10_idx    ;
            MA11_idx_pip_in    =   MA11_idx    ;
            MA12_idx_pip_in    =   MA12_idx    ;
            MA13_idx_pip_in    =   MA13_idx    ;
            MA14_idx_pip_in    =   MA14_idx    ;
            MA15_idx_pip_in    =   MA15_idx    ;

            BN0_idx_pip_in     =   BN0_idx     ;
            BN1_idx_pip_in     =   BN1_idx     ;
            BN2_idx_pip_in     =   BN2_idx     ;
            BN3_idx_pip_in     =   BN3_idx     ;
            BN4_idx_pip_in     =   BN4_idx     ;
            BN5_idx_pip_in     =   BN5_idx     ;
            BN6_idx_pip_in     =   BN6_idx     ;
            BN7_idx_pip_in     =   BN7_idx     ;
            BN8_idx_pip_in     =   BN8_idx     ;
            BN9_idx_pip_in     =   BN9_idx     ;
            BN10_idx_pip_in    =   BN10_idx    ;
            BN11_idx_pip_in    =   BN11_idx    ;
            BN12_idx_pip_in    =   BN12_idx    ;
            BN13_idx_pip_in    =   BN13_idx    ;
            BN14_idx_pip_in    =   BN14_idx    ;
            BN15_idx_pip_in    =   BN15_idx    ;

            r_enable_pip_in    =   r_enable    ;
            w_enable_pip_in    =   w_enable    ;

            R16_w_MA0_idx_pip_in   =   R16_w_MA0_idx   ;
            R16_w_MA1_idx_pip_in   =   R16_w_MA1_idx   ;
            R16_w_MA2_idx_pip_in   =   R16_w_MA2_idx   ;
            R16_w_MA3_idx_pip_in   =   R16_w_MA3_idx   ;
            R16_w_MA4_idx_pip_in   =   R16_w_MA4_idx   ;
            R16_w_MA5_idx_pip_in   =   R16_w_MA5_idx   ;
            R16_w_MA6_idx_pip_in   =   R16_w_MA6_idx   ;
            R16_w_MA7_idx_pip_in   =   R16_w_MA7_idx   ;
            R16_w_MA8_idx_pip_in   =   R16_w_MA8_idx   ;
            R16_w_MA9_idx_pip_in   =   R16_w_MA9_idx   ;
            R16_w_MA10_idx_pip_in  =   R16_w_MA10_idx  ;
            R16_w_MA11_idx_pip_in  =   R16_w_MA11_idx  ;
            R16_w_MA12_idx_pip_in  =   R16_w_MA12_idx  ;
            R16_w_MA13_idx_pip_in  =   R16_w_MA13_idx  ;
            R16_w_MA14_idx_pip_in  =   R16_w_MA14_idx  ;
            R16_w_MA15_idx_pip_in  =   R16_w_MA15_idx  ;

            R16_w_BN0_idx_pip_in   =   R16_w_BN0_idx   ; 
            R16_w_BN1_idx_pip_in   =   R16_w_BN1_idx   ; 
            R16_w_BN2_idx_pip_in   =   R16_w_BN2_idx   ; 
            R16_w_BN3_idx_pip_in   =   R16_w_BN3_idx   ; 
            R16_w_BN4_idx_pip_in   =   R16_w_BN4_idx   ; 
            R16_w_BN5_idx_pip_in   =   R16_w_BN5_idx   ; 
            R16_w_BN6_idx_pip_in   =   R16_w_BN6_idx   ; 
            R16_w_BN7_idx_pip_in   =   R16_w_BN7_idx   ; 
            R16_w_BN8_idx_pip_in   =   R16_w_BN8_idx   ; 
            R16_w_BN9_idx_pip_in   =   R16_w_BN9_idx   ; 
            R16_w_BN10_idx_pip_in  =   R16_w_BN10_idx  ; 
            R16_w_BN11_idx_pip_in  =   R16_w_BN11_idx  ; 
            R16_w_BN12_idx_pip_in  =   R16_w_BN12_idx  ; 
            R16_w_BN13_idx_pip_in  =   R16_w_BN13_idx  ; 
            R16_w_BN14_idx_pip_in  =   R16_w_BN14_idx  ; 
            R16_w_BN15_idx_pip_in  =   R16_w_BN15_idx  ; 
        end
    end


    always_comb begin
        if (LAST_STAGE) begin
            memory_b0   =   memory_b0_pip_out   ;
            memory_b1   =   memory_b1_pip_out   ;
            memory_b2   =   'd0  ;
            memory_b3   =   'd0  ;
            memory_b4   =   'd0  ;
            memory_b5   =   'd0  ;
            memory_b6   =   'd0  ;
            memory_b7   =   'd0  ;
            memory_b8   =   'd0  ;
            memory_b9   =   'd0  ;
            memory_b10  =   'd0  ;
            memory_b11  =   'd0  ;
            memory_b12  =   'd0  ;
            memory_b13  =   'd0  ;
            memory_b14  =   'd0  ;
            memory_b15  =   'd0  ;

            r_enable_out    =   r_enable_out_pip_out    ;
            w_enable_out    =   w_enable_out_pip_out    ;

            MA0_idx_out     =   MA0_idx_out_pip_out     ;
            MA1_idx_out     =   MA1_idx_out_pip_out     ;
            MA2_idx_out     =   'd0    ;
            MA3_idx_out     =   'd0    ;
            MA4_idx_out     =   'd0    ;
            MA5_idx_out     =   'd0    ;
            MA6_idx_out     =   'd0    ;
            MA7_idx_out     =   'd0    ;
            MA8_idx_out     =   'd0    ;
            MA9_idx_out     =   'd0    ;
            MA10_idx_out    =   'd0    ;
            MA11_idx_out    =   'd0    ;
            MA12_idx_out    =   'd0    ;
            MA13_idx_out    =   'd0    ;
            MA14_idx_out    =   'd0    ;
            MA15_idx_out    =   'd0    ;

            BN0_idx_out     =   BN0_idx_out_pip_out         ;
            BN1_idx_out     =   BN1_idx_out_pip_out         ;
            BN2_idx_out     =   'd0        ;
            BN3_idx_out     =   'd0        ;
            BN4_idx_out     =   'd0        ;
            BN5_idx_out     =   'd0        ;
            BN6_idx_out     =   'd0        ;
            BN7_idx_out     =   'd0        ;
            BN8_idx_out     =   'd0        ;
            BN9_idx_out     =   'd0        ;
            BN10_idx_out    =   'd0        ;
            BN11_idx_out    =   'd0        ;
            BN12_idx_out    =   'd0        ;
            BN13_idx_out    =   'd0        ;
            BN14_idx_out    =   'd0        ;
            BN15_idx_out    =   'd0        ;
        end else begin
            memory_b0   =   memory_b0_pip_out   ;
            memory_b1   =   memory_b1_pip_out   ;
            memory_b2   =   memory_b2_pip_out   ;
            memory_b3   =   memory_b3_pip_out   ;
            memory_b4   =   memory_b4_pip_out   ;
            memory_b5   =   memory_b5_pip_out   ;
            memory_b6   =   memory_b6_pip_out   ;
            memory_b7   =   memory_b7_pip_out   ;
            memory_b8   =   memory_b8_pip_out   ;
            memory_b9   =   memory_b9_pip_out   ;
            memory_b10  =   memory_b10_pip_out  ;
            memory_b11  =   memory_b11_pip_out  ;
            memory_b12  =   memory_b12_pip_out  ;
            memory_b13  =   memory_b13_pip_out  ;
            memory_b14  =   memory_b14_pip_out  ;
            memory_b15  =   memory_b15_pip_out  ;

            r_enable_out    =   r_enable_out_pip_out    ;
            w_enable_out    =   w_enable_out_pip_out    ;

            MA0_idx_out     =   MA0_idx_out_pip_out     ;
            MA1_idx_out     =   MA1_idx_out_pip_out     ;
            MA2_idx_out     =   MA2_idx_out_pip_out     ;
            MA3_idx_out     =   MA3_idx_out_pip_out     ;
            MA4_idx_out     =   MA4_idx_out_pip_out     ;
            MA5_idx_out     =   MA5_idx_out_pip_out     ;
            MA6_idx_out     =   MA6_idx_out_pip_out     ;
            MA7_idx_out     =   MA7_idx_out_pip_out     ;
            MA8_idx_out     =   MA8_idx_out_pip_out     ;
            MA9_idx_out     =   MA9_idx_out_pip_out     ;
            MA10_idx_out    =   MA10_idx_out_pip_out    ;
            MA11_idx_out    =   MA11_idx_out_pip_out    ;
            MA12_idx_out    =   MA12_idx_out_pip_out    ;
            MA13_idx_out    =   MA13_idx_out_pip_out    ;
            MA14_idx_out    =   MA14_idx_out_pip_out    ;
            MA15_idx_out    =   MA15_idx_out_pip_out    ;

            BN0_idx_out     =   BN0_idx_out_pip_out         ;
            BN1_idx_out     =   BN1_idx_out_pip_out         ;
            BN2_idx_out     =   BN2_idx_out_pip_out         ;
            BN3_idx_out     =   BN3_idx_out_pip_out         ;
            BN4_idx_out     =   BN4_idx_out_pip_out         ;
            BN5_idx_out     =   BN5_idx_out_pip_out         ;
            BN6_idx_out     =   BN6_idx_out_pip_out         ;
            BN7_idx_out     =   BN7_idx_out_pip_out         ;
            BN8_idx_out     =   BN8_idx_out_pip_out         ;
            BN9_idx_out     =   BN9_idx_out_pip_out         ;
            BN10_idx_out    =   BN10_idx_out_pip_out        ;
            BN11_idx_out    =   BN11_idx_out_pip_out        ;
            BN12_idx_out    =   BN12_idx_out_pip_out        ;
            BN13_idx_out    =   BN13_idx_out_pip_out        ;
            BN14_idx_out    =   BN14_idx_out_pip_out        ;
            BN15_idx_out    =   BN15_idx_out_pip_out        ;
        end
    end

    memory_rtl memory_rtl(
        .LAST_STAGE (LAST_STAGE),
        .data_in0   (data_in0_pip_in ),
        .data_in1   (data_in1_pip_in ),
        .data_in2   (data_in2_pip_in ),
        .data_in3   (data_in3_pip_in ),
        .data_in4   (data_in4_pip_in ),
        .data_in5   (data_in5_pip_in ),
        .data_in6   (data_in6_pip_in ),
        .data_in7   (data_in7_pip_in ),
        .data_in8   (data_in8_pip_in ),
        .data_in9   (data_in9_pip_in ),
        .data_in10  (data_in10_pip_in),
        .data_in11  (data_in11_pip_in),
        .data_in12  (data_in12_pip_in),
        .data_in13  (data_in13_pip_in),
        .data_in14  (data_in14_pip_in),
        .data_in15  (data_in15_pip_in),

        .MA0_idx (MA0_idx_pip_in ),
        .MA1_idx (MA1_idx_pip_in ),
        .MA2_idx (MA2_idx_pip_in ),
        .MA3_idx (MA3_idx_pip_in ),
        .MA4_idx (MA4_idx_pip_in ),
        .MA5_idx (MA5_idx_pip_in ),
        .MA6_idx (MA6_idx_pip_in ),
        .MA7_idx (MA7_idx_pip_in ),
        .MA8_idx (MA8_idx_pip_in ),
        .MA9_idx (MA9_idx_pip_in ),
        .MA10_idx(MA10_idx_pip_in),
        .MA11_idx(MA11_idx_pip_in),
        .MA12_idx(MA12_idx_pip_in),
        .MA13_idx(MA13_idx_pip_in),
        .MA14_idx(MA14_idx_pip_in),
        .MA15_idx(MA15_idx_pip_in),

        .BN0_idx (BN0_idx_pip_in ),
        .BN1_idx (BN1_idx_pip_in ),
        .BN2_idx (BN2_idx_pip_in ),
        .BN3_idx (BN3_idx_pip_in ),
        .BN4_idx (BN4_idx_pip_in ),
        .BN5_idx (BN5_idx_pip_in ),
        .BN6_idx (BN6_idx_pip_in ),
        .BN7_idx (BN7_idx_pip_in ),
        .BN8_idx (BN8_idx_pip_in ),
        .BN9_idx (BN9_idx_pip_in ),
        .BN10_idx(BN10_idx_pip_in),
        .BN11_idx(BN11_idx_pip_in),
        .BN12_idx(BN12_idx_pip_in),
        .BN13_idx(BN13_idx_pip_in),
        .BN14_idx(BN14_idx_pip_in),
        .BN15_idx(BN15_idx_pip_in),

        .r_enable(r_enable_pip_in),
        .w_enable(w_enable_pip_in),
        .clk(clk),
        .rst(rst),

        .R16_w_MA0_idx  (R16_w_MA0_idx_pip_in ),
        .R16_w_MA1_idx  (R16_w_MA1_idx_pip_in ),
        .R16_w_MA2_idx  (R16_w_MA2_idx_pip_in ),
        .R16_w_MA3_idx  (R16_w_MA3_idx_pip_in ),
        .R16_w_MA4_idx  (R16_w_MA4_idx_pip_in ),
        .R16_w_MA5_idx  (R16_w_MA5_idx_pip_in ),
        .R16_w_MA6_idx  (R16_w_MA6_idx_pip_in ),
        .R16_w_MA7_idx  (R16_w_MA7_idx_pip_in ),
        .R16_w_MA8_idx  (R16_w_MA8_idx_pip_in ),
        .R16_w_MA9_idx  (R16_w_MA9_idx_pip_in ),
        .R16_w_MA10_idx (R16_w_MA10_idx_pip_in),
        .R16_w_MA11_idx (R16_w_MA11_idx_pip_in),
        .R16_w_MA12_idx (R16_w_MA12_idx_pip_in),
        .R16_w_MA13_idx (R16_w_MA13_idx_pip_in),
        .R16_w_MA14_idx (R16_w_MA14_idx_pip_in),
        .R16_w_MA15_idx (R16_w_MA15_idx_pip_in),

        .R16_w_BN0_idx  (R16_w_BN0_idx_pip_in ),
        .R16_w_BN1_idx  (R16_w_BN1_idx_pip_in ),
        .R16_w_BN2_idx  (R16_w_BN2_idx_pip_in ),
        .R16_w_BN3_idx  (R16_w_BN3_idx_pip_in ),
        .R16_w_BN4_idx  (R16_w_BN4_idx_pip_in ),
        .R16_w_BN5_idx  (R16_w_BN5_idx_pip_in ),
        .R16_w_BN6_idx  (R16_w_BN6_idx_pip_in ),
        .R16_w_BN7_idx  (R16_w_BN7_idx_pip_in ),
        .R16_w_BN8_idx  (R16_w_BN8_idx_pip_in ),
        .R16_w_BN9_idx  (R16_w_BN9_idx_pip_in ),
        .R16_w_BN10_idx (R16_w_BN10_idx_pip_in),
        .R16_w_BN11_idx (R16_w_BN11_idx_pip_in),
        .R16_w_BN12_idx (R16_w_BN12_idx_pip_in),
        .R16_w_BN13_idx (R16_w_BN13_idx_pip_in),
        .R16_w_BN14_idx (R16_w_BN14_idx_pip_in),
        .R16_w_BN15_idx (R16_w_BN15_idx_pip_in),

        //output
        .memory_b0  (memory_b0_pip_out ),
        .memory_b1  (memory_b1_pip_out ),
        .memory_b2  (memory_b2_pip_out ),
        .memory_b3  (memory_b3_pip_out ),
        .memory_b4  (memory_b4_pip_out ),
        .memory_b5  (memory_b5_pip_out ),
        .memory_b6  (memory_b6_pip_out ),
        .memory_b7  (memory_b7_pip_out ),
        .memory_b8  (memory_b8_pip_out ),
        .memory_b9  (memory_b9_pip_out ),
        .memory_b10 (memory_b10_pip_out),
        .memory_b11 (memory_b11_pip_out),
        .memory_b12 (memory_b12_pip_out),
        .memory_b13 (memory_b13_pip_out),
        .memory_b14 (memory_b14_pip_out),
        .memory_b15 (memory_b15_pip_out),

        .r_enable_out(r_enable_out_pip_out),
        .w_enable_out(w_enable_out_pip_out),

        .MA0_idx_out    (MA0_idx_out_pip_out ),
        .MA1_idx_out    (MA1_idx_out_pip_out ),
        .MA2_idx_out    (MA2_idx_out_pip_out ),
        .MA3_idx_out    (MA3_idx_out_pip_out ),
        .MA4_idx_out    (MA4_idx_out_pip_out ),
        .MA5_idx_out    (MA5_idx_out_pip_out ),
        .MA6_idx_out    (MA6_idx_out_pip_out ),
        .MA7_idx_out    (MA7_idx_out_pip_out ),
        .MA8_idx_out    (MA8_idx_out_pip_out ),
        .MA9_idx_out    (MA9_idx_out_pip_out ),
        .MA10_idx_out   (MA10_idx_out_pip_out),
        .MA11_idx_out   (MA11_idx_out_pip_out),
        .MA12_idx_out   (MA12_idx_out_pip_out),
        .MA13_idx_out   (MA13_idx_out_pip_out),
        .MA14_idx_out   (MA14_idx_out_pip_out),
        .MA15_idx_out   (MA15_idx_out_pip_out),

        .BN0_idx_out    (BN0_idx_out_pip_out ),
        .BN1_idx_out    (BN1_idx_out_pip_out ),
        .BN2_idx_out    (BN2_idx_out_pip_out ),
        .BN3_idx_out    (BN3_idx_out_pip_out ),
        .BN4_idx_out    (BN4_idx_out_pip_out ),
        .BN5_idx_out    (BN5_idx_out_pip_out ),
        .BN6_idx_out    (BN6_idx_out_pip_out ),
        .BN7_idx_out    (BN7_idx_out_pip_out ),
        .BN8_idx_out    (BN8_idx_out_pip_out ),
        .BN9_idx_out    (BN9_idx_out_pip_out ),
        .BN10_idx_out   (BN10_idx_out_pip_out),
        .BN11_idx_out   (BN11_idx_out_pip_out),
        .BN12_idx_out   (BN12_idx_out_pip_out),
        .BN13_idx_out   (BN13_idx_out_pip_out),
        .BN14_idx_out   (BN14_idx_out_pip_out),
        .BN15_idx_out   (BN15_idx_out_pip_out)
    );
endmodule