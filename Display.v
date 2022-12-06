module Display(clk, rst, x, y, ballx, bally, paddlex, paddley, block1x, block1y, block2x, block2y, block3x, block3y, block4x, block4y, block5x, block5y, block6x, block6y, block7x, block7y, block8x, block8y, block9x, block9y, block10x, block10y, block11x, block11y, block12x, block12y, block13x, block13y, block14x, block14y, block15x, block15y, block16x, block16y, hit1, hit2, hit3, hit4, hit5, hit6, hit7, hit8, hit9, hit10, hit11, hit12, hit13, hit14, hit15, hit16, start, done, L, W, color);

input clk, rst, start, hit1, hit2, hit3, hit4, hit5, hit6, hit7, hit8, hit9, hit10, hit11, hit12, hit13, hit14, hit15, hit16, done, W, L;
input [9:0] x, y, ballx, bally, paddlex, paddley, block1x, block1y, block2x, block2y, block3x, block3y, block4x, block4y, block5x, block5y, block6x, block6y, block7x, block7y, block8x, block8y, block9x, block9y, block10x, block10y, block11x, block11y, block12x, block12y, block13x, block13y, block14x, block14y, block15x, block15y, block16x, block16y;

output reg [2:0] color;

reg [8:0] shift;
reg [7:0] S, NS;

parameter
Start = 8'd0,
xypos = 8'd1,
black = 8'd2,
colour = 8'd3,
white = 8'd4,
Begin = 8'd5,
Win = 8'd6,
Loss = 8'd7;



always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		S<= Start;
	else 
		S<= NS;
end



always@(*)
begin
case(S)
	Start:
		if(start == 1'b0)
			NS = xypos;
		else
			NS = Start;
	xypos:
		if((x > paddlex && x < paddlex + 80 && y < paddley + 10 && y > paddley) || (x > ballx - 2 && x < ballx + 2 && y > bally - 2 && y < bally + 2) && L == 1'b0 && W == 1'b0)
			NS = black;
		else if(x > block1x && x < block1x + 40 && y > block1y && y < block1y + 20 && hit1 == 1'b0 && L == 1'b0 && W == 1'b0)
			NS = colour;
		else if(x > block2x && x < block2x + 40 && y > block2y && y < block2y + 20 && hit2 == 1'b0 && L == 1'b0 && W == 1'b0)
			NS = colour;
		else if(x > block3x && x < block3x + 40 && y > block3y && y < block3y + 20 && hit3 == 1'b0 && L == 1'b0 && W == 1'b0)
			NS = colour;
		else if(x > block4x && x < block4x + 40 && y > block4y && y < block4y + 20 && hit4 == 1'b0 && L == 1'b0 && W == 1'b0)
			NS = colour;
		else if(x > block5x && x < block5x + 40 && y > block5y && y < block5y + 20 && hit5 == 1'b0 && L == 1'b0 && W == 1'b0)
			NS = colour;
		else if(x > block6x && x < block6x + 40 && y > block6y && y < block6y + 20 && hit6 == 1'b0 && L == 1'b0 && W == 1'b0)
			NS = colour;
		else if(x > block7x && x < block7x + 40 && y > block7y && y < block7y + 20 && hit7 == 1'b0 && L == 1'b0 && W == 1'b0)
			NS = colour;
		else if(x > block8x && x < block8x + 40 && y > block8y && y < block8y + 20 && hit8 == 1'b0 && L == 1'b0 && W == 1'b0)
			NS = colour;
		else if(x > block9x && x < block9x + 40 && y > block9y && y < block9y + 20 && hit9 == 1'b0 && L == 1'b0 && W == 1'b0)
			NS = colour;
		else if(x > block10x && x < block10x + 40 && y > block10y && y < block10y + 20 && hit10 == 1'b0 && L == 1'b0 && W == 1'b0)
			NS = colour;
		else if(x > block11x && x < block11x + 40 && y > block11y && y < block11y + 20 && hit11 == 1'b0 && L == 1'b0 && W == 1'b0)
			NS = colour;
		else if(x > block12x && x < block12x + 40 && y > block12y && y < block12y + 20 && hit12 == 1'b0 && L == 1'b0 && W == 1'b0)
			NS = colour;
		else if(x > block13x && x < block13x + 40 && y > block13y && y < block13y + 20 && hit13 == 1'b0 && L == 1'b0 && W == 1'b0)
			NS = colour;
		else if(x > block14x && x < block14x + 40 && y > block14y && y < block14y + 20 && hit14 == 1'b0 && L == 1'b0 && W == 1'b0)
			NS = colour;
		else if(x > block15x && x < block15x + 40 && y > block15y && y < block15y + 20 && hit15 == 1'b0 && L == 1'b0 && W == 1'b0)
			NS = colour;
		else if(x > block16x && x < block16x + 40 && y > block16y && y < block16y + 20 && hit16 == 1'b0 && L == 1'b0 && W == 1'b0)
			NS = colour;
		else if(L == 1'b1)
			NS = Loss;
		else if(W == 1'b1)
			NS = Win;
		else 
			NS = white;
	black:
		NS = xypos;
	colour:
		NS = xypos;
	white:
		NS = xypos;
	Win:
		NS = xypos;
	Loss:
		NS = xypos;
endcase
end



//always @(posedge clk_50 or negedge rst) begin
//	
//	if (rst == 1'b0) begin
//			
//		r <= 0;
//		g <= 0;
//		b <= 0;
//		shift <= 8'b00000001;
//			
//	end else begin
//		
//		r <= x[7:0];
//		g <= y[9:2];
//		b <= shift;
//		shift <= {shift[6:0], shift[7] ^ shift[6]};
//		
//	end
//	
//end



always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
	begin
		color <= 3'b111;
	end
	else
	begin
		case (S)
			Start:
			begin
			color <= 3'b000;
			end
			black:
			begin
			color <= 3'b001;
			end
			colour:
			begin
			color <= 3'b010;
			end
			white:
			begin
			color <= 3'b011;
			end
			Win:
			begin
			color <= 3'b100;
			end
			Loss:
			begin
			color <= 3'b101;
			end
			default:
			begin
			color <= 3'b111;
			end
		endcase
	end
end
endmodule