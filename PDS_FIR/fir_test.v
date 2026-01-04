`timescale 1ns / 1ps

module fir_test;

	// Inputs
	reg clk;
	reg rst;
	reg signed [15:0] x;
	
	// Outputs
	wire signed [31:0] y;
	
	parameter numberOfHalfWordInput = 256;

	// Instantiate the Unit Under Test (UUT)
	
	fir uut(.clk(clk), .rst(rst), .x(x), .y(y));

	initial begin
		rst = 0;
		#15;
		rst = 1;
	end

	initial begin
		clk = 0;
		forever #10 clk = ~clk;	
	end

	reg signed[15:0] memory[numberOfHalfWordInput-1:0];
	initial begin
		//$readmemb("impuls.mem" , memory);
		$readmemb("step.mem" , memory);
	end

	integer i = 0;
	initial begin
		#15;
		for(i = 0 ; i <= numberOfHalfWordInput-1 ; i = i+1) begin
			x = memory[i];
			#20;
		end	
	end

	integer file;
	integer counter = 0;
	initial begin
		//file = $fopen("impulsni_odziv.txt" , "w");
		file = $fopen("step_odziv.txt" , "w");
	end
	
	always @(posedge clk) begin
		$fdisplay(file, y);
	end
 
	always @(posedge clk) begin
		$display("y[%d]=%d ," , counter, y);
		counter = counter + 1;
		if (counter == numberOfHalfWordInput-1) begin
			#20 $fclose(file);
			rst = 0;
			#20 $stop;
		end
	end
endmodule