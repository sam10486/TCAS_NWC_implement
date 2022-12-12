`include "../include/define.svh"
`include "barrett_reduction.sv"
`define CYCLE 10


module Testbench();
    //logic [`double_d_width-1:0] S_in;
    logic [`D_width-1:0] a;
    logic [`D_width-1:0] b;
    logic [`D_width-1:0] modulus;
    logic rst;
    logic clk = 0;

    logic [`D_width-1:0] out;
    logic [`D_width-1:0] modulus_out;

    assign modulus = 201;
    
    barrett_reduction #(.pre_computing_width(10) , 
                        .precompute(10'd652))
    barrett_reduction
    (
        .a(a),
        .b(b),
        .modulus(modulus),
        .clk(clk),
        .rst(rst),

        .result(out)
    );
    parameter DATA_WIDTH = `D_width;
    parameter DOUBLE_DATA_WIDTH = 2*DATA_WIDTH;
    reg [`D_width-1:0] ans;
    reg [DOUBLE_DATA_WIDTH-1:0] c;
    integer num = 0;
    integer i, j;
    integer err = 0;


    always #(`CYCLE/2) clk = ~clk;

    initial begin
        clk = 0; rst = 1;
        #`CYCLE rst = 0;
        #`CYCLE a = 59; #`CYCLE b = 66;
        c = a * b;
        $display("c is %d" , c);
        #`CYCLE ans = c % modulus;
        
        if (ans == out) begin
            $display("%d data is correct, your data is %d, correct data is %d", num, out, ans);
        end else begin
            $display("%d data is error !! your data is %d, correct data is %d", num, out, ans);
            err = err + 1;
        end
        num = num + 1; 

        result(err, num);
        #(`CYCLE*`MAX) $finish;
    end


    initial
    begin
        `ifdef FSDB
        $dumpfile("barrett.fsdb");
        //$fsdbDumpvars(0, TOP);
        $dumpvars;
        `elsif FSDB_ALL
        $dumpfile("barrett.fsdb");
        $dumpvars("+struct", "+mda", TOP);
        //$fsdbDumpvars("+struct", "+mda", i_DRAM);
        $dumpvars("+struct", i_DRAM);
        `endif
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