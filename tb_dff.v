`timescale 1ns/1ps
module tb_dff;

    reg clk, d, reset;
    wire q;

    // DUT instance
    dff uut (.clk(clk), .d(d), .reset(reset), .q(q));

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd"); 
        $dumpvars(0, tb_dff);
        
        // Monitor values
        $monitor("Time=%0t | reset=%b | clk=%b | d=%b | q=%b", $time, reset, clk, d, q);
        
        // Initial values
        clk = 0; d = 0; reset = 1; #12;  // Reset active
        reset = 0; d = 1; #10;           // d=1 at posedge
        d = 0; #10;                      // d=0 at posedge  
        d = 1; #5;  d = 0; #5;           // d changes between clock
        reset = 1; #10;                  // Async reset test
        reset = 0; #20;
        
        $finish;
    end

endmodule
