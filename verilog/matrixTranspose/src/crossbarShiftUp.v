/* ../verilog/matrixTranspose/src/crossbarShiftUp.v
 * This file is automatically generated by Chi Zhang
 * k = 2, M = 8
 */
module crossbarShiftUp # (
  parameter DATA_WIDTH = 32
) (
  input [1-1:0] clk,
  input [1-1:0] clk_en,
  input [1-1:0] start,
  input [1-1:0] reset,
  input [DATA_WIDTH-1:0] in0,
  input [DATA_WIDTH-1:0] in1,
  input [DATA_WIDTH-1:0] in2,
  input [DATA_WIDTH-1:0] in3,
  input [DATA_WIDTH-1:0] in4,
  input [DATA_WIDTH-1:0] in5,
  input [DATA_WIDTH-1:0] in6,
  input [DATA_WIDTH-1:0] in7,
  input [DATA_WIDTH-1:0] in8,
  input [DATA_WIDTH-1:0] in9,
  input [DATA_WIDTH-1:0] in10,
  input [DATA_WIDTH-1:0] in11,
  input [DATA_WIDTH-1:0] in12,
  input [DATA_WIDTH-1:0] in13,
  input [DATA_WIDTH-1:0] in14,
  input [DATA_WIDTH-1:0] in15,
  output reg [1-1:0] start_next_stage,
  output reg [DATA_WIDTH-1:0] out0,
  output reg [DATA_WIDTH-1:0] out1,
  output reg [DATA_WIDTH-1:0] out2,
  output reg [DATA_WIDTH-1:0] out3,
  output reg [DATA_WIDTH-1:0] out4,
  output reg [DATA_WIDTH-1:0] out5,
  output reg [DATA_WIDTH-1:0] out6,
  output reg [DATA_WIDTH-1:0] out7,
  output reg [DATA_WIDTH-1:0] out8,
  output reg [DATA_WIDTH-1:0] out9,
  output reg [DATA_WIDTH-1:0] out10,
  output reg [DATA_WIDTH-1:0] out11,
  output reg [DATA_WIDTH-1:0] out12,
  output reg [DATA_WIDTH-1:0] out13,
  output reg [DATA_WIDTH-1:0] out14,
  output reg [DATA_WIDTH-1:0] out15
);

  reg [2-1:0] timestamp;

  always@(posedge clk) begin
    if (reset) begin
      start_next_stage <= 1'b0;
      timestamp <= 2'b00;
    end else if (clk_en & start) begin
      start_next_stage <= start;
      timestamp <= timestamp + 1;
    end
  end

  always@(posedge clk) begin
    if (clk_en & start) begin
      case (timestamp)
        2'b00: begin
          out0 <= in0;
          out1 <= in1;
          out2 <= in2;
          out3 <= in3;
          out4 <= in4;
          out5 <= in5;
          out6 <= in6;
          out7 <= in7;
          out8 <= in8;
          out9 <= in9;
          out10 <= in10;
          out11 <= in11;
          out12 <= in12;
          out13 <= in13;
          out14 <= in14;
          out15 <= in15;
        end
        2'b01: begin
          out0 <= in2;
          out1 <= in3;
          out2 <= in4;
          out3 <= in5;
          out4 <= in6;
          out5 <= in7;
          out6 <= in8;
          out7 <= in9;
          out8 <= in10;
          out9 <= in11;
          out10 <= in12;
          out11 <= in13;
          out12 <= in14;
          out13 <= in15;
          out14 <= in0;
          out15 <= in1;
        end
        2'b10: begin
          out0 <= in4;
          out1 <= in5;
          out2 <= in6;
          out3 <= in7;
          out4 <= in8;
          out5 <= in9;
          out6 <= in10;
          out7 <= in11;
          out8 <= in12;
          out9 <= in13;
          out10 <= in14;
          out11 <= in15;
          out12 <= in0;
          out13 <= in1;
          out14 <= in2;
          out15 <= in3;
        end
        2'b11: begin
          out0 <= in6;
          out1 <= in7;
          out2 <= in8;
          out3 <= in9;
          out4 <= in10;
          out5 <= in11;
          out6 <= in12;
          out7 <= in13;
          out8 <= in14;
          out9 <= in15;
          out10 <= in0;
          out11 <= in1;
          out12 <= in2;
          out13 <= in3;
          out14 <= in4;
          out15 <= in5;
        end
      endcase
    end
  end

endmodule
