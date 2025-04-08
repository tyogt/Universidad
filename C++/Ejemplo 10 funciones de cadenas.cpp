#include <iostream>
#include <string.h>

using namespace std;

int main (){
	
	int i;
	char palabra1[32], palabra2[32];
	
	cout<<"Ingrese palabra1: ";
	cin>>palabra1;
	cout<<"Ingrese palabra2: ";
	cin>>palabra2;
	cout<<"\n";
	cout<<"Palabras capturadas "<<palabra1<<" Y "<<palabra2;
	cout<<"\nSon iguales? ";
	
	if(strcmp(palabra1,palabra2))
	cout<<"NO\n";
	else
	cout<<"SI\n";
	
	cout<<"\nLargo de palabras, Palabra1: "<<strlen(palabra1)<<" Palabra2: "<<strlen(palabra2);
	cout<<"\n";
	cout<<"\nPalabras concatenadas:";
	strcat(palabra1," ");
	strcat(palabra1,palabra2);
	cout<<palabra1;

	return 0;
}
