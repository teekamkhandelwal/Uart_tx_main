`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:00:25 05/18/2021
// Design Name:   urt_tx
// Module Name:   C:/Users/TEEKAM/Documents/ise/example/tfg.v
// Project Name:  example
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: urt_tx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tfg;

	// Inputs
	reg clk;
	reg rst;
	reg trig;
	reg [7:0] data_to_send;

	// Outputs
	wire tx;

	// Instantiate the Unit Under Test (UUT)
	urt_tx uut (
		.clk(clk), 
		.rst(rst), 
		.trig(trig), 
		.data_to_send(data_to_send), 
		.tx(tx)
	);

		// Initialize Inputs
		initial begin 
        clk=1;
        forever #0.001 clk=~clk;
      end
      initial begin
data_to_send<=8'h34;
        rst=1;
        trig=0; 
		  #0.003;
        data_to_send=8'hab;
        rst=0;
        trig=1;
		  #100;
		   data_to_send=8'haa;
       
      end
		// Wait 100 ns for global reset to finish
	
      

      
endmodule

