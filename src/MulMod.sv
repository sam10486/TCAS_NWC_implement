`include "barrett_reduction.sv"  
`include "Mul.sv"  
//`include "barrett_reduction.sv"

 module MulMod(                                                                                  
   A_in,                                                                                         
   B_in,                                                                                                                                                                               
   modulus,                                                                                                                                                                  
   clk,                                                                                          
   rst,                                                                                        
   result                                                                                        
 );                                                                                              
   parameter DOUBLE_DATA_WIDTH   = 2*(`D_width);
                                                                                                 
   input [`D_width-1:0] A_in;                                                                  
   input [`D_width-1:0] B_in;                                                                  
   input [`D_width-1:0] modulus;                                                                                                                                                                                                      
   input clk;                                                                                    
   input rst;                                                                                  
                                                                                                 
   output [`D_width-1:0] result;                                                               
                                                                                                                                                                                                
   wire [DOUBLE_DATA_WIDTH-1:0] S_wire;                                                                                                                                                                                                                  
                                                                                                 
	Mul M1(                                                                                       
		.A_in(A_in),                                                                                
		.B_in(B_in),                                                                                
		.clk(clk),                                                                                   
		.rst(rst),                                                                               
		.S_out(S_wire)                                                                                
	);                                                                                            
 
                                                                  
   barrett_reduction barrett_reduction(
      .S_in(S_wire),
      .modulus(modulus),
      .clk(clk),
      .rst(rst),
      .result(result)
    );                                                             
                                                                  
 endmodule  