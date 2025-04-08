import java.util.HashMap;
import java.util.Map;

public class TablaHashAbierta<T> {
    private NodoHash<T>[] tabla;
    private int tamaño;

    public TablaHashAbierta(int tamaño) {
        this.tamaño = tamaño;
        tabla = new NodoHash[tamaño];
    }

    public void insertar(Map<Integer, T> elementos) {
        for (Map.Entry<Integer, T> entry : elementos.entrySet()) {
            int clave = entry.getKey();
            T valor = entry.getValue();
            int indice = calcularIndice(clave);
            NodoHash<T> nodo = new NodoHash<>(clave, valor);

            if (tabla[indice] == null) {
                tabla[indice] = nodo;
            } else {
                NodoHash<T> nodoActual = tabla[indice];
                while (nodoActual.getSiguiente() != null) {
                    nodoActual = nodoActual.getSiguiente();
                }
                nodoActual.setSiguiente(nodo);
            }
        }
    }

    public T buscar(int clave) {
        int indice = calcularIndice(clave);
        NodoHash<T> nodoActual = tabla[indice];
        while (nodoActual != null) {
            if (nodoActual.getClave() == clave) {
                return nodoActual.getValor();
            }
            nodoActual = nodoActual.getSiguiente();
        }
        return null;
    }

    public void eliminar(int clave) {
        int indice = calcularIndice(clave);
        NodoHash<T> nodoAnterior = null;
        NodoHash<T> nodoActual = tabla[indice];

        while (nodoActual != null) {
            if (nodoActual.getClave() == clave) {
                if (nodoAnterior == null) {
                    tabla[indice] = nodoActual.getSiguiente();
                } else {
                    nodoAnterior.setSiguiente(nodoActual.getSiguiente());
                }
                return;
            }
            nodoAnterior = nodoActual;
            nodoActual = nodoActual.getSiguiente();
        }
    }

    private int calcularIndice(int clave) {
        return clave % tamaño;
    }

    private static class NodoHash<T> {
        private int clave;
        private T valor;
        private NodoHash<T> siguiente;

        public NodoHash(int clave, T valor) {
            this.clave = clave;
            this.valor = valor;
            this.siguiente = null;
        }

        public int getClave() {
            return clave;
        }

        public T getValor() {
            return valor;
        }

        public void setValor(T valor) {
            this.valor = valor;
        }

        public NodoHash<T> getSiguiente() {
            return siguiente;
        }

        public void setSiguiente(NodoHash<T> siguiente) {
            this.siguiente = siguiente;
        }
    }
}
