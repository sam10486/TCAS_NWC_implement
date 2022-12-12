`include "../include/define.svh"
`include "BU2_NWC.sv"
`define CYCLE 10
parameter pattern_num = 64;

module Testbench();
    logic [`D_width-1:0] in1;
    logic [`D_width-1:0] in2;
    logic [`D_width-1:0] twiddle;
    logic [`D_width-1:0] modulus;
    logic rst;
    logic clk;

    logic [`D_width-1:0] BU_a;
    logic [`D_width-1:0] BU_b;
    logic [`D_width-1:0] twiddle_BU_out;
    logic [`D_width-1:0] modulus_BU_out;


    logic  [`D_width-1:0] twiddle_NWC_mem [0:pattern_num-1]; 
    logic  [`D_width-1:0] pattern_up_NWC [0:pattern_num-1];
    logic  [`D_width-1:0] pattern_down_NWC [0:pattern_num-1];
    logic  [`D_width-1:0] golden_up [0:pattern_num-1];
    logic  [`D_width-1:0] golden_down [0:pattern_num-1]; 

    logic [`D_width-1:0] ans_up [0:pattern_num-1];  
    logic [`D_width-1:0] ans_down [0:pattern_num-1];   
    assign modulus = 7681;
    initial begin
        $readmemh("../sim/data_file/BU_NWC/pattern_up_NWC.txt", pattern_up_NWC);  
        $readmemh("../sim/data_file/BU_NWC/pattern_down_NWC.txt", pattern_down_NWC);
        $readmemh("../sim/data_file/BU_NWC/twiddle_NWC.txt", twiddle_NWC_mem);
        $readmemh("../sim/data_file/BU_NWC/golden_up.txt", golden_up);
        $readmemh("../sim/data_file/BU_NWC/golden_down.txt", golden_down);
    end
    initial begin
        for(int i=0; i<pattern_num; i=i+1) begin
            $display("twiddle_array",i, " = " ,twiddle_NWC_mem[i]);
        end
    end

    integer num = 0;
    integer err = 0;

    BU2_NWC BU2_NWC(
        .in1(in1),
        .in2(in2),
        .twiddle(twiddle),
        .modulus(modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(BU_a),
        .BU_b(BU_b),
        .twiddle_BU_out(twiddle_BU_out),
        .modulus_BU_out(modulus_BU_out)
    );

    always #(`CYCLE/2) clk = ~clk;
    initial begin
        #0
        clk = 0; 
        rst = 1;
        #`CYCLE rst = 0;
    end

    initial begin
        for(int i=0; i<pattern_num;i=i+1) begin
            #(`CYCLE);
            in1 = pattern_up_NWC[i];
            in2 = pattern_down_NWC[i];
            twiddle = twiddle_NWC_mem[i];
        
        end
        #(`CYCLE);
        for (int k = 0; k<pattern_num; k=k+1) begin
            if ((ans_up[k] == golden_up[k]) && (ans_down[k] == golden_down[k])) begin
                $display("%d data is correct, your up data is %d, down data is %d, correct up data is %d, down data is %d", num, ans_up[k], ans_down[k], golden_up[k], golden_down[k]);
            end else begin
                $display("%d data is failed, your up data is %d, down data is %d, correct up data is %d, down data is %d", num, ans_up[k], ans_down[k], golden_up[k], golden_down[k]);
                err = err + 1;
            end
            num = num + 1;
            #`CYCLE;
        end
        result(err, num);
        #(`CYCLE*`MAX) $finish;
    end

    initial begin
        #(`CYCLE*2);
        for(int r = 0; r < pattern_num; )begin
            #(`CYCLE);
            ans_up[r] = BU_a;
            ans_down[r] = BU_b;
            r = r + 1;
        end
    end


    initial begin
        `ifdef FSDB
        $fsdbDumpfile("BU2_NWC.fsdb");
        //$fsdbDumpvars(0, TOP);
        $fsdbDumpvars;
        `elsif FSDB_ALL
        $fsdbDumpfile("BU2_NWC.fsdb");
        $fsdbDumpvars("+struct", "+mda", BU2_NWC);
        $fsdbDumpvars("+struct", "+mda", Testbench);
        //$fsdbDumpvars("+struct", "+mda", i_DRAM);
        //$dumpvars("+struct", i_DRAM);
        
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