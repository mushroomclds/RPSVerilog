`timescale 1ns / 1ps

module RPS(input [0:1]A, input [0:1]B, output reg [1:0]result,output reg[0:3]Acounter,
        output reg[0:3]Bcounter, output reg [6:0]seg7A, output reg [6:0]seg7B);
    reg [3:0] concat;
    reg[3:0] SegControl;
    reg [0:6] SEG_CA[0:9];
    initial begin
    Acounter = 4'b0000;
    Bcounter = 4'b0000;
    seg7B = 7'b0111111;
    seg7A = 7'b0111111;
    SEG_CA[0] = (7'b0111111);    //Note:  to lite digit, cathode must = 0
    SEG_CA[1] = (7'b0000110);
    SEG_CA[2] = (7'b1011011);
    SEG_CA[3] = (7'b1001111);
    SEG_CA[4] = (7'b1100110);
    SEG_CA[5] = (7'b1101101);
    SEG_CA[6] = (7'b1111101);
    SEG_CA[7] = (7'b0000111);
    SEG_CA[8] = (7'b1111111);
    SEG_CA[9] = (7'b1101111);
    end
    always @(*)begin
        concat = {A[0:1], B[0:1]};
//        Acounter = 2'b01;
        case (concat [3:0]) //B is 1, A is 0
            4'b0000: 
                result = 2'b11; //tie wins, dont update counter or 7seg
            4'b0001: begin
                result = 2'b01; //B wins
                Bcounter = Bcounter + 4'b0001;
                seg7B = SEG_CA[Bcounter];                
                end                    
            4'b0010: begin //A wins
                result = 2'b00;  
                Acounter = Acounter + 4'b0001;
                seg7A = SEG_CA[Acounter]; 
                end
            4'b0100: begin 
                result = 2'b00;
                Acounter = Acounter + 4'b0001;
                seg7A = SEG_CA[Acounter]; 
                end 
            4'b0101: begin
                result = 2'b11;
                end 
            4'b0110: begin 
                result = 2'b01;
                Bcounter = Bcounter + 4'b0001;
                seg7B = SEG_CA[Bcounter]; 
                end 
            4'b1000: begin 
                result = 2'b01; 
                Bcounter = Bcounter + 4'b0001;
                seg7B = SEG_CA[Bcounter]; 
                end
            4'b1001: begin 
                result = 2'b00;
                Acounter = Acounter + 4'b0001;
                seg7A = SEG_CA[Acounter];
                end 
            4'b1010: begin 
                result = 2'b11;
                end 
        endcase
    end
endmodule


