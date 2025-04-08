import java.util.ArrayList;
import java.util.HashMap;

public class Postres {
    private HashMap<String, Postre> postres;

    public Postres() {
        postres = new HashMap<String, Postre>();
    }

    public void darDeAltaPostre(String nombre, String[] ingredientes) {
        Postre postre = new Postre(new ArrayList<String>());
        postre.insertarIngredientes(ingredientes);
        postres.put(nombre, postre);
        System.out.println("Se ha dado de alta el postre " + nombre);
    }

    public void imprimirIngredientes(String nombre) {
        Postre postre = postres.get(nombre);
        if (postre == null) {
            System.out.println("El postre " + nombre + " no existe");
            return;
        }
        postre.imprimirIngredientes();
    }

    public void insertarIngredientes(String nombre, String[] nuevosIngredientes) {
        Postre postre = postres.get(nombre);
        if (postre == null) {
            System.out.println("El postre " + nombre + " no existe");
            return;
        }
        postre.insertarIngredientes(nuevosIngredientes);
        System.out.println("Se han insertado nuevos ingredientes al postre " + nombre);
    }

    public void eliminarIngredientes(String nombre) {
        Postre postre = postres.get(nombre);
        if (postre == null) {
            System.out.println("El postre " + nombre + " no existe");
            return;
        }
        postre.eliminarIngredientes();
        System.out.println("Se han eliminado todos los ingredientes del postre " + nombre);
    }

    public void listarPostres() {
        if (postres.isEmpty()) {
            System.out.println("No hay postres dados de alta");
            return;
        }
        System.out.println("Listado de postres:");
        for (String nombre : postres.keySet()) {
            System.out.println("- " + nombre);
        }
    }
}
