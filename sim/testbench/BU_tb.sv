`include "../include/define.svh"
`include "BU.sv"
`define CYCLE 10


module Testbench();
    logic [`D_width-1:0] in1;
    logic [`D_width-1:0] in2;
    logic [`D_width-1:0] twiddle;
    logic [`D_width-1:0] modulus;
    logic rst;
    logic clk;

    logic BU_valid;
    logic [`D_width-1:0] fft_a;
    logic [`D_width-1:0] fft_b;
    logic [`D_width-1:0] twiddle_BU_out;
    logic [`D_width-1:0] modulus_BU_out;


    logic  [`D_width-1:0] twiddle_mem [0:95]; 

    logic  [`D_width-1:0] pattern_up [0:95];
    logic  [`D_width-1:0] pattern_down [0:95];
    logic  [`D_width-1:0] fft_up [0:95];
    logic  [`D_width-1:0] fft_down [0:95]; 

    logic [`D_width-1:0] ans_up [0:95];  
    logic [`D_width-1:0] ans_down [0:95];   
    assign modulus = 7681;
    initial begin
        $readmemh("../sim/data_file/BU/twiddle_out.txt", twiddle_mem);  
        $readmemh("../sim/data_file/BU/fft_up.txt", fft_up);
        $readmemh("../sim/data_file/BU/fft_down.txt", fft_down);
        $readmemh("../sim/data_file/BU/pattern_up.txt", pattern_up);
        $readmemh("../sim/data_file/BU/pattern_down.txt", pattern_down);
    end
    initial begin
        for(int i=0; i<96; i=i+1) begin
            $display("twiddle_array",i, " = " ,twiddle_mem[i]);
        end
    end

    integer num = 0;
    integer err = 0;

    BU2_FFT BU2_FFT(
        .in1(in1),
        .in2(in2),
        .twiddle(twiddle),
        .modulus(modulus),
        .rst(rst),
        .clk(clk),

        .BU_valid(BU_valid),
        .fft_a(fft_a),
        .fft_b(fft_b),
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
        for(int i=0; i<96;i=i+1) begin
            #(`CYCLE);
            in1 = pattern_up[i];
            in2 = pattern_down[i];
            twiddle = twiddle_mem[i];
            
            /*
            if(BU_valid == 'd1) begin
                ans_up[i] = fft_a;
                ans_down[i] = fft_b;
            end
            */
        end
        //#(`CYCLE * 5);
        for (int k = 0; k<96; k=k+1) begin
            if ((ans_up[k] == fft_up[k]) && (ans_down[k] == fft_down[k])) begin
                $display("%d data is correct, your up data is %d, down data is %d, correct up data is %d, down data is %d", num, ans_up[k], ans_down[k], fft_up[k], fft_down[k]);
            end else begin
                $display("%d data is failed, your up data is %d, down data is %d, correct up data is %d, down data is %d", num, ans_up[k], ans_down[k], fft_up[k], fft_down[k]);
                err = err + 1;
            end
            num = num + 1;
            #`CYCLE;
        end
        result(err, num);
        #(`CYCLE*`MAX) $finish;
    end

    initial begin
        for(int r = 0; r < 96; )begin
            #(`CYCLE);
            if(BU_valid == 'd1) begin
                ans_up[r] = fft_a;
                ans_down[r] = fft_b;
                r = r + 1;
                //$display("r = %d", r);
            end
        end
    end


    initial begin
        `ifdef FSDB
        $fsdbDumpfile("BU.fsdb");
        //$fsdbDumpvars(0, TOP);
        $fsdbDumpvars;
        `elsif FSDB_ALL
        $fsdbDumpfile("BU.fsdb");
        $fsdbDumpvars("+struct", "+mda", BU2_FFT);
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