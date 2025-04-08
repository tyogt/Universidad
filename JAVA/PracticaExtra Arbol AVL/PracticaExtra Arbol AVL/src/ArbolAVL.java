
public class ArbolAVL {
    Nodo raiz;

    public ArbolAVL() {
        this.raiz = null;
    }

    public Nodo agregar(Nodo nodo, int valor) {
        if (nodo == null) {
            return new Nodo(valor);
        }
        
        if (valor < nodo.valor) {
            nodo.izquierdo = agregar(nodo.izquierdo, valor);
        } else {
            nodo.derecho = agregar(nodo.derecho, valor);
        }
        
        nodo.altura = Math.max(obtenerAltura(nodo.izquierdo), obtenerAltura(nodo.derecho)) + 1;
        int balance = obtenerBalance(nodo);
        
        if (balance > 1 && valor < nodo.izquierdo.valor) {
            return rotacionDerecha(nodo);
        }
        
        if (balance < -1 && valor > nodo.derecho.valor) {
            return rotacionIzquierda(nodo);
        }
        
        if (balance > 1 && valor > nodo.izquierdo.valor) {
            nodo.izquierdo = rotacionIzquierda(nodo.izquierdo);
            return rotacionDerecha(nodo);
        }
        
        if (balance < -1 && valor < nodo.derecho.valor) {
            nodo.derecho = rotacionDerecha(nodo.derecho);
            return rotacionIzquierda(nodo);
        }
        
        return nodo;
    }
    
    public void agregar(int valor) {
        this.raiz = agregar(this.raiz, valor);
    }
    
    public void imprimirPreOrden(Nodo nodo) {
        if (nodo != null) {
            System.out.print(nodo.valor + " ");
            imprimirPreOrden(nodo.izquierdo);
            imprimirPreOrden(nodo.derecho);
        }
    }
    
    public void imprimirInOrden(Nodo nodo) {
        if (nodo != null) {
            imprimirInOrden(nodo.izquierdo);
            System.out.print(nodo.valor + " ");
            imprimirInOrden(nodo.derecho);
        }
    }
    
    private int obtenerAltura(Nodo nodo) {
        if (nodo == null) {
            return 0;
        }
        
        return nodo.altura;
    }
    
    private int obtenerBalance(Nodo nodo) {
        if (nodo == null) {
            return 0;
        }
        
        return obtenerAltura(nodo.izquierdo) - obtenerAltura(nodo.derecho);
    }
    
    private Nodo rotacionDerecha(Nodo nodo) {
        Nodo nuevoNodo = nodo.izquierdo;
        Nodo temp = nuevoNodo.derecho;
        
        nuevoNodo.derecho = nodo;
        nodo.izquierdo = temp;
        
        nodo.altura = Math.max(obtenerAltura(nodo.izquierdo), obtenerAltura(nodo.derecho)) + 1;
        nuevoNodo.altura = Math.max(obtenerAltura(nuevoNodo.izquierdo), obtenerAltura(nuevoNodo.derecho)) + 1;
        
        return nuevoNodo;
    }
    
 
    private Nodo rotacionIzquierda(Nodo nodo) {
        Nodo nuevoNodo = nodo.derecho;
        Nodo temp = nuevoNodo.izquierdo;

        nuevoNodo.izquierdo = nodo;
        nodo.derecho = temp;

        nodo.altura = Math.max(obtenerAltura(nodo.izquierdo), obtenerAltura(nodo.derecho)) + 1;
        nuevoNodo.altura = Math.max(obtenerAltura(nuevoNodo.izquierdo), obtenerAltura(nuevoNodo.derecho)) + 1;

        return nuevoNodo;
    }

        }
