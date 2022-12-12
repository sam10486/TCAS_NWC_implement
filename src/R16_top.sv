`include "../include/define.svh"
`include "R16_BU.sv"

module R16_top(
    input LAST_STAGE,
    input clk,
    input rst, 
    input [`D_width-1:0] x0 ,
    input [`D_width-1:0] x1 ,
    input [`D_width-1:0] x2 ,
    input [`D_width-1:0] x3 ,
    input [`D_width-1:0] x4 ,
    input [`D_width-1:0] x5 ,
    input [`D_width-1:0] x6 ,
    input [`D_width-1:0] x7 ,
    input [`D_width-1:0] x8 ,
    input [`D_width-1:0] x9 ,
    input [`D_width-1:0] x10,
    input [`D_width-1:0] x11,
    input [`D_width-1:0] x12,
    input [`D_width-1:0] x13,
    input [`D_width-1:0] x14,
    input [`D_width-1:0] x15,

    input [`D_width-1:0] twiddle_0  ,
    input [`D_width-1:0] twiddle_1  ,
    input [`D_width-1:0] twiddle_2  ,
    input [`D_width-1:0] twiddle_3  ,
    input [`D_width-1:0] twiddle_4  ,
    input [`D_width-1:0] twiddle_5  ,
    input [`D_width-1:0] twiddle_6  ,
    input [`D_width-1:0] twiddle_7  ,
    input [`D_width-1:0] twiddle_8  ,
    input [`D_width-1:0] twiddle_9  ,
    input [`D_width-1:0] twiddle_10 ,
    input [`D_width-1:0] twiddle_11 ,
    input [`D_width-1:0] twiddle_12 ,
    input [`D_width-1:0] twiddle_13 ,
    input [`D_width-1:0] twiddle_14 ,
    input [`D_width-1:0] twiddle_15 ,

    input [`D_width-1:0]    modulus     ,
    input                   ntt_enable  ,

    input [`MA_width-1:0] R16_MA0_idx    ,
    input [`MA_width-1:0] R16_MA1_idx    ,
    input [`MA_width-1:0] R16_MA2_idx    ,
    input [`MA_width-1:0] R16_MA3_idx    ,
    input [`MA_width-1:0] R16_MA4_idx    ,
    input [`MA_width-1:0] R16_MA5_idx    ,
    input [`MA_width-1:0] R16_MA6_idx    ,
    input [`MA_width-1:0] R16_MA7_idx    ,
    input [`MA_width-1:0] R16_MA8_idx    ,
    input [`MA_width-1:0] R16_MA9_idx    ,
    input [`MA_width-1:0] R16_MA10_idx   ,
    input [`MA_width-1:0] R16_MA11_idx   ,
    input [`MA_width-1:0] R16_MA12_idx   ,
    input [`MA_width-1:0] R16_MA13_idx   ,
    input [`MA_width-1:0] R16_MA14_idx   ,
    input [`MA_width-1:0] R16_MA15_idx   ,

    input [`BANK_width-1:0] R16_BN0_idx    ,
    input [`BANK_width-1:0] R16_BN1_idx    ,
    input [`BANK_width-1:0] R16_BN2_idx    ,
    input [`BANK_width-1:0] R16_BN3_idx    ,
    input [`BANK_width-1:0] R16_BN4_idx    ,
    input [`BANK_width-1:0] R16_BN5_idx    ,
    input [`BANK_width-1:0] R16_BN6_idx    ,
    input [`BANK_width-1:0] R16_BN7_idx    ,
    input [`BANK_width-1:0] R16_BN8_idx    ,
    input [`BANK_width-1:0] R16_BN9_idx    ,
    input [`BANK_width-1:0] R16_BN10_idx   ,
    input [`BANK_width-1:0] R16_BN11_idx   ,
    input [`BANK_width-1:0] R16_BN12_idx   ,
    input [`BANK_width-1:0] R16_BN13_idx   ,
    input [`BANK_width-1:0] R16_BN14_idx   ,
    input [`BANK_width-1:0] R16_BN15_idx   ,
    
    //output
    output logic [`D_width-1:0] y0  ,
    output logic [`D_width-1:0] y1  ,
    output logic [`D_width-1:0] y2  ,
    output logic [`D_width-1:0] y3  ,
    output logic [`D_width-1:0] y4  ,
    output logic [`D_width-1:0] y5  ,
    output logic [`D_width-1:0] y6  ,
    output logic [`D_width-1:0] y7  ,
    output logic [`D_width-1:0] y8  ,
    output logic [`D_width-1:0] y9  ,
    output logic [`D_width-1:0] y10 ,
    output logic [`D_width-1:0] y11 ,
    output logic [`D_width-1:0] y12 ,
    output logic [`D_width-1:0] y13 ,
    output logic [`D_width-1:0] y14 ,
    output logic [`D_width-1:0] y15 ,

    output logic [1:0] ntt_done,

    output logic [`MA_width-1:0] R16_MA0_idx_out ,
    output logic [`MA_width-1:0] R16_MA1_idx_out ,
    output logic [`MA_width-1:0] R16_MA2_idx_out ,
    output logic [`MA_width-1:0] R16_MA3_idx_out ,
    output logic [`MA_width-1:0] R16_MA4_idx_out ,
    output logic [`MA_width-1:0] R16_MA5_idx_out ,
    output logic [`MA_width-1:0] R16_MA6_idx_out ,
    output logic [`MA_width-1:0] R16_MA7_idx_out ,
    output logic [`MA_width-1:0] R16_MA8_idx_out ,
    output logic [`MA_width-1:0] R16_MA9_idx_out ,
    output logic [`MA_width-1:0] R16_MA10_idx_out,
    output logic [`MA_width-1:0] R16_MA11_idx_out,
    output logic [`MA_width-1:0] R16_MA12_idx_out,
    output logic [`MA_width-1:0] R16_MA13_idx_out,
    output logic [`MA_width-1:0] R16_MA14_idx_out,
    output logic [`MA_width-1:0] R16_MA15_idx_out,

    output logic [`BANK_width-1:0] R16_BN0_idx_out ,
    output logic [`BANK_width-1:0] R16_BN1_idx_out ,
    output logic [`BANK_width-1:0] R16_BN2_idx_out ,
    output logic [`BANK_width-1:0] R16_BN3_idx_out ,
    output logic [`BANK_width-1:0] R16_BN4_idx_out ,
    output logic [`BANK_width-1:0] R16_BN5_idx_out ,
    output logic [`BANK_width-1:0] R16_BN6_idx_out ,
    output logic [`BANK_width-1:0] R16_BN7_idx_out ,
    output logic [`BANK_width-1:0] R16_BN8_idx_out ,
    output logic [`BANK_width-1:0] R16_BN9_idx_out ,
    output logic [`BANK_width-1:0] R16_BN10_idx_out,
    output logic [`BANK_width-1:0] R16_BN11_idx_out,
    output logic [`BANK_width-1:0] R16_BN12_idx_out,
    output logic [`BANK_width-1:0] R16_BN13_idx_out,
    output logic [`BANK_width-1:0] R16_BN14_idx_out,
    output logic [`BANK_width-1:0] R16_BN15_idx_out
);

    logic [`D_width-1:0]    x0_pip_in   ;
    logic [`D_width-1:0]    x1_pip_in   ;
    logic [`D_width-1:0]    x2_pip_in   ;
    logic [`D_width-1:0]    x3_pip_in   ;
    logic [`D_width-1:0]    x4_pip_in   ;
    logic [`D_width-1:0]    x5_pip_in   ;
    logic [`D_width-1:0]    x6_pip_in   ;
    logic [`D_width-1:0]    x7_pip_in   ;
    logic [`D_width-1:0]    x8_pip_in   ;
    logic [`D_width-1:0]    x9_pip_in   ;
    logic [`D_width-1:0]    x10_pip_in  ;
    logic [`D_width-1:0]    x11_pip_in  ;
    logic [`D_width-1:0]    x12_pip_in  ;
    logic [`D_width-1:0]    x13_pip_in  ;
    logic [`D_width-1:0]    x14_pip_in  ;
    logic [`D_width-1:0]    x15_pip_in  ; 
        
    logic [`D_width-1:0]    twiddle_0_pip_in    ;
    logic [`D_width-1:0]    twiddle_1_pip_in    ;
    logic [`D_width-1:0]    twiddle_2_pip_in    ;
    logic [`D_width-1:0]    twiddle_3_pip_in    ;
    logic [`D_width-1:0]    twiddle_4_pip_in    ;
    logic [`D_width-1:0]    twiddle_5_pip_in    ;
    logic [`D_width-1:0]    twiddle_6_pip_in    ;
    logic [`D_width-1:0]    twiddle_7_pip_in    ;
    logic [`D_width-1:0]    twiddle_8_pip_in    ;
    logic [`D_width-1:0]    twiddle_9_pip_in    ;
    logic [`D_width-1:0]    twiddle_10_pip_in   ;
    logic [`D_width-1:0]    twiddle_11_pip_in   ;
    logic [`D_width-1:0]    twiddle_12_pip_in   ;
    logic [`D_width-1:0]    twiddle_13_pip_in   ;
    logic [`D_width-1:0]    twiddle_14_pip_in   ;
    logic [`D_width-1:0]    twiddle_15_pip_in   ;
        
    logic [`D_width-1:0]    modulus_pip_in      ;
    logic                   ntt_enable_pip_in   ;
        
    logic [`MA_width-1:0]    R16_MA0_idx_pip_in  ;
    logic [`MA_width-1:0]    R16_MA1_idx_pip_in  ;
    logic [`MA_width-1:0]    R16_MA2_idx_pip_in  ;
    logic [`MA_width-1:0]    R16_MA3_idx_pip_in  ;
    logic [`MA_width-1:0]    R16_MA4_idx_pip_in  ;
    logic [`MA_width-1:0]    R16_MA5_idx_pip_in  ;
    logic [`MA_width-1:0]    R16_MA6_idx_pip_in  ;
    logic [`MA_width-1:0]    R16_MA7_idx_pip_in  ;
    logic [`MA_width-1:0]    R16_MA8_idx_pip_in  ;
    logic [`MA_width-1:0]    R16_MA9_idx_pip_in  ;
    logic [`MA_width-1:0]    R16_MA10_idx_pip_in ;
    logic [`MA_width-1:0]    R16_MA11_idx_pip_in ;
    logic [`MA_width-1:0]    R16_MA12_idx_pip_in ;
    logic [`MA_width-1:0]    R16_MA13_idx_pip_in ;
    logic [`MA_width-1:0]    R16_MA14_idx_pip_in ;
    logic [`MA_width-1:0]    R16_MA15_idx_pip_in ;
        
    logic [`BANK_width-1:0]    R16_BN0_idx_pip_in  ;
    logic [`BANK_width-1:0]    R16_BN1_idx_pip_in  ;
    logic [`BANK_width-1:0]    R16_BN2_idx_pip_in  ;
    logic [`BANK_width-1:0]    R16_BN3_idx_pip_in  ;
    logic [`BANK_width-1:0]    R16_BN4_idx_pip_in  ;
    logic [`BANK_width-1:0]    R16_BN5_idx_pip_in  ;
    logic [`BANK_width-1:0]    R16_BN6_idx_pip_in  ;
    logic [`BANK_width-1:0]    R16_BN7_idx_pip_in  ;
    logic [`BANK_width-1:0]    R16_BN8_idx_pip_in  ;
    logic [`BANK_width-1:0]    R16_BN9_idx_pip_in  ;
    logic [`BANK_width-1:0]    R16_BN10_idx_pip_in ;
    logic [`BANK_width-1:0]    R16_BN11_idx_pip_in ;
    logic [`BANK_width-1:0]    R16_BN12_idx_pip_in ;
    logic [`BANK_width-1:0]    R16_BN13_idx_pip_in ;
    logic [`BANK_width-1:0]    R16_BN14_idx_pip_in ;
    logic [`BANK_width-1:0]    R16_BN15_idx_pip_in ;

    always_comb begin
        if (LAST_STAGE) begin
            x0_pip_in   =   x0   ; 
            x1_pip_in   =   x2  ; 
            x2_pip_in   =   x4  ; 
            x3_pip_in   =   x6  ; 
            x4_pip_in   =   x8  ; 
            x5_pip_in   =   x10  ; 
            x6_pip_in   =   x12  ; 
            x7_pip_in   =   x14  ; 
            x8_pip_in   =   x1  ; 
            x9_pip_in   =   x3  ; 
            x10_pip_in  =   x5  ;
            x11_pip_in  =   x7  ;
            x12_pip_in  =   x9  ;
            x13_pip_in  =   x11  ;
            x14_pip_in  =   x13  ;
            x15_pip_in  =   x15  ;

            twiddle_0_pip_in    =   'd0   ;
            twiddle_1_pip_in    =   twiddle_1  ;
            twiddle_2_pip_in    =   twiddle_2  ;
            twiddle_3_pip_in    =   twiddle_3  ;
            twiddle_4_pip_in    =   twiddle_4  ;
            twiddle_5_pip_in    =   twiddle_5  ;    //-------next 4 BU---------
            twiddle_6_pip_in    =   twiddle_6  ;
            twiddle_7_pip_in    =   twiddle_7  ;
            twiddle_8_pip_in    =   twiddle_8  ;
            twiddle_9_pip_in    =   'd0  ;
            twiddle_10_pip_in   =   'd0  ;
            twiddle_11_pip_in   =   'd0  ;
            twiddle_12_pip_in   =   'd0  ;
            twiddle_13_pip_in   =   'd0  ;
            twiddle_14_pip_in   =   'd0  ;
            twiddle_15_pip_in   =   'd0  ;

            modulus_pip_in      =   modulus ;
            ntt_enable_pip_in   =   ntt_enable  ;

            R16_MA0_idx_pip_in  =   R16_MA0_idx     ;
            R16_MA1_idx_pip_in  =   R16_MA1_idx     ;
            R16_MA2_idx_pip_in  =   R16_MA2_idx     ;
            R16_MA3_idx_pip_in  =   R16_MA3_idx     ;
            R16_MA4_idx_pip_in  =   R16_MA4_idx     ;
            R16_MA5_idx_pip_in  =   R16_MA5_idx     ;
            R16_MA6_idx_pip_in  =   R16_MA6_idx     ;
            R16_MA7_idx_pip_in  =   R16_MA7_idx     ;
            R16_MA8_idx_pip_in  =   R16_MA8_idx     ;
            R16_MA9_idx_pip_in  =   R16_MA9_idx     ;
            R16_MA10_idx_pip_in =   R16_MA10_idx    ;
            R16_MA11_idx_pip_in =   R16_MA11_idx    ;
            R16_MA12_idx_pip_in =   R16_MA12_idx    ;
            R16_MA13_idx_pip_in =   R16_MA13_idx    ;
            R16_MA14_idx_pip_in =   R16_MA14_idx    ;
            R16_MA15_idx_pip_in =   R16_MA15_idx    ;

            R16_BN0_idx_pip_in  =   R16_BN0_idx ; 
            R16_BN1_idx_pip_in  =   R16_BN1_idx ; 
            R16_BN2_idx_pip_in  =   R16_BN2_idx ;
            R16_BN3_idx_pip_in  =   R16_BN3_idx ;
            R16_BN4_idx_pip_in  =   R16_BN4_idx ;
            R16_BN5_idx_pip_in  =   R16_BN5_idx ;
            R16_BN6_idx_pip_in  =   R16_BN6_idx ;
            R16_BN7_idx_pip_in  =   R16_BN7_idx ;
            R16_BN8_idx_pip_in  =   R16_BN8_idx ;
            R16_BN9_idx_pip_in  =   R16_BN9_idx ;
            R16_BN10_idx_pip_in =   R16_BN10_idx;
            R16_BN11_idx_pip_in =   R16_BN11_idx;
            R16_BN12_idx_pip_in =   R16_BN12_idx;
            R16_BN13_idx_pip_in =   R16_BN13_idx;
            R16_BN14_idx_pip_in =   R16_BN14_idx;
            R16_BN15_idx_pip_in =   R16_BN15_idx;
        end else begin
            x0_pip_in   =   x0   ; 
            x1_pip_in   =   x1   ; 
            x2_pip_in   =   x2   ; 
            x3_pip_in   =   x3   ; 
            x4_pip_in   =   x4   ; 
            x5_pip_in   =   x5   ; 
            x6_pip_in   =   x6   ; 
            x7_pip_in   =   x7   ; 
            x8_pip_in   =   x8   ; 
            x9_pip_in   =   x9   ; 
            x10_pip_in  =   x10  ;
            x11_pip_in  =   x11  ;
            x12_pip_in  =   x12  ;
            x13_pip_in  =   x13  ;
            x14_pip_in  =   x14  ;
            x15_pip_in  =   x15  ;

            twiddle_0_pip_in    =   twiddle_0   ;
            twiddle_1_pip_in    =   twiddle_1   ;
            twiddle_2_pip_in    =   twiddle_2   ;
            twiddle_3_pip_in    =   twiddle_3   ;
            twiddle_4_pip_in    =   twiddle_4   ;
            twiddle_5_pip_in    =   twiddle_5   ;
            twiddle_6_pip_in    =   twiddle_6   ;
            twiddle_7_pip_in    =   twiddle_7   ;
            twiddle_8_pip_in    =   twiddle_8   ;
            twiddle_9_pip_in    =   twiddle_9   ;
            twiddle_10_pip_in   =   twiddle_10  ;
            twiddle_11_pip_in   =   twiddle_11  ;
            twiddle_12_pip_in   =   twiddle_12  ;
            twiddle_13_pip_in   =   twiddle_13  ;
            twiddle_14_pip_in   =   twiddle_14  ;
            twiddle_15_pip_in   =   twiddle_15  ;

            modulus_pip_in      =   modulus ;
            ntt_enable_pip_in   =   ntt_enable  ;

            R16_MA0_idx_pip_in  =   R16_MA0_idx ;
            R16_MA1_idx_pip_in  =   R16_MA1_idx ;
            R16_MA2_idx_pip_in  =   R16_MA2_idx ;
            R16_MA3_idx_pip_in  =   R16_MA3_idx ;
            R16_MA4_idx_pip_in  =   R16_MA4_idx ;
            R16_MA5_idx_pip_in  =   R16_MA5_idx ;
            R16_MA6_idx_pip_in  =   R16_MA6_idx ;
            R16_MA7_idx_pip_in  =   R16_MA7_idx ;
            R16_MA8_idx_pip_in  =   R16_MA8_idx ;
            R16_MA9_idx_pip_in  =   R16_MA9_idx ;
            R16_MA10_idx_pip_in =   R16_MA10_idx    ;
            R16_MA11_idx_pip_in =   R16_MA11_idx    ;
            R16_MA12_idx_pip_in =   R16_MA12_idx    ;
            R16_MA13_idx_pip_in =   R16_MA13_idx    ;
            R16_MA14_idx_pip_in =   R16_MA14_idx    ;
            R16_MA15_idx_pip_in =   R16_MA15_idx    ;

            R16_BN0_idx_pip_in  =   R16_BN0_idx ;  
            R16_BN1_idx_pip_in  =   R16_BN1_idx ;  
            R16_BN2_idx_pip_in  =   R16_BN2_idx ;  
            R16_BN3_idx_pip_in  =   R16_BN3_idx ;  
            R16_BN4_idx_pip_in  =   R16_BN4_idx ;  
            R16_BN5_idx_pip_in  =   R16_BN5_idx ;  
            R16_BN6_idx_pip_in  =   R16_BN6_idx ;  
            R16_BN7_idx_pip_in  =   R16_BN7_idx ;  
            R16_BN8_idx_pip_in  =   R16_BN8_idx ;  
            R16_BN9_idx_pip_in  =   R16_BN9_idx ;  
            R16_BN10_idx_pip_in =   R16_BN10_idx    ;
            R16_BN11_idx_pip_in =   R16_BN11_idx    ;
            R16_BN12_idx_pip_in =   R16_BN12_idx    ;
            R16_BN13_idx_pip_in =   R16_BN13_idx    ;
            R16_BN14_idx_pip_in =   R16_BN14_idx    ;
            R16_BN15_idx_pip_in =   R16_BN15_idx    ;
        end
    end


    logic [`D_width-1:0]    y0_pip_out  ;
    logic [`D_width-1:0]    y1_pip_out  ;
    logic [`D_width-1:0]    y2_pip_out  ;
    logic [`D_width-1:0]    y3_pip_out  ;
    logic [`D_width-1:0]    y4_pip_out  ;
    logic [`D_width-1:0]    y5_pip_out  ;
    logic [`D_width-1:0]    y6_pip_out  ;
    logic [`D_width-1:0]    y7_pip_out  ;
    logic [`D_width-1:0]    y8_pip_out  ;
    logic [`D_width-1:0]    y9_pip_out  ;
    logic [`D_width-1:0]    y10_pip_out ;
    logic [`D_width-1:0]    y11_pip_out ;
    logic [`D_width-1:0]    y12_pip_out ;
    logic [`D_width-1:0]    y13_pip_out ;
    logic [`D_width-1:0]    y14_pip_out ;
    logic [`D_width-1:0]    y15_pip_out ;
        
    logic [1:0]                  ntt_done_pip_out    ;
        
    logic [`MA_width-1:0]    R16_MA0_idx_out_pip_out     ;
    logic [`MA_width-1:0]    R16_MA1_idx_out_pip_out     ;
    logic [`MA_width-1:0]    R16_MA2_idx_out_pip_out     ;
    logic [`MA_width-1:0]    R16_MA3_idx_out_pip_out     ;
    logic [`MA_width-1:0]    R16_MA4_idx_out_pip_out     ;
    logic [`MA_width-1:0]    R16_MA5_idx_out_pip_out     ;
    logic [`MA_width-1:0]    R16_MA6_idx_out_pip_out     ;
    logic [`MA_width-1:0]    R16_MA7_idx_out_pip_out     ;
    logic [`MA_width-1:0]    R16_MA8_idx_out_pip_out     ;
    logic [`MA_width-1:0]    R16_MA9_idx_out_pip_out     ;
    logic [`MA_width-1:0]    R16_MA10_idx_out_pip_out    ;
    logic [`MA_width-1:0]    R16_MA11_idx_out_pip_out    ;
    logic [`MA_width-1:0]    R16_MA12_idx_out_pip_out    ;
    logic [`MA_width-1:0]    R16_MA13_idx_out_pip_out    ;
    logic [`MA_width-1:0]    R16_MA14_idx_out_pip_out    ;
    logic [`MA_width-1:0]    R16_MA15_idx_out_pip_out    ;
        
    logic [`BANK_width-1:0]    R16_BN0_idx_out_pip_out     ;    
    logic [`BANK_width-1:0]    R16_BN1_idx_out_pip_out     ;    
    logic [`BANK_width-1:0]    R16_BN2_idx_out_pip_out     ;    
    logic [`BANK_width-1:0]    R16_BN3_idx_out_pip_out     ;    
    logic [`BANK_width-1:0]    R16_BN4_idx_out_pip_out     ;    
    logic [`BANK_width-1:0]    R16_BN5_idx_out_pip_out     ;    
    logic [`BANK_width-1:0]    R16_BN6_idx_out_pip_out     ;    
    logic [`BANK_width-1:0]    R16_BN7_idx_out_pip_out     ;    
    logic [`BANK_width-1:0]    R16_BN8_idx_out_pip_out     ;    
    logic [`BANK_width-1:0]    R16_BN9_idx_out_pip_out     ;    
    logic [`BANK_width-1:0]    R16_BN10_idx_out_pip_out    ;
    logic [`BANK_width-1:0]    R16_BN11_idx_out_pip_out    ;
    logic [`BANK_width-1:0]    R16_BN12_idx_out_pip_out    ;
    logic [`BANK_width-1:0]    R16_BN13_idx_out_pip_out    ;
    logic [`BANK_width-1:0]    R16_BN14_idx_out_pip_out    ;
    logic [`BANK_width-1:0]    R16_BN15_idx_out_pip_out    ;

    always_comb begin
        if (LAST_STAGE) begin
            y0  =   y0_pip_out  ;
            y1  =   y1_pip_out  ;
            y2  =   y2_pip_out ;
            y3  =   y3_pip_out ;
            y4  =   y4_pip_out ;
            y5  =   y5_pip_out ;
            y6  =   y6_pip_out ;
            y7  =   y7_pip_out ;
            y8  =   y8_pip_out ;
            y9  =   y9_pip_out ;
            y10 =   y10_pip_out ;
            y11 =   y11_pip_out ;
            y12 =   y12_pip_out ;
            y13 =   y13_pip_out ;
            y14 =   y14_pip_out ;
            y15 =   y15_pip_out ;
            
            ntt_done    =   ntt_done_pip_out    ;

            R16_MA0_idx_out     =   R16_MA0_idx_out_pip_out     ;
            R16_MA1_idx_out     =   R16_MA1_idx_out_pip_out     ;
            R16_MA2_idx_out     =   R16_MA2_idx_out_pip_out     ;
            R16_MA3_idx_out     =   R16_MA3_idx_out_pip_out     ;
            R16_MA4_idx_out     =   R16_MA4_idx_out_pip_out     ;
            R16_MA5_idx_out     =   R16_MA5_idx_out_pip_out     ;
            R16_MA6_idx_out     =   R16_MA6_idx_out_pip_out     ;
            R16_MA7_idx_out     =   R16_MA7_idx_out_pip_out     ;
            R16_MA8_idx_out     =   R16_MA8_idx_out_pip_out     ;
            R16_MA9_idx_out     =   R16_MA9_idx_out_pip_out     ;
            R16_MA10_idx_out    =   R16_MA10_idx_out_pip_out    ;
            R16_MA11_idx_out    =   R16_MA11_idx_out_pip_out    ;
            R16_MA12_idx_out    =   R16_MA12_idx_out_pip_out    ;
            R16_MA13_idx_out    =   R16_MA13_idx_out_pip_out    ;
            R16_MA14_idx_out    =   R16_MA14_idx_out_pip_out    ;
            R16_MA15_idx_out    =   R16_MA15_idx_out_pip_out    ;

            R16_BN0_idx_out     =   R16_BN0_idx_out_pip_out     ; 
            R16_BN1_idx_out     =   R16_BN1_idx_out_pip_out     ; 
            R16_BN2_idx_out     =   R16_BN2_idx_out_pip_out     ; 
            R16_BN3_idx_out     =   R16_BN3_idx_out_pip_out     ; 
            R16_BN4_idx_out     =   R16_BN4_idx_out_pip_out     ; 
            R16_BN5_idx_out     =   R16_BN5_idx_out_pip_out     ; 
            R16_BN6_idx_out     =   R16_BN6_idx_out_pip_out     ; 
            R16_BN7_idx_out     =   R16_BN7_idx_out_pip_out     ; 
            R16_BN8_idx_out     =   R16_BN8_idx_out_pip_out     ; 
            R16_BN9_idx_out     =   R16_BN9_idx_out_pip_out     ; 
            R16_BN10_idx_out    =   R16_BN10_idx_out_pip_out    ;
            R16_BN11_idx_out    =   R16_BN11_idx_out_pip_out    ;
            R16_BN12_idx_out    =   R16_BN12_idx_out_pip_out    ;
            R16_BN13_idx_out    =   R16_BN13_idx_out_pip_out    ;
            R16_BN14_idx_out    =   R16_BN14_idx_out_pip_out    ;
            R16_BN15_idx_out    =   R16_BN15_idx_out_pip_out    ;
            
        end else begin
            y0  =   y0_pip_out  ; 
            y1  =   y1_pip_out  ; 
            y2  =   y2_pip_out  ; 
            y3  =   y3_pip_out  ; 
            y4  =   y4_pip_out  ; 
            y5  =   y5_pip_out  ; 
            y6  =   y6_pip_out  ; 
            y7  =   y7_pip_out  ; 
            y8  =   y8_pip_out  ; 
            y9  =   y9_pip_out  ; 
            y10 =   y10_pip_out ;
            y11 =   y11_pip_out ;
            y12 =   y12_pip_out ;
            y13 =   y13_pip_out ;
            y14 =   y14_pip_out ;
            y15 =   y15_pip_out ;

            ntt_done    =   ntt_done_pip_out    ;

            R16_MA0_idx_out     =   R16_MA0_idx_out_pip_out     ;    
            R16_MA1_idx_out     =   R16_MA1_idx_out_pip_out     ;    
            R16_MA2_idx_out     =   R16_MA2_idx_out_pip_out     ;    
            R16_MA3_idx_out     =   R16_MA3_idx_out_pip_out     ;    
            R16_MA4_idx_out     =   R16_MA4_idx_out_pip_out     ;    
            R16_MA5_idx_out     =   R16_MA5_idx_out_pip_out     ;    
            R16_MA6_idx_out     =   R16_MA6_idx_out_pip_out     ;    
            R16_MA7_idx_out     =   R16_MA7_idx_out_pip_out     ;    
            R16_MA8_idx_out     =   R16_MA8_idx_out_pip_out     ;    
            R16_MA9_idx_out     =   R16_MA9_idx_out_pip_out     ;    
            R16_MA10_idx_out    =   R16_MA10_idx_out_pip_out    ;   
            R16_MA11_idx_out    =   R16_MA11_idx_out_pip_out    ;   
            R16_MA12_idx_out    =   R16_MA12_idx_out_pip_out    ;   
            R16_MA13_idx_out    =   R16_MA13_idx_out_pip_out    ;   
            R16_MA14_idx_out    =   R16_MA14_idx_out_pip_out    ;   
            R16_MA15_idx_out    =   R16_MA15_idx_out_pip_out    ;   

            R16_BN0_idx_out     =   R16_BN0_idx_out_pip_out     ; 
            R16_BN1_idx_out     =   R16_BN1_idx_out_pip_out     ; 
            R16_BN2_idx_out     =   R16_BN2_idx_out_pip_out     ; 
            R16_BN3_idx_out     =   R16_BN3_idx_out_pip_out     ; 
            R16_BN4_idx_out     =   R16_BN4_idx_out_pip_out     ; 
            R16_BN5_idx_out     =   R16_BN5_idx_out_pip_out     ; 
            R16_BN6_idx_out     =   R16_BN6_idx_out_pip_out     ; 
            R16_BN7_idx_out     =   R16_BN7_idx_out_pip_out     ; 
            R16_BN8_idx_out     =   R16_BN8_idx_out_pip_out     ; 
            R16_BN9_idx_out     =   R16_BN9_idx_out_pip_out     ; 
            R16_BN10_idx_out    =   R16_BN10_idx_out_pip_out    ;
            R16_BN11_idx_out    =   R16_BN11_idx_out_pip_out    ;
            R16_BN12_idx_out    =   R16_BN12_idx_out_pip_out    ;
            R16_BN13_idx_out    =   R16_BN13_idx_out_pip_out    ;
            R16_BN14_idx_out    =   R16_BN14_idx_out_pip_out    ;
            R16_BN15_idx_out    =   R16_BN15_idx_out_pip_out    ;
        end
    end

    //------delay----------
    logic [`D_width-1:0] x0_pip_in_delay    [0:4] ;
    logic [`D_width-1:0] x1_pip_in_delay    [0:4] ;
    logic [`D_width-1:0] x2_pip_in_delay    [0:4] ;
    logic [`D_width-1:0] x3_pip_in_delay    [0:4] ;
    logic [`D_width-1:0] x4_pip_in_delay    [0:4] ;
    logic [`D_width-1:0] x5_pip_in_delay    [0:4] ;
    logic [`D_width-1:0] x6_pip_in_delay    [0:4] ;
    logic [`D_width-1:0] x7_pip_in_delay    [0:4] ;
    logic [`D_width-1:0] x8_pip_in_delay    [0:4] ;
    logic [`D_width-1:0] x9_pip_in_delay    [0:4] ;
    logic [`D_width-1:0] x10_pip_in_delay   [0:4] ;
    logic [`D_width-1:0] x11_pip_in_delay   [0:4] ;
    logic [`D_width-1:0] x12_pip_in_delay   [0:4] ;
    logic [`D_width-1:0] x13_pip_in_delay   [0:4] ;
    logic [`D_width-1:0] x14_pip_in_delay   [0:4] ;
    logic [`D_width-1:0] x15_pip_in_delay   [0:4] ;

    assign x0_pip_in_delay [0]   =   x0_pip_in   ;
    assign x1_pip_in_delay [0]   =   x1_pip_in   ;
    assign x2_pip_in_delay [0]   =   x2_pip_in   ;
    assign x3_pip_in_delay [0]   =   x3_pip_in   ;
    assign x4_pip_in_delay [0]   =   x4_pip_in   ;
    assign x5_pip_in_delay [0]   =   x5_pip_in   ;
    assign x6_pip_in_delay [0]   =   x6_pip_in   ;
    assign x7_pip_in_delay [0]   =   x7_pip_in   ;
    assign x8_pip_in_delay [0]   =   x8_pip_in   ;
    assign x9_pip_in_delay [0]   =   x9_pip_in   ;
    assign x10_pip_in_delay[0]   =   x10_pip_in  ;
    assign x11_pip_in_delay[0]   =   x11_pip_in  ;
    assign x12_pip_in_delay[0]   =   x12_pip_in  ;
    assign x13_pip_in_delay[0]   =   x13_pip_in  ;
    assign x14_pip_in_delay[0]   =   x14_pip_in  ;
    assign x15_pip_in_delay[0]   =   x15_pip_in  ;
    always_ff @( posedge clk or posedge rst ) begin
        integer i;
        if (rst) begin
            for (i = 0; i<4 ; i=i+1) begin
                x0_pip_in_delay [i+1]   <=   'd0;
                x1_pip_in_delay [i+1]   <=   'd0;
                x2_pip_in_delay [i+1]   <=   'd0;
                x3_pip_in_delay [i+1]   <=   'd0;
                x4_pip_in_delay [i+1]   <=   'd0;
                x5_pip_in_delay [i+1]   <=   'd0;
                x6_pip_in_delay [i+1]   <=   'd0;
                x7_pip_in_delay [i+1]   <=   'd0;
                x8_pip_in_delay [i+1]   <=   'd0;
                x9_pip_in_delay [i+1]   <=   'd0;
                x10_pip_in_delay[i+1]   <=   'd0;
                x11_pip_in_delay[i+1]   <=   'd0;
                x12_pip_in_delay[i+1]   <=   'd0;
                x13_pip_in_delay[i+1]   <=   'd0;
                x14_pip_in_delay[i+1]   <=   'd0;
                x15_pip_in_delay[i+1]   <=   'd0;
            end
        end else begin
            for (i = 0; i<4 ; i=i+1) begin
                x0_pip_in_delay [i+1]   <=   x0_pip_in_delay [i];
                x1_pip_in_delay [i+1]   <=   x1_pip_in_delay [i];
                x2_pip_in_delay [i+1]   <=   x2_pip_in_delay [i];
                x3_pip_in_delay [i+1]   <=   x3_pip_in_delay [i];
                x4_pip_in_delay [i+1]   <=   x4_pip_in_delay [i];
                x5_pip_in_delay [i+1]   <=   x5_pip_in_delay [i];
                x6_pip_in_delay [i+1]   <=   x6_pip_in_delay [i];
                x7_pip_in_delay [i+1]   <=   x7_pip_in_delay [i];
                x8_pip_in_delay [i+1]   <=   x8_pip_in_delay [i];
                x9_pip_in_delay [i+1]   <=   x9_pip_in_delay [i];
                x10_pip_in_delay[i+1]   <=   x10_pip_in_delay[i];
                x11_pip_in_delay[i+1]   <=   x11_pip_in_delay[i];
                x12_pip_in_delay[i+1]   <=   x12_pip_in_delay[i];
                x13_pip_in_delay[i+1]   <=   x13_pip_in_delay[i];
                x14_pip_in_delay[i+1]   <=   x14_pip_in_delay[i];
                x15_pip_in_delay[i+1]   <=   x15_pip_in_delay[i];
            end
        end
    end

    R16_BU R16_BU(
        .LAST_STAGE(LAST_STAGE),
        .clk(clk),
        .rst(rst),
        .x0 (x0_pip_in_delay [4]),
        .x1 (x1_pip_in_delay [4]),
        .x2 (x2_pip_in_delay [4]),
        .x3 (x3_pip_in_delay [4]),
        .x4 (x4_pip_in_delay [4]),
        .x5 (x5_pip_in_delay [4]),
        .x6 (x6_pip_in_delay [4]),
        .x7 (x7_pip_in_delay [4]),
        .x8 (x8_pip_in_delay [4]),
        .x9 (x9_pip_in_delay [4]),
        .x10(x10_pip_in_delay[4]),
        .x11(x11_pip_in_delay[4]),
        .x12(x12_pip_in_delay[4]),
        .x13(x13_pip_in_delay[4]),
        .x14(x14_pip_in_delay[4]),
        .x15(x15_pip_in_delay[4]),

        .twiddle_0  (twiddle_0_pip_in ),
        .twiddle_1  (twiddle_1_pip_in ),
        .twiddle_2  (twiddle_2_pip_in ),
        .twiddle_3  (twiddle_3_pip_in ),
        .twiddle_4  (twiddle_4_pip_in ),
        .twiddle_5  (twiddle_5_pip_in ),
        .twiddle_6  (twiddle_6_pip_in ),
        .twiddle_7  (twiddle_7_pip_in ),
        .twiddle_8  (twiddle_8_pip_in ),
        .twiddle_9  (twiddle_9_pip_in ),
        .twiddle_10 (twiddle_10_pip_in),
        .twiddle_11 (twiddle_11_pip_in),
        .twiddle_12 (twiddle_12_pip_in),
        .twiddle_13 (twiddle_13_pip_in),
        .twiddle_14 (twiddle_14_pip_in),
        .twiddle_15 (twiddle_15_pip_in),

        .modulus     (modulus_pip_in   ),
        .ntt_enable  (ntt_enable_pip_in),

        .R16_MA0_idx    (R16_MA0_idx_pip_in ),
        .R16_MA1_idx    (R16_MA1_idx_pip_in ),
        .R16_MA2_idx    (R16_MA2_idx_pip_in ),
        .R16_MA3_idx    (R16_MA3_idx_pip_in ),
        .R16_MA4_idx    (R16_MA4_idx_pip_in ),
        .R16_MA5_idx    (R16_MA5_idx_pip_in ),
        .R16_MA6_idx    (R16_MA6_idx_pip_in ),
        .R16_MA7_idx    (R16_MA7_idx_pip_in ),
        .R16_MA8_idx    (R16_MA8_idx_pip_in ),
        .R16_MA9_idx    (R16_MA9_idx_pip_in ),
        .R16_MA10_idx   (R16_MA10_idx_pip_in),
        .R16_MA11_idx   (R16_MA11_idx_pip_in),
        .R16_MA12_idx   (R16_MA12_idx_pip_in),
        .R16_MA13_idx   (R16_MA13_idx_pip_in),
        .R16_MA14_idx   (R16_MA14_idx_pip_in),
        .R16_MA15_idx   (R16_MA15_idx_pip_in),

        .R16_BN0_idx    (R16_BN0_idx_pip_in ),
        .R16_BN1_idx    (R16_BN1_idx_pip_in ),
        .R16_BN2_idx    (R16_BN2_idx_pip_in ),
        .R16_BN3_idx    (R16_BN3_idx_pip_in ),
        .R16_BN4_idx    (R16_BN4_idx_pip_in ),
        .R16_BN5_idx    (R16_BN5_idx_pip_in ),
        .R16_BN6_idx    (R16_BN6_idx_pip_in ),
        .R16_BN7_idx    (R16_BN7_idx_pip_in ),
        .R16_BN8_idx    (R16_BN8_idx_pip_in ),
        .R16_BN9_idx    (R16_BN9_idx_pip_in ),
        .R16_BN10_idx   (R16_BN10_idx_pip_in),
        .R16_BN11_idx   (R16_BN11_idx_pip_in),
        .R16_BN12_idx   (R16_BN12_idx_pip_in),
        .R16_BN13_idx   (R16_BN13_idx_pip_in),
        .R16_BN14_idx   (R16_BN14_idx_pip_in),
        .R16_BN15_idx   (R16_BN15_idx_pip_in),

        //output
        .y0  (y0_pip_out ),
        .y1  (y1_pip_out ),
        .y2  (y2_pip_out ),
        .y3  (y3_pip_out ),
        .y4  (y4_pip_out ),
        .y5  (y5_pip_out ),
        .y6  (y6_pip_out ),
        .y7  (y7_pip_out ),
        .y8  (y8_pip_out ),
        .y9  (y9_pip_out ),
        .y10 (y10_pip_out),
        .y11 (y11_pip_out),
        .y12 (y12_pip_out),
        .y13 (y13_pip_out),
        .y14 (y14_pip_out),
        .y15 (y15_pip_out),


        .ntt_done(ntt_done_pip_out),

        .R16_MA0_idx_out (R16_MA0_idx_out_pip_out ),
        .R16_MA1_idx_out (R16_MA1_idx_out_pip_out ),
        .R16_MA2_idx_out (R16_MA2_idx_out_pip_out ),
        .R16_MA3_idx_out (R16_MA3_idx_out_pip_out ),
        .R16_MA4_idx_out (R16_MA4_idx_out_pip_out ),
        .R16_MA5_idx_out (R16_MA5_idx_out_pip_out ),
        .R16_MA6_idx_out (R16_MA6_idx_out_pip_out ),
        .R16_MA7_idx_out (R16_MA7_idx_out_pip_out ),
        .R16_MA8_idx_out (R16_MA8_idx_out_pip_out ),
        .R16_MA9_idx_out (R16_MA9_idx_out_pip_out ),
        .R16_MA10_idx_out(R16_MA10_idx_out_pip_out),
        .R16_MA11_idx_out(R16_MA11_idx_out_pip_out),
        .R16_MA12_idx_out(R16_MA12_idx_out_pip_out),
        .R16_MA13_idx_out(R16_MA13_idx_out_pip_out),
        .R16_MA14_idx_out(R16_MA14_idx_out_pip_out),
        .R16_MA15_idx_out(R16_MA15_idx_out_pip_out),

        .R16_BN0_idx_out (R16_BN0_idx_out_pip_out ),
        .R16_BN1_idx_out (R16_BN1_idx_out_pip_out ),
        .R16_BN2_idx_out (R16_BN2_idx_out_pip_out ),
        .R16_BN3_idx_out (R16_BN3_idx_out_pip_out ),
        .R16_BN4_idx_out (R16_BN4_idx_out_pip_out ),
        .R16_BN5_idx_out (R16_BN5_idx_out_pip_out ),
        .R16_BN6_idx_out (R16_BN6_idx_out_pip_out ),
        .R16_BN7_idx_out (R16_BN7_idx_out_pip_out ),
        .R16_BN8_idx_out (R16_BN8_idx_out_pip_out ),
        .R16_BN9_idx_out (R16_BN9_idx_out_pip_out ),
        .R16_BN10_idx_out(R16_BN10_idx_out_pip_out),
        .R16_BN11_idx_out(R16_BN11_idx_out_pip_out),
        .R16_BN12_idx_out(R16_BN12_idx_out_pip_out),
        .R16_BN13_idx_out(R16_BN13_idx_out_pip_out),
        .R16_BN14_idx_out(R16_BN14_idx_out_pip_out),
        .R16_BN15_idx_out(R16_BN15_idx_out_pip_out)
    );

endmodule