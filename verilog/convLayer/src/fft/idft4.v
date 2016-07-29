/*
 * This source file contains a Verilog description of an IP core
 * automatically generated by the SPIRAL HDL Generator.
 *
 * This product includes a hardware design developed by Carnegie Mellon University.
 *
 * Copyright (c) 2005-2011 by Peter A. Milder for the SPIRAL Project,
 * Carnegie Mellon University
 *
 * For more information, see the SPIRAL project website at:
 *   http://www.spiral.net
 *
 * This design is provided for internal, non-commercial research use only
 * and is not for redistribution, with or without modifications.
 * 
 * You may not use the name "Carnegie Mellon University" or derivations
 * thereof to endorse or promote products derived from this software.
 *
 * THE SOFTWARE IS PROVIDED "AS-IS" WITHOUT ANY WARRANTY OF ANY KIND, EITHER
 * EXPRESS, IMPLIED OR STATUTORY, INCLUDING BUT NOT LIMITED TO ANY WARRANTY
 * THAT THE SOFTWARE WILL CONFORM TO SPECIFICATIONS OR BE ERROR-FREE AND ANY
 * IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE,
 * TITLE, OR NON-INFRINGEMENT.  IN NO EVENT SHALL CARNEGIE MELLON UNIVERSITY
 * BE LIABLE FOR ANY DAMAGES, INCLUDING BUT NOT LIMITED TO DIRECT, INDIRECT,
 * SPECIAL OR CONSEQUENTIAL DAMAGES, ARISING OUT OF, RESULTING FROM, OR IN
 * ANY WAY CONNECTED WITH THIS SOFTWARE (WHETHER OR NOT BASED UPON WARRANTY,
 * CONTRACT, TORT OR OTHERWISE).
 *
 */

//   Input/output stream: 4 complex words per cycle
//   Throughput: one transform every 1 cycles
//   Latency: 24 cycles

//   Resources required:
//     16 adders (32 x 32 bit)

// Generated on Fri Jul 29 00:48:00 EDT 2016

// Latency: 24 clock cycles
// Throughput: 1 transform every 1 cycles


// We use an interleaved complex data format.  X0 represents the
// real portion of the first input, and X1 represents the imaginary
// portion.  The X variables are system inputs and the Y variables
// are system outputs.

// The design uses a system of flag signals to indicate the
// beginning of the input and output data streams.  The 'next'
// input (asserted high), is used to instruct the system that the
// input stream will begin on the following cycle.

// This system has a 'gap' of 1 cycles.  This means that
// 1 cycles must elapse between the beginning of the input
// vectors.

// The output signal 'next_out' (also asserted high) indicates
// that the output vector will begin streaming out of the system
 // on the following cycle.

// The system has a latency of 24 cycles.  This means that
// the 'next_out' will be asserted 24 cycles after the user
// asserts 'next'.

// The simple testbench below will demonstrate the timing for loading
// and unloading data vectors.
// The system reset signal is asserted high.

// Please note: when simulating floating point code, you must include
// Xilinx's DSP slice simulation module.



