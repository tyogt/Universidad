import java.util.ArrayList;

public class Postre {
    private ArrayList<String> ingredientes;

    public Postre(ArrayList<String> ingredientes) {
        this.ingredientes = ingredientes;
    }

    public ArrayList<String> getIngredientes() {
        return ingredientes;
    }

    public void setIngredientes(ArrayList<String> ingredientes) {
        this.ingredientes = ingredientes;
    }

    public void imprimirIngredientes() {
        System.out.println("Ingredientes:");
        for (String ingrediente : ingredientes) {
            System.out.println("- " + ingrediente);
        }
    }

    public void insertarIngredientes(String[] nuevosIngredientes) {
        for (String ingrediente : nuevosIngredientes) {
            ingredientes.add(ingrediente);
        }
    }

    public void eliminarIngredientes() {
        ingredientes.clear();
    }
}
