#include<iostream>
#include<conio.h>
#include<stdio.h>

using namespace std;

struct reg_empleado{
	int id;
	char nombre[30];
	char profesion[30];
	char puesto[30];
	float salario;
}empleados[5];

int i, op, m1, e, b;

void menu(){
	cout<<"\n";
	cout<<"1. Ingreso de datos\n";
	cout<<"2. Visualizacion de datos\n";
	cout<<"3. Busqueda de Empleado\n";
	cout<<"SALIR\n";
	cin>>m1;
}

void capturar(){
	cout<<"Bienvenido ingrese datos de 5 usuarios\n";
	
	for(i=0; i<5; i ++){
		cout<<"\nIngrese codigo: ";cin>>empleados[i].id;
		cout<<"\n"<<"\nIngrese nombre de empleado: ";cin>>empleados[i].nombre;
		cout<<"\n"<<"\nIngrese profesion: ";cin>>empleados[i].profesion;
		cout<<"\n"<<"\nIngrese puesto: ";cin>>empleados[i].puesto;
		cout<<"\n"<<"\nIngrese salario: ";cin>>empleados[i].salario;
	}
	
	cout<<"\nDATOS CAPTURADOS\n";
	getch();
	void menu();
}

void mostrar(){
	cout<<".::DATOS ALMACENADOS::.\n";
	
	for(e=0; e<5; e ++){
		cout<<"\nCodigo: "<<empleados[e].id;
		cout<<"\n"<<"\nNombre empleado: "<<empleados[e].nombre;
		cout<<"\n"<<"\nProfesion: "<<empleados[e].profesion;
		cout<<"\n"<<"\nPuesto: "<<empleados[e].puesto;
		cout<<"\n"<<"\nSalario: "<<empleados[i].salario;
		cout<<"\n--------------------------------------------------------------\n";
	}
	
	cout<<"\nProcedimiento de visualizacion de datos terminado";
	getch();
	void menu();
}

void buscar(){
	int cod;
	cout<<".::BUSQUEDA DE REGISTROS::.\n";
	cout<<"\nIngrese ID de empleado: ";cin>>cod;
	cout<<"\nIniciando busqueda:....\n";
	
	for(b=0; b<5; b ++){
		if(empleados[b].id==cod){
			cout<<"Empleado encontrado: \n";
			cout<<"\nNombre: "<<empleados[b].nombre;
			cout<<"\nPuesto: "<<empleados[b].puesto;
			getch();
		}
	}
	
	cout<<"\nPROCEDIMIENTO DE BUSQUEDA FINALIZADO:...";
	getch();
	void menu();
}

void fin(){
	cout<<"Programa finalizad, hasta pronto...";
	getch();
	m1=4;
}

int main(){
		do{
			menu();
			switch(m1){
				case 1:capturar();
					break;
				case 2:mostrar();
					break;
				case 3:buscar();
					break;
				case 4:fin();
					break;
			} while(m1!=4);
		}
		return 0;
}

