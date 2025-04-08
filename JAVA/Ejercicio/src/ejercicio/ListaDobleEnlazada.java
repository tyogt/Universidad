package ejercicio;

public class ListaDobleEnlazada {

	    Nodo inicio;

	    public ListaDobleEnlazada() {
	        inicio = null;
	    }

	    public void agregarInicio(int dato) {
	        Nodo nuevoNodo = new Nodo(dato);

	        if (inicio == null) {
	            inicio = nuevoNodo;
	        } else {
	            nuevoNodo.siguiente = inicio;
	            inicio.anterior = nuevoNodo;
	            inicio = nuevoNodo;
	        }
	    }

	    public void imprimirLista() {
	        Nodo actual = inicio;

	        while (actual != null) {
	            System.out.print(actual.dato + " ");
	            actual = actual.siguiente;
	        }
	    }
	}

