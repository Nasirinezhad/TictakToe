module ControlUnit2(clk, keyboard, rst, mat, winner, sp, beep);
input clk, rst;
input [7:0] keyboard;

output [63:0] mat;
reg [63:0] mat;
initial mat = 64'b1111111111111111111111111111111111111111111111111111111111111111;

output sp;
reg sw_player;
initial sw_player = 0;

assign sp = ~sw_player;

output [1:0] winner;

reg [7:0] keyboard2;
initial keyboard2 = 0;

output beep;
reg beep;
initial beep = 1;

assign winner[0] = 
			(mat[0] | mat[2] | mat[4] | mat[6]) &
			(mat[16] | mat[18] | mat[20] | mat[22]) &
			(mat[32] | mat[34] | mat[36] | mat[38]) & 
			(mat[48] | mat[50] | mat[52] | mat[54]) &
			
			(mat[0] | mat[16] | mat[32] | mat[48]) &
			(mat[2] | mat[18] | mat[34] | mat[50]) &
			(mat[4] | mat[20] | mat[36] | mat[52]) &
			(mat[6] | mat[22] | mat[38] | mat[54]) &
			
			(mat[0] | mat[18] | mat[36] | mat[54]) &
			(mat[48] | mat[34] | mat[20] | mat [6]);
			
assign winner[1] = 
			(mat[1] | mat[3] | mat[5] | mat[7]) &
			(mat[17] | mat[19] | mat[21] | mat[23]) &
			(mat[33] | mat[35] | mat[37] | mat[39]) & 
			(mat[49] | mat[51] | mat[53] | mat[55]) &
			
			(mat[1] | mat[17] | mat[33] | mat[49]) &
			(mat[3] | mat[19] | mat[35] | mat[51]) &
			(mat[5] | mat[21] | mat[37] | mat[53]) &
			(mat[7] | mat[23] | mat[39] | mat[55]) &
			
			(mat[1] | mat[19] | mat[37] | mat[55]) &
			(mat[49] | mat[35] | mat[21] | mat [7]);
 
always @ (posedge clk)
if(winner === 2'b11)
	begin
		if(keyboard2 != keyboard)
			begin
				sw_player <= ~sw_player;
				keyboard2 <= keyboard;
			end
	end

always @ (posedge clk)
if(winner === 2'b11)
begin
	case (keyboard)
	8'b10110000://0
	begin
		mat[56] <= sw_player;
		mat[48] <= ~sw_player;
		mat[57] <= ~sw_player;
		mat[49] <= sw_player;
		
	end
	8'b10100100://1
	begin
		mat[40] <= sw_player;
		mat[32] <= ~sw_player;
		mat[41] <= ~sw_player;
		mat[33] <= sw_player;
	end
	8'b11111001://2
	begin
		mat[24] <= sw_player;
		mat[16] <= ~sw_player;
		mat[25] <= ~sw_player;
		mat[17] <= sw_player;
	end
	8'b11000000://3
	begin
		mat[8] <= sw_player;
		mat[0] <= ~sw_player;
		mat[9] <= ~sw_player;
		mat[1] <= sw_player;
	end
	8'b11111000://4
	begin
		mat[58] <= sw_player;
		mat[50] <= ~sw_player;
		mat[59] <= ~sw_player;
		mat[51] <= sw_player;
	end
	8'b10000010://5
	begin
		mat[42] <= sw_player;
		mat[34] <= ~sw_player;
		mat[43] <= ~sw_player;
		mat[35] <= sw_player;
	end
	8'b10010010://6
	begin
		mat[26] <= sw_player;
		mat[18] <= ~sw_player;
		mat[27] <= ~sw_player;
		mat[19] <= sw_player;
	end
	8'b10011001://7
	begin
		mat[10] <= sw_player;
		mat[2] <= ~sw_player;
		mat[11] <= ~sw_player;
		mat[3] <= sw_player;
	end
	8'b10000011://
	begin
		mat[60] <= sw_player;
		mat[52] <= ~sw_player;
		mat[61] <= ~sw_player;
		mat[53] <= sw_player;
	end
	8'b10001000:
	begin
		mat[44] <= sw_player;
		mat[36] <= ~sw_player;
		mat[45] <= ~sw_player;
		mat[37] <= sw_player;
	end
	8'b10010000:
	begin
		mat[28] <= sw_player;
		mat[20] <= ~sw_player;
		mat[29] <= ~sw_player;
		mat[21] <= sw_player;
	end
	8'b10000000://
	begin
		mat[12] <= sw_player;
		mat[4] <= ~sw_player;
		mat[13] <= ~sw_player;
		mat[5] <= sw_player;
	end
	8'b10001110:
	begin
		mat[62] <= sw_player;
		mat[54] <= ~sw_player;
		mat[63] <= ~sw_player;
		mat[55] <= sw_player;
	end
	8'b10000110:
	begin
		mat[46] <= sw_player;
		mat[38] <= ~sw_player;
		mat[47] <= ~sw_player;
		mat[39] <= sw_player;
	end
	8'b10100001:
	begin
		mat[30] <= sw_player;
		mat[22] <= ~sw_player;
		mat[31] <= ~sw_player;
		mat[23] <= sw_player;
	end
	8'b11000110:
	begin
		mat[14] <= sw_player;
		mat[6] <= ~sw_player;
		mat[15] <= ~sw_player;
		mat[7] <= sw_player;
	end
	endcase
end
else
	beep <= 0;
endmodule
