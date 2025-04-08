public class Main {

    public static void main(String[] args) {
        //String expresion = "(3+(4*5))";
        //String expresion = "(3^5)";
        //String expresion = "((3-1)*(4*5))";
        String expresion = "(((2+1)*(4*5))/2)";

        ArbolExpresion arbol = new ArbolExpresion(expresion);

        System.out.println("Expresion: " + expresion);

        System.out.print("Inorden: ");
        arbol.inorden(arbol.getRaiz());
        System.out.println();

        System.out.print("Preorden: ");
        arbol.preorden(arbol.getRaiz());
        System.out.println();

        System.out.print("Posorden: ");
        arbol.posorden(arbol.getRaiz());
        System.out.println();

        int resultado = evaluarExpresion(arbol.getRaiz());
        System.out.println("Resultado de la expresion: " + resultado);
    }

    private static int evaluarExpresion(NodoArbol nodo) {
        if (nodo == null) {
            return 0;
        } else if (nodo.getIzquierda() == null && nodo.getDerecha() == null) {
            return Character.getNumericValue(nodo.getValor());
        } else {
            int izquierda = evaluarExpresion(nodo.getIzquierda());
            int derecha = evaluarExpresion(nodo.getDerecha());
            switch (nodo.getValor()) {
                case '+':
                    return izquierda + derecha;
                case '-':
                    return izquierda - derecha;
                case '*':
                    return izquierda * derecha;
                case '/':
                    return izquierda / derecha;
                case '^':
                    return (int) Math.pow(izquierda, derecha);
                default:
                    return 0;
            }
        }
    }
}

