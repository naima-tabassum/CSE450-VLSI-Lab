`timescale 1ns / 1ps


module register_8bit_tb;

	// Inputs
	reg D0;
	reg D1;
	reg D2;
	reg D3;
	reg D4;
	reg D5;
	reg D6;
	reg D7;
	reg clk;

	// Outputs
	wire Q0;
	wire Q1;
	wire Q2;
	wire Q3;
	wire Q4;
	wire Q5;
	wire Q6;
	wire Q7;

	// Instantiate the Unit Under Test (UUT)
	register_8bit uut (
		.D0(D0), 
		.D1(D1), 
		.D2(D2), 
		.D3(D3), 
		.D4(D4), 
		.D5(D5), 
		.D6(D6), 
		.D7(D7), 
		.clk(clk), 
		.Q0(Q0), 
		.Q1(Q1), 
		.Q2(Q2), 
		.Q3(Q3), 
		.Q4(Q4), 
		.Q5(Q5), 
		.Q6(Q6), 
		.Q7(Q7)
	);

	initial begin
		// Initialize Inputs
		D0 = 0;
		D1 = 0;
		D2 = 0;
		D3 = 0;
		D4 = 0;
		D5 = 0;
		D6 = 0;
		D7 = 0;
		clk = 0;

		// Wait 100 ns before starting the test cases
		#100;
        
        // Test 1: Store 00000000
        #50;
        clk = 1;
        #50;
        clk = 0;


        // Test 2: Store 00000001
        D0 = 1;
        D1 = 0;
        D2 = 0;
        D3 = 0;
        D4 = 0;
        D5 = 0;
        D6 = 0;
        D7 = 0;

        #50;
        clk = 1;
        #50;
        clk = 0;


        // Test 3: Store 10101010
        D0 = 0;
        D1 = 1;
        D2 = 0;
        D3 = 1;
        D4 = 0;
        D5 = 1;
        D6 = 0;
        D7 = 1;

        #50;
        clk = 1;
        #50;
        clk = 0;


        // Test 4: Store 11110000
        D0 = 0;
        D1 = 0;
        D2 = 0;
        D3 = 0;
        D4 = 1;
        D5 = 1;
        D6 = 1;
        D7 = 1;

        #50;
        clk = 1;
        #50;
        clk = 0;


        // Test 5: Store 11111111
        D0 = 1;
        D1 = 1;
        D2 = 1;
        D3 = 1;
        D4 = 1;
        D5 = 1;
        D6 = 1;
        D7 = 1;

        #50;
        clk = 1;
        #50;
        clk = 0;

        $finish;
	end
      
endmodule

