#include <iostream>

using namespace std;

int main() {

int numeros[10];
int i;

numeros[0]=0;

for(i=1; i<10; i++)
	numeros[i]=numeros[i-1]+1;
	
	for(i=0;i<10;i++){
		
		cout<<numeros[i];
		cout<<"\n";
	}


return 0;
}
