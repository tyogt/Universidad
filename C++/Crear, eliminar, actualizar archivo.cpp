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
	int codigo;
	char nombre[MAX];
	float costo;
	float precio;
	int cantidad;
};
 
typedef struct producto Producto;

void menuPrincipal();
void menuInsertar();
void menuBuscar();
void menuEliminar();
void menuMostrar();
void menuModificar();
void menuEliminarFisica();
 
Producto *obtenerProductos(int *n); 
char existeProducto(int codigoProducto, Producto *producto); 
char insertarProducto(Producto producto); 
char eliminarProducto(int codigoProducto); 
char eliminacionFisica(); 
char modificarProducto(Producto producto);
char guardarReporte(); 
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
		printf("\n\t\t[1]. Insertar nuevo producto\n");
		printf("\t\t[2]. Mostrar listado de productos\n");
		printf("\t\t[3]. Eliminar un producto\n");
		printf("\t\t[4]. Buscar producto por clave\n");
		printf("\t\t[5]. Modificar un producto\n");
		printf("\t\t[6]. Salir\n");
		printf("\n\t\tIngrese su opción: [ ]\b\b");
 
		leecad(linea, MAX);
		sscanf(linea, "%d", &opcion);
 
		switch (opcion) {
 
			case 1:
				menuInsertar();
				break;
 
			case 2:
				menuMostrar();
				break;
 
			case 3:
				menuEliminar();
				break;
 
			case 4:
				menuBuscar();
				break;
 
			case 5:
				menuModificar();
				break;
 
			case 6:
					repite = 0;
				break;
 
		}
 
	} while (repite);
}
 
