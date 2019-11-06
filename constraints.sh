#this script returns all the constraints for the moment matrix

g++ -o g gamma.cpp
./g

python processgamma.py
python constraints.py

rm newgamma.csv
rm constraints.csv
rm constraintsstreamlined.csv
rm constraintssmaller.csv
