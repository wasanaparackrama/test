// Computer Architecture (CO224) - Lab 05
// Design: Testbench of Integrated CPU of Simple Processor
// Author: E/16/267

`include "CPU.v"

module cpu_tb;

    reg CLK, RESET;
    wire [31:0] PC;
    wire [31:0] INSTRUCTION;
    
	//Initialize an array of registers (8x1024) to be used as instruction memory
    reg [7:0] instr_mem[1023:0];
	
	//TODO: Create combinational logic to fetch an instruction from instruction memory, given the Program Counter(PC) value 
	assign #2 INSTRUCTION={instr_mem[PC+3], instr_mem[PC+2], instr_mem[PC+1], instr_mem[PC+0]};
    
    initial
    begin
        //Initialize instruction memory with a set of instructions
        
		
		
		    {instr_mem[10'd3], instr_mem[10'd2], instr_mem[10'd1], instr_mem[10'd0]}     = 32'b00001000000001000000000000001111;	// loadi 4 X 15
			{instr_mem[10'd7], instr_mem[10'd6], instr_mem[10'd5], instr_mem[10'd4]}     = 32'b00001000000001100000000000001010;	// loadi 6 X 10
			{instr_mem[10'd11], instr_mem[10'd10], instr_mem[10'd9], instr_mem[10'd8]}   = 32'b00001000000000110000000000001011;	// loadi 3 X 11
			{instr_mem[10'd15], instr_mem[10'd14], instr_mem[10'd13], instr_mem[10'd12]} = 32'b00000001000001010000011000000011;	// add   5 6 3
			{instr_mem[10'd19], instr_mem[10'd18], instr_mem[10'd17], instr_mem[10'd16]} = 32'b00000010000000010000010000000101;	// and   1 4 5
			{instr_mem[10'd23], instr_mem[10'd22], instr_mem[10'd21], instr_mem[10'd20]} = 32'b00000011000000100000000100000110;	// or    2 1 6
			{instr_mem[10'd27], instr_mem[10'd26], instr_mem[10'd25], instr_mem[10'd24]} = 32'b00000000000001110000000000000010;	// mov   7 x 2
			{instr_mem[10'd31], instr_mem[10'd30], instr_mem[10'd29], instr_mem[10'd28]} = 32'b00001001000001000000011100000011;	// sub   4 7 3
			
			/*
			{instr_mem[10'd3], instr_mem[10'd2], instr_mem[10'd1], instr_mem[10'd0]}      = 32'b00001000000001000000000011111111;// loadi 4 X 0xFF(255)
			{instr_mem[10'd7], instr_mem[10'd6], instr_mem[10'd5], instr_mem[10'd4]}      = 32'b00001000000001100000000010100000;// loadi 6 X 0xAA(160)
			{instr_mem[10'd11], instr_mem[10'd10], instr_mem[10'd9], instr_mem[10'd8]}    = 32'b00001000000000110000000010110100;// loadi 3 X 0xBB(180)
			{instr_mem[10'd15], instr_mem[10'd14], instr_mem[10'd13], instr_mem[10'd12]}  = 32'b00000001000001010000011000000011;// add   5 6 3
			{instr_mem[10'd19], instr_mem[10'd18], instr_mem[10'd17], instr_mem[10'd16]}  = 32'b00000010000000010000010000000101;// and   1 4 5
			{instr_mem[10'd23], instr_mem[10'd22], instr_mem[10'd21], instr_mem[10'd20]}  = 32'b00000011000000100000000100000110;// or    2 1 6
			{instr_mem[10'd27], instr_mem[10'd26], instr_mem[10'd25], instr_mem[10'd24]}  = 32'b00000000000001110000000000000010;// mov   7 x 2
			{instr_mem[10'd31], instr_mem[10'd30], instr_mem[10'd29], instr_mem[10'd28]}  = 32'b00001001000001000000011100000011;// sub   4 7 3*/
		
		
    end
    
    /* 
    -----
     CPU
    -----
    */
    cpu mycpu(PC, INSTRUCTION, CLK, RESET);

    initial
    begin
    
        // generate files needed to plot the waveform using GTKWave
        $dumpfile("cpu_wavedata.vcd");
		$dumpvars(0, cpu_tb);
        
        CLK = 1'b0;
        RESET = 1'b0;
        
        // TODO: Reset the CPU (by giving a pulse to RESET signal) to start the program execution
		#3
		RESET = 1'b1;
		 
		#5
		RESET = 1'b0;
        
        // finish simulation after some time
        #100
        $finish;
        
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;
        

endmodule