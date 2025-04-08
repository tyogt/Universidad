public class NodoHash {
    private int clave;
    private Object valor;
    private NodoHash siguiente;

    public NodoHash(int clave, Object valor) {
        this.clave = clave;
        this.valor = valor;
        this.siguiente = null;
    }

    public int getClave() {
        return clave;
    }

    public Object getValor() {
        return valor;
    }

    public void setValor(Object valor) {
        this.valor = valor;
    }

    public NodoHash getSiguiente() {
        return siguiente;
    }

    public void setSiguiente(NodoHash siguiente) {
        this.siguiente = siguiente;
    }
}
