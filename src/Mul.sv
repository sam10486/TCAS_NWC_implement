`include "../include/define.svh"                          
module Mul(                                       
   A_in,                                          
   B_in,                                          
   clk,                                           
   rst,                                         
   S_out                                          
);                                                
                                                  
  parameter DATA_WIDTH = `D_width;        
  parameter DOUBLE_DATA_WIDTH = 2*DATA_WIDTH ;    

   input [DATA_WIDTH-1:0] A_in;                    
   input [DATA_WIDTH-1:0] B_in;                    
   input clk;                                      
   input rst;   

   output reg [DOUBLE_DATA_WIDTH-1:0] S_out;     

   wire [DOUBLE_DATA_WIDTH-1:0]S_wire;

    assign  S_wire = A_in * B_in;                   
                                                   
    always@(posedge clk or posedge rst)begin      
        if(rst)begin   
	        S_out <= 'd0 ;    	                             
 	    end else begin                                      
          S_out <= S_wire;                   
 	    end                                             
    end       

endmodule