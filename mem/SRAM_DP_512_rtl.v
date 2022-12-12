//
//      CONFIDENTIAL  AND  PROPRIETARY SOFTWARE OF ARM Physical IP, INC.
//      
//      Copyright (c) 1993-2022  ARM Physical IP, Inc.  All  Rights Reserved.
//      
//      Use of this Software is subject to the terms and conditions  of the
//      applicable license agreement with ARM Physical IP, Inc.  In addition,
//      this Software is protected by patents, copyright law and international
//      treaties.
//      
//      The copyright notice(s) in this Software does not indicate actual or
//      intended publication of this Software.
//      
//      name:			Advantage Dual-Port SRAM Generator
//           			TSMC CLN90G Process
//      version:		2009Q1V1
//      comment:		
//      configuration:	 -instname "SRAM_DP_ADV" -words 512 -bits 64 -frequency 200 -ring_width 2.0 -mux 8 -write_mask off -wp_size 8 -top_layer "met5-9" -power_type rings -horiz met3 -vert met4 -redundancy off -rcols 2 -rrows 2 -bmux off -ser none -ema on -cust_comment "" -bus_notation on -left_bus_delim "[" -right_bus_delim "]" -pwr_gnd_rename "VDD:VDD,VSS:VSS" -prefix "" -pin_space 0.0 -name_case upper -check_instname on -diodes on -inside_ring_type VSS -drive 6 -dpccm on -asvm off -corners ff_1.1_-40.0,ff_1.1_125.0,tt_1.0_25.0,ss_0.9_125.0
//
//      Verilog model for Synchronous Dual-Port Ram
//
//      Instance Name:              SRAM_DP_ADV
//      Words:                      512
//      Bits:                       64
//      Mux:                        8
//      Drive:                      6
//      Write Mask:                 Off
//      Extra Margin Adjustment:    On
//      Accelerated Retention Test: Off
//      Redundant Rows:             0
//      Redundant Columns:          0
//      Test Muxes                  Off
//
//      Creation Date:  2022-08-09 07:42:17Z
//      Version: 	2009Q1V1
//
//      Modeling Assumptions: This model supports full gate level simulation
//          including proper x-handling and timing check behavior.  Unit
//          delay timing is included in the model. Back-annotation of SDF
//          (v2.1) is supported.  SDF can be created utilyzing the delay
//          calculation views provided with this generator and supported
//          delay calculators.  All buses are modeled [MSB:LSB].  All 
//          ports are padded with Verilog primitives.
//
//      Modeling Limitations: None.
//
//      Known Bugs: None.
//
//      Known Work Arounds: N/A
//
`timescale 1 ns/1 ps
`celldefine
  module SRAM_DP_512 (
                QA,
                QB,
                CLKA,
                CENA,
                WENA,
                AA,
                DA,
                CLKB,
                CENB,
                WENB,
                AB,
                DB,
                EMAA,
                EMAB
                );

    parameter                BITS = 64;
    parameter                WORD_DEPTH = 512;
    parameter                ADDR_WIDTH = 9;
    parameter                WORDX = {BITS{1'bx}};
    parameter                WORD1 = {BITS{1'b1}};
    parameter                ADDRX = {ADDR_WIDTH{1'bx}};
    parameter                ADDR1 = {ADDR_WIDTH{1'b1}};
    parameter                WEN_WIDTH = 1;
    parameter                WP_SIZE    = 64 ;
    parameter                RCOLS = 0;
    parameter                MASKX = {WEN_WIDTH{1'bx}};
    parameter                MASK1 = {WEN_WIDTH{1'b1}};
    parameter                MASK0 = {WEN_WIDTH{1'b0}};
    parameter                MUX = 8;
    parameter                COL_ADDR_WIDTH = 3;
    parameter                RROWS = 0;
    parameter                UPM_WIDTH = 3;
    parameter                UPM0 = {UPM_WIDTH{1'b0}};
    parameter                RCA_WIDTH = 1;
    parameter                RED_COLUMNS = 2;
    
    output [63:0]            QA;
    output [63:0]            QB;

    input                    CLKA;
    input                    CENA;
    input                    WENA;
    input [8:0]              AA;
    input [63:0]             DA;

    input                    CLKB;
    input                    CENB;
    input                    WENB;
    input [8:0]              AB;
    input [63:0]             DB;
    input [2:0]              EMAA;
    input [2:0]              EMAB;

    reg [63:0]             mem [0:WORD_DEPTH-1];
    reg [63:0]             rows [(MUX*4)-1:0];   // added 2 bits for column redundancy

    reg [63:0] latched_DOA;
    reg [63:0] latched_DOB;

    always @(posedge CLKA) begin
        if (~CENA) begin
            if (~WENA) begin
                mem[AA] <= DA;
            end else begin
                latched_DOA <= mem[AA];
            end
        end else begin
            latched_DOA <= 'd0;
        end
    end

    assign QA = latched_DOA;


    always @(posedge CLKB) begin
        if (~CENB) begin
            if (~WENB) begin
                mem[AB] <= DB;
            end else begin
                latched_DOB <= mem[AB];
            end
        end else begin
            latched_DOB <= 'd0;
        end
    end

    assign QB = latched_DOB;

  endmodule