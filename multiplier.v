module multiplier (
    input  [3:0] A, 
    input  [3:0] B,  
    output [7:0] result   
);

    wire [3:0] pp0, pp1, pp2, pp3; 
    assign pp0 = A & {4{B[0]}};
    assign pp1 = A & {4{B[1]}};
    assign pp2 = A & {4{B[2]}};
    assign pp3 = A & {4{B[3]}};

    wire s1,s2,s3,s4,s5,s6,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,s31,s32,s41,s42,s51;
      half_adder ha1 (pp0[1],pp1[0],s1,c1);
      full_adderm fa1 (pp0[2],pp1[1],c1,s21,c2);
      half_adder ha2 (s21,pp2[0],s2,c3);
      full_adderm fa3 (pp0[3],pp1[2],c2,s31,c4);
      full_adderm fa4 (s31,pp2[1],c3,s32,c5);
      half_adder ha3 (s32,pp3[0],s3,c6);
      half_adder ha4 (pp1[3],c4,s41,c7);
      full_adder fa5 (pp2[2],s41,c5,s42,c8);
      full_adder fa6 (pp3[1],s42,c6,s4,c9);
      full_adder fa7 (pp2[3],c7,c8,s51,c10);
      full_adder fa8 (pp3[2],s51,c9,s5,c11);
      full_adder fa9 (pp3[3],c10,c11,s6,c12);
      
    wire [7:0] sum, carry;
    assign sum[0] = pp0[0];
    assign sum[1] = s1;
    assign sum[2] = s2;
    assign sum[3] = s3;
    assign sum[4] = s4;
    assign sum[5] = s5;
    assign sum[6] = s6;
    assign sum[7] = c12;  
    assign result = sum ;

endmodule

module half_adder (
    input  A, B,
    output SUM, CARRY
);
    assign SUM = A ^ B;
    assign CARRY = A & B;
endmodule

module full_adder (
    input  A, B, Cin,
    output SUM, CARRY
);
    assign SUM = A^B^Cin;
    assign CARRY = (A&B)|(B&Cin)|(Cin&A);
endmodule

module full_adderm (
    input A,B,Cin,
    output SUM,CARRY
    );
    assign SUM = B;
    assign CARRY = A;
    endmodule
