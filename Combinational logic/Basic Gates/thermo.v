module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    assign heater = (too_cold==1'b1&&mode==1'b1)?1:0;
    assign aircon = (too_hot==1'b1&&mode==1'b0)?1:0;
    assign fan= (heater|aircon|fan_on);
endmodule
