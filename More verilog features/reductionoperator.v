module top_module (
    input [7:0] in,
    output parity); 
    assign parity = ^in ; //to add it as 9 th bit for the input
endmodule
