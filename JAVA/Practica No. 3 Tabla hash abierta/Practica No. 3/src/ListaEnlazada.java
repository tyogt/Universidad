public class ListaEnlazada {
    private NodoLista primerNodo;

    public ListaEnlazada() {
        this.primerNodo = null;
    }

    public void insertar(int clave, Object valor) {
        NodoLista nuevoNodo = new NodoLista(clave, valor);
        if (primerNodo == null) {
            primerNodo = nuevoNodo;
        } else {
            NodoLista nodoActual = primerNodo;
            while (nodoActual.getSiguiente() != null) {
                nodoActual = nodoActual.getSiguiente();
            }
            nodoActual.setSiguiente(nuevoNodo);
        }
    }

    public Object buscar(int clave) {
        NodoLista nodoActual = primerNodo;
        while (nodoActual != null) {
            if (nodoActual.getClave() == clave) {
                return nodoActual.getValor();
            }
            nodoActual = nodoActual.getSiguiente();
        }
        return null;
    }

    public void eliminar(int clave) {
        if (primerNodo != null) {
            if (primerNodo.getClave() == clave) {
                primerNodo = primerNodo.getSiguiente();
            } else {
                NodoLista nodoAnterior = primerNodo;
                NodoLista nodoActual = nodoAnterior.getSiguiente();
                while (nodoActual != null) {
                    if (nodoActual.getClave() == clave) {
                        nodoAnterior.setSiguiente(nodoActual.getSiguiente());
                        break;
                    }
                    nodoAnterior = nodoActual;
                    nodoActual = nodoActual.getSiguiente();
                }
            }
        }
    }

    private class NodoLista {
        private int clave;
        private Object valor;
        private NodoLista siguiente;

        public NodoLista(int clave, Object valor) {
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

        public NodoLista getSiguiente() {
            return siguiente;
        }

        public void setSiguiente(NodoLista siguiente) {
            this.siguiente = siguiente;
        }
    }
}
