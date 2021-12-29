module Ringing(cp,rst,minte,secd,ring,hours);
      input cp;
      input [7:0] secd;
      input [7:0] minte;
	  input [7:0] hours;
      input rst;
      output reg ring;
      
          reg [5:0] cnt;
		  reg [1:0] s;

parameter s0 =2'b00,
          s1 =2'b10;
integer i=0;
  always@(hours)
      begin
		     case(hours[7:4])
			      4'b0000: 
				          begin
							     case(hours[3:0])
                                          4'b0000:cnt=48;
										  4'b0001:cnt=2;
										  4'b0010:cnt=4;
										  4'b0011:cnt=6;
										  4'b0100:cnt=8;
										  4'b0101:cnt=10;
										  4'b0110:cnt=12;
										  4'b0111:cnt=14;
										  4'b1000:cnt=16;
										  4'b1001:cnt=18;
								 endcase
						  end
				  4'b0001:begin
					             case(hours[3:0])
								          4'b0000:cnt=20;
										  4'b0001:cnt=22;
										  4'b0010:cnt=24;
										  4'b0011:cnt=26;
										  4'b0100:cnt=28;
										  4'b0101:cnt=30;
										  4'b0110:cnt=32;
										  4'b0111:cnt=34;
										  4'b1000:cnt=36;
										  4'b1001:cnt=38;

								 endcase
				          end
				  4'b0010:begin
					           case (hours[4:0])
							              4'b0000:cnt=40;
										  4'b0001:cnt=42;
										  4'b0010:cnt=44;
										  4'b0011:cnt=46;
							   endcase

				          end
			endcase
	end


 always@(posedge cp,negedge rst)
      begin
		    if(!rst)
			     begin
			    s=s0;
				ring=0;
				 end
      	else if ((((minte==8'b0101_1001)&&(secd==8'b0101_1001))||s!=s0)&&i<cnt)
      	         begin
						  
						      ring=~ring;
							  i=i+1;
							  s<=s1;
							   
				 end
	   else if(i==cnt)  
		          begin 
				  i<=0;
		          s<=s0;
		          ring=0;
		          end
          else ring =0;
       end
    
        
endmodule