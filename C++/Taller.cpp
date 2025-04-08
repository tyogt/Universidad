#ifdef _WIN32
#define CLEAR "cls"
#else
#define CLEAR "clear"
#endif

#include <stdio.h>	
#include <string.h>
#include <stdlib.h>	
#include <locale.h> 
 
#define MAX 80
#define VALOR_CENTINELA -1
 
struct producto {
	char codigo;
	char nombre[MAX];
	float costo;
	char vehiculo[MAX];
	char placa[MAX];
	float precio;
};
 
typedef struct producto Producto;
 
void menuPrincipal();
void menuRepuesto();
void menuInforme();

Producto *obtenerProductos(int *n); 
char existeProducto(int codigoProducto, Producto *producto); 
char insertarProducto(Producto producto); 

 
int leecad(char *cad, int n);
 
void tituloPrincipal();
 
char linea[MAX];
 
int main()
{
	setlocale(LC_ALL, "spanish"); 
	menuPrincipal();
 
	return 0;
}
 
void menuPrincipal()
{
	char repite = 1;
	int opcion = -1;
	
	do {
		system(CLEAR);
 
		tituloPrincipal();
 
		printf("\n\t\t\t\tMENU PRINCIPAL\n");
		printf("\t\t[1]. Servicio y Repuesto\n");
		printf("\t\t[2]. Mostrar Informe\n");
		printf("\t\t[3]. Salir\n");
		printf("\n\t\tIngrese su opción: [ ]\b\b");
 
		leecad(linea, MAX);
		sscanf(linea, "%d", &opcion);
 
		switch (opcion) {
 
			case 1:
				menuRepuesto();
				break;
 
			case 2:
				menuInforme();
				break;
 
			case 3:
				repite = 0;
				break;
		}
 
	} while (repite);
}
 
void menuRepuesto()
{
	Producto producto;
	int codigoProducto = 0;
	char repite = 1;
	char respuesta[MAX];
 
	do {
		system(CLEAR);
		tituloPrincipal();
		printf("\n\t\t\t==> INSERTAR PRODUCTO <==\n");
		
		printf("\n\tCódigo de repuesto: ");
		leecad(linea, MAX);
		sscanf(linea, "%d", &codigoProducto);
 
		if (!existeProducto(codigoProducto, &producto)) {
 
			producto.codigo = codigoProducto;
			printf("\tNombre del repuesto: ");
			leecad(producto.nombre, MAX);
 
			printf("\tPrecio de repuesto (Q): ");
			leecad(linea, MAX);
			sscanf(linea, "%f", &producto.costo);
			
			printf("\tVehiculo: ");
			leecad(producto.vehiculo, MAX);
			
			printf("\tPlaca: ");
			leecad(producto.placa, MAX);
 
			printf("\tPrecio de servicio (Q): ");
			leecad(linea, MAX);
			sscanf(linea, "%f", &producto.precio);
 
			if (insertarProducto(producto)) {
				printf("\n\tEl producto fue insertado correctamente\n");
 
			} else {
				printf("\n\tOcurrió un error al intentar insertar el producto\n");
				printf("\tInténtelo mas tarde\n");
			}
		} else {
			printf("\n\tEl producto de código %d ya existe.\n", codigoProducto);
			printf("\tNo puede ingresar dos productos distintos con el mismo código.\n");
		}
 
		printf("\n\tDesea seguir ingresando productos? [S/N]: ");
		leecad(respuesta, MAX);
 
		if (!(strcmp(respuesta, "S") == 0 || strcmp(respuesta, "s") == 0)) {
			repite = 0;
		}
 
	} while (repite);
}
 
