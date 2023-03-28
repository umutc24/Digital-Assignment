//fifo

module FIFO(i_packet,o_full, o_packet, o_empty, i_clock, i_reset, wn, rn, );
  output reg [7:0] o_packet;
  output o_full, o_empty;
  input [7:0] i_packet;
  input i_clock, i_reset;
  input wn, rn //enable signals to write and read
  
  reg [2:0] wptr, rptr; // tracking pointers
  reg [7:0] memory [7:0]; // FIFO is 8x8
  
  assign o_full = ((wptr == 3'b111) & (rptr == 3'b000)? 1:0);
  assign o_empty = (wptr == rptr)? 1:0;
  
  always @(posedge i_clock)
  begin
    if (i_reset)
      begin
        memory[0] <= 0; memory[1] <= 0; memory[2] <= 0; memory[3] <= 0;
        memory[4] <= 0; memory[5] <= 0; memory[6] <= 0; memory[7] <= 0;
        o_packet <= 0; wptr <= 0; rptr <= 0;
      end
    else if (wn & !o_full)
      begin
        memory[wptr] <= i_packet;
        wptr <= wptr + 1;
      end
    else if (rn & !o_empty)
      begin
        o_packet <= memory[rptr];
        rptr <= rptr + 1;
      end
  end
endmodule