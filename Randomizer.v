module shiftRightRegister   // LSB -------> MSB 
(
 input clk,
 input reset,
 output reg LSB, //load input from the left
 output reg  MSB14,// opposite to bit number 14 , one based counting
 output  reg MSB15,// opposite to bit number 15 , one based counting
 output wire[1:15] check,
 input enable,
 input load,
 input wire [1:15] seed
);

// the D is assigned to its opposite Q
reg [1:15] Q;//   1  2  ->  14  15  
reg [1:15]D;// 1/ 2/ ->  14/ 15/ 
 
always @ (posedge clk,posedge reset)
begin
	if(reset)
	Q<=15'b000000000000000;

	else if (load)
	Q<=seed;

	else if (enable)
	begin
		MSB14=Q[14];
 		MSB15=Q[15];
		LSB=MSB14^MSB15;
		D={LSB,Q[1:14]};//D1=LSB,D13=Q12,D14=Q13,D15=Q14;  
		Q<=D;//Q[i]=D[i]  D[i]->Q[i]
	end
end
assign check=Q;
 
/*
LSB->D[1]
	Q[1]->D[2]
		**
			Q[14]->D[15]
*/

/*
	1 2 3 .... 13 14 15  )-> from the documentation
		       |  |
		     MSB14 MSB15
*/
endmodule 
module Randomizer 
(
 input clk,
 input reset,
 input dataIn, //load
 output out,
 output wire[1:15] chekk,
 input enable,
 input load,
 input wire [1:15] seed
);
wire w1,w2,w3;
shiftRightRegister shift
(
  .clk(clk),
  .reset(reset),
  .LSB(w3), 
  .MSB14(w1),
  .MSB15(w2),
  .check(chekk),
  .enable(enable),
  .load(load),
  .seed(seed)
);
xor(w3,w1,w2);
xor(out,w3,dataIn);

endmodule
