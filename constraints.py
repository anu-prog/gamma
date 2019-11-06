#program to output the constraints of the gamma matrix created in gamma.cpp and simplified in processgamma.py

import csv
import string

data = []
rowcounter = 0
counter = 1

with open('gammamatrix.csv', 'rb') as f:
    reader = csv.reader(f)
    for row in reader:
        data.append(row)
        rowcounter += 1
        
g = open('constraints.csv', 'w')		
g.write("row, column, row, column \n")

#finds values that match each element in the lower triangular part of gamma
#increment the values by 1 since Matlab indexes arrays from 1
for m in range(0, rowcounter):
	for n in range(0, m):
		searchterm = data[m][n]
		for i in range(0, rowcounter):
			for j in range(0, i+1):
				if searchterm == data[i][j]:
					g.write("%d,%d," %(m+1, n+1))
					g.write("%d,%d\n" %(i+1, j+1))
					counter += 1

f.close()
g.close()
			
#now get rid of same or symmetric columns
equality = []
with open('constraints.csv', 'rb') as f:
    reader = csv.reader(f)
    for row in reader:
        equality.append(row)
        
g = open('constraintsstreamlined.csv', 'w')
g.write("row, column, row, column \n")

noocon = 0;
      
for p in range(1, counter):
	if equality[p][0] == equality[p][2] and equality[p][1] == equality[p][3]:
		pass
	elif equality[p][0] == equality[p][3] and equality[p][1] == equality[p][2]:
		pass
	else:
		g.write("%s,%s,%s,%s\n" %(equality[p][0], equality[p][1], equality[p][2], equality[p][3]))
		noocon += 1
		
f.close()
g.close()

#get rid of constraints that are the same but just switched around
same = [] 
with open('constraintsstreamlined.csv', 'rb') as f:
	reader = csv.reader(f)
	for row in reader:
		same.append(row)
				
g = open('constraintssmaller.csv', 'w')
g.write("row, column, row, column \n")

badarray = []
finalcons = 0

for l in range(1, noocon):
	if l in badarray:
		pass
	else:
		for u in range(l+1, noocon):
			if same[l][0] == same[u][2] and same[l][1] == same[u][3] and same[l][2] == same[u][0] and same[l][3] == same[u][1]:
				badarray.append(u)
				
ctr = 0
for t in range(1, noocon):
	if t not in badarray:
		g.write("%s,%s,%s,%s\n" %(same[t][0], same[t][1], same[t][2], same[t][3]))
		finalcons += 1

f.close()
g.close()

#now write constraints in a form that can be exported straight to Matlab
constraint = []
with open('constraintssmaller.csv', 'rb') as f:
    reader = csv.reader(f)
    for row in reader:
        constraint.append(row)
                
g = open('constraintsfinal.txt', 'w')
print "Your %d constraints have been printed to the file : constraintsfinal.txt.\n" %finalcons

g.write("\t\tfor i=1:1:n\n\t\t\tGamma(i,i) == 1;\n\t\tend\n\n")
for q in range(1, finalcons+1):
	g.write("\t\tGamma(%s,%s) == Gamma(%s,%s);\n" %(constraint[q][0], constraint[q][1], constraint[q][2], constraint[q][3]))           

f.close()
g.close()
