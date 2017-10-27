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
	
	


	//////


	//mux1

	//mux2

	//mux3

	//tri state sel
	
	//connect other wires	

  ////////////////////////////////////////////
  
	register_file rf1( );
  
	shifter shifter1( );

	decoder decoder1( );

	ir ir1( );
          
	pc pc1( );
      
	ALU alu1( );

	PSR psr1( );
endmodule
