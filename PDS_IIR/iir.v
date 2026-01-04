`timescale 1ns / 1ps


module iir(input clk, input rst, input wire signed [15:0] x,output reg signed [31:0] y);

	parameter sizeOfMemoryBuffer = 256;
	reg signed [15:0] x_buffer [sizeOfMemoryBuffer-1:0];
	reg signed [31:0] y_buffer [sizeOfMemoryBuffer-1:0];
	reg signed [31:0] y_temp;
	integer i;
	reg[7:0] index=6;
	reg trigger=0;

	always @(posedge clk or negedge rst) 
	begin
		if (!rst) 
			x_buffer[index] = 0;

		else
			x_buffer[index] = x;
	end


	always @(posedge clk or negedge rst) 
	begin
		if (!rst)
		begin	
			for(i = 0; i < sizeOfMemoryBuffer; i = i+1)
				begin
					x_buffer[i] = 0;
					y_buffer[i] = 0;
				end
		end
		// Jednadzba diferencija: y[n] = -2.9306*y[n-2]-4.0562*y[n-4]-3.2915*y[n-6]-1.6636*y[n-8]-0.4931*y[n-10]-0.0645*y[n-12]+x[n-6]-1.25*x[n-8]+0.25*x[n-10]
		// Format kodiranja u hex: Q4.12
		else begin
			if (index == 0 || index==1)
				begin
					y_buffer[index] = 0;
					y_temp = y_buffer[index];					
					trigger=~trigger;
				end
			else if (index == 2 || index == 3)
				begin
					y_buffer[index] = -16'h2EE3 * y_buffer[index-2];
					y_temp = y_buffer[index];					
					trigger=~trigger;
				end
			else	if (index == 4 || index == 5)	
				begin
					y_buffer[index] = -16'h2EE3 * y_buffer[index-2] -16'h40E6 * y_buffer[index-4];
					y_temp = y_buffer[index];			
					trigger=~trigger;
				end
			else	if (index == 6 || index == 7)	
				begin
					y_buffer[index] = -16'h2EE3 * y_buffer[index-2] -16'h40E6 * y_buffer[index-4] -16'h34A9 * y_buffer[index-6] + 16'h1000 * x_buffer[index-6];
					y_temp = y_buffer[index];					
					trigger=~trigger;
				end
			else	if (index == 8 || index == 9) begin
				y_buffer[index] = -16'h2EE3 * y_buffer[index-2] -16'h40E6 * y_buffer[index-4] -16'h34A9 * y_buffer[index-6] -16'h1A9E * y_buffer[index-8] + 16'h1000 * x_buffer[index-6] -16'h0140* x_buffer[index-8];
				y_temp = y_buffer[index];			
				trigger=~trigger;
			end 

			else	if (index == 10 || index == 11) begin
				y_buffer[index] = -16'h2EE3 * y_buffer[index-2] -16'h40E6 * y_buffer[index-4] -16'h34A9 * y_buffer[index-6] -16'h1A9E * y_buffer[index-8] -16'h07E3 * y_buffer[index - 10] + 16'h1000 * x_buffer[index-6] -16'h0140* x_buffer[index-8] +  16'h0400 * x_buffer[index-10];
				y_temp = y_buffer[index];			
				trigger=~trigger;
			end
		
			else	if (index > 11) begin
				y_buffer[index] = -16'h2EE3 * y_buffer[index-2] -16'h40E6 * y_buffer[index-4] -16'h34A9 * y_buffer[index-6] -16'h1A9E * y_buffer[index-8] -16'h07E3 * y_buffer[index - 10]  - 16'h0108* y_buffer[index - 12] + 16'h1000 * x_buffer[index-6] - 16'h0140* x_buffer[index-8] +  16'h0400 * x_buffer[index-10];
				y_temp = y_buffer[index];			
				trigger=~trigger;
			end
			
		end
	end

	always @(trigger)
	begin
		if (!rst)
			y = 0;
	
		else begin
		
			index = index+1;
			y = y_temp;
			
		end
	end
endmodule