`timescale 1ns / 1ps

module test_tb();
reg [1:0]A;
reg [1:0]B;
//reg CLK;
wire [0:3]Acounter;
wire [0:3]Bcounter;
wire [0:6]seg7A;
wire [0:6]seg7B;

//reg Cin;
//wire Cout;
wire [1:0]result;
//initial begin
//CLK = 1'b0;
//end
//initial forever begin
//#10 CLK = !CLK;
//end
initial begin
//    $monitor("A=%d%d ", A[1], A[0]);
//    $monitor("B=%d%d ", B[1], B[0]);

    A = 2'b00;
    B = 2'b00;
    #20;
    A = 2'b00;
    B = 2'b01;
    #20;
    A = 2'b00;
    B = 2'b10;
    #20;
    A = 2'b01;
    B = 2'b00;
    #20;
    A = 2'b01;
    B = 2'b01;
    #20;
    A = 2'b01;
    B = 2'b10;
    #20;
    A = 2'b10;
    B = 2'b00;
    #20;
    A = 2'b10;
    B = 2'b01;
    #20;
    A = 2'b10;
    B = 2'b10;
    
     
end
RPS M (A,B, result,Acounter,Bcounter, seg7A, seg7B);
endmodule
