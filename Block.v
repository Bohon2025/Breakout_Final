
module Block(clk, rst, start, ballx, bally, x, y, hitx, topbotcol, LRcol);
input clk, rst, start;
input [9:0] ballx, bally, x, y;
output reg hitx, topbotcol, LRcol;

reg [3:0] S, NS;

parameter
Start = 4'd0,
init = 4'd1,
display = 4'd2,
hit = 4'd3,
tb = 4'd4,
lr = 4'd5;

always@(posedge clk or negedge rst)
begin
    if(rst == 1'b0)
        S <= Start;
    else
        S <= NS;
end

always@(*)
case(S)
    Start:
        NS = init;
    init:
        NS = display;
    display:
        if((ballx > x && ballx < x + 40 && bally == y) || (ballx > x && ballx < x + 40 && bally == y + 20))
            NS = tb;
        else if((bally > y && bally < y + 20 && (ballx == x || ballx == x + 1)) || (bally > y && bally < y + 20 && (ballx == x + 40 || ballx == x + 39)))
            NS = lr;
		  else
			   NS = display;
	 lr:
		NS = hit;
	 tb:
	   NS = hit;
		
    hit:
        NS = hit;
endcase

always@(posedge clk or negedge rst)
begin
    if(rst == 1'b0)
    begin
        hitx <= 1'b0;
        topbotcol <= 1'b0;
        LRcol <= 1'b0;
    end
    else
    begin
        case(S)
            init:
				begin
                hitx <= 1'b0;
                topbotcol <= 1'b0;
                LRcol <= 1'b0;
				end
            display:
				begin
					 begin
                    hitx <= 1'b0;
					 end
				end
				tb:
				begin

                   topbotcol <= 1'b1;
                   hitx <= 1'b1;
				end
				lr:
				begin
                   LRcol <= 1'b1;
                   hitx <= 1'b1;
				end
            hit:
				begin
                topbotcol <= 1'b0;
                LRcol <= 1'b0;
                hitx <= 1'd1;
				end
        endcase
    end
end
endmodule