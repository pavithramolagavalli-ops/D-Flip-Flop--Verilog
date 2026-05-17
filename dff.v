module dff (
    input clk,      // Clock
    input d,        // Data input  
    input reset,    // Async reset, active high
    output reg q    // Output
);

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 1'b0;  // Reset vaste Q = 0
    else
        q <= d;     // Clock edge appudu D -> Q
end

endmodule
