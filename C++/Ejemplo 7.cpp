#include <iostream>

using namespace std;

int main(){
	float numeros[4], suma;
	int i;
	
	cout<<"Ingrese 4 numeros: \n";
	
	for(i=0;i<4;i++){
		
	cout<<"ingrese el numero "<<i<<" ";
	cin>>numeros[i];
		
	}
	
	for(i=0;i<4;i++){
		
		suma=suma+numeros[i];
		
	}
	
	cout<<"\nLa suma de los numeros ingresados es: "<<suma;
	cout<<"\n El promedio es: "<<suma/i;
	
	return 0;
}
