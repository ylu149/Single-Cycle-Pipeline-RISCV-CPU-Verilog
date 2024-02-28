`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2022 10:16:11 PM
// Design Name: 
// Module Name: IMem_tst
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module IMem_tst();
reg [31:0] Address;
wire [31:0] ReadData1;
IMem uut(Address, ReadData1);
initial begin
    #10;
    Address = 32'd2;
    #10;
end
endmodule
