#include <iostream>
#include <fstream>
#include <cstring>
#include <conio.h>
#include <stdio.h>

using namespace std;

struct sRegistro {
char producto[25];
int codigo;
float precio;
} registro;

int opcion;
int salida = 0;
FILE *fichero;

void menu()
{
    printf("\n");
    printf(" Menu:");
    printf("\n");
    printf(" 1. Crear fichero");
    printf("\n");
    printf(" 2. Insertar datos");
    printf("\n");
    printf(" 3. Ver datos");
    printf("\n");
    printf(" 4. Salir");
    printf("\n");
}

void CrearFichero(FILE *Fichero)
{
    Fichero = fopen("fichero", "r");
    if (!Fichero){
        Fichero = fopen("fichero", "w");
        printf("\n Archivo creado!");
        }
    else
    {
        printf("\nEl fichero ya existe!");
    }
    fclose (Fichero);
}

void InsertarDatos(FILE *Fichero) 
{
    Fichero = fopen("fichero", "a+");
    if(Fichero == NULL){
        printf("\nFichero no existe! \nPorfavor creelo");
        return;
        }
    printf("******************************\n");
    printf("nombre producto: ");
    scanf("%s", &registro.producto);
    printf("Código producto: ");
    scanf("%d", &registro.codigo);
    printf("Precio producto: ");
    scanf("%f", &registro.precio);
    fwrite(&registro, sizeof(registro), 1, Fichero);
    fclose(Fichero);
}

void enca()
{
printf("**********************************\n");
printf("Numero Codigo Nombre    Precio\n");
}

void VerDatos(FILE *Fichero)
{
    enca();
    int numero = 1;
    Fichero = fopen("fichero", "r");
    if(Fichero == NULL)
    {
        printf("\nFichero no existe! \nPor favor creelo");
        return;
    }
    fread(&registro, sizeof(struct sRegistro), 1, Fichero);
    while(!feof(Fichero))
    {
        printf("\%d ", numero);
        printf("\%d ",  registro.codigo);
        printf("\%s " , registro.producto);
        printf("\%.2f", registro.precio);
        fread(&registro, sizeof(struct sRegistro), 1, Fichero);
        numero++;
        printf("\n");
    }
    fclose(Fichero);
}

int main() 
{
    while (!salida) {
        menu();
        printf("Opcion: ");
        scanf("%d", &opcion);
        switch(opcion) 
        {
            case 1: CrearFichero(fichero); break;
            case 2: InsertarDatos(fichero); break;
            case 3: VerDatos(fichero); break;
            case 4: salida = 1; break;
            default: printf("\n Opcion no valida");
        }
    }
return 0;
}
