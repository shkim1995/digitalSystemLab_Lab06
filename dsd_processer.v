`timescale 1ns / 1ps
module dsd_processor
 (r0,r1,r2,r3,r4,r5,r6,r7, IMEM_ADDRESS , DMEM_ADDRESS, DMEM_DATA_WRITE,
  DMEM_WRITE_ENABLE , CLK ,RESET , IMEM_DATA , DMEM_DATA_READ );
  
  output [15:0] r0,r1,r2,r3,r4,r5,r6,r7 ;
  output [15:0] IMEM_ADDRESS, DMEM_ADDRESS , DMEM_DATA_WRITE;
  output        DMEM_WRITE_ENABLE;
  input  [15:0] IMEM_DATA,DMEM_DATA_READ;
  input         CLK,RESET;
  

	/////////// write your code here ///////////
	//wires
	wire [15:0] instruction_out; // instruction on the 2nd pipeline

	wire [3:0] addrA, addrB;

	wire [15:0] data_in; // write data to reg file
	wire [15:0] src, dest; // src, dest register values

	wire [15:0] imm_8bit;
	wire [15:0] imm_16bit; 

	wire[4:0] flcnz;

	//control signals
	
	wire[4:0] tri_sel;
	wire register_we;
	wire [5:0] alu_sel;
	wire mux_sel0, shift_imm, mux_sel1, lui, jmp, br, imm_ex_sel;
	//////


	//mux1

	//mux2

	//mux3

	//tri state sel
	
	//connect other wires	

  ////////////////////////////////////////////
  
	register_file rf1(
		.addrA(addrA), 
		.addrB(addrB),
		.data_in(data_in), 
		.CLK(CLK), 
		.RST(RESET), 
		.WR(register_we), 
		.src(src), 
		.dest(dest),
		.r0(r0), .r1(r1), .r2(r2), .r3(r3), .r4(r4), .r5(r5), .r6(r6), .r7(r7));
  
	shifter shifter1( );

	decoder decoder1( .instruction(instruction_out)
		.flcnz(flcnz),
		
		.tri_sel(tri_sel),
		.register_we(register_we),
		
		.alu_sel(alu_sel),
		.mux_sel0(mux_sel0),
		
		.shift_imm(shift_imm),
		.mux_sel1(mux_sel1),
		.lui(lui),

		.jmp(jmp),
		.br(br),

		.memory_we(DMEM_WRITE_ENABLE),
	
		.imm_ex_sel(imm_ex_sel)
	);

/*
input clk,
	input rst_n,
	
	//control signal
	input jmp,
	input br,
	
	//datapath
    input [15:0] instruction_in,
    
    output reg [15:0] instruction_out,
    output [7:0] imm,disp,
    output [3:0] addr_a,addr_b
*/
	ir ir1( .rst_n(RESET),
		.jmp(jmp),
		.br(br),
		.instruction_in(IMEM_ADDRESS),
		.instruction_out(instruction_out),
		.imm(imm_8bit),
		.addr_a(addrA),
		.addr_b(addrB)
		);
          
	pc pc1( );
      
	ALU alu1( );

	PSR psr1( );
endmodule
