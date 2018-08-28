module dFF_tb;
  
    reg data, clk, rst;
    wire Q, QB;
  
    dFF DUT (   .Q(Q),
                .QB(QB),
                .data(data),
                .clk(clk),
                .rst(rst)   );
  
    initial begin
        clk = 0;
        rst = 1;
        forever begin
            #5 clk = ~clk;
	    end
    end
  
    initial begin
        #14
	    rst = 0;
	    #14
	    rst = 1;
	    #14
	    rst = 0;
    end
  
    initial begin
	    #12
	    data = 0;
	    #10
	    data = 1;
	    #30
	    data = 0;
    end
  
    initial begin
        $monitor($time, "CLK = %b , RST = %b , DATA = %b", clk, rst, data);
    end
  
endmodule
