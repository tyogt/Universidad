import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese el tamaño de la tabla hash: ");
        int tamañoTabla = scanner.nextInt();
        TablaHashAbierta tablaHash = new TablaHashAbierta(tamañoTabla);

        Map<Integer, String> elementos = new HashMap<>();
        for (int i = 1; i <= tamañoTabla; i++) {
            System.out.print("Ingrese el valor para la clave " + i + ": ");
            String valor = scanner.next();
            elementos.put(i, valor);
        }

        tablaHash.insertar(elementos);
        System.out.println("Elementos insertados correctamente en la tabla hash.");

        int opcion = 0;
        do {
            System.out.println("\n----- Menu -----\n");
            System.out.println("1. Buscar elemento");
            System.out.println("2. Eliminar elemento");
            System.out.println("3. Salir");
            System.out.print("\nIngrese la opcion: ");
            opcion = scanner.nextInt();

            switch (opcion) {
                case 1:
                    System.out.print("Ingrese la clave del elemento a buscar: ");
                    int clave = scanner.nextInt();
                    Object elementoEncontrado = tablaHash.buscar(clave);
                    if (elementoEncontrado != null) {
                        System.out.println("Elemento encontrado: " + elementoEncontrado);
                    } else {
                        System.out.println("Elemento no encontrado.");
                    }
                    break;
                case 2:
                    System.out.print("Ingrese la clave del elemento a eliminar: ");
                    clave = scanner.nextInt();
                    tablaHash.eliminar(clave);
                    System.out.println("Elemento eliminado correctamente.");
                    break;
                case 3:
                    System.out.println("Saliendo del programa...");
                    break;
                default:
                    System.out.println("Opcion invalida. Intente nuevamente.");
                    break;
            }
        } while (opcion != 3);

        scanner.close();
    }
}
