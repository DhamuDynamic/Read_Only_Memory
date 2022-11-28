module ROM_tb();
	reg Clk_tb,Re_tb;
	reg [3:0] Ra_tb;
	wire [7:0] Dout_tb;
	integer i;
	ROM dut (Clk_tb,Re_tb,Ra_tb,Dout_tb);
	initial
	begin
		Clk_tb = 0;
		forever #10 Clk_tb = ~Clk_tb;
	end
	task initialize;
	begin
		Re_tb = 0;
		Ra_tb = 0;
	end
	endtask
	task Read(input [3:0]m);
	begin
		@(negedge Clk_tb)
		Re_tb = 1'b1;
		Ra_tb = m;
	end
	endtask
	initial
	begin
		initialize;
		#20;
		for(i=0;i<16;i=i+1)
		begin
			Read(i);
		end
	end
	initial
	begin
		$dumpfile("dump.vcd");
		$dumpvars(1);
	end
	initial #500 $finish;
endmodule
