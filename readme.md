Guide to automating gamma matrix calculations.
----------------------------------------------

This code allows us to generate and constrain the elements of a 'moment matrix' Gamma, which is used to simplify our semidefinite programming (SDP) calculations. Gamma is often a very large matrix, and we wish to generate a list of unique constraints on the elements (i.e. which elements are equal to one another). 

We run the following code before running the SDP: 
1) constraints.sh - bash script to run all the programs
2) gamma.cpp - C++ program to generate elements of gamma from given rows and columns
3) processgamma.py - python script to go through and simplify elements of gamma
4) constraints.py - python script to generate all non-redundant constraints of gamma

To run the program, we run the bash script constraints.sh. The gamma matrix will be printed to the file 'gammamatrix.csv'. The constraints will be printed to the file 'constraintsfinal.txt' in the appropriate format. Then, we copy and paste the contents of 'constraintsfinal.txt' to the SDP part of our Matlab code. 

For example:
    cvx_begin sdp
    
        variable Gamma(n,n) hermitian semidefinite
        minimise( trace(transpose(M)*Gamma) )
        
        subject to
        Gamma >= 0 
        trace(transpose(N)*Gamma) == 2 - eta
        
        %constraints
        
    cvx_end
Here, we enter the constraints exactly as printed to the file under '%constraints'.

1) constraints.sh
-----------------
This compiles and runs the C++ program that generates gamma, then processes it using the python scripts. 
It deletes any unnecessary files that were created.
The end result is all the constraints required.

2) gamma.cpp
------------
This asks you what you wish to self-test (state, XX, ZZ, ZX).
Depending on your answer, it tells you which level of the NPA hierarchy you require. 
It is pre-defined in this code which operators we require for the rows and columns of gamma, for each thing you wish to self-test.
The level and the operators required have been optimised, by balancing computational efficiency with getting the best bounds.
The row and column operators are defined with columns being adjoint of rows.
Each element of gamma is calculated by simply printing the relevant row element and then the relevant column element.
The end result is the gamma matrix printed to a csv file.

3) processgamma.py
------------------
This simplifies the elements of the gamma matrix so that we have:
11 -> 1
a0a0 -> a0 
b0a0 -> a0b0
It repeats the process enough times so that it works for all the levels you need in this Bell state/operators self-testing scenario.
The end result is a gamma matrix with all elements simplified.

4) constraints.py
-----------------
This creates a list of elements that are equal to each other. 
It then further simplifies this list to remove any repetitions or redundancies resulting from the symmetry of gamma.
The end result is a list of the final constraints, in a format that is suitable for exporting to Matlab.

The Matlab files in this repo then run the relevant SDP for each self-test. 

