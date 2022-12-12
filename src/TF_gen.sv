`include "../include/define.svh"
`include "Register.sv"
`include "TFG.sv"

module TF_gen(
	input clk,
	input rst,
	input TF_ren,
	input TF_wen,
	input [2:0] it_depth_cnt,

	input [`D_width-1:0] modulus,
	input [2:0] l,
	input [`D_width-1:0] ite_sw_cnt,
	input [`D_width-1:0] ite_sw_cnt_ite3,

	input [3:0] idx1	, 
	input [3:0] idx2	, 
	input [3:0] idx3	,
	input [3:0] idx4	,
	input [3:0] idx5	,
	input [3:0] idx6	,
	input [3:0] idx7	,
	input [3:0] idx8	,
	input [3:0] idx9	,
	input [3:0] idx10	,
	input [3:0] idx11	,
	input [3:0] idx12	,
	input [3:0] idx13	,
	input [3:0] idx14	,
	input [3:0] idx15	,
	
	output logic [`D_width-1:0] TFG0_out	,
	output logic [`D_width-1:0] TFG1_out	,
	output logic [`D_width-1:0] TFG2_out	,
	output logic [`D_width-1:0] TFG3_out	,
	output logic [`D_width-1:0] TFG4_out	,
	output logic [`D_width-1:0] TFG5_out	,
	output logic [`D_width-1:0] TFG6_out	,
	output logic [`D_width-1:0] TFG7_out	,
	output logic [`D_width-1:0] TFG8_out	,
	output logic [`D_width-1:0] TFG9_out	,
	output logic [`D_width-1:0] TFG10_out	,
	output logic [`D_width-1:0] TFG11_out	,
	output logic [`D_width-1:0] TFG12_out	,
	output logic [`D_width-1:0] TFG13_out	,
	output logic [`D_width-1:0] TFG14_out
	

);

	logic [`D_width-1:0] Read_TF_base0  ;
	logic [`D_width-1:0] Read_TF_base1  ;
	logic [`D_width-1:0] Read_TF_base2  ;
	logic [`D_width-1:0] Read_TF_base3  ;
	logic [`D_width-1:0] Read_TF_base4  ;
	logic [`D_width-1:0] Read_TF_base5  ;
	logic [`D_width-1:0] Read_TF_base6  ;
	logic [`D_width-1:0] Read_TF_base7  ;
	logic [`D_width-1:0] Read_TF_base8  ;
	logic [`D_width-1:0] Read_TF_base9  ;
	logic [`D_width-1:0] Read_TF_base10 ;
	logic [`D_width-1:0] Read_TF_base11 ;
	logic [`D_width-1:0] Read_TF_base12 ;
	logic [`D_width-1:0] Read_TF_base13 ;
	logic [`D_width-1:0] Read_TF_base14 ;
	
	logic [`D_width-1:0] Read_TF_const0    ;
	logic [`D_width-1:0] Read_TF_const1    ;
	logic [`D_width-1:0] Read_TF_const2    ;
	logic [`D_width-1:0] Read_TF_const3    ;
	logic [`D_width-1:0] Read_TF_const4    ;
	logic [`D_width-1:0] Read_TF_const5    ;
	logic [`D_width-1:0] Read_TF_const6    ;
	logic [`D_width-1:0] Read_TF_const7    ;
	logic [`D_width-1:0] Read_TF_const8    ;
	logic [`D_width-1:0] Read_TF_const9    ;
	logic [`D_width-1:0] Read_TF_const10   ;
	logic [`D_width-1:0] Read_TF_const11   ;
	logic [`D_width-1:0] Read_TF_const12   ;
	logic [`D_width-1:0] Read_TF_const13   ;
	logic [`D_width-1:0] Read_TF_const14   ;


	//-----------------
	logic TF_ren_pip0, TF_ren_pip1, TF_ren_pip2, TF_ren_pip3;
	logic [2:0] l_pip0, l_pip1, l_pip2, l_pip3;
	logic [2:0] it_depth_cnt0, it_depth_cnt1, it_depth_cnt2, it_depth_cnt3;

	always_ff @( posedge clk or posedge rst ) begin
		if (rst) begin
			TF_ren_pip0 <= 'd0;
			TF_ren_pip1 <= 'd0;
			TF_ren_pip2 <= 'd0;
			TF_ren_pip3 <= 'd0;
			l_pip0 		<= 'd0;
			l_pip1 		<= 'd0;
			l_pip2 		<= 'd0;
			l_pip3 		<= 'd0;
			it_depth_cnt0	<= 'd0;
			it_depth_cnt1	<= 'd1;
			it_depth_cnt2	<= 'd2;
			it_depth_cnt3	<= 'd3;
		end else begin
			TF_ren_pip0 <= TF_ren;
			TF_ren_pip1 <= TF_ren_pip0;
			TF_ren_pip2 <= TF_ren_pip1;
			TF_ren_pip3 <= TF_ren_pip2;
			l_pip0 		<= l;
			l_pip1 		<= l_pip0;
			l_pip2 		<= l_pip1;
			l_pip3 		<= l_pip2;
			it_depth_cnt0	<= it_depth_cnt;
			it_depth_cnt1	<= it_depth_cnt0;
			it_depth_cnt2	<= it_depth_cnt1;
			it_depth_cnt3	<= it_depth_cnt2;

		end
	end

	Register Register(
		//input
		.clk           		(clk					),
		.rst           		(rst					),
		.TF_ren        		(TF_ren_pip3					),
		.it_depth_cnt   	(it_depth_cnt3			),
		.l					(l_pip3						),

		.idx1				(idx1	),
		.idx2				(idx2	),
		.idx3				(idx3	),
		.idx4				(idx4	),
		.idx5				(idx5	),
		.idx6				(idx6	),
		.idx7				(idx7	),
		.idx8				(idx8	),
		.idx9				(idx9	),
		.idx10				(idx10	),
		.idx11				(idx11	),
		.idx12				(idx12	),
		.idx13				(idx13	),
		.idx14				(idx14	),
		.idx15				(idx15	),
		
		//output
		.Read_TF_base0  	(Read_TF_base0 ),
		.Read_TF_base1  	(Read_TF_base1 ),
		.Read_TF_base2  	(Read_TF_base2 ),
		.Read_TF_base3  	(Read_TF_base3 ),
		.Read_TF_base4  	(Read_TF_base4 ),
		.Read_TF_base5  	(Read_TF_base5 ),
		.Read_TF_base6  	(Read_TF_base6 ),
		.Read_TF_base7  	(Read_TF_base7 ),
		.Read_TF_base8  	(Read_TF_base8 ),
		.Read_TF_base9  	(Read_TF_base9 ),
		.Read_TF_base10 	(Read_TF_base10),
		.Read_TF_base11 	(Read_TF_base11),
		.Read_TF_base12 	(Read_TF_base12),
		.Read_TF_base13 	(Read_TF_base13),
		.Read_TF_base14 	(Read_TF_base14),

		.Read_TF_const0    	(Read_TF_const0 ),
		.Read_TF_const1    	(Read_TF_const1 ),
		.Read_TF_const2    	(Read_TF_const2 ),
		.Read_TF_const3    	(Read_TF_const3 ),
		.Read_TF_const4    	(Read_TF_const4 ),
		.Read_TF_const5    	(Read_TF_const5 ),
		.Read_TF_const6    	(Read_TF_const6 ),
		.Read_TF_const7    	(Read_TF_const7 ),
		.Read_TF_const8    	(Read_TF_const8 ),
		.Read_TF_const9    	(Read_TF_const9 ),
		.Read_TF_const10   	(Read_TF_const10),
		.Read_TF_const11   	(Read_TF_const11),
		.Read_TF_const12   	(Read_TF_const12),
		.Read_TF_const13   	(Read_TF_const13),
		.Read_TF_const14   	(Read_TF_const14)
	);	

	logic TF_wen_sel;
	always_comb begin
		if (rst) begin
			TF_wen_sel = 'd0;
		end else begin
			if (TF_ren_pip3) begin
				TF_wen_sel = TF_wen;
			end else begin
				TF_wen_sel = 'd0;
			end
		end
	end


	logic [`D_width-1:0] TFG_ite_sw_cnt;
	always_comb begin 
		if (l == 'd4) begin
			TFG_ite_sw_cnt = ite_sw_cnt_ite3;
		end else begin
			TFG_ite_sw_cnt = ite_sw_cnt;
		end
	end

	//-----------
	TFG TFG0(
		//input
		.W_B		(Read_TF_base0),       
		.W_C		(Read_TF_const0),       
		.Moulus		(modulus),    
		.ite_sw_cnt	(TFG_ite_sw_cnt),
		.TF_wen		(TF_wen_sel),
		.TF_ren		(TF_ren_pip3),
		.clk		(clk),   
		.rst		(rst),  
		.l			(l_pip3),
		//output
		.result		(TFG0_out)
	);
	///---------------------

	TFG TFG1(
		//input
		.W_B		(Read_TF_base1),       
		.W_C		(Read_TF_const1),       
		.Moulus		(modulus),    
		.ite_sw_cnt	(TFG_ite_sw_cnt),
		.TF_wen		(TF_wen_sel),
		.TF_ren		(TF_ren_pip3),
		.clk		(clk),   
		.rst		(rst),  
		.l			(l_pip3),
		//output
		.result		(TFG1_out)
	);

	TFG TFG2(
		//input
		.W_B		(Read_TF_base2),       
		.W_C		(Read_TF_const2),       
		.Moulus		(modulus),    
		.ite_sw_cnt	(TFG_ite_sw_cnt),
		.TF_wen		(TF_wen_sel),
		.TF_ren		(TF_ren_pip3),
		.clk		(clk),   
		.rst		(rst),  
		.l			(l_pip3),
		//output
		.result		(TFG2_out)
	);
	//-----------------

	TFG TFG3(
		//input
		.W_B		(Read_TF_base3),       
		.W_C		(Read_TF_const3),       
		.Moulus		(modulus),    
		.ite_sw_cnt	(TFG_ite_sw_cnt),
		.TF_wen		(TF_wen_sel),
		.TF_ren		(TF_ren_pip3),
		.clk		(clk),   
		.rst		(rst),  
		.l			(l_pip3),
		//output
		.result		(TFG3_out)
	);

	TFG TFG4(
		//input
		.W_B		(Read_TF_base4),       
		.W_C		(Read_TF_const4),       
		.Moulus		(modulus),    
		.ite_sw_cnt	(TFG_ite_sw_cnt),
		.TF_wen		(TF_wen_sel),
		.TF_ren		(TF_ren_pip3),
		.clk		(clk),   
		.rst		(rst),  
		.l			(l_pip3),
		//output
		.result		(TFG4_out)
	);

	TFG TFG5(
		//input
		.W_B		(Read_TF_base5),       
		.W_C		(Read_TF_const5),       
		.Moulus		(modulus),    
		.ite_sw_cnt	(TFG_ite_sw_cnt),
		.TF_wen		(TF_wen_sel),
		.TF_ren		(TF_ren_pip3),
		.clk		(clk),   
		.rst		(rst),  
		.l			(l_pip3),
		//output
		.result		(TFG5_out)
	);

	TFG TFG6(
		//input
		.W_B		(Read_TF_base6),       
		.W_C		(Read_TF_const6),       
		.Moulus		(modulus),    
		.ite_sw_cnt	(TFG_ite_sw_cnt),
		.TF_wen		(TF_wen_sel),
		.TF_ren		(TF_ren_pip3),
		.clk		(clk),   
		.rst		(rst),  
		.l			(l_pip3),
		//output
		.result		(TFG6_out)
	);

	//---------------

	TFG TFG7(
		//input
		.W_B		(Read_TF_base7),       
		.W_C		(Read_TF_const7),       
		.Moulus		(modulus),    
		.ite_sw_cnt	(TFG_ite_sw_cnt),
		.TF_wen		(TF_wen_sel),
		.TF_ren		(TF_ren_pip3),
		.clk		(clk),   
		.rst		(rst),  
		.l			(l_pip3),
		//output
		.result		(TFG7_out)
	);

	TFG TFG8(
		//input
		.W_B		(Read_TF_base8),       
		.W_C		(Read_TF_const8),       
		.Moulus		(modulus),    
		.ite_sw_cnt	(TFG_ite_sw_cnt),
		.TF_wen		(TF_wen_sel),
		.TF_ren		(TF_ren_pip3),
		.clk		(clk),   
		.rst		(rst),  
		.l			(l_pip3),
		//output
		.result		(TFG8_out)
	);

	TFG TFG9(
		//input
		.W_B		(Read_TF_base9),       
		.W_C		(Read_TF_const9),       
		.Moulus		(modulus),    
		.ite_sw_cnt	(TFG_ite_sw_cnt),
		.TF_wen		(TF_wen_sel),
		.TF_ren		(TF_ren_pip3),
		.clk		(clk),   
		.rst		(rst),  
		.l			(l_pip3),
		//output
		.result		(TFG9_out)
	);

	TFG TFG10(
		//input
		.W_B		(Read_TF_base10),       
		.W_C		(Read_TF_const10),       
		.Moulus		(modulus),    
		.ite_sw_cnt	(TFG_ite_sw_cnt),
		.TF_wen		(TF_wen_sel),
		.TF_ren		(TF_ren_pip3),
		.clk		(clk),   
		.rst		(rst),  
		.l			(l_pip3),
		//output
		.result		(TFG10_out)
	);

	TFG TFG11(
		//input
		.W_B		(Read_TF_base11),       
		.W_C		(Read_TF_const11),       
		.Moulus		(modulus),    
		.ite_sw_cnt	(TFG_ite_sw_cnt),
		.TF_wen		(TF_wen_sel),
		.TF_ren		(TF_ren_pip3),
		.clk		(clk),   
		.rst		(rst),  
		.l			(l_pip3),
		//output
		.result		(TFG11_out)
	);

	TFG TFG12(
		//input
		.W_B		(Read_TF_base12),       
		.W_C		(Read_TF_const12),       
		.Moulus		(modulus),    
		.ite_sw_cnt	(TFG_ite_sw_cnt),
		.TF_wen		(TF_wen_sel),
		.TF_ren		(TF_ren_pip3),
		.clk		(clk),   
		.rst		(rst),  
		.l			(l_pip3),
		//output
		.result		(TFG12_out)
	);

	TFG TFG13(
		//input
		.W_B		(Read_TF_base13),       
		.W_C		(Read_TF_const13),       
		.Moulus		(modulus),    
		.ite_sw_cnt	(TFG_ite_sw_cnt),
		.TF_wen		(TF_wen_sel),
		.TF_ren		(TF_ren_pip3),
		.clk		(clk),   
		.rst		(rst),  
		.l			(l_pip3),
		//output
		.result		(TFG13_out)
	);

	TFG TFG14(
		//input
		.W_B		(Read_TF_base14),       
		.W_C		(Read_TF_const14),       
		.Moulus		(modulus),    
		.ite_sw_cnt	(TFG_ite_sw_cnt),
		.TF_wen		(TF_wen_sel),
		.TF_ren		(TF_ren_pip3),
		.clk		(clk),   
		.rst		(rst),  
		.l			(l_pip3),
		//output
		.result		(TFG14_out)
	);

endmodule