// Latency: 24
// Gap: 1
// module_name_is:dft_top
module idft4_top(clk, reset, next, next_out,
   X0, Y0,
   X1, Y1,
   X2, Y2,
   X3, Y3,
   X4, Y4,
   X5, Y5,
   X6, Y6,
   X7, Y7);

   output next_out;
   input clk, reset, next;

   input [31:0] X0,
      X1,
      X2,
      X3,
      X4,
      X5,
      X6,
      X7;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3,
      Y4,
      Y5,
      Y6,
      Y7;

   wire [31:0] t0_0;
   wire [31:0] t0_1;
   wire [31:0] t0_2;
   wire [31:0] t0_3;
   wire [31:0] t0_4;
   wire [31:0] t0_5;
   wire [31:0] t0_6;
   wire [31:0] t0_7;
   wire next_0;
   wire [31:0] t1_0;
   wire [31:0] t1_1;
   wire [31:0] t1_2;
   wire [31:0] t1_3;
   wire [31:0] t1_4;
   wire [31:0] t1_5;
   wire [31:0] t1_6;
   wire [31:0] t1_7;
   wire next_1;
   wire [31:0] t2_0;
   wire [31:0] t2_1;
   wire [31:0] t2_2;
   wire [31:0] t2_3;
   wire [31:0] t2_4;
   wire [31:0] t2_5;
   wire [31:0] t2_6;
   wire [31:0] t2_7;
   wire next_2;
   assign t0_0 = X0;
   assign Y0 = t2_0;
   assign t0_1 = X1;
   assign Y1 = t2_1;
   assign t0_2 = X2;
   assign Y2 = t2_2;
   assign t0_3 = X3;
   assign Y3 = t2_3;
   assign t0_4 = X4;
   assign Y4 = t2_4;
   assign t0_5 = X5;
   assign Y5 = t2_5;
   assign t0_6 = X6;
   assign Y6 = t2_6;
   assign t0_7 = X7;
   assign Y7 = t2_7;
   assign next_0 = next;
   assign next_out = next_2;

// latency=12, gap=1
   codeBlock80049 stage0(.clk(clk), .reset(reset), .next_in(next_0), .next_out(next_1),
       .X0_in(t0_0), .Y0(t1_0),
       .X1_in(t0_1), .Y1(t1_1),
       .X2_in(t0_2), .Y2(t1_2),
       .X3_in(t0_3), .Y3(t1_3),
       .X4_in(t0_4), .Y4(t1_4),
       .X5_in(t0_5), .Y5(t1_5),
       .X6_in(t0_6), .Y6(t1_6),
       .X7_in(t0_7), .Y7(t1_7));


// latency=12, gap=1
   codeBlock80204 stage1(.clk(clk), .reset(reset), .next_in(next_1), .next_out(next_2),
       .X0_in(t1_0), .Y0(t2_0),
       .X1_in(t1_1), .Y1(t2_1),
       .X2_in(t1_2), .Y2(t2_2),
       .X3_in(t1_3), .Y3(t2_3),
       .X4_in(t1_4), .Y4(t2_4),
       .X5_in(t1_5), .Y5(t2_5),
       .X6_in(t1_6), .Y6(t2_6),
       .X7_in(t1_7), .Y7(t2_7));


endmodule

