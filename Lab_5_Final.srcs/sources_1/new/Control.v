`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2022 08:55:03 PM
// Design Name: 
// Module Name: Control
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


module Control(input rst, clk, input [31:0] current_mem, output reg[3:0] alu_op, output reg alu_src,mem_to_reg,reg_write,mem_read,mem_write,branch);

wire [6:0] opcode = current_mem [6:0];
wire [2:0] func3 = current_mem [14:12];
wire [6:0] func7 = current_mem [31:25];
always @(*)  
 begin  
      if (rst) begin    
                alu_op = 4'd0;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                branch = 1'b0;
      end
      if(opcode == 7'b0110011) begin  //add & sub & or & and
                if (func3 == 3'b000)
                    if (func7 == 7'd0)
                        alu_op = 4'b0010; //add
                    else
                        alu_op = 4'b0110; //sub
                if (func3 == 3'b110)
                    alu_op = 4'b0001; //or
                if (func3 == 3'b111)
                    alu_op = 4'b0000; //and
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                branch = 1'b0;
      end 
      if(opcode == 7'b0010011) begin //addi
                alu_op = 4'b0010; //add
                alu_src = 1'b1;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                branch = 1'b0;
      end
      if(opcode == 7'b0100011) begin//sw
                alu_op = 4'b0010;
                alu_src = 1'b1;
                mem_to_reg = 1'b1;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b1;
                branch = 1'b0;
       end 
       if(opcode == 7'b0000011) begin  //lw
                alu_op = 4'b0010;
                alu_src = 1'b1;
                mem_to_reg = 1'b1;
                reg_write = 1'b1;
                mem_read = 1'b1;
                mem_write = 1'b0;
                branch = 1'b0;
        end
        if (opcode == 7'b1101111) begin//jal
                alu_op = 4'b0010;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                branch = 1'b0;
        end
        if (opcode == 7'b1100011) begin//bne
                alu_op = 4'b0010;
                alu_src = 1'b0;
                mem_to_reg = 1'b1;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                branch = 1'b1;
        end
        if (opcode == 7'b0110111) begin//lui
                alu_op = 4'b0010;
                alu_src = 1'b1;
                mem_to_reg = 1'b0;
                reg_write = 1'b0;
                mem_read = 1'b1;
                mem_write = 1'b0;
                branch = 1'b0;
        end
end
endmodule
