public class NodoArbol {

    private char valor;
    private NodoArbol izquierda;
    private NodoArbol derecha;

    public NodoArbol(char valor) {
        this.valor = valor;
        this.izquierda = null;
        this.derecha = null;
    }

    public char getValor() {
        return valor;
    }

    public NodoArbol getIzquierda() {
        return izquierda;
    }

    public void setIzquierda(NodoArbol izquierda) {
        this.izquierda = izquierda;
    }

    public NodoArbol getDerecha() {
        return derecha;
    }

    public void setDerecha(NodoArbol derecha) {
        this.derecha = derecha;
    }
}
