module Ballmove(rst, clk, clk60, start, topbotcol, LRcol, topbotcol2, LRcol2, topbotcol3, LRcol3, topbotcol4, LRcol4, topbotcol5, LRcol5, topbotcol6, LRcol6, topbotcol7, LRcol7, topbotcol8, LRcol8, topbotcol9, LRcol9, topbotcol10, LRcol10, topbotcol11, LRcol11, topbotcol12, LRcol12, topbotcol13, LRcol13, topbotcol14, LRcol14, topbotcol15, LRcol15, topbotcol16, LRcol16, ceilingcol, walcol, padcol, padAng, ballx, bally, L);

input rst, clk, clk60, start,topbotcol, LRcol, topbotcol2, LRcol2, topbotcol3, LRcol3, topbotcol4, LRcol4, topbotcol5, LRcol5, topbotcol6, LRcol6, topbotcol7, LRcol7, topbotcol8, LRcol8, topbotcol9, LRcol9, topbotcol10, LRcol10, topbotcol11, LRcol11, topbotcol12, LRcol12, topbotcol13, LRcol13, topbotcol14, LRcol14, topbotcol15, LRcol15, topbotcol16, LRcol16, padcol, ceilingcol, walcol;
input [2:0] padAng;
//output reg done;
output reg [9:0] ballx, bally;
output reg L;

reg [3:0] S, NS;
reg [2:0] movex, movey;
reg UD;

//LR = 0(no left or right) 1(little left(-1)) 2(more left(-2)) 3(little right(+1)) 4(more right(+2))
reg [2:0] LR;

parameter
Start = 4'd0,
Startpos = 4'd1,
Startmove = 4'd2,
Move = 4'd3,
SwitchL = 4'd4,
SwitchR = 4'd8,
Switchy = 4'd5,
Padcol = 4'd6,
Done = 4'd7,
Startx = 10'd160,
Starty = 10'd100;

always@(posedge clk60 or negedge rst)
begin
    if(rst == 1'b0)
        S <= Start;
    else
        S <= NS;
end

always@(*)
begin
    case(S)
        Start:
            NS = Startpos;
        Startpos:
         if(start == 1'b0)
				NS = Startmove;
			else
				NS = Startpos;
		Startmove:
			NS = Move;
		Move:
			if(topbotcol == 1'b1 || topbotcol2 == 1'b1 || topbotcol3 == 1'b1 || topbotcol4 == 1'b1 || topbotcol5 == 1'b1 || topbotcol6 == 1'b1 || topbotcol7 == 1'b1 || topbotcol8 == 1'b1 || topbotcol9 == 1'b1 || topbotcol10 == 1'b1 || topbotcol11 == 1'b1 || topbotcol12 == 1'b1 || topbotcol13 == 1'b1 || topbotcol14 == 1'b1 || topbotcol15 == 1'b1 || topbotcol16 == 1'b1)
				NS = Switchy;
			else
			if(bally == 10'd1)
				NS = Switchy;
			else
			if(ballx == 10'd2)
				NS = SwitchL;
			else
			if(ballx == 10'd1)
				NS = SwitchL;
			else
			if(ballx == 10'd318)
				NS = SwitchR;
			else
			if(ballx == 10'd319)
				NS = SwitchR;
			else
			if(LRcol == 1'b1 || LRcol2 == 1'b1 || LRcol3 == 1'b1 || LRcol4 == 1'b1 || LRcol5 == 1'b1 || LRcol6 == 1'b1 || LRcol7 == 1'b1 || LRcol8 == 1'b1 || LRcol9 == 1'b1 || LRcol10 == 1'b1 || LRcol11 == 1'b1 || LRcol12 == 1'b1 || LRcol13 == 1'b1 || LRcol14 == 1'b1 || LRcol15 == 1'b1 || LRcol16 == 1'b1)
				NS = SwitchL;
			else
			if(padcol == 1'b1)
				NS = Padcol;
			else
			if(bally == 240)
				NS = Done;
			else
				NS = Move;
		Switchy:
			NS = Move;
		SwitchL:
			NS = Move;
		SwitchR:
			NS = Move;
		Padcol:
			NS = Move;
		Done:
			NS = Done;
	endcase
end

always@(posedge clk60 or negedge rst)
begin
	if(rst == 1'b0)
	begin
		ballx <= 10'd160;
		bally <= 10'd100;
		UD <= 1'b0;
		LR <= 3'd0;
		L <= 1'b0;
	end
	else
	begin
		case(S)
			Start: 
			begin
				ballx <= 10'd160;
				bally <= 10'd100;
			end
			Startmove:
			begin
				movex <= 3'd0;
				movey <= 3'd1;
			end
			
			
			Move:
			begin
			if(UD == 1'b0 && LR == 3'd0)
			begin
				ballx <= ballx;
				bally <= bally + 1;
			end
			else if(UD == 1'b0 && LR == 3'd1)
			begin
				ballx <= ballx - 1;
				bally <= bally + 1;
			end
			else if(UD == 1'b0 && LR == 3'd2)
			begin
				ballx <= ballx - 2;
				bally <= bally + 1;
			end
			else if(UD == 1'b0 && LR == 3'd3)
			begin
				ballx <= ballx + 1;
				bally <= bally + 1;
			end
			else if(UD == 1'b0 && LR == 3'd4)
			begin
				ballx <= ballx + 2;
				bally <= bally + 1;
			end
			else if(UD == 1'b1 && LR == 3'd0)
			begin
				ballx <= ballx;
				bally <= bally - 1;
			end
			else if(UD == 1'b1 && LR == 3'd1)
			begin
				ballx <= ballx - 1;
				bally <= bally - 1;
			end
			else if(UD == 1'b1 && LR == 3'd2)
			begin
				ballx <= ballx - 2;
				bally <= bally - 1;
			end
			else if(UD == 1'b1 && LR == 3'd3)
			begin
				ballx <= ballx + 1;
				bally <= bally - 1;
			end
			else if(UD == 1'b1 && LR == 3'd4)
			begin
				ballx <= ballx + 2;
				bally <= bally - 1;
			end
			else
			begin
				bally <= ballx;
				bally <= bally;
			end
			end
			
			Switchy:
			begin
				if(UD == 1'b1)
				begin
					bally <= bally + 2;
					UD <= 1'b0;
				end
				else
				begin
					bally <= bally - 2;
					UD <= 1'b1;
				end
			end
			
			SwitchL:
			begin
				if(LR == 3'd1)
				begin
					ballx <= ballx + 2;
					LR <= 3'd3;
				end
				else if(LR == 3'd2)
				begin
					ballx <= ballx + 3;
					LR <= 3'd4;
				end
				else
				begin
					LR <= LR;
				end
			end
			
			SwitchR:
			begin
				if(LR == 3'd3)
				begin
					ballx <= ballx - 2;
					LR <= 3'd1;
				end
				else if(LR == 3'd4)
				begin
					ballx <= ballx - 3;
					LR <= 3'd2;
				end
				else
				begin
					LR <= LR;
				end
			end
			
			Padcol:
			begin
				bally <= bally - 1;
				UD <= 1'b1;
				case(padAng)
					3'd0:
					begin
						LR <= 3'd2;
					end
					3'd1:
					begin
						LR <= 3'd1;
					end
					3'd2:
					begin
						LR <= 3'd0;
					end
					3'd3:
					begin
						LR <= 3'd3;
					end
					3'd4:
					begin
						LR <= 3'd4;
					end
				endcase
			end
			Done:
			begin
				L <= 1'b1;
			end
		endcase
	end
end

endmodule
