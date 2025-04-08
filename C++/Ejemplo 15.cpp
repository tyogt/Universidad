#include <fstream>
#include <stdio.h>
#include <iostream>
#include <conio.h>

using namespace std;

int op;
char nombre[20]="c++";
char edi[20]="Reprueba";
double precio=19.58;
char uno[64],dos[64],tres[64];

int main(void){
	
	ofstream archivo_libro("bok1.dat");
	
	cout<<"Ingresando datos al archivo... ";
	
	archivo_libro<<nombre<<endl;
	archivo_libro<<edi<<endl;
	archivo_libro<<precio<<endl;
	
	cout<<"\n";
	cout<<"Leyendo datos del archivo";
	cout<<"\n";
	
	ifstream archivo_entrada("bok1.dat");
	
	archivo_entrada.getline(uno,sizeof(uno));
	archivo_entrada.getline(dos,sizeof(dos));
	archivo_entrada.getline(tres,sizeof(tres));
	
	cout<<uno<<endl;
	cout<<dos<<endl;
	cout<<tres<<endl;
	
	return 0;
}
