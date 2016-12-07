`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:25:51 12/07/2016
// Design Name:   fifo1
// Module Name:   D:/Project/verilog_templet/asy_fifo/snug_fifo1/tb_fifo1.v
// Project Name:  ise_sim
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fifo1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`define WCLK_D1 @(posedge wclk);
`define RCLK_D1 @(posedge rclk);
module tb_fifo1;

	// Inputs
	reg [7:0] wdata;
	reg winc;
	reg wclk;
	reg wrst_n;
	reg rinc;
	reg rclk;
	reg rrst_n;

	// Outputs
	wire [7:0] rdata;
	wire wfull;
	wire rempty;
        integer for_idx;

	// Instantiate the Unit Under Test (UUT)
	fifo1 uut (
		.rdata(rdata), 
		.wfull(wfull), 
		.rempty(rempty), 
		.wdata(wdata), 
		.winc(winc), 
		.wclk(wclk), 
		.wrst_n(wrst_n), 
		.rinc(rinc), 
		.rclk(rclk), 
		.rrst_n(rrst_n)
	);

	initial begin
		// Initialize Inputs
		wdata = 0;
		winc = 0;
		wclk = 0;
		wrst_n = 0;
		rinc = 0;
		rclk = 0;
		rrst_n = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		wrst_n = 1;
		rrst_n = 1;
		#100;
		// Add stimulus here
		
                //test write to full
                for(for_idx = 0; for_idx < 16; for_idx = for_idx + 1) begin
                  `WCLK_D1 winc = 1; wdata = for_idx;
                end
                `WCLK_D1 winc = 0; 

                // test read to empty
                for(for_idx = 0; for_idx < 16; for_idx = for_idx + 1) begin
                  `RCLK_D1 rinc = 1; 
                end
                `RCLK_D1 rinc = 0; 
               
                
	end

        initial begin
          wclk = 1'b0;
          forever #5 wclk = ~wclk;
        end
        
        initial begin
          rclk = 1'b0;
          forever #10 rclk = ~rclk;
        end

endmodule

