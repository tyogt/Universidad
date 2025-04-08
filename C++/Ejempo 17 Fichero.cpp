#include<iostream>
#include<fstream>
#include<cstring>
#include<conio.h>
#include<stdio.h>

using namespace std;

struc sRegistro {
char producto[25];
int codigo;
float precio;
} registro;

int opcio:
int salida=0;
FILE *fichero;

void menu(){
	
	cout<<"\n";
	cout<<"Menu\n";
	cout<<"\n";
	cout<<"1. Crear fichero\n";
	cout<<"2. Ingresar datos\n";
	cout<<"3. Ver datos\n";
	cout<<"4. Salir\n";
	
}

void CrearFichero(FILE *fichero){
	fichero = fopen("fichero", "r");
	
	if(!fichero){
		fichero = fopen("fichero", "w");
		cout<<"\nArchivo creado";
	}else{
		cout<<"\nEl fichero ya existe!";
	}
	fclose(fichero);
}

void InsetarDatos(FILE *fichero){
	fichero = fopen("fichero", "a+");
	if(fichero == NULL){
		cout<<"\nFichero no exite! \n Por favor creelo";
		return;
	}
	cout<<"**********************************************\n";
	cout<<"Nombre producto: ";
	scanf("%s",&registro.producto);
	cout<<"Codigo producto: ";
	scanf("%d",&registro.codigo);
	cout<<"Precio producto: ";
	scanf("%f",&registro.precio);
	fwrite(&registro, sizeof(struct sRegistro), 1, fichero);
	fclose(fichero);
}

void enca(){
	cout<<"***********************************************\n";
	cout<<"Numero     Codigo     Nombre     Precio\n";
}

void VerDatos(FILE *fichero){
	enca();
	int numero = 1;
	fichero = fopen ("fichero", "r");
	if(fichero == NULL){
		cout<<"\nFichero no existe!\nPor favor creelo";
		return 0;
	}
	fread(&registro, sizeof(struct sRegistro), 1, fichero);
	while(!feof(fichero)){
		printf("\%d",numero);
		printf("\%d",registro.codigo);
		printf("\%s",registro.producto);
		printf("\%.2f",registro.precio);
	}
}

int main(){
	while(!salida){
		menu();
		cout<<"Opcion: ";
		scanf("%d", &opcion);
		switch(opcion){
			case 1:
				CrearFichero(fichero);
				break;
			case 2:
				InsertarDatos(fichero);
				break;
			case 3:
				VerDatos(fichero);
				break;
			case 1:
				salida = 1;
				break;
			default:
				cout<<"\n Opcion no valida";
		}
	}
	return 0;
}
