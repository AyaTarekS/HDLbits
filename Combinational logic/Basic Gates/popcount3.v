module top_module( 
    input [2:0] in,
    output [1:0] out );
    integer i;
    integer count;
    always@(in)begin
        count = 0;
        for(i=0;i<$bits(in);i=i+1)begin
            if(in[i]==1'b1)
            	count=count+1;
        end
        out = count;
    end
endmodule
