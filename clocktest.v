 `timescale   1ns/10ps;
module clock_tb;
    
      reg  rr,ee,mm,hh,ss,cc;
      wire [7:0]ledsel;
      wire rig;
      wire [6:0]ll;
   
      topCLK  topCLK(
                   .CP(cc),     //CC
                   .rst(rr),    //i
                   .EN(ee),     //i
                   .ledsel(ledsel),  //o
                   .led(ll),   //o
                   .Adj_min(mm),   //i
                   .Adj_hour(hh),    //i
                   .Adj_sec(ss),    //i
                   .ring(rig));    //o
   
initial
   begin
   	   rr<=0;hh<=0;ss<=0;mm<=0;
   	   cc<=0;
   	   ee<=1;
   	   #30 rr<=1;
   	   #6000 $stop;
   end
  always #5 cc<=~cc;
  
   
endmodule