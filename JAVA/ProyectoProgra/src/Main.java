public class Main {
    public static void main(String[] args) {
        if (args.length < 3) {
            System.out.println("Cantidad insuficiente de parametros.");
            return;
        }

        String archivoDatos = args[0];
        String nombreBD = args[1];
        String archivoComandos = args[2];
        String archivoSalida = args[3];

        BaseDatos baseDatos = new BaseDatos(nombreBD, archivoSalida);
        baseDatos.cargarArchivoDatos(archivoDatos);

        baseDatos.procesarArchivoComandos(archivoComandos, archivoSalida);
    }
}
