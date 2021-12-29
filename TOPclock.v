module topCLK(CP,rst,EN,ledsel,led,Adj_min,Adj_hour,Adj_sec,ring) ;                       //name:
       input CP;                                                      //counter24(clk,rst,EN,HL,HH);
       input rst;
       input EN;       
       input Adj_min;
       input Adj_hour;
       input Adj_sec;                                         //div1KHZ(clk,rst,clk_1k)
       output wire[7:0] ledsel;                                //div1HZ(clk,rst,clk_1)
       output reg[6:0] led;                                    //LED(iDIG,oSEG)     gfedcba
       output wire ring;                                       //counter10(CP,rst,EN,TC,Q,Ad);
    //-------------------------//                             //counter6(CP,rst,EN,TC,Q);
                                                              //Ringing(cp,minte,secd,ring);
        wire [7:0]hour;
        wire [7:0]min;
        wire [7:0]sec;
        wire clk_1s;
        wire clk_1ks;
        wire MIL_EN,MIH_EN,SIH_EN,HOUR_EN;
        wire [6:0]LED6;
        wire [6:0]LED5;
        wire [6:0]LED4;
        wire [6:0]LED3;
        wire [6:0]LED2;
        wire [6:0]LED1;
   //-------------------------//
         
  
   //-------------------------//
   div1KHZ D0(CP,rst,clk_1ks);               //generate the basic clk signal
   div1HZ  D1(CP,rst,clk_1s) ;
  //-------------------------//
   counter10 S0(clk_1s,rst,EN,SIH_EN,sec[3:0],Adj_sec);
   counter6 S1(clk_1s,rst,SIH_EN,MIL_EN,sec[7:4]);

   counter10 MO(clk_1s,rst,MIL_EN,MIH_EN,min[3:0],Adj_min);      //this part is jishuqi 
   counter6 M1(clk_1s,rst,MIH_EN,HOUR_EN,min[7:4]);
 
   counter24 HR(CP,rst,HOUR_EN,hour[3:0],hour[7:4],Adj_hour);
  //-------------------------//
   
    LED U1(hour[7:4],LED1);      //HOUR
    LED U2(hour[3:0],LED2);
    
    LED U3(min[7:4],LED3);       //MIN
    LED U4(min[3:0],LED4);
    
    LED U5(sec[7:4],LED5);       //SEC
    LED U6(sec[3:0],LED6);
    
  //---------------------------//  the ledsel module
  LEDsel sel(clk_1ks,rst,ledsel);      //cp is 1hz
  
  //--------------------------//   鏁寸偣鎶ユ暟妯�?�潡
  
   Ringing wake(clk_1s,rst,min,sec,ring,hour);
  
  //--------------------------//   
//鍔�??锟芥樉绀烘ā锟�??
  
      
  
  
always@(ledsel)                                    //ledsel 鍦ㄥ紑鍙戞澘鎺ュ彛涓婁粠宸﹀埌鍙虫帴灏卞畬浜嬩簡gfedcba
     begin
     	      case(ledsel)
     	      	      8'b0111_1111:led<=LED1;
     	      	      8'b1011_1111:led<=LED2;
     	      	      
     	      	      8'b1101_1111:led<=7'b011_1111;     //鏄剧ず妯嚎鏉ュ綋璁℃椂鍣ㄧ殑鍒嗛殧锟�?
     	      	      
     	      	      8'b1110_1111:led<=LED3;
     	      	      8'b1111_0111:led<=LED4;
     	      	      
     	      	      8'b1111_1011:led<=7'b011_1111;
     	      	      
     	      	      8'b1111_1101:led<=LED5;
     	      	      8'b1111_1110:led<=LED6;
     	      endcase
     end

  
endmodule





