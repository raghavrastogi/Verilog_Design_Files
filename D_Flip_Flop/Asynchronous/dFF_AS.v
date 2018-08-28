module dFF_AS (Q, QB, data, clk, rst);
  
	output Q, QB;
	input data, clk, rst;
	reg Q;
  
	assign QB = ~Q;
  
	always @(posedge clk, posedge rst)
	begin
		if(rst)
			Q <= 1'b0;
		else
			Q <= data;
	end
endmodule
