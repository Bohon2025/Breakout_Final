module BreakoutControl(clk_50, strt, rst, ,L, R, VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC, VGA_CLK);

input clk_50;
input strt, rst, L, R;

output [9:0]VGA_R;
output [9:0]VGA_G;
output [9:0]VGA_B;
output VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC, VGA_CLK;

wire [2:0] color;

reg [3:0] S,NS;
reg W, done, start_state, clk25; 
reg [9:0] x, y;

wire [9:0] ballx, bally, padx, pady;
wire [2:0] PadAng;
wire padcol, topbotcol, LRcol, topbotcol2, LRcol2, topbotcol3, LRcol3, topbotcol4, LRcol4, topbotcol5, LRcol5, topbotcol6, LRcol6, topbotcol7, LRcol7, topbotcol8, LRcol8, topbotcol9, LRcol9, topbotcol10, LRcol10, topbotcol11, LRcol11, topbotcol12, LRcol12, topbotcol13, LRcol13, topbotcol14, LRcol14, topbotcol15, LRcol15, topbotcol16, LRcol16, ceilingcol, walcol, Lo;
wire Hit1, Hit2, Hit3, Hit4, Hit5, Hit6, Hit7, Hit8, Hit9, Hit10, Hit11, Hit12, Hit13, Hit14, Hit15, Hit16;
wire clk60;

Counter slowclk(clk_50, rst, clk60);
Paddlemove pad(rst, clk_50, clk60, L, R, strt, ballx, bally, padx, pady, padcol, PadAng);
//Wallcol wallc(rst, clk60, ballx, bally, ceilingcol, walcol);
Block blk1(clk60, rst, strt, ballx, bally, block1x, block1y, Hit1, topbotcol, LRcol);
Block blk2(clk60, rst, strt, ballx, bally, block2x, block2y, Hit2, topbotcol2, LRcol2);
Block blk3(clk60, rst, strt, ballx, bally, block3x, block3y, Hit3, topbotcol3, LRcol3);
Block blk4(clk60, rst, strt, ballx, bally, block4x, block4y, Hit4, topbotcol4, LRcol4);
Block blk5(clk60, rst, strt, ballx, bally, block5x, block5y, Hit5, topbotcol5, LRcol5);
Block blk6(clk60, rst, strt, ballx, bally, block6x, block6y, Hit6, topbotcol6, LRcol6);
Block blk7(clk60, rst, strt, ballx, bally, block7x, block7y, Hit7, topbotcol7, LRcol7);
Block blk8(clk60, rst, strt, ballx, bally, block8x, block8y, Hit8, topbotcol8, LRcol8);
Block blk9(clk60, rst, strt, ballx, bally, block9x, block9y, Hit9, topbotcol9, LRcol9);
Block blk10(clk60, rst, strt, ballx, bally, block10x, block10y, Hit10, topbotcol10, LRcol10);
Block blk11(clk60, rst, strt, ballx, bally, block11x, block11y, Hit11, topbotcol11, LRcol11);
Block blk12(clk60, rst, strt, ballx, bally, block12x, block12y, Hit12, topbotcol12, LRcol12);
Block blk13(clk60, rst, strt, ballx, bally, block13x, block13y, Hit13, topbotcol13, LRcol13);
Block blk14(clk60, rst, strt, ballx, bally, block14x, block14y, Hit14, topbotcol14, LRcol14);
Block blk15(clk60, rst, strt, ballx, bally, block15x, block15y, Hit15, topbotcol15, LRcol15);
Block blk16(clk60, rst, strt, ballx, bally, block16x, block16y, Hit16, topbotcol16, LRcol16);

Ballmove ball(rst, clk_50, clk60, strt, topbotcol, LRcol, topbotcol2, LRcol2, topbotcol3, LRcol3, topbotcol4, LRcol4, topbotcol5, LRcol5, topbotcol6, LRcol6, topbotcol7, LRcol7, topbotcol8, LRcol8, topbotcol9, LRcol9, topbotcol10, LRcol10, topbotcol11, LRcol11, topbotcol12, LRcol12, topbotcol13, LRcol13, topbotcol14, LRcol14, topbotcol15, LRcol15, topbotcol16, LRcol16, ceilingcol, walcol, padcol, PadAng, ballx, bally, Lo);

