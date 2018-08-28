//------------------------------------------------
// D Flip Flop with synchronous reset.
//------------------------------------------------
//  Functionality:
//                Q Output data of flip flop.
//                QB inverted output of Q.
//                data data input.
//                clk clock input.
//                rst reset input.
//                If reset is enabled after the rising edge of the clock and remains high until next rising edge only then the D Flip Flop
//                will reset(Synchronous Reset).
//------------------------------------------------
//  Design Architecture = Behavioural Architecture
//------------------------------------------------
//  Module Name   : dFF;
//  Designer      : Raghav Rastogi;
//  Creation Date : 28, August, 2018;
//------------------------------------------------

module dFF (Q, QB, data, clk, rst);
  
    output Q, QB;
    input data, clk, rst;
    reg Q;
  
    assign QB = ~Q;
  
    always @(posedge clk)
    begin
        if(rst)
            Q <= 1'b0;
        else
            Q <= data;
    end
endmodule
