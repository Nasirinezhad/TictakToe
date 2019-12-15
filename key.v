module key(clk,rst,row,column,dataout,en) ;

input clk,rst;
input[3:0] column;//column line
output[3:0] row;//line line
output[7:0] dataout;//digital display data
reg[7:0] dataout;
output[7:0] en;//digital display that can
reg[3:0] row;

reg[4:0] scan_key; //scan code register
reg[15:0] cnt_scan;//scan frequency counter

assign en=254;

always@(posedge clk or negedge rst)
begin
	if(!rst) begin
		row<=4'b1110;
		cnt_scan<=0;
	 end
	else begin
		cnt_scan<=cnt_scan+1;
		if(cnt_scan==16'hffff) begin
			row[3:1]<=row[2:0];
			row[0]<=row[3];  //4 ? line wire loop send low
		 end
	 end
end


always@(posedge clk or negedge rst)
begin
	if(!rst) begin
		scan_key<=16;
	 end
	else begin
		case(row)  //The results of test case where a key is pressed
			4'b1110:
				case(column)
					4'b1110: begin
						scan_key<=0;
					 end
					4'b1101: begin
						scan_key<=1;
					 end
					4'b1011: begin
						scan_key<=2;
					 end
					4'b0111: begin
						scan_key<=3;
					 end
				 endcase
			4'b1101:
				case(column)
					4'b1110: begin
						scan_key<=4;
					 end
					4'b1101: begin
						scan_key<=5;
					 end
					4'b1011: begin
						scan_key<=6;
					 end
					4'b0111: begin
						scan_key<=7;
					 end
				 endcase
			4'b1011:
				case(column)
					4'b1110: begin
						scan_key<=8;
					 end
					4'b1101: begin
						scan_key<=9;
					 end
					4'b1011: begin
						scan_key<=10;
					 end
					4'b0111: begin
						scan_key<=11;
					 end
				 endcase
			4'b0111:
				case(column)
					4'b1110: begin
						scan_key<=12;
					 end
					4'b1101: begin
						scan_key<=13;
					 end
					4'b1011: begin
						scan_key<=14;
					 end
					4'b0111: begin
						scan_key<=15;
					 end
				 endcase
			 default:
				scan_key<=15;
		 endcase
	 end
end

always@(scan_key)
begin
	case(scan_key)
		5'b00000:
			dataout<=8'b11000000;
		5'b00001:
			dataout<=8'b11111001;
		5'b00010:
			dataout<=8'b10100100;
		5'b00011:
			dataout<=8'b10110000;
		5'b00100:
			dataout<=8'b10011001;
		5'b00101:
			dataout<=8'b10010010; 
		5'b00110:
			dataout<=8'b10000010; 
		5'b00111:
			dataout<=8'b11111000;
		5'b01000:
			dataout<=8'b10000000;
		5'b01001:
			dataout<=8'b10010000;
		5'b01010:
			dataout<=8'b10001000;
		5'b01011:
			dataout<=8'b10000011;
		5'b01100:
			dataout<=8'b11000110;
		5'b01101:
			dataout<=8'b10100001;
		5'b01110:
			dataout<=8'b10000110;
		5'b01111:
			dataout<=8'b10001110;
		5'b10000:
			dataout<=8'b00000000;
	 endcase
end	

endmodule
