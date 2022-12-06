module Counter(clk, rst, clk60);

input clk, rst;
output reg clk60;

reg [25:0] tick;

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
	begin
		tick <= 26'd0;
		clk60 <= 1'b0;
	end
	else
	begin
		if (tick >= 26'd603333)
		begin
			tick <= 26'd0;
			clk60 <=1'b1;
		end
		
		else
		begin
			tick <= tick + 1'b1;
			clk60 <= 1'b0;
		end
end
end
endmodule
