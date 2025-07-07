module bcd_fadd (
    input  [3:0] a,
    input  [3:0] b,
    input        cin,
    output       cout,
    output [3:0] sum
);

    wire [4:0] bin_sum;
    wire [4:0] modified_sum;
    wire need_correction;

    assign bin_sum = a + b + cin;
    assign need_correction = (bin_sum > 9);
    assign modified_sum = bin_sum + 5'd6;

    assign sum = need_correction ? modified_sum[3:0] : bin_sum[3:0];
    assign cout = need_correction ? 1'b1 : 1'b0;

endmodule

    //the range of the sum should be 0-9
    //if there any 10-15 we need to add => 6 to have a carry and make the sum in the acceptable range
    //BCD Binary Coded Decimal
module top_module( 
    input  [399:0] a, b,
    input          cin,
    output         cout,
    output [399:0] sum 
);

    wire [99:0] carry;
    genvar i;

    generate
        for (i = 0; i < 100; i = i + 1) begin : BCD
            if (i == 0) begin
                bcd_fadd u_bcd_fadd_0 (
                    .a   (a[3:0]),
                    .b   (b[3:0]),
                    .cin (cin),
                    .cout(carry[0]),
                    .sum (sum[3:0])
                );
            end else begin
                bcd_fadd u_bcd_fadd_i (
                    .a   (a[4*i+3:4*i]),
                    .b   (b[4*i+3:4*i]),
                    .cin (carry[i-1]),
                    .cout(carry[i]),
                    .sum (sum[4*i+3:4*i])
                );
            end
        end
    endgenerate

    assign cout = carry[99];

endmodule
