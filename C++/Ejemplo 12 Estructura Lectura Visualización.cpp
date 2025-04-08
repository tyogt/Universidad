#include<iostream>
#include<conio.h>
#include<stdio.h>

using namespace std;

struct cd{
	char titulo[30];
	char artista[20];
	int no_canciones;
	float precioQ;
}CD1;

int main(){
	
	cout<<"Programa de manejo de estructuras\n";
	cout<<"\n";
	cout<<"Ingrese porfavor los datos generales del CD: \n";
	cout<<"\n";
	cout<<"Titulo del CD: "; gets(CD1.titulo);
	cout<<"\n Artista: "; gets(CD1.artista);
	cout<<"\n Numero de canciones: ";cin>>CD1.no_canciones;
	cout<<"\n Precio en querzales: Q";cin>>CD1.precioQ;

	cout<<"LOS DATOS PROPORCIONADOS DE CD SON: ";
	cout<<"\n";
	cout<<"Titulo del cd: "<<CD1.titulo<<"\n";
	cout<<"Artista: "<<CD1.artista<<" No. de Canciones: "<<CD1.no_canciones;
	cout<<"\n Precio de venta: Q"<<CD1.precioQ;
	
	return 0;
}
