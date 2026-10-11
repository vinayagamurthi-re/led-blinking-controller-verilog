module led_blinker #(parameter THRESHOLD = 49999999)(
    input clk,
    input reset,
    output reg led
);
 reg [25:0]counter;


always @(posedge clk)
begin
if(reset) 
  begin
   led<=0;
   counter<=0;
   end
else
 begin
    if (counter == THRESHOLD)begin
        led <= ~led;
        counter<=0; 
     end
else 
    begin
     counter<=counter+1; 
    end
  end 
 end
endmodule