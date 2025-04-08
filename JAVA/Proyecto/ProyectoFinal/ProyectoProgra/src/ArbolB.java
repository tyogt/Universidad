import java.util.ArrayList;
import java.util.List;

public class ArbolB<T extends Comparable<T>> {
    private Nodo raiz;
    private int orden;

    public ArbolB(int orden) {
        this.orden = orden;
        raiz = new Nodo();
    }

    public void insertar(T valor) {
        if (raiz.esHoja) {
            if (raiz.cantidad < orden - 1) {
                insertarEnNodo(valor, raiz);
            } else {
                Nodo nuevoNodo = new Nodo();
                nuevoNodo.hijos.add(raiz);
                dividirNodo(0, raiz, nuevoNodo);
                insertarEnNodo(valor, raiz);
            }
        } else {
            Nodo nodoActual = raiz;
            while (!nodoActual.esHoja) {
                int i = 0;
                while (i < nodoActual.cantidad && valor.compareTo(nodoActual.valores.get(i)) > 0) {
                    i++;
                }
                if (i < nodoActual.cantidad && valor.compareTo(nodoActual.valores.get(i)) == 0) {
                    return;
                } else if (nodoActual.hijos.get(i).cantidad == orden - 1) {
                    dividirNodo(i, nodoActual.hijos.get(i), nodoActual);
                    if (valor.compareTo(nodoActual.valores.get(i)) > 0) {
                        i++;
                    }
                }
                nodoActual = nodoActual.hijos.get(i);
            }
            if (nodoActual.cantidad < orden - 1) {
                insertarEnNodo(valor, nodoActual);
            } else {
                Nodo nuevoNodo = new Nodo();
                nuevoNodo.hijos.add(nodoActual);
                dividirNodo(0, nodoActual, nuevoNodo);
                insertarEnNodo(valor, nodoActual);
            }
        }
    }

    private void insertarEnNodo(T valor, Nodo nodo) {
        int i = 0;
        while (i < nodo.cantidad && valor.compareTo(nodo.valores.get(i)) > 0) {
            i++;
        }
        nodo.valores.add(i, valor);
        nodo.cantidad++;
    }

    private void dividirNodo(int indice, Nodo nodo, Nodo nodoPadre) {
        Nodo nuevoNodo = new Nodo();
        nuevoNodo.esHoja = nodo.esHoja;

        for (int i = orden / 2; i < orden - 1; i++) {
            nuevoNodo.valores.add(nodo.valores.get(i));
        }

        if (!nodo.esHoja) {
            for (int i = orden / 2; i < orden; i++) {
                nuevoNodo.hijos.add(nodo.hijos.get(i));
            }
            for (int i = nodo.cantidad - 1; i >= orden / 2; i--) {
                nodo.hijos.remove(i);
            }
        }

        for (int i = nodo.cantidad - 1; i >= orden / 2; i--) {
            nodo.valores.remove(i);
        }

        nodo.cantidad = orden / 2;

        nodoPadre.hijos.add(indice + 1, nuevoNodo);
        nodoPadre.valores.add(indice, nuevoNodo.valores.get(0));
        nodoPadre.cantidad++;
    }

    public List<T> buscar(T valor) {
        List<T> resultados = new ArrayList<>();
        buscarEnNodo(valor, raiz, resultados);
        return resultados;
    }

    private void buscarEnNodo(T valor, Nodo nodo, List<T> resultados) {
        int i = 0;
        while (i < nodo.cantidad && valor.compareTo(nodo.valores.get(i)) > 0) {
            i++;
        }
        if (i < nodo.cantidad && valor.compareTo(nodo.valores.get(i)) == 0) {
            resultados.add(nodo.valores.get(i));
        }
        if (!nodo.esHoja) {
            buscarEnNodo(valor, nodo.hijos.get(i), resultados);
        }
    }

    private class Nodo {
        private List<T> valores;
        private List<Nodo> hijos;
        private boolean esHoja;
        private int cantidad;

        public Nodo() {
            valores = new ArrayList<>();
            hijos = new ArrayList<>();
            esHoja = true;
            cantidad = 0;
        }
    }

	public int obtenerNumeroDivisiones() {
		// TODO Auto-generated method stub
		return 0;
	}

	public String[] inorden() {
		// TODO Auto-generated method stub
		return null;
	}
}
