import java.util.Stack;

public class ArbolExpresion {

    private NodoArbol raiz;

    public ArbolExpresion(String expresion) {
        this.raiz = construirArbol(expresion);
    }

    public NodoArbol getRaiz() {
        return raiz;
    }

    private NodoArbol construirArbol(String expresion) {
        Stack<NodoArbol> pilaOperadores = new Stack<>();
        Stack<NodoArbol> pilaOperandos = new Stack<>();

        for (int i = 0; i < expresion.length(); i++) {
            char caracter = expresion.charAt(i);

            if (esOperando(caracter)) {
                NodoArbol nodo = new NodoArbol(caracter);
                pilaOperandos.push(nodo);
            } else if (esOperador(caracter)) {
                NodoArbol nodo = new NodoArbol(caracter);

                while (!pilaOperadores.empty() && prioridadOperador(pilaOperadores.peek().getValor()) >= prioridadOperador(caracter)) {
                    NodoArbol operador = pilaOperadores.pop();
                    operador.setDerecha(pilaOperandos.pop());
                    operador.setIzquierda(pilaOperandos.pop());
                    pilaOperandos.push(operador);
                }

                pilaOperadores.push(nodo);
            } else if (caracter == '(') {
                pilaOperadores.push(new NodoArbol(caracter));
            } else if (caracter == ')') {
                while (!pilaOperadores.empty() && pilaOperadores.peek().getValor() != '(') {
                    NodoArbol operador = pilaOperadores.pop();
                    operador.setDerecha(pilaOperandos.pop());
                    operador.setIzquierda(pilaOperandos.pop());
                    pilaOperandos.push(operador);
                }
                pilaOperadores.pop();
            }
        }

        while (!pilaOperadores.empty()) {
            NodoArbol operador = pilaOperadores.pop();
            operador.setDerecha(pilaOperandos.pop());
            operador.setIzquierda(pilaOperandos.pop());
            pilaOperandos.push(operador);
        }

        return pilaOperandos.pop();
    }

    private int prioridadOperador(char operador) {
        switch (operador) {
            case '+':
            case '-':
                return 1;
            case '*':
            case '/':
                return 2;
            case '^':
                return 3;
            default:
                return 0;
        }
    }


    private boolean esOperando(char caracter) {
        return Character.isDigit(caracter);
    }

    private boolean esOperador(char caracter) {
        return caracter == '+' || caracter == '-' || caracter == '*' || caracter == '/' || caracter == '^';
    }

    public void inorden(NodoArbol nodo) {
        if (nodo != null) {
            inorden(nodo.getIzquierda());
            System.out.print(nodo.getValor());
            inorden(nodo.getDerecha());
        }
    }

    public void preorden(NodoArbol nodo) {
        if (nodo != null) {
            System.out.print(nodo.getValor());
            preorden(nodo.getIzquierda());
            preorden(nodo.getDerecha());
        }
    }

    public void posorden(NodoArbol nodo) {
        if (nodo != null) {
            posorden(nodo.getIzquierda());
            posorden(nodo.getDerecha());
            System.out.print(nodo.getValor());
        }
    }
}

