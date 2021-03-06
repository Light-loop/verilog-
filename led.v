module LED(                              //此模块用来将计数器模块输出的4位信号转变为
        input [3:0] iDIG,                    //led灯的显示信号，低电平有效，顺序为gfedcba
	    output reg [6:0] oSEG 
	        
    );
	 
	
always @ (iDIG)
	 begin
	   case(iDIG)
		  4'b0000:oSEG=7'b100_0000;
		  4'b0001:oSEG=7'b111_1001;
		  4'b0010:oSEG=7'b010_0100;
		  4'b0011:oSEG=7'b011_0000;
		  4'b0100:oSEG=7'b001_1001;
		  4'b0101:oSEG=7'b001_0010;
		  4'b0110:oSEG=7'b000_0010;
		  4'b0111:oSEG=7'b111_1000;
		  4'b1000:oSEG=7'b000_0000;
		  4'b1001:oSEG=7'b001_0000;
		
	 endcase
	end
endmodule


