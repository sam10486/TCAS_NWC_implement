`include "../include/define.svh"
`include "TF_gen.sv"

module TF_top (
    input LAST_STAGE    ,

    input clk           ,
    input rst           ,
    input TF_ren        ,
    input TF_wen        ,
    input [2:0] it_depth_cnt   ,

    input [`D_width-1:0] modulus        ,
    input [2:0] l                       ,
    input [`D_width-1:0] ite_sw_cnt     ,
    input [`D_width-1:0] ite_sw_cnt_ite3,

    output logic [`D_width-1:0] TF_base_b1  ,
    output logic [`D_width-1:0] TF_base_b2  ,
    output logic [`D_width-1:0] TF_base_b3  ,
    output logic [`D_width-1:0] TF_base_b4  ,
    output logic [`D_width-1:0] TF_base_b5  ,
    output logic [`D_width-1:0] TF_base_b6  ,
    output logic [`D_width-1:0] TF_base_b7  ,
    output logic [`D_width-1:0] TF_base_b8  ,
    output logic [`D_width-1:0] TF_base_b9  ,
    output logic [`D_width-1:0] TF_base_b10 ,
    output logic [`D_width-1:0] TF_base_b11 ,
    output logic [`D_width-1:0] TF_base_b12 ,
    output logic [`D_width-1:0] TF_base_b13 ,
    output logic [`D_width-1:0] TF_base_b14 ,
    output logic [`D_width-1:0] TF_base_b15
);


    logic [`D_width-1:0]    TF_base_b1_pip_out ;
    logic [`D_width-1:0]    TF_base_b2_pip_out ;
    logic [`D_width-1:0]    TF_base_b3_pip_out ;
    logic [`D_width-1:0]    TF_base_b4_pip_out ;
    logic [`D_width-1:0]    TF_base_b5_pip_out ;
    logic [`D_width-1:0]    TF_base_b6_pip_out ;
    logic [`D_width-1:0]    TF_base_b7_pip_out ;
    logic [`D_width-1:0]    TF_base_b8_pip_out ;
    logic [`D_width-1:0]    TF_base_b9_pip_out ;
    logic [`D_width-1:0]    TF_base_b10_pip_out;
    logic [`D_width-1:0]    TF_base_b11_pip_out;
    logic [`D_width-1:0]    TF_base_b12_pip_out;
    logic [`D_width-1:0]    TF_base_b13_pip_out;
    logic [`D_width-1:0]    TF_base_b14_pip_out;
    logic [`D_width-1:0]    TF_base_b15_pip_out;

    logic [3:0]    idx1_pip_in     ;
    logic [3:0]    idx2_pip_in     ;
    logic [3:0]    idx3_pip_in     ;
    logic [3:0]    idx4_pip_in     ;
    logic [3:0]    idx5_pip_in     ;
    logic [3:0]    idx6_pip_in     ;
    logic [3:0]    idx7_pip_in     ;
    logic [3:0]    idx8_pip_in     ;
    logic [3:0]    idx9_pip_in     ;
    logic [3:0]    idx10_pip_in    ;
    logic [3:0]    idx11_pip_in    ;
    logic [3:0]    idx12_pip_in    ;
    logic [3:0]    idx13_pip_in    ;
    logic [3:0]    idx14_pip_in    ;
    logic [3:0]    idx15_pip_in    ;

    logic [3:0] idx1; 
    logic [3:0] idx2; 
    logic [3:0] idx3;
    logic [3:0] idx4;
    logic [3:0] idx5;
    logic [3:0] idx6;
    logic [3:0] idx7;
    logic [3:0] idx8;
    logic [3:0] idx9;
    logic [3:0] idx10;
    logic [3:0] idx11;
    logic [3:0] idx12;
    logic [3:0] idx13;
    logic [3:0] idx14;
    logic [3:0] idx15; 

    assign idx1 = $clog2(`degree) - `radix_k1*l - 0; 
    assign idx2 = $clog2(`degree) - `radix_k1*l - 1; 
    assign idx3 = $clog2(`degree) - `radix_k1*l - 1; 
    assign idx4 = $clog2(`degree) - `radix_k1*l - 2; 
    assign idx5 = $clog2(`degree) - `radix_k1*l - 2; 
    assign idx6 = $clog2(`degree) - `radix_k1*l - 2; 
    assign idx7 = $clog2(`degree) - `radix_k1*l - 2; 
    assign idx8 = $clog2(`degree) - `radix_k1*l - 3; 
    assign idx9 = $clog2(`degree) - `radix_k1*l - 3; 
    assign idx10 = $clog2(`degree) - `radix_k1*l - 3;
    assign idx11 = $clog2(`degree) - `radix_k1*l - 3;
    assign idx12 = $clog2(`degree) - `radix_k1*l - 3;
    assign idx13 = $clog2(`degree) - `radix_k1*l - 3;
    assign idx14 = $clog2(`degree) - `radix_k1*l - 3;
    assign idx15 = $clog2(`degree) - `radix_k1*l - 3;

    logic [`D_width-1:0] idx1_k2;
    assign idx1_k2 = `radix_k2 - $clog2(1);

    always_comb begin
        if (LAST_STAGE) begin
            TF_base_b1      =   TF_base_b1_pip_out  ;
            TF_base_b2      =   TF_base_b2_pip_out  ;
            TF_base_b3      =   TF_base_b3_pip_out  ;
            TF_base_b4      =   TF_base_b4_pip_out  ;
            TF_base_b5      =   TF_base_b5_pip_out  ; //------next BU
            TF_base_b6      =   TF_base_b6_pip_out  ;
            TF_base_b7      =   TF_base_b7_pip_out  ;
            TF_base_b8      =   TF_base_b8_pip_out  ;
            TF_base_b9      =   'd0 ;
            TF_base_b10     =   'd0 ;
            TF_base_b11     =   'd0 ;
            TF_base_b12     =   'd0 ;
            TF_base_b13     =   'd0 ;
            TF_base_b14     =   'd0 ;
            TF_base_b15     =   'd0 ;
            
            idx1_pip_in     =   idx1_k2    ;
            idx2_pip_in     =   'd0   ;
            idx3_pip_in     =   'd0   ;
            idx4_pip_in     =   'd0   ;
            idx5_pip_in     =   'd0   ;
            idx6_pip_in     =   'd0   ;
            idx7_pip_in     =   'd0   ;
            idx8_pip_in     =   'd0   ;
            idx9_pip_in     =   'd0   ;
            idx10_pip_in    =   'd0   ;
            idx11_pip_in    =   'd0   ;
            idx12_pip_in    =   'd0   ;
            idx13_pip_in    =   'd0   ;
            idx14_pip_in    =   'd0   ;
            idx15_pip_in    =   'd0   ;
        end else begin
            TF_base_b1      =   TF_base_b1_pip_out  ;
            TF_base_b2      =   TF_base_b2_pip_out  ;
            TF_base_b3      =   TF_base_b3_pip_out  ;
            TF_base_b4      =   TF_base_b4_pip_out  ;
            TF_base_b5      =   TF_base_b5_pip_out  ;
            TF_base_b6      =   TF_base_b6_pip_out  ;
            TF_base_b7      =   TF_base_b7_pip_out  ;
            TF_base_b8      =   TF_base_b8_pip_out  ;
            TF_base_b9      =   TF_base_b9_pip_out  ;
            TF_base_b10     =   TF_base_b10_pip_out ;
            TF_base_b11     =   TF_base_b11_pip_out ;
            TF_base_b12     =   TF_base_b12_pip_out ;
            TF_base_b13     =   TF_base_b13_pip_out ;
            TF_base_b14     =   TF_base_b14_pip_out ;
            TF_base_b15     =   TF_base_b15_pip_out ;

            idx1_pip_in     =   idx1    ;
            idx2_pip_in     =   idx2    ;
            idx3_pip_in     =   idx3    ;
            idx4_pip_in     =   idx4    ;
            idx5_pip_in     =   idx5    ;
            idx6_pip_in     =   idx6    ;
            idx7_pip_in     =   idx7    ;
            idx8_pip_in     =   idx8    ;
            idx9_pip_in     =   idx9    ;
            idx10_pip_in    =   idx10   ;
            idx11_pip_in    =   idx11   ;
            idx12_pip_in    =   idx12   ;
            idx13_pip_in    =   idx13   ;
            idx14_pip_in    =   idx14   ;
            idx15_pip_in    =   idx15   ;
        end
    end
    
    logic TF_wen_delay_pip0, TF_wen_delay_pip1, TF_wen_delay_pip2;
    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            TF_wen_delay_pip0 <= 'd0;
            TF_wen_delay_pip1 <= 'd0;
            TF_wen_delay_pip2 <= 'd0;
        end else begin
            TF_wen_delay_pip0 <= TF_wen;
            TF_wen_delay_pip1 <= TF_wen_delay_pip0;
            TF_wen_delay_pip2 <= TF_wen_delay_pip1;
        end
    end

    TF_gen TF_gen (
        .clk           (clk),
        .rst           (rst),
        .TF_ren        (TF_ren      ),
        .TF_wen        (TF_wen_delay_pip2      ),
        .it_depth_cnt  (it_depth_cnt),

        .modulus        (modulus      ),
        .l              (l            ),
        .ite_sw_cnt     (ite_sw_cnt   ),
        .ite_sw_cnt_ite3(ite_sw_cnt_ite3),

        .idx1	(idx1_pip_in	),
        .idx2	(idx2_pip_in	),
        .idx3	(idx3_pip_in	),
        .idx4	(idx4_pip_in	),
        .idx5	(idx5_pip_in	),
        .idx6	(idx6_pip_in	),
        .idx7	(idx7_pip_in	),
        .idx8	(idx8_pip_in	),
        .idx9	(idx9_pip_in	),
        .idx10	(idx10_pip_in	),
        .idx11	(idx11_pip_in	),
        .idx12	(idx12_pip_in	),
        .idx13	(idx13_pip_in	),
        .idx14	(idx14_pip_in	),
        .idx15	(idx15_pip_in	),

        //output

        .TFG0_out    (TF_base_b1_pip_out ) ,
        .TFG1_out    (TF_base_b2_pip_out ) ,
        .TFG2_out    (TF_base_b3_pip_out ) ,
        .TFG3_out    (TF_base_b4_pip_out ) ,
        .TFG4_out    (TF_base_b5_pip_out ) ,
        .TFG5_out    (TF_base_b6_pip_out ) ,
        .TFG6_out    (TF_base_b7_pip_out ) ,
        .TFG7_out    (TF_base_b8_pip_out ) ,
        .TFG8_out    (TF_base_b9_pip_out ) ,
        .TFG9_out    (TF_base_b10_pip_out) ,
        .TFG10_out   (TF_base_b11_pip_out) ,
        .TFG11_out   (TF_base_b12_pip_out) ,
        .TFG12_out   (TF_base_b13_pip_out) ,
        .TFG13_out   (TF_base_b14_pip_out) ,
        .TFG14_out   (TF_base_b15_pip_out)
    );
endmodule