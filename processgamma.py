#program to process the gamma matrix created in gamma.cpp and simplify the elements to their final form

import csv
import string

def processgamma(readfile, writefile):

   input_file = open(readfile, 'r')
   output_file = open(writefile, 'w')
   data = csv.reader(input_file)
   writer = csv.writer(output_file)

   #1 - identity times an operator is equal to the operator
   specials0 = '1'
   specials1 = '11'

   #2 - any operator times itself is equal to identity
   specials2 = 'aa'
   specials3 = 'bb'
   specials4 = 'cc'
   specials5 = 'dd'

   #3 - operators of Alice (a,b) and Bob (c,d) commute
   specials6 = 'ca'
   specials7 = 'da'
   specials8 = 'cb'
   specials9 = 'db'  
   
   for line in data:
    line = [value.replace(specials0, '') for value in line]
    line = [value.replace(specials1, '1') for value in line]
    line = [value.replace(specials2, '1') for value in line]
    line = [value.replace(specials3, '1') for value in line]
    line = [value.replace(specials4, '1') for value in line]
    line = [value.replace(specials5, '1') for value in line]
    line = [value.replace(specials6, 'ac') for value in line]
    line = [value.replace(specials7, 'ad') for value in line]
    line = [value.replace(specials8, 'bc') for value in line]
    line = [value.replace(specials9, 'bd') for value in line]
    writer.writerow(line)
 
   input_file.close()
   output_file.close()
   

#this is enough times for level <= 5
processgamma("gammamatrix.csv","newgamma.csv")
processgamma("newgamma.csv","gammamatrix.csv")
processgamma("gammamatrix.csv","newgamma.csv")
processgamma("newgamma.csv","gammamatrix.csv")
processgamma("gammamatrix.csv","newgamma.csv")
processgamma("newgamma.csv","gammamatrix.csv")
processgamma("gammamatrix.csv","newgamma.csv")
processgamma("newgamma.csv","gammamatrix.csv")
processgamma("gammamatrix.csv","newgamma.csv")

    
#final formatting
input_file = open('newgamma.csv', 'r')
output_file = open('gammamatrix.csv', 'w')
data = csv.reader(input_file)
writer = csv.writer(output_file)
last1 = 'a'
last2 = 'b'
last3 = 'c'
last4 = 'd'
for line in data:
    line = [value.replace(last1, 'A0') for value in line]
    line = [value.replace(last2, 'A1') for value in line]
    line = [value.replace(last3, 'B0') for value in line]
    line = [value.replace(last4, 'B1') for value in line]
    writer.writerow(line)
