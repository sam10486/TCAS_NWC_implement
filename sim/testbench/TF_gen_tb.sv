`include "../include/define.svh"
`include "TF_gen.sv"
`define CYCLE 10


module Testbench ();

    logic clk;
	logic rst;
	logic TF_init_base;
	logic TF_ren;
	logic TF_wen;
    logic TF_init_const;
	logic [`D_width-1:0] it_depth_cnt;
	logic [`D_width-1:0] TF_bank_cnt;

	logic [`D_width-1:0] TF_base_in0;
    logic [`D_width-1:0] TF_base_in1;
    logic [`D_width-1:0] TF_base_in2;
    logic [`D_width-1:0] TF_base_in3;
    logic [`D_width-1:0] TF_base_in4;
    logic [`D_width-1:0] TF_base_in5;
    logic [`D_width-1:0] TF_base_in6;
    logic [`D_width-1:0] TF_base_in7;
    logic [`D_width-1:0] TF_base_in8;
    logic [`D_width-1:0] TF_base_in9;
    logic [`D_width-1:0] TF_base_in10;
    logic [`D_width-1:0] TF_base_in11;
    logic [`D_width-1:0] TF_base_in12;
    logic [`D_width-1:0] TF_base_in13;
    logic [`D_width-1:0] TF_base_in14;


	logic [`D_width-1:0] TF_const_in0;
    logic [`D_width-1:0] TF_const_in1;
    logic [`D_width-1:0] TF_const_in2;
    logic [`D_width-1:0] TF_const_in3;
    logic [`D_width-1:0] TF_const_in4;
    logic [`D_width-1:0] TF_const_in5;
    logic [`D_width-1:0] TF_const_in6;
    logic [`D_width-1:0] TF_const_in7;
    logic [`D_width-1:0] TF_const_in8;
    logic [`D_width-1:0] TF_const_in9;
    logic [`D_width-1:0] TF_const_in10;
    logic [`D_width-1:0] TF_const_in11;
    logic [`D_width-1:0] TF_const_in12;
    logic [`D_width-1:0] TF_const_in13;
	//logic [`D_width-1:0] TF_const_bank_cnt;
	logic [`D_width-1:0] modulus;

	logic [`D_width-1:0] TF_base_b1;
	logic [`D_width-1:0] TF_base_b2;
	logic [`D_width-1:0] TF_base_b3;
	logic [`D_width-1:0] TF_base_b4;
	logic [`D_width-1:0] TF_base_b5;
	logic [`D_width-1:0] TF_base_b6;
	logic [`D_width-1:0] TF_base_b7;
	logic [`D_width-1:0] TF_base_b8;
	logic [`D_width-1:0] TF_base_b9;
	logic [`D_width-1:0] TF_base_b10;
	logic [`D_width-1:0] TF_base_b11;
	logic [`D_width-1:0] TF_base_b12;
	logic [`D_width-1:0] TF_base_b13;
	logic [`D_width-1:0] TF_base_b14;
    logic [`D_width-1:0] TF_base_b15;

    integer num = 0;
    integer err = 0;
    assign modulus = 65537;
    parameter bank_num = 15;
    parameter k =3;
    integer i=0;
    integer l=0;

    logic [`D_width-1:0] TF_golden [0:`degree-1]; 
    logic [`D_width-1:0] W_intial [0:`k*bank_num-1]; 
    logic [`D_width-1:0] Wc_intial [0:$clog2(`degree)];  

    logic [`D_width-1:0] ite_stage;
    logic [`D_width-1:0] ite_sw_cnt;
    logic [`D_width-1:0] BU_cnt;
    logic ite_flag0, ite_flag1, ite_flag2;
    logic done;
    logic [`D_width-1:0] delay_cnt;
    logic delay_flag;
    logic compute_complete;

    parameter ite_0 = 512;
    parameter ite_1 = 32;
    parameter ite_2 = 2;
    parameter BU_total = 512;

    initial begin
        $readmemh("../sim/data_file/TF_gen/TF_gen_golden.txt", TF_golden);  
        $readmemh("../sim/data_file/TF_gen/W_initial.txt", W_intial);  
        $readmemh("../sim/data_file/TF_gen/Wc_const_initial.txt", Wc_intial);  
    end

    TF_gen TF_gen(
        .clk(clk),
        .rst(rst),
        .TF_init_base(TF_init_base),
        .TF_ren(TF_ren),
        .TF_wen(TF_wen),
        .TF_init_const(TF_init_const),
        .it_depth_cnt(it_depth_cnt),

        .TF_base_in0(TF_base_in0),
        .TF_base_in1(TF_base_in1),
        .TF_base_in2(TF_base_in2),
        .TF_base_in3(TF_base_in3),
        .TF_base_in4(TF_base_in4),
        .TF_base_in5(TF_base_in5),
        .TF_base_in6(TF_base_in6),
        .TF_base_in7(TF_base_in7),
        .TF_base_in8(TF_base_in8),
        .TF_base_in9(TF_base_in9),
        .TF_base_in10(TF_base_in10),
        .TF_base_in11(TF_base_in11),
        .TF_base_in12(TF_base_in12),
        .TF_base_in13(TF_base_in13),
        .TF_base_in14(TF_base_in14),


        .TF_const_in0(TF_const_in0),
        .TF_const_in1(TF_const_in1),
        .TF_const_in2(TF_const_in2),
        .TF_const_in3(TF_const_in3),
        .TF_const_in4(TF_const_in4),
        .TF_const_in5(TF_const_in5),
        .TF_const_in6(TF_const_in6),
        .TF_const_in7(TF_const_in7),
        .TF_const_in8(TF_const_in8),
        .TF_const_in9(TF_const_in9),
        .TF_const_in10(TF_const_in10),
        .TF_const_in11(TF_const_in11),
        .TF_const_in12(TF_const_in12),
        .TF_const_in13(TF_const_in13),
        .modulus(modulus),

        .TF_base_b1(TF_base_b1),
        .TF_base_b2(TF_base_b2),
        .TF_base_b3(TF_base_b3),
        .TF_base_b4(TF_base_b4),
        .TF_base_b5(TF_base_b5),
        .TF_base_b6(TF_base_b6),
        .TF_base_b7(TF_base_b7),
        .TF_base_b8(TF_base_b8),
        .TF_base_b9(TF_base_b9),
        .TF_base_b10(TF_base_b10),
        .TF_base_b11(TF_base_b11),
        .TF_base_b12(TF_base_b12),
        .TF_base_b13(TF_base_b13),
        .TF_base_b14(TF_base_b14),
        .TF_base_b15(TF_base_b15)
    );

    always #(`CYCLE/2) clk = ~clk;

    initial begin
        #0
        clk = 0; 
        rst = 1;
        compute_complete <= 'd0;
        #`CYCLE rst = 0;
    end

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            delay_cnt <= 'd0;
            delay_flag <= 'd0;
        end else begin
            if (done) begin
                if (delay_cnt == 'd2 && ite_sw_cnt != BU_total-1) begin
                    delay_cnt <= delay_cnt;
                    delay_flag <= 'd1;
                end else if (delay_cnt == 'd2 && ite_sw_cnt == BU_total-1) begin
                    delay_cnt <= 'd0;
                    delay_flag <= 'd0;
                end else if (ite_sw_cnt == 'd0 && BU_cnt == 'd0)begin
                    delay_cnt <= delay_cnt + 'd1;
                    delay_flag <= delay_flag;
                end
            end
        end
    end

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            ite_sw_cnt <= 'd0;
            ite_stage <= 'd0;
        end else begin
            if (done) begin
                if (ite_sw_cnt == BU_total-1) begin
                    ite_sw_cnt <= 'd0;
                    if (ite_stage == 'd3) begin
                        ite_stage <= ite_stage;
                    end else begin
                        ite_stage <= ite_stage + 'd1;
                    end
                end else begin
                    if (TF_ren) begin
                        ite_sw_cnt <= ite_sw_cnt + 'd1;
                        ite_stage <= ite_stage; 
                    end else begin
                        ite_sw_cnt <= ite_sw_cnt;
                        ite_stage <= ite_stage; 
                    end
                end
            end 
        end
    end

    always_ff@(posedge clk or posedge rst) begin
        if (rst) begin
            BU_cnt <= 'd0;
        end else begin
            if (done) begin
                case (ite_stage)
                    'd0: begin
                        if (BU_cnt == ite_0-1) begin
                            BU_cnt <= 'd0;
                        end else begin
                            if (TF_ren) begin
                                BU_cnt <= BU_cnt + 'd1;
                            end else begin
                                BU_cnt <= BU_cnt;
                            end
                        end
                    end
                    'd1: begin
                        if (BU_cnt == ite_1-1) begin
                            BU_cnt <= 'd0;
                        end else begin
                            if (TF_ren) begin
                                BU_cnt <= BU_cnt + 'd1;
                            end else begin
                                BU_cnt <= BU_cnt;
                            end 
                        end
                    end
                    'd2: begin
                        if (BU_cnt == ite_2-1) begin
                            BU_cnt <= 'd0;
                        end else begin
                            if (TF_ren) begin
                                BU_cnt <= BU_cnt + 'd1;
                            end else begin
                                BU_cnt <= BU_cnt;
                            end
                        end
                    end
                    default: begin
                        BU_cnt <= 'd0;
                    end
                endcase
            end
        end
    end

    initial begin
        TF_base_in0 <= 'd0;
        TF_base_in1 <= 'd0;
        TF_base_in2 <= 'd0;
        TF_base_in3 <= 'd0;
        TF_base_in4 <= 'd0;
        TF_base_in5 <= 'd0;
        TF_base_in6 <= 'd0;
        TF_base_in7 <= 'd0;
        TF_base_in8 <= 'd0;
        TF_base_in9 <= 'd0;
        TF_base_in10 <= 'd0;
        TF_base_in11 <= 'd0;
        TF_base_in12 <= 'd0;
        TF_base_in13 <= 'd0;
        TF_base_in14 <= 'd0;
        TF_const_in0 <= 'd0;
        TF_const_in1 <= 'd0;
        TF_const_in2 <= 'd0;
        TF_const_in3 <= 'd0;
        TF_const_in4 <= 'd0;
        TF_const_in5 <= 'd0;
        TF_const_in6 <= 'd0;
        TF_const_in7 <= 'd0;
        TF_const_in8 <= 'd0;
        TF_const_in9 <= 'd0;
        TF_const_in10 <= 'd0;
        TF_const_in11 <= 'd0;
        TF_const_in12 <= 'd0;
        TF_const_in13 <= 'd0;
        for (l = 0; l<k ; l++) begin
            #`CYCLE;
            if (l == k) begin
                TF_init_base <= 'd0;
                TF_ren <= 'd0;
                TF_wen <= 'd0;
                TF_init_const <= 'd0;
                it_depth_cnt <= 'd0;
                
                TF_base_in0 <= 'd0;
                TF_base_in1 <= 'd0;
                TF_base_in2 <= 'd0;
                TF_base_in3 <= 'd0;
                TF_base_in4 <= 'd0;
                TF_base_in5 <= 'd0;
                TF_base_in6 <= 'd0;
                TF_base_in7 <= 'd0;
                TF_base_in8 <= 'd0;
                TF_base_in9 <= 'd0;
                TF_base_in10 <= 'd0;
                TF_base_in11 <= 'd0;
                TF_base_in12 <= 'd0;
                TF_base_in13 <= 'd0;
                TF_base_in14 <= 'd0;
            end else begin
                TF_init_base <= 'd1;
                TF_ren <= 'd0;
                TF_wen <= 'd0;
                TF_init_const <= 'd0;
                it_depth_cnt <= l;

                TF_base_in0 <= W_intial[l*bank_num + 0];
                TF_base_in1 <= W_intial[l*bank_num + 1];
                TF_base_in2 <= W_intial[l*bank_num + 2];
                TF_base_in3 <= W_intial[l*bank_num + 3];
                TF_base_in4 <= W_intial[l*bank_num + 4];
                TF_base_in5 <= W_intial[l*bank_num + 5];
                TF_base_in6 <= W_intial[l*bank_num + 6];
                TF_base_in7 <= W_intial[l*bank_num + 7];
                TF_base_in8 <= W_intial[l*bank_num + 8];
                TF_base_in9 <= W_intial[l*bank_num + 9];
                TF_base_in10 <= W_intial[l*bank_num + 10];
                TF_base_in11 <= W_intial[l*bank_num + 11];
                TF_base_in12 <= W_intial[l*bank_num + 12];
                TF_base_in13 <= W_intial[l*bank_num + 13];
                TF_base_in14 <= W_intial[l*bank_num + 14];
            end
        end

        #(`CYCLE);
        TF_init_base <= 'd0;
        TF_ren <= 'd0;
        TF_wen <= 'd0;
        TF_init_const <= 'd1;
        it_depth_cnt <= 'd0;
        TF_const_in0 <= Wc_intial[0];
        TF_const_in1 <= Wc_intial[1];
        TF_const_in2 <= Wc_intial[2];
        TF_const_in3 <= Wc_intial[3];
        TF_const_in4 <= Wc_intial[4];
        TF_const_in5 <= Wc_intial[5];
        TF_const_in6 <= Wc_intial[6];
        TF_const_in7 <= Wc_intial[7];
        TF_const_in8 <= Wc_intial[8];
        TF_const_in9 <= Wc_intial[9];
        TF_const_in10 <= Wc_intial[10];
        TF_const_in11 <= Wc_intial[11];
        TF_const_in12 <= Wc_intial[12];
        TF_const_in13 <= Wc_intial[13];

        #(`CYCLE*1);
        repeat(`degree) begin
            @(posedge clk)
            done <= 'd1;
            case (ite_stage)
                'd0: begin
                    if (BU_cnt == ite_0-1) begin
                        TF_init_base <= 'd0;
                        TF_ren <= 'd0;
                        TF_wen <= 'd1;
                        TF_init_const <= 'd0;
                        it_depth_cnt <= ite_stage;
                    end else begin
                        TF_init_base <= 'd0;
                        TF_wen <= 'd0;
                        TF_init_const <= 'd0;
                        it_depth_cnt <= ite_stage;
                        if (delay_flag) begin
                            TF_ren <= 'd1;
                        end else begin
                            TF_ren <= 'd0;
                        end
                    end
                end
                'd1: begin
                    if (BU_cnt == ite_1-1) begin
                        TF_init_base <= 'd0;
                        TF_ren <= 'd0;
                        TF_wen <= 'd1;
                        TF_init_const <= 'd0;
                        it_depth_cnt <= ite_stage;
                    end else begin
                        TF_init_base <= 'd0;
                        TF_wen <= 'd0;
                        TF_init_const <= 'd0;
                        it_depth_cnt <= ite_stage;
                        if (delay_flag) begin
                            TF_ren <= 'd1;
                        end else begin
                            TF_ren <= 'd0;
                        end
                    end
                end
                'd2: begin
                    if (BU_cnt == ite_2-1) begin
                        TF_init_base <= 'd0;
                        TF_ren <= 'd0;
                        TF_wen <= 'd1;
                        TF_init_const <= 'd0;
                        it_depth_cnt <= ite_stage;
                    end else begin
                        TF_init_base <= 'd0;       
                        TF_wen <= 'd0;
                        TF_init_const <= 'd0;
                        it_depth_cnt <= ite_stage;
                        if (delay_flag) begin
                            TF_ren <= 'd1;
                        end else begin
                            TF_ren <= 'd0;
                        end
                    end
                end 
                default: begin
                    TF_init_base <= 'd0;
                    TF_ren <= 'd0;
                    TF_wen <= 'd0;
                    TF_init_const <= 'd0;
                    it_depth_cnt <= 'd0;
                end
            endcase 
        end
        compute_complete <= 'd1;
    end
    

    initial begin
        $dumpfile("TF_gen_tb.vcd");
        $dumpvars;
        //$fsdbDumpvars("+struct", "+mda", mem);
        //$fsdbDumpvars("+struct", "+mda", Testbench);
        #(`CYCLE*`MAX)
        $finish;
    end

endmodule