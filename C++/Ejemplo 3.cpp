#include <iostream>
#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

using namespace std;


double leerInteres(){
double i=0;

cout<<"Interes?[0-100]%: ";
cin>>i;

i=i/100;

	return i;
}

int main (){
	double i1=0, i2=0;
	
	i1=leerInteres();
	i2=leerInteres();
	
	cout<<"Intereses de cantidades ingresadas: "<<i1<<" y "<<i2;
	
	return 0;
}
