`timescale 1ns/1ns
module RAM_TB;
	parameter 	ADDRESS_DEPTH 	= 1048576,
				ADDRESS_SIZE 	= 20,
				DATA_WIDTH		= 32;
				
	wire 	[DATA_WIDTH 	- 1 : 0] 	dataBus_OUT;
	reg 	[DATA_WIDTH 	- 1 : 0] 	dataBus_IN;
	reg		[ADDRESS_SIZE 	- 1 : 0] 	addressBus;
	reg 								clk, rst, RDwr;
	
	reg [ADDRESS_SIZE-1:0] i;
	
	RAM_ASYNC dut(dataBus_OUT, dataBus_IN, addressBus, clk, rst, RDwr);
	
	initial begin
		clk = 1'b0;
		RDwr = 1'b1;
		rst = 1'b1;
		forever begin
			#2 clk = ~clk;
		end
	end
	
	initial begin
		#6
		rst = 1'b0;
		#4
		RDwr = 1'b0;
		for(i = 0; i < 20; i = i + 1) begin
			#4
			addressBus = i;
			dataBus_IN = i;
			$display ("Time: %3t, Address: %7d, Data_OUT: %7d, Data_IN: %7d, RST: %0b, RDWR: %0b", $time,addressBus,dataBus_OUT, dataBus_IN, rst, RDwr);
		end
	end
	
	initial begin
		#102
		RDwr = 1'b1;
		repeat(20) begin
			#4 addressBus = $random % 20;
			$display ("Time: %3t, Address: %7d, Data_OUT: %7d, Data_IN: %7d, RST: %0b, RDWR: %0b", $time,addressBus,dataBus_OUT, dataBus_IN, rst, RDwr);
		end
	end
endmodule
