module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [3:0] carry;
    //need to instantiate it seperatly for the cin
    bcd_fadd a0(.a(a[3:0])
               ,.b(b[3:0]),
               .cin(cin),
               .cout(carry[0]),
               .sum(sum[3:0]));
    genvar i;
    generate 
        for(i=1;i<4;i=i+1)begin:ripple
               bcd_fadd a1(.a(a[4*i+3:4*i])
               ,.b(b[4*i+3:4*i]),
               .cin(carry[i-1]),
                .cout(carry[i]),
               .sum(sum[4*i+3:4*i])); 
        end
    endgenerate
    assign cout = carry[3];
endmodule
