module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
 	assign s = a + b ;
    //overflow is happen due (adding two negative and get positive , adding two positive number and get negative)
    assign overflow = (a[7] & b[7] & ~s[7])|(~a[7] & ~b[7] & s[7]);


endmodule
