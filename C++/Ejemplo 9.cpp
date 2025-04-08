#include <iostream>

using namespace std;

int main (){
	
	int i;
	char palabra [32];
	
	for(i=0;i<5;i++)
	palabra[i]=65+i;
	palabra[6]=2;
	
	for (i=0;i<5;i++)
	cout<<palabra[i];
	cout<<"\n";
	cout<<"\n"<<palabra;
	
	return 0;
}
