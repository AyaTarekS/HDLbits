module fadd(input a , b , cin ,
            output sum , cout);
    assign sum = a^b^cin;
    assign cout = (a&b) | (a&cin) | (b&cin);
endmodule
    
module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    genvar i;
    generate
        for(i=0;i<3;i=i+1)begin:full_adder
            if(i==0)
                fadd s(.a(a[i]),.b(b[i]),.cin(cin),.cout(cout[i]),.sum(sum[i]));
            else
            	fadd s(.a(a[i]),.b(b[i]),.cin(cout[i-1]),.cout(cout[i]),.sum(sum[i]));
        end
    endgenerate

endmodule
