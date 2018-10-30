/* Asynchronous RAM
		Single Port Asynchronous RAM with asynchronous reset.
		Size = 4MBytes.
        Active High Reset.
        Active High Read (RDwr = 1 for Reading)
        Active Low Write (RDWR = 0 for Writing)
		Designer : Raghav Rastogi
*/

module RAM_ASYNC(dataBus_OUT, dataBus_IN, addressBus, clk, rst, RDwr);
	parameter 	ADDRESS_DEPTH 	= 1048576,
				ADDRESS_SIZE 	= 20,
				DATA_WIDTH		= 32;
	
	output	[DATA_WIDTH		- 1 : 0]	dataBus_OUT;
	input 	[DATA_WIDTH 	- 1 : 0] 	dataBus_IN;
	input	[ADDRESS_SIZE 	- 1 : 0] 	addressBus;
	input								clk, rst, RDwr;
	
	integer i;
	
	reg 	[DATA_WIDTH - 1 : 0] ASYNC_RAM [ADDRESS_DEPTH - 1 : 0];
	
	assign dataBus_OUT = RDwr ? ASYNC_RAM[addressBus] : 32'bz;
	
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			for(i = 0; i < ADDRESS_DEPTH; i = i + 1)
				ASYNC_RAM[i] = 32'b0;
		end
		else if(!RDwr)
			ASYNC_RAM[addressBus] = dataBus_IN;
	end
endmodule
