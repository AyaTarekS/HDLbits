module FA(input a,b,cin,
          output cout,sum);
    assign sum = a^b^cin;
    assign cout = (a&b)|(b&cin)|(a&cin);
endmodule
module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    wire [99:0] c;
    FA a0(.a(a[0]),
          .b(b[0]),
          .cin(cin),
          .cout(c[0]),
          .sum(sum[0]));
    genvar i;
    generate 
        for(i=1;i<100;i=i+1)begin:ripple
            FA a0(.a(a[i]),
                  .b(b[i]),
                  .cin(c[i-1]),
                  .cout(c[i]),
                  .sum(sum[i])); 
        end
    endgenerate
    assign cout = c[99];

endmodule
//or :) {cout,sum}=a+b+cin