// Latency: 12
// Gap: 1
module codeBlock80049(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3,
   X4_in, Y4,
   X5_in, Y5,
   X6_in, Y6,
   X7_in, Y7);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in,
      X4_in,
      X5_in,
      X6_in,
      X7_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3,
      X4,
      X5,
      X6,
      X7;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3,
      Y4,
      Y5,
      Y6,
      Y7;

   shiftRegFIFO #(11, 1) shiftFIFO_80361(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a49;
   wire signed [31:0] a50;
   wire signed [31:0] a51;
   wire signed [31:0] a52;
   wire signed [31:0] a57;
   wire signed [31:0] a58;
   wire signed [31:0] a59;
   wire signed [31:0] a60;
   wire  [31:0] t113;
   wire  [31:0] t114;
   wire  [31:0] t115;
   wire  [31:0] t116;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;
   wire  [31:0] t117;
   wire  [31:0] t118;
   wire  [31:0] t119;
   wire  [31:0] t120;
   wire signed [31:0] Y4;
   wire signed [31:0] Y5;
   wire signed [31:0] Y6;
   wire signed [31:0] Y7;


   assign a49 = X0;
   assign a50 = X4;
   assign a51 = X1;
   assign a52 = X5;
   assign a57 = X2;
   assign a58 = X6;
   assign a59 = X3;
   assign a60 = X7;
   assign Y0 = t113;
   assign Y1 = t114;
   assign Y2 = t115;
   assign Y3 = t116;
   assign Y4 = t117;
   assign Y5 = t118;
   assign Y6 = {~(t120[31]), t120[30:0]};
   assign Y7 = t119;

    addfp32 add80061(.a(a49), .b(a50), .clk(clk), .out(t113), .enable(1'b1), .rst(reset));
    addfp32 add80076(.a(a51), .b(a52), .clk(clk), .out(t114), .enable(1'b1), .rst(reset));
    subfp32 sub80091(.a(a49), .b(a50), .clk(clk), .out(t115), .enable(1'b1), .rst(reset));
    subfp32 sub80106(.a(a51), .b(a52), .clk(clk), .out(t116), .enable(1'b1), .rst(reset));
    addfp32 add80137(.a(a57), .b(a58), .clk(clk), .out(t117), .enable(1'b1), .rst(reset));
    addfp32 add80152(.a(a59), .b(a60), .clk(clk), .out(t118), .enable(1'b1), .rst(reset));
    subfp32 sub80167(.a(a57), .b(a58), .clk(clk), .out(t119), .enable(1'b1), .rst(reset));
    subfp32 sub80182(.a(a59), .b(a60), .clk(clk), .out(t120), .enable(1'b1), .rst(reset));


   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         X4 <= X4_in;
         X5 <= X5_in;
         X6 <= X6_in;
         X7 <= X7_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 12
// Gap: 1
module codeBlock80204(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3,
   X4_in, Y4,
   X5_in, Y5,
   X6_in, Y6,
   X7_in, Y7);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in,
      X4_in,
      X5_in,
      X6_in,
      X7_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3,
      X4,
      X5,
      X6,
      X7;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3,
      Y4,
      Y5,
      Y6,
      Y7;

   shiftRegFIFO #(11, 1) shiftFIFO_80364(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a17;
   wire signed [31:0] a18;
   wire signed [31:0] a19;
   wire signed [31:0] a20;
   wire signed [31:0] a25;
   wire signed [31:0] a26;
   wire signed [31:0] a27;
   wire signed [31:0] a28;
   wire  [31:0] t49;
   wire  [31:0] t50;
   wire  [31:0] t51;
   wire  [31:0] t52;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   wire signed [31:0] Y4;
   wire signed [31:0] Y5;
   wire  [31:0] t53;
   wire  [31:0] t54;
   wire  [31:0] t55;
   wire  [31:0] t56;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;
   wire signed [31:0] Y6;
   wire signed [31:0] Y7;


   assign a17 = X0;
   assign a18 = X4;
   assign a19 = X1;
   assign a20 = X5;
   assign a25 = X2;
   assign a26 = X6;
   assign a27 = X3;
   assign a28 = X7;
   assign Y0 = t49;
   assign Y1 = t50;
   assign Y4 = t51;
   assign Y5 = t52;
   assign Y2 = t53;
   assign Y3 = t54;
   assign Y6 = t55;
   assign Y7 = t56;

    addfp32 add80216(.a(a17), .b(a18), .clk(clk), .out(t49), .enable(1'b1), .rst(reset));
    addfp32 add80231(.a(a19), .b(a20), .clk(clk), .out(t50), .enable(1'b1), .rst(reset));
    subfp32 sub80246(.a(a17), .b(a18), .clk(clk), .out(t51), .enable(1'b1), .rst(reset));
    subfp32 sub80261(.a(a19), .b(a20), .clk(clk), .out(t52), .enable(1'b1), .rst(reset));
    addfp32 add80292(.a(a25), .b(a26), .clk(clk), .out(t53), .enable(1'b1), .rst(reset));
    addfp32 add80307(.a(a27), .b(a28), .clk(clk), .out(t54), .enable(1'b1), .rst(reset));
    subfp32 sub80322(.a(a25), .b(a26), .clk(clk), .out(t55), .enable(1'b1), .rst(reset));
    subfp32 sub80337(.a(a27), .b(a28), .clk(clk), .out(t56), .enable(1'b1), .rst(reset));


   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         X4 <= X4_in;
         X5 <= X5_in;
         X6 <= X6_in;
         X7 <= X7_in;
         next <= next_in;
      end
   end
endmodule
