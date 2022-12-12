`include "../include/define.svh"

module Register (
    input clk                           ,
    input rst                           ,
    input TF_ren                        ,
    input [2:0] it_depth_cnt            ,
    input [2:0] l                       ,

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

    output logic [`D_width-1:0] Read_TF_base0  ,
    output logic [`D_width-1:0] Read_TF_base1  ,
    output logic [`D_width-1:0] Read_TF_base2  ,
    output logic [`D_width-1:0] Read_TF_base3  ,
    output logic [`D_width-1:0] Read_TF_base4  ,
    output logic [`D_width-1:0] Read_TF_base5  ,
    output logic [`D_width-1:0] Read_TF_base6  ,
    output logic [`D_width-1:0] Read_TF_base7  ,
    output logic [`D_width-1:0] Read_TF_base8  ,
    output logic [`D_width-1:0] Read_TF_base9  ,
    output logic [`D_width-1:0] Read_TF_base10 ,
    output logic [`D_width-1:0] Read_TF_base11 ,
    output logic [`D_width-1:0] Read_TF_base12 ,
    output logic [`D_width-1:0] Read_TF_base13 ,
    output logic [`D_width-1:0] Read_TF_base14 ,

    output logic [`D_width-1:0] Read_TF_const0    ,
    output logic [`D_width-1:0] Read_TF_const1    ,
    output logic [`D_width-1:0] Read_TF_const2    ,
    output logic [`D_width-1:0] Read_TF_const3    ,
    output logic [`D_width-1:0] Read_TF_const4    ,
    output logic [`D_width-1:0] Read_TF_const5    ,
    output logic [`D_width-1:0] Read_TF_const6    ,
    output logic [`D_width-1:0] Read_TF_const7    ,
    output logic [`D_width-1:0] Read_TF_const8    ,
    output logic [`D_width-1:0] Read_TF_const9    ,
    output logic [`D_width-1:0] Read_TF_const10   ,
    output logic [`D_width-1:0] Read_TF_const11   ,
    output logic [`D_width-1:0] Read_TF_const12   ,
    output logic [`D_width-1:0] Read_TF_const13   ,
    output logic [`D_width-1:0] Read_TF_const14   
);


    parameter it_depth = 8;
	parameter TF_bank = 16;
	parameter TF_const_bank = 16;

    logic [`D_width-1:0] TF_base_array[0:7][0:15];  //[0:3+2][0:15-1]
	logic [`D_width-1:0] TF_const_array[0:2][0:15];      //[0:14-1]
    

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            TF_base_array[0][0]     <=  `D_width'h3e3a2b0   ; 
            TF_base_array[0][1]     <=  `D_width'h442e7e8   ; 
            TF_base_array[0][2]     <=  `D_width'h1cff90a   ; 
            TF_base_array[0][3]     <=  `D_width'h6f76bcb   ; 
            TF_base_array[0][4]     <=  `D_width'h19bf5d5   ; 
            TF_base_array[0][5]     <=  `D_width'h7dbe285   ; 
            TF_base_array[0][6]     <=  `D_width'h2646f0b   ; 
            TF_base_array[0][7]     <=  `D_width'h108822e   ; 
            TF_base_array[0][8]     <=  `D_width'h9dbc38    ;
            TF_base_array[0][9]     <=  `D_width'h698c44d   ; 
            TF_base_array[0][10]    <=  `D_width'h7f5e353   ; 
            TF_base_array[0][11]    <=  `D_width'h3d22f79   ; 
            TF_base_array[0][12]    <=  `D_width'h259c593   ; 
            TF_base_array[0][13]    <=  `D_width'he25dd5    ;
            TF_base_array[0][14]    <=  `D_width'h9884296   ;
            TF_base_array[0][15]    <=  `D_width'h0         ;
    
            TF_base_array[1][0]     <=  `D_width'h339af8f   ;
            TF_base_array[1][1]     <=  `D_width'h5a761     ;
            TF_base_array[1][2]     <=  `D_width'h1cf41c6   ;
            TF_base_array[1][3]     <=  `D_width'h1905fdb   ;
            TF_base_array[1][4]     <=  `D_width'h17fc5dd   ;
            TF_base_array[1][5]     <=  `D_width'h120de63   ;
            TF_base_array[1][6]     <=  `D_width'h9ac3146   ;
            TF_base_array[1][7]     <=  `D_width'h372a390   ;
            TF_base_array[1][8]     <=  `D_width'h7aa4c57   ;
            TF_base_array[1][9]     <=  `D_width'h1230ae7   ;
            TF_base_array[1][10]    <=  `D_width'h6617b95   ;
            TF_base_array[1][11]    <=  `D_width'h7cdff82   ;
            TF_base_array[1][12]    <=  `D_width'h68cdd99   ;
            TF_base_array[1][13]    <=  `D_width'h86e7108   ;
            TF_base_array[1][14]    <=  `D_width'h4454f67   ;
            TF_base_array[1][15]    <=  `D_width'h0         ;

            TF_base_array[2][0]     <=  `D_width'h808a836  ;
            TF_base_array[2][1]     <=  `D_width'h4fc14e6  ;
            TF_base_array[2][2]     <=  `D_width'h4899ee9  ;
            TF_base_array[2][3]     <=  `D_width'h8fcf14c  ;
            TF_base_array[2][4]     <=  `D_width'h17d1a3e  ;
            TF_base_array[2][5]     <=  `D_width'h2b9bdb3  ;
            TF_base_array[2][6]     <=  `D_width'h367537e  ;
            TF_base_array[2][7]     <=  `D_width'h280df35  ;
            TF_base_array[2][8]     <=  `D_width'h1debef5  ;
            TF_base_array[2][9]     <=  `D_width'h6cc01f1  ;
            TF_base_array[2][10]    <=  `D_width'h68a1e5c  ;
            TF_base_array[2][11]    <=  `D_width'h7e0af96  ;
            TF_base_array[2][12]    <=  `D_width'h4874eb9  ;
            TF_base_array[2][13]    <=  `D_width'h760187e  ;
            TF_base_array[2][14]    <=  `D_width'h66c411f  ;
            TF_base_array[2][15]    <=  `D_width'h0        ;

            TF_base_array[3][0]     <=  `D_width'h33fe7d2  ;
            TF_base_array[3][1]     <=  `D_width'h122a49   ;
            TF_base_array[3][2]     <=  `D_width'h8f3339a  ;
            TF_base_array[3][3]     <=  `D_width'h66fc73b  ;
            TF_base_array[3][4]     <=  `D_width'h4bc73ea  ;
            TF_base_array[3][5]     <=  `D_width'h88a9d60  ;
            TF_base_array[3][6]     <=  `D_width'h9b086e1  ;
            TF_base_array[3][7]     <=  `D_width'h44f23cb  ;
            TF_base_array[3][8]     <=  `D_width'h963090d  ;
            TF_base_array[3][9]     <=  `D_width'h78486cd  ;
            TF_base_array[3][10]    <=  `D_width'h44ea3e   ;
            TF_base_array[3][11]    <=  `D_width'h93bab2   ;
            TF_base_array[3][12]    <=  `D_width'h55189ed  ;
            TF_base_array[3][13]    <=  `D_width'h6fcdb71  ;
            TF_base_array[3][14]    <=  `D_width'h62fa6b8  ;
            TF_base_array[3][15]    <=  `D_width'h0        ;


            TF_base_array[4][0]     <=  `D_width'h7b37359   ;
            TF_base_array[4][1]     <=  `D_width'h78d13f9   ;
            TF_base_array[4][2]     <=  `D_width'h601e0c7   ;
            TF_base_array[4][3]     <=  `D_width'h7a7d12e   ;
            TF_base_array[4][4]     <=  `D_width'h424e900   ; //---------next 4 BU tw
            TF_base_array[4][5]     <=  `D_width'h949eab    ;
            TF_base_array[4][6]     <=  `D_width'h74c8135   ;
            TF_base_array[4][7]     <=  `D_width'h3f5d489   ;
            TF_base_array[4][8]     <=  `D_width'h0         ;
            TF_base_array[4][9]     <=  `D_width'h0         ;
            TF_base_array[4][10]    <=  `D_width'h0         ;
            TF_base_array[4][11]    <=  `D_width'h0         ;
            TF_base_array[4][12]    <=  `D_width'h0         ;
            TF_base_array[4][13]    <=  `D_width'h0         ;
            TF_base_array[4][14]    <=  `D_width'h0         ;
            TF_base_array[4][15]    <=  `D_width'h0         ;

            TF_base_array[5][0]     <=  `D_width'h233dfb3   ;
            TF_base_array[5][1]     <=  `D_width'h7371c04   ;
            TF_base_array[5][2]     <=  `D_width'h12fe3eb   ;
            TF_base_array[5][3]     <=  `D_width'h80ac15b   ;
            TF_base_array[5][4]     <=  `D_width'h191a640   ; //---------next 4 BU tw
            TF_base_array[5][5]     <=  `D_width'h5699c7    ;
            TF_base_array[5][6]     <=  `D_width'h41027c2   ;
            TF_base_array[5][7]     <=  `D_width'h58a89d6   ;
            TF_base_array[5][8]     <=  `D_width'h0         ;
            TF_base_array[5][9]     <=  `D_width'h0         ;
            TF_base_array[5][10]    <=  `D_width'h0         ;
            TF_base_array[5][11]    <=  `D_width'h0         ;
            TF_base_array[5][12]    <=  `D_width'h0         ;
            TF_base_array[5][13]    <=  `D_width'h0         ;
            TF_base_array[5][14]    <=  `D_width'h0         ;
            TF_base_array[5][15]    <=  `D_width'h0         ;

            TF_base_array[6][0]     <=  `D_width'h15cd52a   ;
            TF_base_array[6][1]     <=  `D_width'h85a4a14   ;
            TF_base_array[6][2]     <=  `D_width'h4b8e9d7   ;
            TF_base_array[6][3]     <=  `D_width'h46e3ecb   ;
            TF_base_array[6][4]     <=  `D_width'h9b047f2   ;
            TF_base_array[6][5]     <=  `D_width'h992e36e   ;
            TF_base_array[6][6]     <=  `D_width'h1633351   ;
            TF_base_array[6][7]     <=  `D_width'h53f3b77   ;
            TF_base_array[6][8]     <=  `D_width'h0         ;
            TF_base_array[6][9]     <=  `D_width'h0         ;
            TF_base_array[6][10]    <=  `D_width'h0         ;
            TF_base_array[6][11]    <=  `D_width'h0         ;
            TF_base_array[6][12]    <=  `D_width'h0         ;
            TF_base_array[6][13]    <=  `D_width'h0         ;
            TF_base_array[6][14]    <=  `D_width'h0         ;
            TF_base_array[6][15]    <=  `D_width'h0         ;

            TF_base_array[7][0]     <=  `D_width'h69063fe   ;
            TF_base_array[7][1]     <=  `D_width'h9217530   ;
            TF_base_array[7][2]     <=  `D_width'h44c0ea6   ;
            TF_base_array[7][3]     <=  `D_width'h7e9e270   ;
            TF_base_array[7][4]     <=  `D_width'h8bdc8dd   ;
            TF_base_array[7][5]     <=  `D_width'h820593a   ;
            TF_base_array[7][6]     <=  `D_width'h56442f9   ;
            TF_base_array[7][7]     <=  `D_width'h513b4a8   ;
            TF_base_array[7][8]     <=  `D_width'h0         ;
            TF_base_array[7][9]     <=  `D_width'h0         ;
            TF_base_array[7][10]    <=  `D_width'h0         ;
            TF_base_array[7][11]    <=  `D_width'h0         ;
            TF_base_array[7][12]    <=  `D_width'h0         ;
            TF_base_array[7][13]    <=  `D_width'h0         ;
            TF_base_array[7][14]    <=  `D_width'h0         ;
            TF_base_array[7][15]    <=  `D_width'h0         ;
        end else begin
            case ({TF_ren})
                1'b1: begin
                    Read_TF_base0  <=  TF_base_array[it_depth_cnt][0]  ;
                    Read_TF_base1  <=  TF_base_array[it_depth_cnt][1]  ;
                    Read_TF_base2  <=  TF_base_array[it_depth_cnt][2]  ;
                    Read_TF_base3  <=  TF_base_array[it_depth_cnt][3]  ;
                    Read_TF_base4  <=  TF_base_array[it_depth_cnt][4]  ;
                    Read_TF_base5  <=  TF_base_array[it_depth_cnt][5]  ;
                    Read_TF_base6  <=  TF_base_array[it_depth_cnt][6]  ;
                    Read_TF_base7  <=  TF_base_array[it_depth_cnt][7]  ;
                    Read_TF_base8  <=  TF_base_array[it_depth_cnt][8]  ;
                    Read_TF_base9  <=  TF_base_array[it_depth_cnt][9]  ;
                    Read_TF_base10 <=  TF_base_array[it_depth_cnt][10] ;
                    Read_TF_base11 <=  TF_base_array[it_depth_cnt][11] ;
                    Read_TF_base12 <=  TF_base_array[it_depth_cnt][12] ;
                    Read_TF_base13 <=  TF_base_array[it_depth_cnt][13] ;
                    Read_TF_base14 <=  TF_base_array[it_depth_cnt][14] ;
                end
                default: begin
                    integer i, j;
                    for(i = 0; i < it_depth; i = i + 1) begin
						for(j = 0; j < TF_bank; j = j + 1) begin
							TF_base_array[i][j] <= TF_base_array[i][j];
						end
					end
                end
            endcase
        end
    end

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            //a
            TF_const_array[0][0]   <=  `D_width'h7b37359   ;
            TF_const_array[0][1]   <=  `D_width'h280df35   ;
            TF_const_array[0][2]   <=  `D_width'h8fcf14c   ;
            TF_const_array[0][3]   <=  `D_width'h4fc14e6   ;
            TF_const_array[0][4]   <=  `D_width'h808a836   ;
            TF_const_array[0][5]   <=  `D_width'h372a390   ;
            TF_const_array[0][6]   <=  `D_width'h1905fdb   ;
            TF_const_array[0][7]   <=  `D_width'h5a761     ; 
            TF_const_array[0][8]   <=  `D_width'h339af8f   ;
            TF_const_array[0][9]   <=  `D_width'h108822e   ;
            TF_const_array[0][10]  <=  `D_width'h6f76bcb   ;
            TF_const_array[0][11]  <=  `D_width'h442e7e8   ;
            TF_const_array[0][12]  <=  `D_width'h3e3a2b0   ;
            TF_const_array[0][13]  <=  `D_width'h1         ;
            TF_const_array[0][14]  <=  `D_width'h0         ;
            TF_const_array[0][15]  <=  `D_width'h0         ;

            //a^2
            TF_const_array[1][0]   <=  `D_width'h280df35    ;
            TF_const_array[1][1]   <=  `D_width'h8fcf14c    ;
            TF_const_array[1][2]   <=  `D_width'h4fc14e6    ;
            TF_const_array[1][3]   <=  `D_width'h808a836    ;
            TF_const_array[1][4]   <=  `D_width'h372a390    ;
            TF_const_array[1][5]   <=  `D_width'h1905fdb    ;
            TF_const_array[1][6]   <=  `D_width'h5a761      ;
            TF_const_array[1][7]   <=  `D_width'h339af8f    ; 
            TF_const_array[1][8]   <=  `D_width'h108822e    ;
            TF_const_array[1][9]   <=  `D_width'h6f76bcb    ;
            TF_const_array[1][10]  <=  `D_width'h442e7e8    ;
            TF_const_array[1][11]  <=  `D_width'h3e3a2b0    ;
            TF_const_array[1][12]  <=  `D_width'ha000000    ;
            TF_const_array[1][13]  <=  `D_width'h1          ;
            TF_const_array[1][14]  <=  `D_width'h0          ;
            TF_const_array[1][15]  <=  `D_width'h0          ;
            /*
            //a^4
            TF_const_array[2][0]   <=  `D_width'h8fcf14c  ;
            TF_const_array[2][1]   <=  `D_width'h4fc14e6  ;
            TF_const_array[2][2]   <=  `D_width'h808a836  ;
            TF_const_array[2][3]   <=  `D_width'h372a390  ;
            TF_const_array[2][4]   <=  `D_width'h1905fdb  ;
            TF_const_array[2][5]   <=  `D_width'h5a761  ;
            TF_const_array[2][6]   <=  `D_width'h339af8f  ;
            TF_const_array[2][7]   <=  `D_width'h108822e  ; 
            TF_const_array[2][8]   <=  `D_width'h6f76bcb  ;
            TF_const_array[2][9]   <=  `D_width'h442e7e8  ;
            TF_const_array[2][10]  <=  `D_width'h3e3a2b0  ;
            TF_const_array[2][11]  <=  `D_width'ha000000  ;
            TF_const_array[2][12]  <=  `D_width'h1  ;
            TF_const_array[2][13]  <=  `D_width'h1  ;
            TF_const_array[2][14]  <=  `D_width'h0  ;
            TF_const_array[2][15]  <=  `D_width'h0  ;
            */
            /*
            // a^16
            TF_const_array[2][0]   <=  `D_width'h808a836  ;
            TF_const_array[2][1]   <=  `D_width'h372a390  ;
            TF_const_array[2][2]   <=  `D_width'h1905fdb  ;
            TF_const_array[2][3]   <=  `D_width'h5a761  ;
            TF_const_array[2][4]   <=  `D_width'h339af8f  ;
            TF_const_array[2][5]   <=  `D_width'h108822e  ;
            TF_const_array[2][6]   <=  `D_width'h6f76bcb  ;
            TF_const_array[2][7]   <=  `D_width'h442e7e8  ; 
            TF_const_array[2][8]   <=  `D_width'h3e3a2b0  ;
            TF_const_array[2][9]   <=  `D_width'ha000000 ;
            TF_const_array[2][10]  <=  `D_width'h1 ;
            TF_const_array[2][11]  <=  `D_width'h1        ;
            TF_const_array[2][12]  <=  `D_width'h1 ;
            TF_const_array[2][13]  <=  `D_width'h1  ;
            TF_const_array[2][14]  <=  `D_width'h0  ;
            TF_const_array[2][15]  <=  `D_width'h0  ;
            */
            // a^32
            TF_const_array[2][0]   <=  `D_width'h372a390  ;
            TF_const_array[2][1]   <=  `D_width'h1905fdb  ;
            TF_const_array[2][2]   <=  `D_width'h5a761  ;
            TF_const_array[2][3]   <=  `D_width'h339af8f   ;
            TF_const_array[2][4]   <=  `D_width'h108822e  ;
            TF_const_array[2][5]   <=  `D_width'h6f76bcb  ;
            TF_const_array[2][6]   <=  `D_width'h442e7e8  ;
            TF_const_array[2][7]   <=  `D_width'h3e3a2b0  ; 
            TF_const_array[2][8]   <=  `D_width'ha000000  ;
            TF_const_array[2][9]   <=  `D_width'h1 ;
            TF_const_array[2][10]  <=  `D_width'h1 ;
            TF_const_array[2][11]  <=  `D_width'h1        ;
            TF_const_array[2][12]  <=  `D_width'h1 ;
            TF_const_array[2][13]  <=  `D_width'h1  ;
            TF_const_array[2][14]  <=  `D_width'h0  ;
            TF_const_array[2][15]  <=  `D_width'h0  ;
        end else begin
            if (TF_ren) begin
                case (l)
                    'd2: begin
                        Read_TF_const0     <= TF_const_array[1][idx1];
                        Read_TF_const1     <= TF_const_array[1][idx2];
                        Read_TF_const2     <= TF_const_array[1][idx3];
                        Read_TF_const3     <= TF_const_array[1][idx4];
                        Read_TF_const4     <= TF_const_array[1][idx5];
                        Read_TF_const5     <= TF_const_array[1][idx6];
                        Read_TF_const6     <= TF_const_array[1][idx7];
                        Read_TF_const7     <= TF_const_array[1][idx8];
                        Read_TF_const8     <= TF_const_array[1][idx9];
                        Read_TF_const9     <= TF_const_array[1][idx10];
                        Read_TF_const10    <= TF_const_array[1][idx11];
                        Read_TF_const11    <= TF_const_array[1][idx12];
                        Read_TF_const12    <= TF_const_array[1][idx13];
                        Read_TF_const13    <= TF_const_array[1][idx14];
                        Read_TF_const14    <= TF_const_array[1][idx15];
                    end 
                    'd4: begin
                        Read_TF_const0     <= TF_const_array[2][idx1];
                        Read_TF_const1     <= TF_const_array[2][idx1];
                        Read_TF_const2     <= TF_const_array[2][idx1];
                        Read_TF_const3     <= TF_const_array[2][idx1];
                        Read_TF_const4     <= TF_const_array[2][idx1];
                        Read_TF_const5     <= TF_const_array[2][idx1];
                        Read_TF_const6     <= TF_const_array[2][idx1];
                        Read_TF_const7     <= TF_const_array[2][idx1];
                        Read_TF_const8     <= TF_const_array[2][idx1];
                        Read_TF_const9     <= TF_const_array[2][idx1];
                        Read_TF_const10    <= TF_const_array[2][idx1];
                        Read_TF_const11    <= TF_const_array[2][idx1];
                        Read_TF_const12    <= TF_const_array[2][idx1];
                        Read_TF_const13    <= TF_const_array[2][idx1];
                        Read_TF_const14    <= TF_const_array[2][idx1];
                    end
                    default: begin
                        Read_TF_const0     <= TF_const_array[0][idx1];
                        Read_TF_const1     <= TF_const_array[0][idx2];
                        Read_TF_const2     <= TF_const_array[0][idx3];
                        Read_TF_const3     <= TF_const_array[0][idx4];
                        Read_TF_const4     <= TF_const_array[0][idx5];
                        Read_TF_const5     <= TF_const_array[0][idx6];
                        Read_TF_const6     <= TF_const_array[0][idx7];
                        Read_TF_const7     <= TF_const_array[0][idx8];
                        Read_TF_const8     <= TF_const_array[0][idx9];
                        Read_TF_const9     <= TF_const_array[0][idx10];
                        Read_TF_const10    <= TF_const_array[0][idx11];
                        Read_TF_const11    <= TF_const_array[0][idx12];
                        Read_TF_const12    <= TF_const_array[0][idx13];
                        Read_TF_const13    <= TF_const_array[0][idx14];
                        Read_TF_const14    <= TF_const_array[0][idx15];
                    end
                endcase
            end else begin
                integer i, j;
                for(i = 0; i < 3; i = i + 1) begin
					for(j = 0; j < 16; j = j + 1) begin
						TF_const_array[i][j] <= TF_const_array[i][j];
					end
				end
            end
        end
    end

endmodule