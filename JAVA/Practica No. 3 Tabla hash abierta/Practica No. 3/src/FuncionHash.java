public class FuncionHash {
    private int tamañoTabla;

    public FuncionHash(int tamañoTabla) {
        this.tamañoTabla = tamañoTabla;
    }

    public int calcularHash(int clave) {
        return clave % tamañoTabla;
    }
}
