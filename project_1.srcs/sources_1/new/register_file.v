
`timescale 1ns / 1ps

module register_file(
    input en_write,  clk, [7 : 0] write_data, [3:0] write_address, [3:0] read_address,
    output [7:0] read_data
    );

        reg [7:0] registers [15:0];

        assign read_data = registers[read_address]; //read whenever

        always @ (posedge clk)//write only on clock edge
        begin
            if(en_write) registers[write_address] <= write_data;
            else begin end
        end
endmodule
