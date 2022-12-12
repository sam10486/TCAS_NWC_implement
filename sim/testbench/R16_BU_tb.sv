`include "../include/define.svh"
`include "R16_BU.sv"
`define CYCLE 10

parameter pattern_number = 16;
module Testbench ();
    
    logic [`D_width-1:0]    x0, x1, x2, x3, x4, x5, x6, x7,
                            x8, x9, x10, x11, x12, x13, x14, x15;
    logic [`D_width-1:0]    twiddle_0, twiddle_1, twiddle_2, twiddle_3, twiddle_4, twiddle_5, twiddle_6,
                            twiddle_7, twiddle_8, twiddle_9, twiddle_10, twiddle_11, twiddle_12, twiddle_13,
                            twiddle_14, twiddle_15;
    logic [`D_width-1:0] modulus;
    logic rst;
    logic clk;
    logic done;
    logic [`D_width-1:0]    y0, y1, y2, y3, y4, y5, y6, y7,
                            y8, y9, y10, y11, y12, y13, y14, y15;


    logic [`D_width-1:0] input_pattern [0:pattern_number-1]; 
    logic [`D_width-1:0] output_pattern [0:pattern_number-1]; 
    logic [`D_width-1:0] phi_factor [0:pattern_number-1];

    logic [`D_width-1:0] R16_output [0:pattern_number-1];  

    initial begin
        $readmemh("../sim/data_file/R16_BU/input_pattern.txt", input_pattern);  
        $readmemh("../sim/data_file/R16_BU/output_pattern.txt", output_pattern);
        $readmemh("../sim/data_file/R16_BU/phi_factor.txt", phi_factor);
    end


    integer num = 0;
    integer err = 0;
    
    
    assign modulus = 65537;

    R16_BU R16_BU(
        .x0(x0), .x1(x1), .x2(x2), .x3(x3), .x4(x4), .x5(x5), .x6(x6), .x7(x7),
        .x8(x8), .x9(x9), .x10(x10), .x11(x11), .x12(x12), .x13(x13), .x14(x14), .x15(x15),

        .twiddle_0(twiddle_0), .twiddle_1(twiddle_1), .twiddle_2(twiddle_2), .twiddle_3(twiddle_3), 
        .twiddle_4(twiddle_4), .twiddle_5(twiddle_5), .twiddle_6(twiddle_6), .twiddle_7(twiddle_7), 
        .twiddle_8(twiddle_8), .twiddle_9(twiddle_9), .twiddle_10(twiddle_10), .twiddle_11(twiddle_11), 
        .twiddle_12(twiddle_12), .twiddle_13(twiddle_13), .twiddle_14(twiddle_14), .twiddle_15(twiddle_15),

        .modulus(modulus), .clk(clk), .rst(rst), 

        .y0(y0), .y1(y1), .y2(y2), .y3(y3), .y4(y4), .y5(y5), .y6(y6), .y7(y7),
        .y8(y8), .y9(y9), .y10(y10), .y11(y11), .y12(y12), .y13(y13), .y14(y14), .y15(y15)
    );


    always #(`CYCLE/2) clk = ~clk;
    initial begin
        #0
        clk = 0; 
        rst = 1;
        #`CYCLE rst = 0;
    end

    int loop_num = pattern_number/16;
    initial begin
        for (int i = 0; i<loop_num ; i=i+1) begin
            #`CYCLE;
            x0 <= input_pattern[16*i];
            x1 <= input_pattern[16*i+1];
            x2 <= input_pattern[16*i+2];
            x3 <= input_pattern[16*i+3];
            x4 <= input_pattern[16*i+4];
            x5 <= input_pattern[16*i+5];
            x6 <= input_pattern[16*i+6];
            x7 <= input_pattern[16*i+7];
            x8 <= input_pattern[16*i+8];
            x9 <= input_pattern[16*i+9];
            x10 <= input_pattern[16*i+10];
            x11 <= input_pattern[16*i+11];
            x12 <= input_pattern[16*i+12];
            x13 <= input_pattern[16*i+13];
            x14 <= input_pattern[16*i+14];
            x15 <= input_pattern[16*i+15];

            twiddle_0 <= phi_factor[0];
            twiddle_1 <= phi_factor[1];
            twiddle_2 <= phi_factor[2];
            twiddle_3 <= phi_factor[3];
            twiddle_4 <= phi_factor[4];
            twiddle_5 <= phi_factor[5];
            twiddle_6 <= phi_factor[6];
            twiddle_7 <= phi_factor[7];
            twiddle_8 <= phi_factor[8];
            twiddle_9 <= phi_factor[9];
            twiddle_10 <= phi_factor[10];
            twiddle_11 <= phi_factor[11];
            twiddle_12 <= phi_factor[12];
            twiddle_13 <= phi_factor[13];
            twiddle_14 <= phi_factor[14];
            twiddle_15 <= phi_factor[15];
        end
    end

    initial begin
      #(`CYCLE*21);
        for (int j = 0; j<loop_num; j=j+1) begin
            #`CYCLE;
            R16_output[16*j+0] <= y0; 
            R16_output[16*j+1] <= y1;
            R16_output[16*j+2] <= y2;
            R16_output[16*j+3] <= y3; 
            R16_output[16*j+4] <= y4; 
            R16_output[16*j+5] <= y5; 
            R16_output[16*j+6] <= y6; 
            R16_output[16*j+7] <= y7; 
            R16_output[16*j+8] <= y8; 
            R16_output[16*j+9] <= y9; 
            R16_output[16*j+10] <= y10; 
            R16_output[16*j+11] <= y11;
            R16_output[16*j+12] <= y12;
            R16_output[16*j+13] <= y13;
            R16_output[16*j+14] <= y14;
            R16_output[16*j+15] <= y15;
            j = j+1;   
        end
        #(`CYCLE);
        for (int i = 0; i<pattern_number;i=i+1 ) begin
          if (output_pattern[i] == R16_output[i]) begin
            $display("%d data is correct, your data is %d, correct up data is %d", num, R16_output[i], output_pattern[i]);
          end else begin
            $display("%d data is failed!!!!, your data is %d, correct up data is %d", num, R16_output[i], output_pattern[i]);
            err = err + 1;
          end
          num = num + 1;
          #`CYCLE;
        end 
        
        result(err, num);
        #(`CYCLE*`MAX) $finish;
    end

    initial begin
        $fsdbDumpfile("R16_BU.fsdb");
        $fsdbDumpvars;
        $fsdbDumpvars("+struct", "+mda", R16_BU);
        $fsdbDumpvars("+struct", "+mda", Testbench);    
        #(`CYCLE*`MAX)
        $finish;
    end

    task result;
    input integer err;
    input integer num;
    integer rf;
    begin
      if (err === 0)
      begin
        $display("\n");
        $display("\n");
        $display("        ****************************               ");
        $display("        **                        **       |\__||  ");
        $display("        **  Congratulations !!    **      / O.O  | ");
        $display("        **                        **    /_____   | ");
        $display("        **  Simulation PASS!!     **   /^ ^ ^ \\  |");
        $display("        **                        **  |^ ^ ^ ^ |w| ");
        $display("        ****************************   \\m___m__|_|");
        $display("\n");
      end
      else
      begin
        $display("\n");
        $display("\n");
        $display("        ****************************               ");
        $display("        **                        **       |\__||  ");
        $display("        **  OOPS!!                **      / X,X  | ");
        $display("        **                        **    /_____   | ");
        $display("        **  Simulation Failed!!   **   /^ ^ ^ \\  |");
        $display("        **                        **  |^ ^ ^ ^ |w| ");
        $display("        ****************************   \\m___m__|_|");
        $display("         Totally has %d errors                     ", err); 
        $display("\n");
      end
    end
  endtask
endmodule