void menuInforme()
{
	Producto *productos;
	int numeroProductos;
	int i;
	float costoTotal;
	float precioTotal;
	float Total;
	char respuesta[MAX];
 
	system(CLEAR);
	tituloPrincipal();
	productos = obtenerProductos(&numeroProductos); 
 
	if (numeroProductos == 0) {
		printf("\n\tEl archivo está vacío!!\n");
		getchar();
 
	} else {
		printf(" ------------------------------------------------------------------------------\n");
		printf("\t\t       IINGRESOS \n");
		printf(" ------------------------------------------------------------------------------\n");
		printf("SERVICIOS MENORES REALIZADOS\n");
		printf(" ------------------------------------------------------------------------------\n");
		printf("%8s\t%-20s%15s%\n", "VEHICULO", "PLACA", "COSTO Q");
		printf(" ------------------------------------------------------------------------------\n");
		precioTotal = 0;
		for (i = 0; i < numeroProductos; i++) {
			
				printf("%7s \t%-20.20s%15.1f%\n", productos[i].vehiculo, productos[i].placa, productos[i].precio);
				precioTotal += productos[i].precio;

		}
	
		printf("\n\t\t\tTOTAL SERVICIO MENORES==> %15.1f\n", precioTotal);
		printf(" ------------------------------------------------------------------------------\n");
		
		printf("VENTA DE REPUESTOS\n");
		printf(" ------------------------------------------------------------------------------\n");
		printf("%8s\t%-20s%15s%\n", "CODIGO", "NOMBRE", "COSTO Q");
		printf(" ------------------------------------------------------------------------------\n");
		costoTotal = 0;
		for (i = 0; i < numeroProductos; i++) {
			if (productos[i].codigo != VALOR_CENTINELA) {
				printf("%7d \t%-20.20s%15.1f%\n", productos[i].codigo, productos[i].nombre, productos[i].costo);
				costoTotal += productos[i].costo;

			}
		}
	
		printf("\n\t\t\tTOTAL VENTA DE REPUESTO==> %15.1f\n", costoTotal);
		printf(" ------------------------------------------------------------------------------\n");
		
		Total=precioTotal + costoTotal;
		printf("\n\t\t\tTOTAL DE INGRESO: %15.1f\n", Total);
		
	}
 
			getchar();
}
 
Producto *obtenerProductos(int *n)
{
	FILE *archivo;
	Producto producto;
	Producto *productos; 
	int i;

	archivo = fopen("Taller.dat", "rb");
 
	if (archivo == NULL) {/* Si no se pudo abrir el archivo, el valor de archivo es NULL */
		*n = 0; 
		productos = NULL;
 
	} else {
 
		fseek(archivo, 0, SEEK_END);
		*n = ftell(archivo) / sizeof(Producto); 
		productos = (Producto *)malloc((*n) * sizeof(Producto));

		fseek(archivo, 0, SEEK_SET); 
		fread(&producto, sizeof(producto), 1, archivo);
		i = 0;
		while (!feof(archivo)) {
			productos[i++] = producto;
			fread(&producto, sizeof(producto), 1, archivo);
		}
 
		fclose(archivo);
	}
 
	return productos;
}
 
char existeProducto(int codigoProducto, Producto *producto)
{
	FILE *archivo;
	char existe;
 
	archivo = fopen("Taller.dat", "rb");
 
	if (archivo == NULL) { 
		existe = 0;
 
	} else {
		existe = 0;

		fread(&(*producto), sizeof(*producto), 1, archivo);
		while (!feof(archivo)) {
			if ((*producto).codigo == codigoProducto) {
				existe = 1;
				break;
			}
			fread(&(*producto), sizeof(*producto), 1, archivo);
		}
 
		fclose(archivo);
	}
 
	return existe;
}
 
char insertarProducto(Producto producto)
{
	FILE *archivo;
	char insercion;
 
	archivo = fopen("Taller.dat", "ab");	
 
	if (archivo == NULL) { 
		insercion = 0;
 
	} else {
		fwrite(&producto, sizeof(producto), 1, archivo);
		insercion = 1;
 
		fclose(archivo);
	}
 
	return insercion;
}
 
 
int leecad(char *cad, int n)
{
	int i, c;
	c = getchar();
	if (c == EOF) {
		cad[0] = '\0';
		return 0;
	}
 
	if (c == '\n') {
		i = 0;
	} else {

		cad[0] = c;
		i = 1;
	}
 
	for (; i < n - 1 && (c = getchar()) != EOF && c != '\n'; i++) {
		cad[i] = c;
	}
	cad[i] = '\0';
 
	if (c != '\n' && c != EOF) /* es un caracter */
		while ((c = getchar()) != '\n' && c != EOF);
 
	return 1;
}
 
void tituloPrincipal()
{
	printf("\n********************************************************************************\n");
	printf("\t\t\t     TALLER AUTOMOTRIZ\n");
	printf("\t\t        Sevicios y Venta de Repuesto\n");
	printf("********************************************************************************\n\n");
}
