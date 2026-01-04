`timescale 1ns / 1ps

module fir(input clk,input rst,input wire signed [15:0] x,output reg signed [31:0] y);
	
	parameter word_width = 16;
	parameter order = 55;

	reg signed [word_width-1:0] delay_pipeline[order:0];
	
	wire signed [word_width-1:0]  h[order:0];
	
	//FORMAT Q1.15
	assign h[0] = 0;
	assign h[1] = 0;
	assign h[2] = 0;
	assign h[3] = 0;
	assign h[4] = 0;
	assign h[5] = 0;
	assign h[6] = 2956; //+0.0902099609375
	assign h[7] = 0;
	assign h[8] = -12358; //-0.37713623046875
	assign h[9] = 0;
	assign h[10] = 24967; //+0.761932373046875
	assign h[11] = 0;
	assign h[12] = -32768; //-1.0
	assign h[13] = 0;
	assign h[14] = 30525; //+0.931549072265625
	assign h[15] = 0;
	assign h[16] = -19613; //-0.598541259765625
	assign h[17] = 0;
	assign h[18] = 5890;//+0.17974853515625
	assign h[19] = 0;
	assign h[20] = 4820; //+0.1470947265625
	assign h[21] = 0;
	assign h[22] = -9700; //-0.2960205078125
	assign h[23] = 0;
	assign h[24] = 9177; //+0.280059814453125
	assign h[25] = 0;
	assign h[26] = -5513;//-0.168243408203125
	assign h[27] = 0;
	assign h[28] = 1204; //+0.0367431640625
	assign h[29] = 0;
	assign h[30] = 2009; //+0.061309814453125
	assign h[31] = 0;
	assign h[32] = -3421; //-0.104400634765625
	assign h[33] = 0;
	assign h[34] = 3184; // +0.09716796875
	assign h[35] = 0;
	assign h[36] = -1947; //-0.059417724609375
	assign h[37] = 0;
	assign h[38] = 468; //+0.0142822265625
	assign h[39] = 0;
	assign h[40] = 665; //+0.020294189453125
	assign h[41] = 0;
	assign h[42] = -1183; //-0.036102294921875
	assign h[43] = 0;
	assign h[44] = 1114; //+0.03399658203125
	assign h[45] = 0;
	assign h[46] = -683; //-0.020843505859375
	assign h[47] = 0;
	assign h[48] = 163; //+0.004974365234375
	assign h[49] = 0;
	assign h[50] = 234; //+0.00714111328125
	assign h[51] = 0;
	assign h[52] = -414; //-0.01263427734375
	assign h[53] = 0;
	assign h[54] = 389; //+0.011871337890625
	assign h[55] = 0;

	reg signed [31:0]  product[order:0];

	reg signed [31:0]  sum_buf;	

	reg signed [15:0] data_in_buf;
	

	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			data_in_buf <= 0;
		end
		else begin
			data_in_buf <= x;
		end
	end

	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			delay_pipeline[0] <= 0 ;
			delay_pipeline[1] <= 0 ;
			delay_pipeline[2] <= 0 ;
			delay_pipeline[3] <= 0 ;
			delay_pipeline[4] <= 0 ;
			delay_pipeline[5] <= 0 ;
			delay_pipeline[6] <= 0 ;
			delay_pipeline[7] <= 0 ;
			delay_pipeline[8] <= 0 ;
			delay_pipeline[9] <= 0 ;
			delay_pipeline[10] <= 0 ;
			delay_pipeline[11] <= 0 ;
			delay_pipeline[12] <= 0 ;
			delay_pipeline[13] <= 0 ;
			delay_pipeline[14] <= 0 ;
			delay_pipeline[15] <= 0 ;
			delay_pipeline[16] <= 0 ;
			delay_pipeline[17] <= 0 ;
			delay_pipeline[18] <= 0 ;
			delay_pipeline[19] <= 0 ;
			delay_pipeline[20] <= 0 ;
			delay_pipeline[21] <= 0 ;
			delay_pipeline[22] <= 0 ;
			delay_pipeline[23] <= 0 ;
			delay_pipeline[24] <= 0 ;
			delay_pipeline[25] <= 0 ;
			delay_pipeline[26] <= 0 ;
			delay_pipeline[27] <= 0 ;
			delay_pipeline[28] <= 0 ;
			delay_pipeline[29] <= 0 ;
			delay_pipeline[30] <= 0 ;
			delay_pipeline[31] <= 0 ;
			delay_pipeline[32] <= 0 ;
			delay_pipeline[33] <= 0 ;
			delay_pipeline[34] <= 0 ;
			delay_pipeline[35] <= 0 ;
			delay_pipeline[36] <= 0 ;
			delay_pipeline[37] <= 0 ;
			delay_pipeline[38] <= 0 ;
			delay_pipeline[39] <= 0 ;
			delay_pipeline[40] <= 0 ;
			delay_pipeline[41] <= 0 ;
			delay_pipeline[42] <= 0 ;
			delay_pipeline[43] <= 0 ;
			delay_pipeline[44] <= 0 ;
			delay_pipeline[45] <= 0 ;
			delay_pipeline[46] <= 0 ;
			delay_pipeline[47] <= 0 ;
			delay_pipeline[48] <= 0 ;
			delay_pipeline[49] <= 0 ;
			delay_pipeline[50] <= 0 ;
			delay_pipeline[51] <= 0 ;
			delay_pipeline[52] <= 0 ;
			delay_pipeline[53] <= 0 ;
			delay_pipeline[54] <= 0 ;
			delay_pipeline[55] <= 0 ;
		end 
		else begin
			delay_pipeline[0] <= data_in_buf ;
			delay_pipeline[1] <= delay_pipeline[0] ;
			delay_pipeline[2] <= delay_pipeline[1] ;
			delay_pipeline[3] <= delay_pipeline[2] ;
			delay_pipeline[4] <= delay_pipeline[3] ;
			delay_pipeline[5] <= delay_pipeline[4] ;
			delay_pipeline[6] <= delay_pipeline[5] ;
			delay_pipeline[7] <= delay_pipeline[6] ;
			delay_pipeline[8] <= delay_pipeline[7] ;
			delay_pipeline[9] <= delay_pipeline[8] ;
			delay_pipeline[10] <= delay_pipeline[9] ;
			delay_pipeline[11] <= delay_pipeline[10] ;
			delay_pipeline[12] <= delay_pipeline[11] ;
			delay_pipeline[13] <= delay_pipeline[12] ;
			delay_pipeline[14] <= delay_pipeline[13] ;
			delay_pipeline[15] <= delay_pipeline[14] ;
			delay_pipeline[16] <= delay_pipeline[15] ;
			delay_pipeline[17] <= delay_pipeline[16] ;
			delay_pipeline[18] <= delay_pipeline[17] ;
			delay_pipeline[19] <= delay_pipeline[18] ;
			delay_pipeline[20] <= delay_pipeline[19] ;
			delay_pipeline[21] <= delay_pipeline[20] ;
			delay_pipeline[22] <= delay_pipeline[21] ;
			delay_pipeline[23] <= delay_pipeline[22] ;
			delay_pipeline[24] <= delay_pipeline[23] ;
			delay_pipeline[25] <= delay_pipeline[24] ;
			delay_pipeline[26] <= delay_pipeline[25] ;
			delay_pipeline[27] <= delay_pipeline[26] ;
			delay_pipeline[28] <= delay_pipeline[27] ;
			delay_pipeline[29] <= delay_pipeline[28] ;
			delay_pipeline[30] <= delay_pipeline[29] ;
			delay_pipeline[31] <= delay_pipeline[30] ;
			delay_pipeline[32] <= delay_pipeline[31] ;
			delay_pipeline[33] <= delay_pipeline[32] ;
			delay_pipeline[34] <= delay_pipeline[33] ;
			delay_pipeline[35] <= delay_pipeline[34] ;
			delay_pipeline[36] <= delay_pipeline[35] ;
			delay_pipeline[37] <= delay_pipeline[36] ;
			delay_pipeline[38] <= delay_pipeline[37] ;
			delay_pipeline[39] <= delay_pipeline[38] ;
			delay_pipeline[40] <= delay_pipeline[39] ;
			delay_pipeline[41] <= delay_pipeline[40] ;
			delay_pipeline[42] <= delay_pipeline[41] ;
			delay_pipeline[43] <= delay_pipeline[42] ;
			delay_pipeline[44] <= delay_pipeline[43] ;
			delay_pipeline[45] <= delay_pipeline[44] ;
			delay_pipeline[46] <= delay_pipeline[45] ;
			delay_pipeline[47] <= delay_pipeline[46] ;
			delay_pipeline[48] <= delay_pipeline[47] ;
			delay_pipeline[49] <= delay_pipeline[48] ;
			delay_pipeline[50] <= delay_pipeline[49] ;
			delay_pipeline[51] <= delay_pipeline[50] ;
			delay_pipeline[52] <= delay_pipeline[51] ;
			delay_pipeline[53] <= delay_pipeline[52] ;
			delay_pipeline[54] <= delay_pipeline[53] ;
			delay_pipeline[55] <= delay_pipeline[54] ;
		end
	end
	
always @(posedge clk or negedge rst) begin
		if (!rst) begin
			product[0] <= 0;
			product[1] <= 0;
			product[2] <= 0;
			product[3] <= 0;
			product[4] <= 0;
			product[5] <= 0;
			product[6] <= 0;
			product[7] <= 0;
			product[8] <= 0;
			product[9] <= 0;
			product[10] <= 0;
			product[11] <= 0;
			product[12] <= 0;
			product[13] <= 0;
			product[14] <= 0;
			product[15] <= 0;
			product[16] <= 0;
			product[17] <= 0;
			product[18] <= 0;
			product[19] <= 0;
			product[20] <= 0;
			product[21] <= 0;
			product[22] <= 0;
			product[23] <= 0;
			product[24] <= 0;
			product[25] <= 0;
			product[26] <= 0;
			product[27] <= 0;
			product[28] <= 0;
			product[29] <= 0;
			product[30] <= 0;
			product[31] <= 0;
			product[32] <= 0;
			product[33] <= 0;
			product[34] <= 0;
			product[35] <= 0;
			product[36] <= 0;
			product[37] <= 0;
			product[38] <= 0;
			product[39] <= 0;
			product[40] <= 0;
			product[41] <= 0;
			product[42] <= 0;
			product[43] <= 0;
			product[44] <= 0;
			product[45] <= 0;
			product[46] <= 0;
			product[47] <= 0;
			product[48] <= 0;
			product[49] <= 0;
			product[50] <= 0;
			product[51] <= 0;
			product[52] <= 0;
			product[53] <= 0;
			product[54] <= 0;
			product[55] <= 0;
		end
		else begin
			product[0] <= h[0] * delay_pipeline[0];
			product[1] <= h[1] * delay_pipeline[1];
			product[2] <= h[2] * delay_pipeline[2];
			product[3] <= h[3] * delay_pipeline[3];
			product[4] <= h[4] * delay_pipeline[4];
			product[5] <= h[5] * delay_pipeline[5];
			product[6] <= h[6] * delay_pipeline[6];
			product[7] <= h[7] * delay_pipeline[7];
			product[8] <= h[8] * delay_pipeline[8];
			product[9] <= h[9] * delay_pipeline[9];
			product[10] <= h[10] * delay_pipeline[10];
			product[11] <= h[11] * delay_pipeline[11];
			product[12] <= h[12] * delay_pipeline[12];
			product[13] <= h[13] * delay_pipeline[13];
			product[14] <= h[14] * delay_pipeline[14];
			product[15] <= h[15] * delay_pipeline[15];
			product[16] <= h[16] * delay_pipeline[16];
			product[17] <= h[17] * delay_pipeline[17];
			product[18] <= h[18] * delay_pipeline[18];
			product[19] <= h[19] * delay_pipeline[19];
			product[20] <= h[20] * delay_pipeline[20];
			product[21] <= h[21] * delay_pipeline[21];
			product[22] <= h[22] * delay_pipeline[22];
			product[23] <= h[23] * delay_pipeline[23];
			product[24] <= h[24] * delay_pipeline[24];
			product[25] <= h[25] * delay_pipeline[25];
			product[26] <= h[26] * delay_pipeline[26];
			product[27] <= h[27] * delay_pipeline[27];
			product[28] <= h[28] * delay_pipeline[28];
			product[29] <= h[29] * delay_pipeline[29];
			product[30] <= h[30] * delay_pipeline[30];
			product[31] <= h[31] * delay_pipeline[31];
			product[32] <= h[32] * delay_pipeline[32];
			product[33] <= h[33] * delay_pipeline[33];
			product[34] <= h[34] * delay_pipeline[34];
			product[35] <= h[35] * delay_pipeline[35];
			product[36] <= h[36] * delay_pipeline[36];
			product[37] <= h[37] * delay_pipeline[37];
			product[38] <= h[38] * delay_pipeline[38];
			product[39] <= h[39] * delay_pipeline[39];
			product[40] <= h[40] * delay_pipeline[40];
			product[41] <= h[41] * delay_pipeline[41];
			product[42] <= h[42] * delay_pipeline[42];
			product[43] <= h[43] * delay_pipeline[43];
			product[44] <= h[44] * delay_pipeline[44];
			product[45] <= h[45] * delay_pipeline[45];
			product[46] <= h[46] * delay_pipeline[46];
			product[47] <= h[47] * delay_pipeline[47];
			product[48] <= h[48] * delay_pipeline[48];
			product[49] <= h[49] * delay_pipeline[49];
			product[50] <= h[50] * delay_pipeline[50];
			product[51] <= h[51] * delay_pipeline[51];
			product[52] <= h[52] * delay_pipeline[52];
			product[53] <= h[53] * delay_pipeline[53];
			product[54] <= h[54] * delay_pipeline[54];
			product[55] <= h[55] * delay_pipeline[55];
		end
	end

	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			sum_buf <= 0;
		end
		else begin
			sum_buf <= product[0] + product[1]+ product[2]+ product[3]+ product[4]
			+ product[5]+ product[6]+ product[7]+ product[8]+ product[9]+ product[10]
			+ product[11]+ product[12]+ product[13]+ product[14]+ product[15]+ product[16]
			+ product[17]+ product[18]+ product[19]+ product[20]+ product[21]+ product[22]
			+ product[23]+ product[24]+ product[25]+ product[26]+ product[27]+ product[28]
			+ product[29]+ product[30]+ product[31]+ product[32]+ product[33]+ product[34]
			+ product[35]+ product[36]+ product[37]+ product[38]+ product[39]+ product[40]
			+ product[41]+ product[42]+ product[43]+ product[44]+ product[45]+ product[46]
			+ product[47]+ product[48]+ product[49]+ product[50] + product[51] + product[52]
			+ product[53] + product[54]+product[55];
		end
	end

	always @(sum_buf) begin
		if (!rst) begin
			y = 0;
		end
		else begin
			y = sum_buf;
		end
	end

endmodule