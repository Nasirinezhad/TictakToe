module Dooz(rst, rkey, ckey, row, col, clk, winner, w2, leds, beep, sp);

input clk, rst;

output [7:0] row, col;
input [3:0] ckey;
output [3:0] rkey;
output [3:0] leds;

output beep;
wire bw;

output [1:0] sp;

output [1:0] winner;
output [1:0] w2;

assign sp[0] = 0;

wire [7:0] en, keyboard;
wire [63:0] mat;

key bl(clk, rst, rkey, ckey, keyboard, en);

ControlUnit2 cu(clk, keyboard, rst, mat, winner, sp[1], bw);

assign w2 = winner;

dotmat blok(mat, row, col, leds, clk, bw, beep);

endmodule
