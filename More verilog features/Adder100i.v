module full_adder(input a , b , cin,
                  output sum , cout);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule


module top_module #(parameter N = 100)( 
    input [N-1:0] a, b,
    input cin,
    output [N-1:0] cout,
    output [N-1:0] sum );

    genvar i;
    generate
        for(i = 0; i < N; i = i + 1) begin: full_adders
            if(i == 0) begin
                full_adder f(
                    .a(a[i]),
                    .b(b[i]),
                    .cin(cin),
                    .sum(sum[i]),
                    .cout(cout[i])
                );
            end else begin
                full_adder f(
                    .a(a[i]),
                    .b(b[i]),
                    .cin(cout[i-1]),
                    .sum(sum[i]),
                    .cout(cout[i])
                );
            end
        end
    endgenerate

endmodule
