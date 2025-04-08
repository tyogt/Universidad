#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include <iostream>
#include <fstream>

using namespace std;

typedef struct {
    int codigo;
    char nombre[41];
    char marca[41];
    char tipo[41];
    int Cant;
    float precio;
    int Elimin;  
} vregistro;

void cont(){
    printf("\n\n\t\t\t\t---------------------------------------------------------------\n");
    printf("\t\t\t\t\t--------------------------------------------\n\n");
    getch();
}

void archivo(){
    FILE *Archiv;
    Archiv=fopen("Materiales","r");
    if (!Archiv){
        Archiv = fopen("Materiales", "w");
        printf("\n Archivo creado!");
        }
        else
        {
            printf("\nEl Archivo ya Existe, seleccion otra Accion: !");
        }
        fclose (Archiv);
        cont();
}

void ver(){
    printf("\nCemento, Piedrin y Arena"); printf("\t  Tipo:"); printf("\tObra Civil\n");                                       
    printf(" 500      400     200\n\n");
    
    printf("Ladrillos y Bloques");printf("\t  Tipo:"); printf("\tObra\n");    
    printf(" 1200         1500\n\n");              

    printf("Adoquines"); printf("\t  Tipo:"); printf("\tObra Civil\n");          
    printf("  2000\n\n");
    
    printf("Hierra y Yeso"); printf("\t  Tipo:"); printf("\tObra Civil\n");    
    printf(" 450      150\n\n");
    
    printf("Aluminio"); printf("\t  Tipo:"); printf("\tObra\n");    
    printf("  600\n\n");
    
     cont();
}

void Ingresa(){
    FILE *Archiv;
    
    Archiv=fopen("Materiales","a+");
    if (Archiv==NULL)
        exit(1);
    vregistro producto;
    printf("\n\nSelecciones Correctamente el Material a Utilizar asi mismo la cantidad, ya que sino sera Rebotada \nla Orden solicitada, saludos\n\n\n");
    
                    printf("Ingrese el codigo del producto:");
                    scanf("%i",&producto.codigo);
                    fflush(stdin);
                    printf("Ingrese el nombre del producto:");
                    gets(producto.nombre);
                    printf("Ingrese la cantidad a Utilizar: (Dependiendo del Producto; consultar las cantidades disponibles) ");
                    scanf("%i",&producto.Cant);   
                    printf("Ingrese precio:");
                    scanf("%f",&producto.precio);
                    fflush(stdin);
                    printf("Ingrese el Tipo del Producto: ");
                    gets(producto.tipo);
    producto.Elimin=0;
    fwrite(&producto, sizeof(vregistro), 1, Archiv);
    fclose(Archiv);
    cont();
}

void Visualizar(){
        FILE *Archiv;
    int numero = 1;
    Archiv=fopen("Materiales","r");
    if (Archiv==NULL)
        exit(1);
    vregistro producto;
    fread(&producto, sizeof(vregistro), 1, Archiv);
    while(!feof(Archiv))
    {
        if (producto.Elimin==0)
        {
           
            printf("\%d \%d \%s \%d \%.2f \%s \n ", numero, producto.codigo, producto.nombre,producto.Cant, producto.precio, producto.tipo);
            numero++,"\n";
            
        }
        fread(&producto, sizeof(vregistro), 1, Archiv);
    }
    fclose(Archiv);
     cont();
}

