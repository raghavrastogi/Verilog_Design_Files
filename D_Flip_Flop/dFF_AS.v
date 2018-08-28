//------------------------------------------------
// D Flip Flop with synchronous reset.
//------------------------------------------------
//  Functionality:
//                Q Output data of flip flop.
//                QB inverted output of Q.
//                data data input.
//                clk clock input.
//                rst reset input.
//                If reset is enabled the flip flop will reset independent of the clock (Asynchronous).
//------------------------------------------------
//  Design Architecture = Behavioural Architecture
//------------------------------------------------
//  Module Name   : dFF_AS;
//  Designer      : Raghav Rastogi;
//  Creation Date : 28, August, 2018;
//------------------------------------------------

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
