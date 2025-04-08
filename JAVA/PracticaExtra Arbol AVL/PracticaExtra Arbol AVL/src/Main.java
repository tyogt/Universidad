
public class Main {
    public static void main(String[] args) {
        ArbolAVL arbol = new ArbolAVL();
        
        arbol.agregar(65);
        arbol.agregar(50);
        arbol.agregar(23);
        arbol.agregar(70);
        arbol.agregar(82);
        arbol.agregar(68);
        arbol.agregar(39);
        
        System.out.println("Preorden: ");
        arbol.imprimirPreOrden(arbol.raiz);
        System.out.println();
        
        System.out.println("Inorden: ");
        arbol.imprimirInOrden(arbol.raiz);
        System.out.println();
    }
}
