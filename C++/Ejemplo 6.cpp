#include <iostream>

using namespace std;

int main() {
int numeros[10];
int i;

cout<<"Ingrese 10 numeros: \n";

for (i=0;i<10;i++){
	
	cout<<"ingrese el numero 0"<<i<<" ";
	cin>>numeros[i];
	
}

cout<<"\nlos numeros ingresados son: \n";

for(i=0;i<10;i++){
	
	cout<<numeros[i];
	cout<<"\n";
	
}

return 0;
}
