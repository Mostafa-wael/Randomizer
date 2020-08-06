`timescale 1 ns/ 10 ps

module Randomizer_TB();

//internal signals
reg clk;
reg reset;
reg dataIn;
reg [0:3]dataInHex;
wire out;
reg [0:3]outHex;
reg enable;
reg load;
reg [1:15] seed;

//clock period
localparam PERIOD =10;
//unit under test
Randomizer  RDM
(
	.clk(clk),
	.reset(reset),
	.dataIn(dataIn),
	.out(out),
        .enable(enable),
	.load(load),
	.seed(seed)
);
//clock
always
   #(PERIOD/2) clk=~clk;
initial begin


$display ("time\t reset\t enable\t load\t    Data in\t  Data Hex in\t Data out\t  Data Hex out\t vector ");
$monitor ("%g\t   %b\t   %b\t  %b\t      %b\t         %b\t 	    %b\t         %b\t      %b\t  ",
	   $time, reset,enable, load, dataIn, dataInHex, out, outHex, RDM.chekk);

clk=0;
reset=1'b1;
enable=1'b0;
load=1'b0;

#PERIOD reset=1'b0; load=1'b1; seed<=15'b011011100010101; 

#PERIOD		      load=1'b0;   enable=1'b1; 
		      dataIn=1'b1; dataInHex[0]=1'b1; 
#PERIOD outHex[0]=out;dataIn=1'b0; dataInHex[1]=1'b0; 
#PERIOD outHex[1]=out;dataIn=1'b1; dataInHex[2]=1'b1; 
#PERIOD outHex[2]=out;dataIn=1'b0; dataInHex[3]=1'b0; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b1; dataInHex[0]=1'b1; 
#PERIOD outHex[0]=out;dataIn=1'b1; dataInHex[1]=1'b1; 
#PERIOD outHex[1]=out;dataIn=1'b0; dataInHex[2]=1'b0; 
#PERIOD outHex[2]=out;dataIn=1'b0; dataInHex[3]=1'b0; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b1; dataInHex[0]=1'b1; 
#PERIOD outHex[0]=out;dataIn=1'b0; dataInHex[1]=1'b0; 
#PERIOD outHex[1]=out;dataIn=1'b1; dataInHex[2]=1'b1; 
#PERIOD outHex[2]=out;dataIn=1'b1; dataInHex[3]=1'b1; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b1; dataInHex[0]=1'b1; 
#PERIOD outHex[0]=out;dataIn=1'b1; dataInHex[1]=1'b1; 
#PERIOD outHex[1]=out;dataIn=1'b0; dataInHex[2]=1'b0; 
#PERIOD outHex[2]=out;dataIn=1'b0; dataInHex[3]=1'b0; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b1; dataInHex[0]=1'b1; 
#PERIOD outHex[0]=out;dataIn=1'b1; dataInHex[1]=1'b1; 
#PERIOD outHex[1]=out;dataIn=1'b0; dataInHex[2]=1'b0; 
#PERIOD outHex[2]=out;dataIn=1'b1; dataInHex[3]=1'b1; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b0; dataInHex[0]=1'b0; 
#PERIOD outHex[0]=out;dataIn=1'b0; dataInHex[1]=1'b0; 
#PERIOD outHex[1]=out;dataIn=1'b1; dataInHex[2]=1'b1; 
#PERIOD outHex[2]=out;dataIn=1'b0; dataInHex[3]=1'b0; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b0; dataInHex[0]=1'b0; 
#PERIOD outHex[0]=out;dataIn=1'b0; dataInHex[1]=1'b0; 
#PERIOD outHex[1]=out;dataIn=1'b0; dataInHex[2]=1'b0; 
#PERIOD outHex[2]=out;dataIn=1'b1; dataInHex[3]=1'b1; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b0; dataInHex[0]=1'b0; 
#PERIOD outHex[0]=out;dataIn=1'b0; dataInHex[1]=1'b0; 
#PERIOD outHex[1]=out;dataIn=1'b0; dataInHex[2]=1'b0; 
#PERIOD outHex[2]=out;dataIn=1'b1; dataInHex[3]=1'b1; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b0; dataInHex[0]=1'b0; 
#PERIOD outHex[0]=out;dataIn=1'b1; dataInHex[1]=1'b1; 
#PERIOD outHex[1]=out;dataIn=1'b0; dataInHex[2]=1'b0; 
#PERIOD outHex[2]=out;dataIn=1'b0; dataInHex[3]=1'b0; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b1; dataInHex[0]=1'b1; 
#PERIOD outHex[0]=out;dataIn=1'b1; dataInHex[1]=1'b1; 
#PERIOD outHex[1]=out;dataIn=1'b0; dataInHex[2]=1'b0; 
#PERIOD outHex[2]=out;dataIn=1'b1; dataInHex[3]=1'b1; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

		      dataIn=1'b1; dataInHex[0]=1'b1; 
#PERIOD outHex[0]=out;dataIn=1'b0; dataInHex[1]=1'b0; 
#PERIOD outHex[1]=out;dataIn=1'b1; dataInHex[2]=1'b1; 
#PERIOD outHex[2]=out;dataIn=1'b0; dataInHex[3]=1'b0; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

		      dataIn=1'b1; dataInHex[0]=1'b1; 
#PERIOD outHex[0]=out;dataIn=1'b1; dataInHex[1]=1'b1; 
#PERIOD outHex[1]=out;dataIn=1'b1; dataInHex[2]=1'b1; 
#PERIOD outHex[2]=out;dataIn=1'b0; dataInHex[3]=1'b0; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b0; dataInHex[0]=1'b0; 
#PERIOD outHex[0]=out;dataIn=1'b0; dataInHex[1]=1'b0; 
#PERIOD outHex[1]=out;dataIn=1'b0; dataInHex[2]=1'b0; 
#PERIOD outHex[2]=out;dataIn=1'b1; dataInHex[3]=1'b1; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b0; dataInHex[0]=1'b0; 
#PERIOD outHex[0]=out;dataIn=1'b1; dataInHex[1]=1'b1; 
#PERIOD outHex[1]=out;dataIn=1'b0; dataInHex[2]=1'b0; 
#PERIOD outHex[2]=out;dataIn=1'b1; dataInHex[3]=1'b1; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b0; dataInHex[0]=1'b0; 
#PERIOD outHex[0]=out;dataIn=1'b1; dataInHex[1]=1'b1; 
#PERIOD outHex[1]=out;dataIn=1'b1; dataInHex[2]=1'b1; 
#PERIOD outHex[2]=out;dataIn=1'b1; dataInHex[3]=1'b1; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b0; dataInHex[0]=1'b0; 
#PERIOD outHex[0]=out;dataIn=1'b1; dataInHex[1]=1'b1; 
#PERIOD outHex[1]=out;dataIn=1'b1; dataInHex[2]=1'b1; 
#PERIOD outHex[2]=out;dataIn=1'b1; dataInHex[3]=1'b1; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b1; dataInHex[0]=1'b1; 
#PERIOD outHex[0]=out;dataIn=1'b1; dataInHex[1]=1'b1; 
#PERIOD outHex[1]=out;dataIn=1'b0; dataInHex[2]=1'b0; 
#PERIOD outHex[2]=out;dataIn=1'b0; dataInHex[3]=1'b0; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b0; dataInHex[0]=1'b0; 
#PERIOD outHex[0]=out;dataIn=1'b1; dataInHex[1]=1'b1; 
#PERIOD outHex[1]=out;dataIn=1'b1; dataInHex[2]=1'b1; 
#PERIOD outHex[2]=out;dataIn=1'b0; dataInHex[3]=1'b0; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b1; dataInHex[0]=1'b1; 
#PERIOD outHex[0]=out;dataIn=1'b1; dataInHex[1]=1'b1; 
#PERIOD outHex[1]=out;dataIn=1'b0; dataInHex[2]=1'b0; 
#PERIOD outHex[2]=out;dataIn=1'b1; dataInHex[3]=1'b1; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b1; dataInHex[0]=1'b1; 
#PERIOD outHex[0]=out;dataIn=1'b0; dataInHex[1]=1'b0; 
#PERIOD outHex[1]=out;dataIn=1'b1; dataInHex[2]=1'b1; 
#PERIOD outHex[2]=out;dataIn=1'b1; dataInHex[3]=1'b1; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b1; dataInHex[0]=1'b1; 
#PERIOD outHex[0]=out;dataIn=1'b1; dataInHex[1]=1'b1; 
#PERIOD outHex[1]=out;dataIn=1'b1; dataInHex[2]=1'b1; 
#PERIOD outHex[2]=out;dataIn=1'b1; dataInHex[3]=1'b1; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b0; dataInHex[0]=1'b0; 
#PERIOD outHex[0]=out;dataIn=1'b1; dataInHex[1]=1'b1; 
#PERIOD outHex[1]=out;dataIn=1'b0; dataInHex[2]=1'b0; 
#PERIOD outHex[2]=out;dataIn=1'b0; dataInHex[3]=1'b0; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b1; dataInHex[0]=1'b1; 
#PERIOD outHex[0]=out;dataIn=1'b1; dataInHex[1]=1'b1; 
#PERIOD outHex[1]=out;dataIn=1'b0; dataInHex[2]=1'b0; 
#PERIOD outHex[2]=out;dataIn=1'b0; dataInHex[3]=1'b0; 
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);

                      dataIn=1'b1; dataInHex[0]=1'b1; 
#PERIOD outHex[0]=out;dataIn=1'b0; dataInHex[1]=1'b0; 
#PERIOD outHex[1]=out;dataIn=1'b0; dataInHex[2]=1'b0; 
#PERIOD outHex[2]=out;dataIn=1'b1; dataInHex[3]=1'b1;
#PERIOD outHex[3]=out;$display("dataInHex = %h, dataOutHex = %h ", dataInHex, outHex);


$finish;
end
endmodule
