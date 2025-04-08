import java.io.FileWriter;
import java.io.IOException;

public class Salida {
    private FileWriter writer;

    public Salida(String archivoSalida) throws IOException {
        writer = new FileWriter(archivoSalida);
    }

    public void escribirLinea(String linea) throws IOException {
        writer.write(linea + "\n");
    }

    public void cerrar() throws IOException {
        writer.close();
    }
}
