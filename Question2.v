module shiftRegister64(i_data, clk, i_enable, o_data);
  input i_data; //input 64-bit data
  input clk, i_enable; //enable signal
  output [63:0] o_data; //output 64-bit data
  reg [63:0] flipFlop; //64-bit flipFlop
  assign o_data = flipFlop[63:0];
  always @ (posedge clk) //shift at clock positive edge
  begin
  if (i_enable) begin    //if enable is HIGH
    flipFlop <= flipFlop << 1; //shift the bits to the "left" by 1 bit
	  flipFlop[0] <= i_data;
	  
  end

  else begin           // if enable is  LOW 
	   flipFlop <= 0;
  end
  end 
  
endmodule