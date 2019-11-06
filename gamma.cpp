//program to generate the elements of the moment matrix

#include<iostream> 
#include<math.h>
#include<fstream>
#include<string.h>
#include<stdio.h>
using namespace std;

int generategamma(int choice)
{
	int i, j, size;
	ofstream wfile;
	wfile.open("gammamatrix.csv");
	
	switch(choice)
  	{
  	
  		//state
  		case 1 :
  		{
  			cout<<endl<<"You are using Level 3 of the NPA hierarchy."<<endl;
    		size = 19;
    		char rowop[19][5] = {"1", "a", "b", "c", "d", 
						"ab", "ac", "ad", "bc", "bd", "cd",
						"abc", "abd", "acd", "bcd", 
						"abcd", "abdc", 
						"aba", "cdc"};
    		char colop[19][5] = {"1", "a", "b", "c", "d", 
    					"ba", "ac", "ad", "bc", "bd", "dc",
    					"bac", "bad", "adc", "bdc",
    					"badc", "bacd",
    					"aba", "cdc"};
    		for(i = 0; i < size; i++) 
    		{
    			for(j = 0; j < size; j++)
    			{
    				wfile<<rowop[i]<<colop[j];
    				if(j != size - 1) 
    					wfile<<",";
        		}
        		wfile<<"\n";
    		}
    		break;
  		}
  		
  		//ZZ 
  		case 2 :
  		{
  			cout<<endl<<"You are using Level 3 of the NPA hierarchy."<<endl;
    		size = 19;
    		char rowop[19][5] = {"1", "a", "b", "c", "d", 
						"ab", "ac", "ad", "bc", "bd", "cd",
						"abc", "abd", "acd", "bcd", 
						"abcd", "abdc", 
						"aba", "cdc"};
    		char colop[19][5] = {"1", "a", "b", "c", "d", 
    					"ba", "ac", "ad", "bc", "bd", "dc",
    					"bac", "bad", "adc", "bdc",
    					"badc", "bacd",
    					"aba", "cdc"};
    		for(i = 0; i < size; i++) 
    		{
    			for(j = 0; j < size; j++)
    			{
    				wfile<<rowop[i]<<colop[j];
    				if(j != size - 1) 
    					wfile<<",";
        		}
        		wfile<<"\n";
    		}
    		break;
  		}
  		
  		//XX
  		case 3 :
  		{
  			cout<<endl<<"You are using Level 5 of the NPA hierarchy."<<endl;
  			size = 81;
  			char rowop[81][11] = {"1", "a", "b", "c", "d", 
						"ab", "ac", "ad", "bc", "bd", "cd",
						"abc", "abd", "acd", "bcd", 
						"abcd", "abdc", 
						"bab", "dcd",
						"abac", "abad", "babc", "babd",
						"acdc", "bcdc", "adcd", "bdcd",
						"abacd", "babcd", "abcdc", "abdcd",
						"abacdc", "abadcd", "babcdc", "babdcd",
						"babab", "dcdcd",
						"aba", "cdc",
						"abab", "cdcd", "ababc", "ababd",
						"acdcd", "bcdcd", "ababcd", "ababdc",
						"abcdcd", "bacdcd", "ababcdc", "ababdcd",
						"abacdcd", "babcdcd", "ababcdcd", "ababdcdc",
						"ababa", "cdcdc", 
						"ababac", "ababad", "bababc", "bababd",
						"acdcdc", "bcdcdc", "adcdcd", "bdcdcd",
						"ababacd", "bababcd", "abcdcdc", "abdcdcd",
						"ababacdc", "ababadcd", "bababcdc", "bababdcd",
						"ababacdcd", "bababcdcd",
						"ababacdcdc", "ababadcdcd",
						"ababacdcdc", "ababadcdcd", "bababcdcdc", "bababdcdcd"};
    		char colop[81][11] = {"1", "a", "b", "c", "d", 
    					"ba", "ac", "ad", "bc", "bd", "dc",
    					"bac", "bad", "adc", "bdc",
    					"badc", "bacd",
    					"bab", "dcd",
    					"abac", "abad", "babc", "babd",
    					"acdc", "bcdc", "adcd", "bdcd",
    					"abadc", "babdc", "bacdc", "badcd",
    					"abacdc", "abadcd", "babcdc", "babdcd",
    					"babab", "dcdcd",
    					"aba", "cdc",
    					"baba", "dcdc", "babac", "babad",
    					"adcdc", "bdcdc", "babadc", "babacd",
    					"badcdc", "abdcdc", "babacdc", "babadcd",
    					"abadcdc", "babdcdc", "babadcdc", "babacdcd",
    					"ababa", "cdcdc",
    					"ababac", "ababad", "bababc", "bababd",
    					"acdcdc", "bcdcdc", "adcdcd", "bdcdcd",
    					"ababadc", "bababdc", "bacdcdc", "badcdcd",
    					"ababacdc", "ababadcd", "bababcdc", "bababdcd",
    					"ababadcdc", "bababdcdc",
    					"ababacdcdc", "ababadcdcd",
    					"ababacdcdc", "ababadcdcd", "bababcdcdc", "bababdcdcd"};
    		for(i = 0; i < size; i++) 
    		{
    			for(j = 0; j < size; j++)
    			{
    				wfile<<rowop[i]<<colop[j];
    				if(j != size - 1) 
    					wfile<<",";
        		}
        		wfile<<"\n";
    		}
    		break;
  		}
  		
  		//ZX
  		case 4 :
  		{
  			cout<<endl<<"You are using Level 5 of the NPA hierarchy."<<endl;
  			size = 37;
  			char rowop[37][7] = {"1", "a", "b", "c", "d", 
						"ab", "ac", "ad", "bc", "bd", "cd",
						"abc", "abd", "acd", "bcd", 
						"abcd", "abdc", 
						"aba", "dcd",
						"abac", "abad", "babc", "babd",
						"acdc", "bcdc", "adcd", "bdcd",
						"abacd", "babcd", "abcdc", "abdcd",
						"abacdc", "abadcd", "babcdc", "babdcd",
						"ababa", "dcdcd"};
    		char colop[37][7] = {"1", "a", "b", "c", "d", 
    					"ba", "ac", "ad", "bc", "bd", "dc",
    					"bac", "bad", "adc", "bdc",
    					"badc", "bacd",
    					"aba", "dcd",
    					"abac", "abad", "babc", "babd",
    					"acdc", "bcdc", "adcd", "bdcd",
    					"abadc", "babdc", "bacdc", "badcd",
    					"abacdc", "abadcd", "babcdc", "babdcd",
    					"ababa", "dcdcd"};
    		for(i = 0; i < size; i++) 
    		{
    			for(j = 0; j < size; j++)
    			{
    				wfile<<rowop[i]<<colop[j];
    				if(j != size - 1) 
    					wfile<<",";
        		}
        		wfile<<"\n";
    		}
    		break;
  		}
  		
  		default :
  		{
  			cout<<"Sorry, that option is invalid. "<<endl;
  		}
  		
  	}
  	
  	wfile.close();
  	return size;
}

int main()
{
	int choice, size;
	
  	cout<<endl<<"Alice and Bob share an untrusted state claiming to be a Bell state."<<endl;
  	cout<<"They each have untrusted operators claiming to be the Pauli operators Z and X."<<endl;
  	cout<<"They wish to test these using the amount of violation of the CHSH inequality."<<endl<<endl;
  	
  	cout<<"What do you wish to self-test?"<<endl;
  	cout<<"1. State"<<endl;
  	cout<<"2. Both parties apply Z"<<endl;
  	cout<<"3. Both parties apply X"<<endl;
  	cout<<"4. One party applies Z, the other party applies X "<<endl<<endl;
  	cout<<"Enter the number of your choice : ";
  	cin>>choice;
  	
	size = generategamma(choice);
	cout<<"Your "<<size<<" X "<<size<<" moment matrix can be found in the file : gammamatrix.csv."<<endl;
  	
  	return 0;
}


