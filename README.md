# approximate_multiplier
This project is in verilog language and deals with the construction of an approximate 4X4 multiplier 

The logic I used in this project was that I first constructed an exact 4X4 bit multiplier . 
Then I constructed a modified full adder module named full_adderm
I replaced the 3 full adders used for the lower sum bits by full_adderm 
This brought down my LUTs to 12 and Mean Relative Error to a mere 9.66%

