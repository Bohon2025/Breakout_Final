module Wallcol(rst, clk, ballx, bally, topbotcol, LRcol);

input rst, clk;
input[9:0] ballx, bally;

output reg topbotcol, LRcol;

reg [3:0] S, NS;

parameter
Start = 4'd0,
init = 4'd1,
pause = 4'd2,
LR = 4'd3,
TB = 4'd4;

always@(posedge clk or negedge rst)
begin
	if (rst == 1'b0)
	begin
		S <= Start;
	end
	
	else
	begin
		S <= NS;
	end
end

always@(*)
	case(S)
		Start:
			NS = init;
		init:
			NS = pause;
		pause:
			if(ballx > 320 || ballx < 0)
				NS = LR;
			else
				if(bally < 1)
					NS = TB;
				else
					NS = pause;
		LR:
			NS = pause;
		TB:
			NS = pause;
	endcase

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
	begin
		topbotcol <= 1'b0;
		LRcol <= 1'b0;
	end
	else
	begin
		case(S)
			pause: 
			begin
				topbotcol <= 1'b0;
				LRcol <= 1'b0;
			end
			
			LR:
			begin
				LRcol <= 1'b1;
			end
			
			TB:
			begin
				topbotcol <= 1'b1;
			end
		endcase
	end
end
endmodule 