void menuInsertar()
{
	Producto producto;
	int codigoProducto = 0;
	char repite = 1;
	char respuesta[MAX];
 
	do {
		system(CLEAR);
		tituloPrincipal();
		printf("\n\t\t\t==> INSERTAR PRODUCTO <==\n");
 
		printf("\n\tCódigo de producto: ");
		leecad(linea, MAX);
		sscanf(linea, "%d", &codigoProducto);
 
		if (!existeProducto(codigoProducto, &producto)) {
 
			producto.codigo = codigoProducto;
 
			printf("\tNombre del producto: ");
			leecad(producto.nombre, MAX);
 
			printf("\tCosto del producto ($): ");
			leecad(linea, MAX);
			sscanf(linea, "%f", &producto.costo);
 
			printf("\tPrecio del producto ($): ");
			leecad(linea, MAX);
			sscanf(linea, "%f", &producto.precio);
 
			printf("\tCantidad: ");
			leecad(linea, MAX);
			sscanf(linea, "%d", &producto.cantidad);
 
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
 
void menuBuscar()
{
	Producto producto;
	int codigoProducto;
	char repite = 1;
	char respuesta[MAX];
 
	do {
		system(CLEAR);
		tituloPrincipal();
		printf("\n\t\t\t==> BUSCAR PRODUCTO POR CÓDIGO <==\n");

		printf("\n\tCódigo de producto: ");
		leecad(linea, MAX);
		sscanf(linea, "%d", &codigoProducto);
 
		if (existeProducto(codigoProducto, &producto)) {
 
			printf("\n\tCódigo del producto: %d\n", producto.codigo);
			printf("\tNombre del producto: %s\n", producto.nombre);			
			printf("\tCosto del producto: %.1f $\n", producto.costo);
			printf("\tPrecio del producto: %.1f $\n", producto.precio);
			printf("\tCantidad: %d\n", producto.cantidad);
 
		} else {
			printf("\n\tEl producto de código %d no existe.\n", codigoProducto);
		}
 
		printf("\n\tDesea seguir buscando algún producto? [S/N]: ");
		leecad(respuesta, MAX);
 
		if (!(strcmp(respuesta, "S") == 0 || strcmp(respuesta, "s") == 0)) {
			repite = 0;
		}
 
	} while (repite);
}
 
void menuEliminar()
{
	Producto producto;
	int codigoProducto;
	char repite = 1;
	char respuesta[MAX];
 
	do {
		system(CLEAR);
		tituloPrincipal();
		printf("\n\t\t\t==> ELIMINAR PRODUCTO POR CÓDIGO <==\n");
 
		printf("\n\tCódigo de producto: ");
		leecad(linea, MAX);
		sscanf(linea, "%d", &codigoProducto);

		if (existeProducto(codigoProducto, &producto)) {
 
			printf("\n\tCódigo del producto: %d\n", producto.codigo);
			printf("\tNombre del producto: %s\n", producto.nombre);			
			printf("\tCosto del producto: %.1f $\n", producto.costo);
			printf("\tPrecio del producto: %.1f $\n", producto.precio);
			printf("\tCantidad: %d\n", producto.cantidad);
 
			printf("\n\tSeguro que desea eliminar el producto? [S/N]: ");
			leecad(respuesta, MAX);
			if (strcmp(respuesta, "S") == 0 || strcmp(respuesta, "s") == 0) {
				if (eliminarProducto(codigoProducto)) {
					printf("\n\tProducto eliminado satisfactoriamente.\n");
				} else {
					printf("\n\tEl producto no pudo ser eliminado\n");
				}
			}
 
		} else {
			printf("\n\tEl producto de código %d no existe.\n", codigoProducto);
		}
 
		printf("\n\tDesea eliminar otro producto? [S/N]: ");
		leecad(respuesta, MAX);
 
		if (!(strcmp(respuesta, "S") == 0 || strcmp(respuesta, "s") == 0)) {
			repite = 0;
		}
 
	} while (repite);
}
 
void menuMostrar()
{
	Producto *productos;
	int numeroProductos;
	int i;
	float costoTotal;
	float precioTotal;
	int cantidadTotal;
	char respuesta[MAX];
 
	system(CLEAR);
	tituloPrincipal();
	productos = obtenerProductos(&numeroProductos);
 
	if (numeroProductos == 0) {
		printf("\n\tEl archivo está vacío!!\n");
		getchar();
 
	} else {
		printf("\n\t\t    ==> LISTADO DE PRODUCTOS REGISTRADOS <==\n");
		printf(" ------------------------------------------------------------------------------\n");
		printf("%8s\t%-20s%15s%15s%10s\n", "CODIGO", "NOMBRE", "COSTO Q", "PRECIO Q", "CANTIDAD");
		printf(" ------------------------------------------------------------------------------\n");

		costoTotal = 0;
		precioTotal = 0;
		cantidadTotal = 0;
		for (i = 0; i < numeroProductos; i++) {
			if (productos[i].codigo != VALOR_CENTINELA) {
				printf("%7d \t%-20.20s%15.1f%15.1f%8d\n", productos[i].codigo, productos[i].nombre, productos[i].costo, productos[i].precio, productos[i].cantidad);
				costoTotal += productos[i].costo;
				precioTotal += productos[i].precio;
				cantidadTotal += productos[i].cantidad;
			}
		}
		printf(" ------------------------------------------------------------------------------\n");
		printf("\t\t\t      TOTAL: %15.1f%15.1f%8d\n", costoTotal, precioTotal, cantidadTotal);
 
		printf("\n\tDesea guardar el reporte en un archivo de texto? [S/N]: ");
		leecad(respuesta, MAX);
 
		if (strcmp(respuesta, "S") == 0 || strcmp(respuesta, "s") == 0) {
			if (guardarReporte()) {
				printf("\n\tEl reporte fue guardado con éxito\n");
			} else {
				printf("\n\tOcurrió un error al guardar el reporte\n");
			}
 
			getchar();
		}
	}
}
 
void menuModificar()
{
	Producto producto;
	int codigoProducto;
	char repite = 1;
	char respuesta[MAX];
 
	do {
		system(CLEAR);
		tituloPrincipal();
		printf("\n\t\t\t==> MODIFICAR PRODUCTO POR CÓDIGO <==\n");
 
		printf("\n\tCódigo de producto: ");
		leecad(linea, MAX);
		sscanf(linea, "%d", &codigoProducto);
 
		if (existeProducto(codigoProducto, &producto)) {
 
			printf("\n\tNombre del producto: %s\n", producto.nombre);
			printf("\tCosto del producto ($): %.1f\n", producto.costo);
			printf("\tPrecio del producto ($): %.1f\n", producto.precio);
			printf("\tCantidad: %d\n", producto.cantidad);
 
			printf("\n\tElija los datos a modificar\n");
 
			printf("\n\tNombre del producto actual: %s\n", producto.nombre);
			printf("\tDesea modificar el nombre del producto? [S/N]: ");
			leecad(respuesta, MAX);
			if (strcmp(respuesta, "S") == 0 || strcmp(respuesta, "s") == 0) {
				printf("\tNuevo nombre del producto: ");
				leecad(producto.nombre, MAX);
			}
 
			printf("\n\tCosto del producto actual: %.1f\n", producto.costo);
			printf("\tDesea modificar el costo del producto? [S/N]: ");
			leecad(respuesta, MAX);
			if (strcmp(respuesta, "S") == 0 || strcmp(respuesta, "s") == 0) {
				printf("\tNuevo costo del producto: ");
				leecad(linea, MAX);
				sscanf(linea, "%f", &producto.costo);
			}
 
			printf("\n\tPrecio del producto actual: %.1f\n", producto.precio);
			printf("\tDesea modificar el precio del producto? [S/N]: ");
			leecad(respuesta, MAX);
			if (strcmp(respuesta, "S") == 0 || strcmp(respuesta, "s") == 0) {
				printf("\tNuevo precio del producto: ");
				leecad(linea, MAX);
				sscanf(linea, "%f", &producto.precio);
			}
 
			printf("\n\tCantidad del producto actual: %d\n", producto.cantidad);
			printf("\tDesea modificar la cantidad del producto? [S/N]: ");
			leecad(respuesta, MAX);
			if (strcmp(respuesta, "S") == 0 || strcmp(respuesta, "s") == 0) {
				printf("\tNueva cantidad del producto: ");
				leecad(linea, MAX);
				sscanf(linea, "%d", &producto.cantidad);
			}
 
			printf("\n\tEstá seguro que desea modificar los datos del producto? [S/N]: ");
			leecad(respuesta, MAX);
 
			if (strcmp(respuesta, "S") == 0 || strcmp(respuesta, "s") == 0) {
			
				if (modificarProducto(producto)) {
					printf("\n\tEl producto fue modificado correctamente\n");
 
				} else {
					printf("\n\tOcurrió un error al intentar modificar el producto\n");
					printf("\tInténtelo mas tarde\n");
				}
			}
		} else {
		
			printf("\n\tEl producto de código %d no existe.\n", codigoProducto);
		}
 
		printf("\n\tDesea modificar algún otro producto? [S/N]: ");
		leecad(respuesta, MAX);
 
		if (!(strcmp(respuesta, "S") == 0 || strcmp(respuesta, "s") == 0)) {
			repite = 0;
		}
 
	} while (repite);
}
 
 
Producto *obtenerProductos(int *n)
{
	FILE *archivo;
	Producto producto;
	Producto *productos; 
	int i;
 
	archivo = fopen("productos.dat", "rb");
 
	if (archivo == NULL) { 
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
 
	archivo = fopen("productos.dat", "rb");
 
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

	archivo = fopen("productos.dat", "ab");	
 
	if (archivo == NULL) { 
		insercion = 0;
 
	} else {
		fwrite(&producto, sizeof(producto), 1, archivo);
		insercion = 1;
 
		fclose(archivo);
	}
 
	return insercion;
}
 
char eliminarProducto(int codigoProducto)
{
	FILE *archivo;
	FILE *auxiliar;
	Producto producto;
	char elimina;
 
	archivo = fopen("productos.dat", "r+b");	
 
	if (archivo == NULL) { 
		elimina = 0;
 
	} else {
 
		elimina = 0;
		fread(&producto, sizeof(producto), 1, archivo);
		while (!feof(archivo)) {
			if (producto.codigo == codigoProducto) {
				fseek(archivo, ftell(archivo) - sizeof(producto), SEEK_SET);
				producto.codigo = VALOR_CENTINELA;
				fwrite(&producto, sizeof(producto), 1, archivo);
				elimina = 1;
				break;
			}
			fread(&producto, sizeof(producto), 1, archivo);
		}

		fclose(archivo);
	}
 
	return elimina;
}
 
 
char modificarProducto(Producto producto)
{
	FILE *archivo;
	char modifica;
	Producto producto2;
 
	archivo = fopen("productos.dat", "rb+");
 
	if (archivo == NULL) { 
		modifica = 0;
 
	} else {
		modifica = 0;
		fread(&producto2, sizeof(producto2), 1, archivo);
		while (!feof(archivo)) {
			if (producto2.codigo == producto.codigo) {
				fseek(archivo, ftell(archivo) - sizeof(producto), SEEK_SET);
				fwrite(&producto, sizeof(producto), 1, archivo);
				modifica = 1;
				break;
			}
			fread(&producto2, sizeof(producto2), 1, archivo);
		}
 
		fclose(archivo);
	}
 
	return modifica;
}
 
char guardarReporte()
{
	FILE *archivo;
	char guardado;
	Producto *productos;
	int numeroProductos;
	int i;
	float costoTotal;
	float precioTotal;
	int cantidadTotal;
 
	productos = obtenerProductos(&numeroProductos); 
 
	if (numeroProductos == 0) {
		guardado = 0;
 
	} else {
	
		archivo = fopen("reporte.txt", "w");
 
		if (archivo == NULL) { 
			guardado = 0;
 
		} else {
			fprintf(archivo, "\n\t\t    ==> LISTADO DE PRODUCTOS REGISTRADOS <==\n");
			fprintf(archivo, " ------------------------------------------------------------------------------\n");
			fprintf(archivo, "%8s\t%-20s%15s%15s%10s\n", "CODIGO", "NOMBRE", "COSTO Q", "PRECIO Q", "CANTIDAD");
			fprintf(archivo, " ------------------------------------------------------------------------------\n");
 
			costoTotal = 0;
			precioTotal = 0;
			cantidadTotal = 0;
			for (i = 0; i < numeroProductos; i++) {
				if (productos[i].codigo != VALOR_CENTINELA) {
					fprintf(archivo, "%7d \t%-20.20s%15.1f%15.1f%8d\n", productos[i].codigo, productos[i].nombre, productos[i].costo, productos[i].precio, productos[i].cantidad);
					costoTotal += productos[i].costo;
					precioTotal += productos[i].precio;
					cantidadTotal += productos[i].cantidad;
				}
			}
			fprintf(archivo, " ------------------------------------------------------------------------------\n");
			fprintf(archivo, "\t\t\t      TOTAL: %15.1f%15.1f%8d", costoTotal, precioTotal, cantidadTotal);
 
			guardado = 1;
 
			fclose(archivo);
		}
	}
	
	free(productos);
	productos = NULL;
 
	return guardado;
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

	if (c != '\n' && c != EOF) 
		while ((c = getchar()) != '\n' && c != EOF);
 
	return 1;
}