Display dis(clk_50, rst, x, y, ballx, bally, padx, pady, block1x, block1y, block2x, block2y, block3x, block3y, block4x, block4y, block5x, block5y, block6x, block6y, block7x, block7y, block8x, block8y, block9x, block9y, block10x, block10y, block11x, block11y, block12x, block12y, block13x, block13y, block14x, block14y, block15x, block15y, block16x, block16y, Hit1, Hit2, Hit3, Hit4, Hit5, Hit6, Hit7, Hit8, Hit9, Hit10, Hit11, Hit12, Hit13, Hit14, Hit15, Hit16, strt, done, Lo, W, color);

//                  rst  clk     color  x  y  ploten/outputs
vga_adapter display(rst, clk_50, color, x, y, 1'b1, VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC, VGA_CLK);


parameter 
Start = 4'd0,
Play = 4'd1,
Win = 4'd2,
Lose = 4'd3,

block1x = 10'd1,
block1y = 10'd50,

block2x = 10'd41,
block2y = 10'd50,

block3x = 10'd81,
block3y = 10'd50,

block4x = 10'd121,
block4y = 10'd50,

block5x = 10'd161,
block5y = 10'd50,

block6x = 10'd201,
block6y = 10'd50,

block7x = 10'd241,
block7y = 10'd50,

block8x = 10'd281,
block8y = 10'd50,

block9x = 10'd1,
block9y = 10'd19,

block10x = 10'd41,
block10y = 10'd19,

block11x = 10'd81,
block11y = 10'd19,

block12x = 10'd121,
block12y = 10'd19,

block13x = 10'd161,
block13y = 10'd19,

block14x = 10'd201,
block14y = 10'd19,

block15x = 10'd241,
block15y = 10'd19,

block16x = 10'd281,
block16y = 10'd19;



//25mhz clk
always @(posedge clk_50 or negedge rst) begin

	if (rst == 1'b0) begin
	
		clk25 <= 0;
		
	end else begin
	
		clk25 <= ~clk25;
		
	end

end



always @(posedge clk25 or negedge rst) begin
	
	if (rst == 1'b0) begin
		// reset x and y
		x <= 0;
		y <= 0;
	end else begin
			
		if (x == 10'd320) begin
			// reset x if 320
			x <= 0;
			
			if (y == 10'd240) begin
				// reset y if 240
				y <= 0;
				
			end else begin
				// inc y if < 240
				y <= y + 10'd1;
				
			end
			
		end else begin
			// inc x if < 320
			x <= x + 10'd1;
			
		end
		
	end

end



always@(posedge clk_50 or negedge rst)
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
		if(strt == 1'b0)
			NS = Play;
		else 
			NS = Start;
	Play:
		if(Hit1 == 1'b1 && Hit2 == 1'b1 && Hit3 == 1'b1 && Hit4 == 1'b1 && Hit5 == 1'b1 && Hit6 == 1'b1 && Hit7 == 1'b1 && Hit8 == 1'b1 && Hit9 == 1'b1 && Hit10 == 1'b1 && Hit11 == 1'b1 && Hit12 == 1'b1 && Hit13 == 1'b1 && Hit14 == 1'b1 && Hit15 == 1'b1 && Hit16 == 1'b1)
			NS = Win;
		else 
			if(Lo == 1'b1)
				NS = Lose;
			else
			NS = Play;
	Win:
		NS = Win;
	Lose: 
		NS = Lose;
endcase
end


always@(posedge clk_50 or negedge rst)
begin
	if(rst == 1'b0)
	begin 
		done <= 1'b0;
		W <= 1'b0;
//		Lo <= 1'b0;
		start_state <= 1'b1;
	end
	else 
	begin
		case (S)
			Start:
			begin
				done <= 1'b0;
				W <= 1'b0;
			end
			Win:
			begin
				W <= 1'b1;
			end
		endcase
	end
end
endmodule	