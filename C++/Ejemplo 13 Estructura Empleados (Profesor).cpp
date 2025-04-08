
#include <iostream>
#include <stdio.h>
#include <conio.h>

using namespace std;

struct reg_empleado
{
   int id;
   char nombre[30];
   char profesion[30];
   char puesto[30];
   float salario;
   }empleados[5];

int i, op, m1,e,b;

void menu()
{	
   cout<<"\n";
   cout<<"1.  Ingreso de datos\n";
   cout<<"2.  Visualizacion de datos\n";
   cout<<"3.  Busqueda de Empleado\n";
   cout<<"4.  SALIR\n";
   cin>>m1;
   }
   
void capturar()
{
 cout<<"Bienvenido ingrese datos de 5 usuarios\n";
 for(i=0; i < 3; i++)
 {
    cout<<"\nIngrese codigo  "; cin>>empleados[i].id;
    cout<<"\n"<<"\n Ingrese nombre de empleado: "; cin>>empleados[i].nombre;
    cout<<"\n"<<"\n Ingrese profesion: "; cin>>empleados[i].profesion;
    cout<<"\n"<<"\n Ingrese puesto: "; cin>>empleados[i].puesto;
    cout<<"\n"<<"\n Ingrese salario: "; cin>>empleados[i].salario;
   }
 cout<<"\n DATOS CAPTURADOS \n";
 getch();
 void menu();
}

void mostrar()
{
    cout<<".::DATOS ALMACENADOS::.\n";
    for (e=0; e < 3; e++)
   	{
        cout<<"\nCodigo: "<<empleados[e].id;
        cout<<"\nNombre empleado: "<<empleados[e].nombre;
        cout<<"\nProfesion: "<<empleados[e].profesion;
        cout<<"\nPuesto: "<<empleados[e].puesto;
        cout<<"\nSalario: "<<empleados[e].salario;
        cout<<"\n-------------------------------------------------\n";
         }
	cout<<"\n Procedimiento de visualizacion de datos terminado";
    getch();
    void menu();
}

void buscar()
{
    int cod;
    cout<<".::BUSQUEDA DE REGISTROS::.\n";
    cout<<"\n Ingrese ID de empleado: ";cin>>cod;
    cout<<"\n Iniciando busqueda: ....\n";
    for (b=0; b <5;b++)
   	{
      	if (empleados[b].id == cod)
         	{
               cout<<"Empleado encontrado: \n";
               cout<<"\n Nombre: "<<empleados[b].nombre;
               cout<<"\n Puesto: "<<empleados[b].puesto;
               getch();
               }
    }
   cout<<"\n PROCEDIMIENTO DE BUSQUEDA FINALIZADO:... ";
   getch();
   void menu();
}

void fin()
{
   cout<<"Programa finalizado, hasta pronto...";
   getch();
   m1=4;
   }
   
int main()
{
   do{
      menu();
      switch(m1){
            case 1:capturar(); break;
            case 2: mostrar(); break;
            case 3: buscar(); break;
            case 4: fin();break;}
      }while (m1 != 4);
    
return 0;
}


