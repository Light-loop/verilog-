module div1KHZ(clk,rst,clk_1k);
     input clk;
     input rst;
     output reg clk_1k;
     
     reg [23:0] cnt;                //change this part to alter module's assginment
   
always@(posedge clk or negedge rst ) 
               if(!rst)
                 begin
                 	   cnt<=0;
                 	   clk_1k<=0;
                 end
               else  if(cnt<23'd49999)      //100m/1000/2-1    and this part
                     cnt<=cnt+1;  
               else
                    begin
                    	  cnt<=0;
                    	  clk_1k=~clk_1k;
                    end
                 
endmodule