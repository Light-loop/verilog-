module div1HZ(clk,rst,clk_1);
     input clk;
     input rst;
     output reg clk_1;
     
     reg [25:0]cnt;                //change this part to alter module's assginment
   
always@(posedge clk or negedge rst ) 
               if(!rst)
                 begin
                 	   cnt<=0;
                 	   clk_1<=0;
                 end
               else  if(cnt<26'd49_999_999)      //100m/1/2-1    and this part
                     cnt<=cnt+1;  
               else
                    begin
                    	  cnt<=0;
                    	  clk_1=~clk_1;
                    end
                 
endmodule