module Datapath(

    clk,rst,
    
    ins_Addr,
    ins,
    
    memAddr,memWriteData,memReadData,MemWrite,MemRead,
    
    rReadSelect1,rReadSelect2,rWriteSelect,rWriteData,rWriteEnable,rReadData1,rReadData2
    );
    //ports for Fetch
    input clk,rst;
    reg [31:0] PC = 32'd0;
    reg [31:0] imm = 32'd1;
    reg [6:0] opcode;
    always @(alu_src)
    begin
        opcode = ins_Addr [6:0];
        if (alu_src) begin
            if(opcode == 7'b0010011) begin //addi
                imm <= ins_Addr [31:20];
                imm [19:0] <= 20'd0;
            end
            if(opcode == 7'b0100011) begin//sw
                imm [11:5] <= ins_Addr [31:25];
                imm [4:0] <= ins_Addr [11:7];
                imm [31:12] <= 20'd0;
            end
            if(opcode == 7'b0000011) begin//lw
                imm [11:0] <= ins_Addr [31:20];
                imm [31:12] <= 20'd0;
            end
            if (opcode == 7'b1101111) begin//jal
                imm [20] <= ins_Addr [31];
                imm [19:12] <= ins_Addr [19:12];
                imm [11] <= ins_Addr [20];
                imm [10:1] <= ins_Addr [30:21];
                imm [31:21] <= 11'd0;
                imm [0] <= 1'd0;
            end
            if (opcode == 7'b1100011) begin //bne
                imm [12] <= ins_Addr [31];
                imm [10:5] <= ins_Addr [30:25];
                imm [4:1] <= ins_Addr [11:8];               
                imm [11] <= ins_Addr [7];
                imm [31:13] <= 19'd0;
                imm [0] <= 1'd0;
            end
            if (opcode == 7'b0110111) begin//lui
                imm [31:12] <= ins_Addr [31:12];
                imm [11:0] <= 12'd0;
            end
        else
            imm <= 32'd1;        
        end
    end
    Fetch fetch(clk, rst, PC, imm, ins);
    
    //ports for control
    wire [3:0] alu_op;
    wire alu_src, mem_to_reg, branch;
    Control control(rst, clk, ins_Addr, alu_op, 
    alu_src, mem_to_reg, rWriteEnable, MemRead, MemWrite, branch);
    
    //ports for IMEM
    input  [31:0] ins;//instruction
    output [31:0] ins_Addr;//Instructions Address
    IMem imem(ins, ins_Addr);
    
    //ports for ALU
    reg [31:0] B;
    wire Z; //useless
    always @(alu_src)
    begin
        if (alu_src)
            B = imm;
        else
            B = rReadData2;
    end
    ALU_64_bits alu(alu_op, rReadData1, B,  memReadData, Z);
    
    //ports for Data Memory
    input [31:0] memReadData;//Read data from memory
    output [31:0] memAddr;// Data memory Address 
    output [31:0] memWriteData;// Data wrote to data memory
    output  MemWrite; // control signal
    output  MemRead; // control signal
    Data_Memory data(memReadData, MemRead, MemWrite, ReadData);
    
    //ports for Register file
    input [31:0] rReadData1, rReadData2;
    output [4:0] rReadSelect1, rReadSelect2, rWriteSelect; // Control singal for Reginster file
    output [31:0] rWriteData; // Data wrote to Register file
    output rWriteEnable;// Control singal for Reginster file
    assign rReadSelect1 = ins_Addr [19:15];
    assign rReadSelect2 = ins_Addr [24:20];
    assign rWriteSelect = ins_Addr [11:7];
    Register_File register(rReadSelect1, rReadSelect2, rWriteSelect, rWriteData, rWriteEnable, rReadData1, rReadData2, clk, rst);
    //add additional module needed for implementation 
   
endmodule