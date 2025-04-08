#include <iostream>
#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

using namespace std;


void mostrarLinea(char c, int n){
int i;

for (i=0; i<n; i++){
	cout<<c;
	cout<<"\n";
}

}

void mostrarPorcentaje(double porc){

cout<<"Porcentaje: "<<100*porc<<"\n";

}

void mostrarPorcentajeYLineas(double porc, char c, int n){

mostrarLinea(c,n);
mostrarPorcentaje(porc);
mostrarLinea(c,n);

}

int main(){
	
	mostrarLinea('*',20);
	mostrarPorcentaje(0.12345);
	mostrarLinea('*',20);
	
	cout<<"\n";
	
	mostrarPorcentajeYLineas(0.89766,'*',18);
	
	return 0;
}



