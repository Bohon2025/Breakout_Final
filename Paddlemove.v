/* 
 * Do not change Module name 
 * PADDLE MOVE MODULE
*/
module Paddlemove(rst, clk, clk60, L, R, start, ballx, bally, padx, pady, Padcol, PadAng);
input rst, clk, clk60, L, R, start;
input [9:0] ballx, bally;
output reg Padcol;
output reg [2:0] PadAng;
output reg [9:0] padx, pady;

reg [3:0] S,NS;

parameter
PadW = 8'd80,
PadH = 5'd20,
PadStartX = 10'd100,
PadStartY = 10'd200,
ScreenW = 10'd320,
ScreenH = 10'd240,
Start = 4'd0,
Wait = 4'd1,
MoveL = 4'd2,
MoveR = 4'd3;

always@(posedge clk60 or negedge rst)
begin
    if(rst == 1'b0)
        S <= Start;
    else
        S <= NS;
end

always@(*)
    case(S)
        Start:
            if(start == 1'b0)
                NS = Wait;
            else
                NS = Start;
        
        Wait:
            if(L == 1'b0)
                NS = MoveL;
            else
            if(R == 1'b0)
                NS = MoveR;
            else
            if(L^~R == 1'b0)
                NS = Wait;
            else
                NS = Wait;
        
        MoveL:
            if(L == 1'b0)
                NS = MoveL;
            else
                NS = Wait;
        
        MoveR:
            if(R == 1'b0)
                NS = MoveR;
            else
                NS = Wait;
    endcase

always@(posedge clk60 or negedge rst)
begin
    if(rst == 1'b0)
    begin
        padx <= PadStartX;
        pady <= PadStartY;
    end
    else
    begin
        case(S)
            Wait:
				begin
                if(ballx > padx && ballx < padx + 17 && bally == pady)
					 begin
                    Padcol <= 1'b1;
                    PadAng <= 3'd0;
					 end
                else
                if(ballx > padx + 16 && ballx < padx + 33 && bally == pady)
					 begin
                    Padcol <= 1'b1;
                    PadAng <= 3'd1;
					 end
                else
                if(ballx > padx + 32 && ballx < padx + 49 && bally == pady)
					 begin
                    Padcol <= 1'b1;
                    PadAng <= 3'd2;
					 end
                else
                if(ballx > padx + 48 && ballx < padx + 65 && bally == pady)
					 begin
                    Padcol <= 1'b1;
                    PadAng <= 3'd3;
					 end
                else
                if(ballx > padx + 64 && ballx < padx + 80 && bally == pady)
					 begin
                    Padcol <= 1'b1;
                    PadAng <= 3'd4;
					 end
                else
					 begin
                    padx <= padx;
                    Padcol <= 1'b0;
					 end
            end
            MoveL:
				begin
                if(ballx > padx && ballx < padx + 17 && bally == pady)
					 begin
                    Padcol <= 1'b1;
                    PadAng <= 3'd0;
					 end
                else
                if(ballx > padx + 16 && ballx < padx + 33 && bally == pady)
					 begin
                    Padcol <= 1'b1;
                    PadAng <= 3'd1;
					 end
                else
                if(ballx > padx + 32 && ballx < padx + 49 && bally == pady)
					 begin
                    Padcol <= 1'b1;
                    PadAng <= 3'd2;
					 end
                else
                if(ballx > padx + 48 && ballx < padx + 65 && bally == pady)
					 begin
                    Padcol <= 1'b1;
                    PadAng <= 3'd3;
					 end
                else
                if(ballx > padx + 64 && ballx < padx + 80 && bally == pady)
					 begin
                    Padcol <= 1'b1;
                    PadAng <= 3'd4;
					 end
                else
                if(padx == 10'd0)
					 begin
                    padx <= padx;
					 end
                else
					 begin
                    padx <= padx - 1;
                    Padcol <= 1'b0;
					 end
				end
            MoveR:
				begin
                if(ballx > padx && ballx < padx + 17 && bally == pady)
					 begin
                    Padcol <= 1'b1;
                    PadAng <= 3'd0;
					 end
                else
                if(ballx > padx + 16 && ballx < padx + 33 && bally == pady)
					 begin
                    Padcol <= 1'b1;
                    PadAng <= 3'd1;
					 end
                else
                if(ballx > padx + 32 && ballx < padx + 49 && bally == pady)
					 begin
                    Padcol <= 1'b1;
                    PadAng <= 3'd2;
					 end
                else
                if(ballx > padx + 48 && ballx < padx + 65 && bally == pady)
					 begin
                    Padcol <= 1'b1;
                    PadAng <= 3'd3;
					 end
                else
                if(ballx > padx + 64 && ballx < padx + 80 && bally == pady)
					 begin
                    Padcol <= 1'b1;
                    PadAng <= 3'd4;
					 end
                else
                if(padx == 10'd240)
					 begin
                    padx <= padx;
					 end
                else
					 begin
                    padx <= padx + 1;
                    Padcol <= 1'b0;
					 end
				end
            endcase
		end
	end
endmodule