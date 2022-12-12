`include "../include/define.svh"
`ifdef SYN
`include "top_syn.v"
`include "SRAM_DP_512.v"
`include "/opt/synopsys/CBDK_TSMC90GUTM_Arm_f1.0/CIC/Verilog/tsmc090.v"
`timescale 1ns/10ps
`else
`include "top.sv"
`include "SRAM_DP_512_rtl.v"
`timescale 1ns/10ps
`endif

`define CYCLE 40

module Testbench ();

    logic clk;
    logic rst;
    logic [`D_width-1:0] modulus;
    logic DONE;
    string output_path;


    
    parameter degree = `degree;
    parameter bank_num = 15;
    parameter k1_ite = `k;
    parameter MA = `MA;
    parameter BN = `BN;

    logic [`D_width-1:0] TF_based_in [0:(k1_ite+2)*bank_num-1]; 
    logic [`D_width-1:0] TF_const_in [0:bank_num-2]; 
    logic [`D_width-1:0] mem_data_in [0:`degree-1];
    logic [`D_width-1:0] mem_data_golden [0:`degree-1]; 

    assign modulus = `Modulus_D_width'd167772161;

    // ite0, ite1 is one TFs group, ite2 is two TFs group, and ite3 is one TFs group, 
    // thus there are all five TF groups are needed to be stored. 
    initial begin
        $readmemh("../sim/data_file/top/TF_based_in.txt", TF_based_in);  
        $readmemh("../sim/data_file/top/TF_const_in.txt", TF_const_in);  
        $readmemh("../sim/data_file/top/mem_data_in.txt", mem_data_in);  
        $readmemh("../sim/data_file/top/mem_data_golden.txt", mem_data_golden);  
    end

    top top(
        //input
        .clk(clk),
        .rst(rst),
        .modulus(modulus),
        //output
        .DONE(DONE)
    );


    always #(`CYCLE/2) clk = ~clk;

    initial begin
        #0
        clk = 0; 
        rst = 1;
        #`CYCLE rst = 0;
    end

    integer mem_out;
    integer i, j;
    initial begin
        $value$plusargs("output_path=%s", output_path);
        while (1)
		begin
			#(`CYCLE)
			if(DONE) break;
		end
        mem_out = $fopen({output_path, "/mem_out.txt"}, "w");
        `ifndef SYN
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram[0].sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram[1].sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram[2].sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram[3].sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram[4].sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram[5].sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram[6].sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram[7].sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram[8].sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram[9].sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram[10].sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram[11].sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram[12].sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram[13].sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram[14].sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram[15].sram.mem[j]);
            $display("successful !\n");
            $display("mem_out[0][0] = (%d)" , top.memory_wrapper.gen_sram[0].sram.mem[0]);
            $finish;
        `else
			
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram_0__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram_1__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram_2__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram_3__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram_4__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram_5__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram_6__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram_7__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram_8__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram_9__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram_10__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram_11__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram_12__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram_13__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram_14__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper.gen_sram_15__sram.mem[j]);
            $display("successful !\n");
            $display("mem_out[0][0] = (%d)" , top.memory_wrapper.gen_sram_0__sram.mem[0]);
            $finish;
			
			/*
			for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper_gen_sram_0__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper_gen_sram_1__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper_gen_sram_2__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper_gen_sram_3__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper_gen_sram_4__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper_gen_sram_5__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper_gen_sram_6__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper_gen_sram_7__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper_gen_sram_8__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper_gen_sram_9__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper_gen_sram_10__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper_gen_sram_11__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper_gen_sram_12__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper_gen_sram_13__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper_gen_sram_14__sram.mem[j]);
            for (j = 0; j < MA; j = j + 1) $fwrite(mem_out, "%d\n",  top.memory_wrapper_gen_sram_15__sram.mem[j]);
            $display("successful !\n");
            $display("mem_out[0][0] = (%d)" , top.memory_wrapper_gen_sram_0__sram.mem[0]);
            $finish;
			*/
        `endif
    end


    initial begin
        `ifndef SYN
            for (int k = 0; k<MA; k=k+1) begin
                top.memory_wrapper.gen_sram[0].sram.mem[k]  = mem_data_in[k*BN + 0];
                top.memory_wrapper.gen_sram[1].sram.mem[k]  = mem_data_in[k*BN + 1];
                top.memory_wrapper.gen_sram[2].sram.mem[k]  = mem_data_in[k*BN + 2];
                top.memory_wrapper.gen_sram[3].sram.mem[k]  = mem_data_in[k*BN + 3];
                top.memory_wrapper.gen_sram[4].sram.mem[k]  = mem_data_in[k*BN + 4];
                top.memory_wrapper.gen_sram[5].sram.mem[k]  = mem_data_in[k*BN + 5];
                top.memory_wrapper.gen_sram[6].sram.mem[k]  = mem_data_in[k*BN + 6];
                top.memory_wrapper.gen_sram[7].sram.mem[k]  = mem_data_in[k*BN + 7];
                top.memory_wrapper.gen_sram[8].sram.mem[k]  = mem_data_in[k*BN + 8];
                top.memory_wrapper.gen_sram[9].sram.mem[k]  = mem_data_in[k*BN + 9];
                top.memory_wrapper.gen_sram[10].sram.mem[k] = mem_data_in[k*BN + 10];
                top.memory_wrapper.gen_sram[11].sram.mem[k] = mem_data_in[k*BN + 11];
                top.memory_wrapper.gen_sram[12].sram.mem[k] = mem_data_in[k*BN + 12];
                top.memory_wrapper.gen_sram[13].sram.mem[k] = mem_data_in[k*BN + 13];
                top.memory_wrapper.gen_sram[14].sram.mem[k] = mem_data_in[k*BN + 14];
                top.memory_wrapper.gen_sram[15].sram.mem[k] = mem_data_in[k*BN + 15];
            end
        `else
            #`CYCLE;
			
            for (int k = 0; k<MA; k=k+1) begin
                top.memory_wrapper.gen_sram_0__sram.mem[k]  = mem_data_in[k*BN + 0];
                top.memory_wrapper.gen_sram_1__sram.mem[k]  = mem_data_in[k*BN + 1];
                top.memory_wrapper.gen_sram_2__sram.mem[k]  = mem_data_in[k*BN + 2];
                top.memory_wrapper.gen_sram_3__sram.mem[k]  = mem_data_in[k*BN + 3];
                top.memory_wrapper.gen_sram_4__sram.mem[k]  = mem_data_in[k*BN + 4];
                top.memory_wrapper.gen_sram_5__sram.mem[k]  = mem_data_in[k*BN + 5];
                top.memory_wrapper.gen_sram_6__sram.mem[k]  = mem_data_in[k*BN + 6];
                top.memory_wrapper.gen_sram_7__sram.mem[k]  = mem_data_in[k*BN + 7];
                top.memory_wrapper.gen_sram_8__sram.mem[k]  = mem_data_in[k*BN + 8];
                top.memory_wrapper.gen_sram_9__sram.mem[k]  = mem_data_in[k*BN + 9];
                top.memory_wrapper.gen_sram_10__sram.mem[k] = mem_data_in[k*BN + 10];
                top.memory_wrapper.gen_sram_11__sram.mem[k] = mem_data_in[k*BN + 11];
                top.memory_wrapper.gen_sram_12__sram.mem[k] = mem_data_in[k*BN + 12];
                top.memory_wrapper.gen_sram_13__sram.mem[k] = mem_data_in[k*BN + 13];
                top.memory_wrapper.gen_sram_14__sram.mem[k] = mem_data_in[k*BN + 14];
                top.memory_wrapper.gen_sram_15__sram.mem[k] = mem_data_in[k*BN + 15];
                //$display("mem_out[0][0] = (%d)" , top.memory_wrapper.gen_sram_0__sram.mem[k]);
            end
			/*
			for (int k = 0; k<MA; k=k+1) begin
                top.memory_wrapper_gen_sram_0__sram.mem[k]  = mem_data_in[k*BN + 0];
                top.memory_wrapper_gen_sram_1__sram.mem[k]  = mem_data_in[k*BN + 1];
                top.memory_wrapper_gen_sram_2__sram.mem[k]  = mem_data_in[k*BN + 2];
                top.memory_wrapper_gen_sram_3__sram.mem[k]  = mem_data_in[k*BN + 3];
                top.memory_wrapper_gen_sram_4__sram.mem[k]  = mem_data_in[k*BN + 4];
                top.memory_wrapper_gen_sram_5__sram.mem[k]  = mem_data_in[k*BN + 5];
                top.memory_wrapper_gen_sram_6__sram.mem[k]  = mem_data_in[k*BN + 6];
                top.memory_wrapper_gen_sram_7__sram.mem[k]  = mem_data_in[k*BN + 7];
                top.memory_wrapper_gen_sram_8__sram.mem[k]  = mem_data_in[k*BN + 8];
                top.memory_wrapper_gen_sram_9__sram.mem[k]  = mem_data_in[k*BN + 9];
                top.memory_wrapper_gen_sram_10__sram.mem[k] = mem_data_in[k*BN + 10];
                top.memory_wrapper_gen_sram_11__sram.mem[k] = mem_data_in[k*BN + 11];
                top.memory_wrapper_gen_sram_12__sram.mem[k] = mem_data_in[k*BN + 12];
                top.memory_wrapper_gen_sram_13__sram.mem[k] = mem_data_in[k*BN + 13];
                top.memory_wrapper_gen_sram_14__sram.mem[k] = mem_data_in[k*BN + 14];
                top.memory_wrapper_gen_sram_15__sram.mem[k] = mem_data_in[k*BN + 15];
                $display("mem_out[0][0] = (%d)" , top.memory_wrapper_gen_sram_0__sram.mem[k]);
            end
			*/
        `endif
    end
	
	`ifdef SYN
        initial $sdf_annotate("top_syn.sdf", top);
    `endif
	

    initial begin
        `ifndef SYN
            $fsdbDumpfile("top_tb.fsdb");
            $fsdbDumpvars;
            $fsdbDumpvars("+struct", "+mda", top);
            $fsdbDumpvars("+struct", "+mda", Testbench);
        `endif
        
        #(`CYCLE*`MAX)
        $finish;
    end

endmodule