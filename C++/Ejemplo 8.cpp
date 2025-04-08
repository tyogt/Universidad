#include <iostream>

using namespace std;

int main(){
	float numeros[4];
	int i, min=0, max=100;
	
	cout<<"Ingrese 4 numeros: \n";
	
	for(i=0;i<4;i++){
		
	cout<<"ingrese el numero "<<i<<" ";
	cin>>numeros[i];
		
	}
	
	for(i=0;i<4;i++){
		
		if(numeros[i]<min)
			min=numeros[i];
		if (numeros[i]>max)
		max=numeros[i];
		
	}
	
	cout<<"Numero minimo ingresado: "<<min<<"\n";
	cout<<"Numero maximo ingresado: "<<max;
	
	return 0;
}
