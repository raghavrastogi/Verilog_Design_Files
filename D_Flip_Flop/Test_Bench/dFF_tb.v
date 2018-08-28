module dFF_tb;
  
  reg data, clk, rst;
  wire Q, QB;
  
  dFF DUT (.Q(Q),
           .QB(QB),
           .data(data),
           .clk(clk),
           .rst(rst));
  
  initial begin
    clk = 0;
    rst = 1;
    forever begin
      #10 clk = ~clk;
  end
  
  initial begin
    #20
    rst = 0;
    #30
    data = 1;
    #20
    rst = 1;
    #40
    rst = 0;
  end
  
  initial begin
    $monitor($time, "CLK = %b , RST = %b , DATA = %b", clk, rst, data);
  end
  
endmodule
