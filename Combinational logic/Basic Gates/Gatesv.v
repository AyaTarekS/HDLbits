module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
    integer i;
    always@(*)begin
        for(i=0;i<$bits(in);i=i+1)begin
            if(i!=3)//to stay inside the boundray
            	out_both[i]=((in[i]&in[i+1])&(in[i]==1'b1));
            if(i!=0)
                out_any[i]=((in[i]|in[i-1])&(in[i]==1'b1|in[i-1]==1'b1));
            if(i!=3)
            	out_different[i]=((in[i]!=in[i+1]));
            else
                out_different[i]=(in[0]!=in[3]);
        end
    end
endmodule
