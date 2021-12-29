module counter6(CP,rst,EN,TC,Q);
        input CP;
        input rst;
        input EN;
        output  TC;
        output reg [3:0] Q;
  
always@(posedge CP or negedge rst)
      begin
         if(!rst) 
              begin
              Q<=4'b0000;               //initial signal
              end
         else if(~EN)  Q<=Q;      //stop count;
         else if(Q==4'b0101) 
               begin
               	  Q<=4'b0000;
               end   
         else begin 
         	       Q<=Q+1;
         	  end
   
      end
      
      //由于下一个进位信号还没来所以会一直保持输出4的信号
   assign TC=((Q==4'b0101)&&(EN==1));
          
endmodule 