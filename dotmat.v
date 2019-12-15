module dec38(x, y);
input [2:0] x;
output [7:0] y;
assign y[0]= ~(~x[0] & ~x[1] & ~x[2]);
assign y[1]= ~(x[0] & ~x[1] & ~x[2]);
assign y[2]= ~(~x[0] & x[1] & ~x[2]);
assign y[3]= ~(x[0] & x[1] & ~x[2]);
assign y[4]= ~(~x[0] & ~x[1] & x[2]);
assign y[5]= ~(x[0] & ~x[1] & x[2]);
assign y[6]= ~(~x[0] & x[1] & x[2]);
assign y[7]= ~(x[0] & x[1] & x[2]);
endmodule

module dotmat(mat, row, col, leds, clk, bw, beep);
input [63:0] mat;
input clk, bw;
output reg [7:0] col;
output [7:0] row;
output [3:0] leds;

reg [13:0] Q;
initial Q = 0;

reg [8:0] Q2;
initial Q2 = 0;

output beep;
reg beep;
initial beep = 1;

reg [3:0] leds;
initial leds = 4'b0000;

dec38 b_row(Q[13:11], row);

always @ (posedge clk)
begin
	Q <= Q+1;
	case (Q[13:11])
		3'b000:
			col<=mat[7:0];
		3'b001:
			col<=mat[15:8];
		3'b010:
			col<=mat[23:16];
		3'b011:
			col<=mat[31:24];
		3'b100:
			col<=mat[39:32];
		3'b101:
			col<=mat[47:40];
		3'b110:
			col<=mat[55:48];
		3'b111:
			col<=mat[63:56];
	endcase
end
always @ (posedge Q[13])
begin
	Q2 <= Q2+1;
	if(Q2 === 0)
		leds <= leds + 1;
	if(~bw & Q2 === 0)
		beep = beep+1;	
end
endmodule
