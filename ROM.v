module ROM(Clk,Re,Ra,Dout);
	input Clk,Re;
	input [3:0] Ra;
	output reg [7:0] Dout;
	integer i;
	reg [7:0] Mem [15:0];
	initial
	begin
		for(i=0;i<16;i=i+1)
		begin
			Mem[i] = i;
		end
	end
	always @(posedge Clk)
	begin
		if(Re)
		begin
			Dout <= Mem[Ra];
		end
	end
endmodule
