module counter10(CP,rst,EN,TC,Q,Ad);
        input CP;
        input rst;
        input EN;
        input Ad;
        output  TC;
        output reg [3:0] Q;
        
        
                 //为高电平的时候不去保持状态而是自动继续进行计数来调
  always@(posedge CP or negedge rst)
      begin
         if(!rst) 
              begin
              Q<=4'b0000;                                             //initial signal
              end
         else if((~EN)&&(~Ad))  Q<=Q;               //stop count;    en and ad both low can count
         else if(Q==4'b1001) 
               begin
               	  Q<=4'b0000;                       //only ad is low can make tc=0
               end   
         else begin
         	     Q<=Q+1;
         	    end
       end
        
   assign TC=((Q==4'b1001)&&(EN==1)||(Q==4'b1001)&&(Ad==1));
   
endmodule




     