`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:44:49 03/27/2017 
// Design Name: 
// Module Name:    data_mem 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module data_memory(clock_in, address, writeData, memWrite, memRead, readData);
    input clock_in;
    input [31:0] address;
    input [31:0] writeData;
    input memWrite;
    input memRead;
    output [31:0] readData;
	 reg [31:0] readData;
	 reg [31:0] memFile[0:127];
    
	 initial begin
	     $readmemh("./mem_data.txt", memFile);
		  readData=0;
	 end
	 
	 always @ (address)
	 begin
	     if (memRead)
	         readData = memFile[address];
	 end
	 
	 always @ (negedge clock_in)
	 begin
	     if (memWrite ==1)
	         memFile[address] = writeData;
	 end
endmodule
