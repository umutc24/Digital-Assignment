module substraction(i_a, i_b, o_c, o_s);
  input [3:0]i_a;  // input number 1, always positive 
  input [3:0]i_b;  // input number 2, always negative
  output [3:0]o_c; // output carry
  output [3:0]o_s; // output sum
  
  wire signed [4:0] signed_i_a; // convert inputs and outputs 
  wire signed [4:0] signed_i_b; // to signed numbers 
  wire signed [4:0] signed_o_c;
  wire signed [4:0] signed_o_s;
  
  wire i_carry;
  wire signal_sub;
  wire [4:0] signed_i_nb
  
  signal_sub = 4'b 1111  // input signal for substraction 
  
  i_carry = signal_sub;  // input carry to achieve 2's complement
  
  
//  output signed_o_c = o_c;
//  output signed_o_s = o_s;
  
  //find 2's complement the number b
  //compare the two numbers. if a>b positive result.
  //                         if b>a negative result.
  
  
  always @*
  begin
  if(a == b)begin
    o_c = 4'b000;
    o_s = 4'b000;
  end 
  
  else if (a>b)begin
    assign signed_i_a = i_a;
	 assign signed_i_b = ~i_b;
	 assign signed_i_nb = signed_i_b + 4'b 1000; //if doesn't work, try shifting the bits
    assign o_s = signed_i_a ^                                           
  end 
  
  else begin
  //result is negative
  end
  end
  
  assign i_sb = i_b ^ signal_sub
  
  
  assign o_s = i_a ^ i_b ^ i_c; // calculate output sum
  
  assign o_c = (i_a ^ i_b) & i_c | (i_a & i_b); // calculate output carry
 

 
endmodule
 
  
input [3:0]i_a;  // input number 1
 input [3:0]i_b;  // input number 2
 input [3:0]i_c; 
 input i_s;
 output [3:0]o_c; // output carry
 output [3:0]o_s; // output sum
 
 wire i_bn; //negative b after the XOR gate
 
 assign i_bn = i_b ^ i_s; //XOR gate to inverse B
 assign o_s = (i_a ^ i_bn) ^ i_c; // calculate output sum
 assign o_c = ((i_a ^ i_bn) & i_c) | (i_a & i_bn); // calculate output carry

 
 
 