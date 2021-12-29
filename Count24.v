module counter24(clk,rst,EN,HL,HH,Ad);
     input clk;
     input rst;
     input EN;
     input Ad;
     output reg [3:0] HH;
     output reg [3:0] HL;
     
     reg ad;
    
    
 always@(posedge clk or negedge rst)
      begin 
      	      if(Ad)
      	        ad<=1;
      	      else
      	        ad<=0;
      	      if(!rst){HH,HL}<=8'b0000_0000;           
      	      else if((!EN)&&(!ad)) {HH,HL}<={HH,HL};          //using en signal to cotrol state
      	      else 
      	            begin
      	            	      case(HH)
      	            	                 4'b0000:begin
      	            	                 	               if(HL<9) begin
      	            	                 	                   HH<=HH;
      	            	                 	                   HL<=HL+1;     	            	                 	                  
      	            	                 	               end else begin
      	            	                 	                   HH<=HH+1;
      	            	                 	                   HL<=4'b0000;
      	            	                 	               end   
      	            	                 	       end     	            	                      	            	        
      	            	                 
      	            	                 4'b0001:begin
      	            	                 	               if(HL<9) begin
      	            	                 	                   HH<=HH;
      	            	                 	                   HL<=HL+1;     	            	                 	                  
      	            	                 	               end else begin
      	            	                 	                   HH<=HH+1;
      	            	                 	                   HL<=4'b0000;
      	            	                 	               end   
      	            	                 	       end
     	            	                 
      	            	                 4'b0010:begin
      	            	                 	               if(HL<3) begin           //cannot come up number4
      	            	                 	                   HH<=HH;
      	            	                 	                   HL<=HL+1;     	            	                 	                  
      	            	                 	               end else begin
      	            	                 	                   HH<=4'b0000;              //veil 00:00 time
      	            	                 	                   HL<=4'b0000;
      	            	                 	               end   
      	            	                 	       end
      	            	                        	            	                     	            	                   	            	   
      	            	                      
      	            	     endcase  	     
      	            	         
      	          end
        end
    
endmodule
     
     
     
     
     
        
   