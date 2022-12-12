`ifndef DEFINE_SVH
`define DEFINE_SVH

`timescale 10ns / 1ps
`define D_width 52
`define Modulus_D_width 28

`define degree 8192
`define Radix 16
`define Radix_width $clog2(`Radix)
`define degree_width $clog2(`degree)

`define BN `Radix
`define MA `degree/`BN
`define BANK_width $clog2(`BN) + 1
`define MA_width $clog2(`MA)
`define delta $clog2(`Radix)                            //logr
`define bank_idx_upper_bound  $clog2(`degree) / `delta  //logr^N


`define radix_k1 4
`define radix_k2 1
`define k ( $clog2(`degree) - `radix_k2) / `radix_k1
`define logn $clog2(`degree)
`define pow_radix_k1 (1 << `radix_k1)
`define pow_radix_k2 (1 << `radix_k2)
//-------barrett precomputing value-----
`define pre_computing_width `Modulus_D_width*2                  // Modulus_D_width*2
`define precompute 56'd858993454                          // Modulus_D_width*2


//----------controller initial------
`define bank_num 15
`define ite_k 3
`define ite_0 512
`define ite_1 32
`define ite_2 2
`define ite_3 1
`define BU_total 512
`define BU_total_k2 512

//-------last iteration------
`define Last_l 4

`endif 