import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Postres postres = new Postres();

        boolean salir = false;
        while (!salir) {
            System.out.println("Ingrese la opcion que desea realizar:");
            System.out.println("1. Dar de alta un postre.");
            System.out.println("2. Imprimir los ingredientes de un postre.");
            System.out.println("3. Insertar nuevos ingredientes a un postre.");
            System.out.println("4. Eliminar los ingredientes de un postre.");
            System.out.println("5. Listar los postres.");
            System.out.println("6. Salir.");

            String opcion = scanner.nextLine();

            if (opcion.equals("1")) {
                System.out.println("Ingrese el nombre del postre:");
                String nombre = scanner.nextLine();
                System.out.println("Ingrese los ingredientes separados por comas:");
                String ingredientesString = scanner.nextLine();
                String[] ingredientes = ingredientesString.split(",");
                postres.darDeAltaPostre(nombre, ingredientes);
            } else if (opcion.equals("2")) {
                System.out.println("Ingrese el nombre del postre:");
                String nombre = scanner.nextLine();
                postres.imprimirIngredientes(nombre);
            } else if (opcion.equals("3")) {
                System.out.println("Ingrese el nombre del postre:");
                String nombre = scanner.nextLine();
                System.out.println("Ingrese los nuevos ingredientes separados por comas:");
                String ingredientesString = scanner.nextLine();
                String[] ingredientes = ingredientesString.split(",");
                postres.insertarIngredientes(nombre, ingredientes);
            } else if (opcion.equals("4")) {
                System.out.println("Ingrese el nombre del postre:");
                String nombre = scanner.nextLine();
                postres.eliminarIngredientes(nombre);
            } else if (opcion.equals("5")) {
                postres.listarPostres();
            } else if (opcion.equals("6")) {
                salir = true;
            } else {
                System.out.println("Opcion invalida.");
            }
        }

        scanner.close();
    }
}
