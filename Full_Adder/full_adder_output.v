module full_adder_output;

	// Inputs
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	full_adder uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.carry(carry)
	);

	initial begin
		// Initialize Inputs
		a = 0; b = 0; cin = 0; #100;   
		a = 0; b = 0; cin = 1; #100; 
		a = 0; b = 1; cin = 0; #100;   
		a = 0; b = 1; cin = 1; #100;   
		a = 1; b = 0; cin = 0; #100;   
		a = 1; b = 0; cin = 1; #100;   
		a = 1; b = 1; cin = 0; #100;   
		a = 1; b = 1; cin = 1; #100;   
		

        
		// Add stimulus here

	end
      
endmodule