void modificacion(){
    FILE *Archiv;
    Archiv=fopen("Materiales","r+b");
    if (Archiv==NULL)
        exit(1);
    printf("Ingrese el codigo de producto a modificar:");
    int cod;
    scanf("%i", &cod);
    vregistro producto;
    int existe=0;
    fread(&producto, sizeof(vregistro), 1, Archiv);
    while(!feof(Archiv))
    {
        if (cod==producto.codigo && producto.Elimin==0)
        {
           printf("%i %s %0.2f\n", producto.codigo, producto.nombre, producto.precio,producto.tipo,producto.Cant);
                    printf("Ingrese nuevo precio:");
                    scanf("%f",&producto.precio);
                     fflush(stdin);
                    printf("Ingrese La nueva cantidad: ");
                    scanf("%f",&producto.Cant);
         
           int pos=ftell(Archiv)-sizeof(vregistro);
           fseek(Archiv,pos,SEEK_SET);
           fwrite(&producto, sizeof(vregistro), 1, Archiv);
           printf("Se modifico los correspondientes datos para dicho producto.\n");
           existe=1;
           break;
        }
        fread(&producto, sizeof(vregistro), 1, Archiv);
    }
    if (existe==0)
        printf("No existe un producto con dicho codigo\n");
    fclose(Archiv);
     cont();
}

void buscar(){
    FILE *Archiv;
    Archiv=fopen("Materiales","r+b");
    if (Archiv==NULL)
        exit(1);
    printf("Ingrese el codigo de producto a buscar:");
    int cod;
    scanf("%i", &cod);
    vregistro producto;
    int existe=0;
    fread(&producto, sizeof(vregistro), 1, Archiv);
    while(!feof(Archiv))
    {
        if (cod==producto.codigo && producto.Elimin==0)
        {
           printf("%i %s %0.2f\n", producto.codigo, producto.nombre, producto.precio,producto.tipo,producto.Cant);
            existe=1;
        }
        fread(&producto, sizeof(vregistro), 1, Archiv);
    }
    if (existe==0)
        printf("No existe un producto con dicho codigo\n");
    fclose(Archiv);
     cont();
}

void Eliminar(){
FILE *Archiv;
	int cod;
    Archiv=fopen("Materiales","rb+");
    if (Archiv==NULL){
    	printf("\nArchivo no existe! \nPor favor debe crearlo");
		return; 
	}
    printf("Ingrese el codigo de producto a borrar: ");
    scanf("%i", &cod);
    vregistro producto;
    int existe=0;
    fread(&producto, sizeof(vregistro), 1, Archiv);
    while(!feof(Archiv))
    {
        if (cod==producto.codigo && producto.Elimin==0)
        {
           producto.Elimin=1;
           int pos=ftell(Archiv)-sizeof(vregistro);
           fseek(Archiv,pos,SEEK_SET);
           fwrite(&producto, sizeof(vregistro), 1, Archiv);
           printf("Se borro dicho producto.\n");
           existe=1;
           break;
        }
        fread(&producto, sizeof(vregistro), 1, Archiv);
    }
    if (existe==0)
        printf("No existe un producto con dicho codigo\n");
    fclose(Archiv);
     cont();
}

int main(){
    int opcion;
    do {
    	
    	 printf("\n-------------------------------------------------<><><><><<><><>----------------------------------------------\n");
         printf("-----------------------------------------**FERRETERIA EL BUEN INGENIERO**-------------------------------------");
        printf("\n-------------------------------------------------<><><><><<><><>----------------------------------------------\n");
        printf("1 - Crear el Archivo\n");
        printf("2 - Ver Materiales Disponibles para venta\n");
        printf("3 - Insertar Datos\n");
        printf("4 - Visualizar datos Registrados\n");
        printf("5 - Modificacion Informacion Registrada\n");
        printf("6 - Eliminar \n");
        printf("7 - Buscar \n");
        printf("8 - Salir\n\n");
        printf("Selleccione Alguna Opcion Requerida: \n\n");
        scanf("%i",&opcion);
        
        switch (opcion) {
            case 1:archivo();
                   break;
            case 2:ver();
                   break;
            case 3:Ingresa();
                   break;
            case 4:Visualizar();
                   break;
            case 5:modificacion();
                   break;
            case 6:Eliminar();
                   break;
            case 7: buscar();
                    break;
            case 8: opcion=100;
                    break;
        }
    } while (opcion!=100);
    return 0;
}
