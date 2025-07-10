module FA(input a, b, cin,
          output sum, cout);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule

module top_module (
    input  [3:0] x,
    input  [3:0] y, 
    output [4:0] sum
);
    wire [3:0] cout;

    //cannot add if inside generate block
    FA fa0 (
        .a   (x[0]),
        .b   (y[0]),
        .cin (1'b0),
        .sum (sum[0]),
        .cout(cout[0])
    );

    // Generate remaining full adders (i = 1 to 3)
    genvar i;
    generate
        for (i = 1; i < 4; i = i + 1) begin : ripple
            FA fa (
                .a   (x[i]),
                .b   (y[i]),
                .cin (cout[i-1]),
                .sum (sum[i]),
                .cout(cout[i])
            );
        end
    endgenerate

    // Final carry-out
    assign sum[4] = cout[3];

endmodule
