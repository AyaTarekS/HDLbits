module top_module( 
    input [254:0] in,
    output reg [7:0] out );

    integer i;
    reg [7:0] count;

    always @(in) begin
        count = 0; // Initialize count on every input change
        for(i = 0; i < 255; i = i + 1) begin
            if(in[i] == 1'b1) begin
                //combinational always block no need for <= 
                count = count + 1;
            end
        end
        out = count;
    end
endmodule
