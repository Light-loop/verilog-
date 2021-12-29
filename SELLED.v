module LEDsel(cp,rst,leds);
     input cp;
     input rst;
     output reg[7:0]leds;
     
     reg [2:0]cnt;
     
     
always@(posedge cp or negedge rst)      //计数器模块
        begin
        	   if(!rst)
        	   cnt<=3'b000;
        	   else
        	   cnt<=(cnt+1)%8;
       
        end

     
always@(posedge cp or negedge rst)
   begin  
   	    if(!rst)
   	          leds<=8'b1111_1111;   
   	     else
   	       begin
   	          case(cnt)                          //which light is flash
   	     	          3'b000:leds<=8'b0111_1111;
   	     	          3'b001:leds<=8'b1011_1111;
   	     	          3'b010:leds<=8'b1101_1111;
   	     	          3'b011:leds<=8'b1110_1111;
   	     	          3'b100:leds<=8'b1111_0111;
   	     	          3'b101:leds<=8'b1111_1011;
   	     	          3'b110:leds<=8'b1111_1101;
   	     	          3'b111:leds<=8'b1111_1110;
   	     	          
   	          endcase   
   	     end    
   	            
   end    
   
endmodule   
     
     