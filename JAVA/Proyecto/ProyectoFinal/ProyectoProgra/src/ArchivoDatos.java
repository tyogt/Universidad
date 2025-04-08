import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.RandomAccessFile;

public class ArchivoDatos {
    private String archivoRegistros;
    private String archivoIndiceId;
    private String archivoIndiceApellido;

    public ArchivoDatos(String archivoRegistros, String archivoIndiceId, String archivoIndiceApellido) {
        this.archivoRegistros = archivoRegistros;
        this.archivoIndiceId = archivoIndiceId;
        this.archivoIndiceApellido = archivoIndiceApellido;
    }

    public void construirArchivos() {
        try {
            BufferedReader br = new BufferedReader(new FileReader(archivoRegistros));
            RandomAccessFile raIndiceId = new RandomAccessFile(archivoIndiceId, "rw");
            RandomAccessFile raIndiceApellido = new RandomAccessFile(archivoIndiceApellido, "rw");

            String linea;
            long posicion = 0;

            while ((linea = br.readLine()) != null) {
                String[] campos = linea.split(" ");

                // Guardar registro en el archivo de registros
                RandomAccessFile raRegistros = new RandomAccessFile(archivoRegistros + ".dat", "rw");
                raRegistros.seek(posicion);
                raRegistros.writeBytes(linea + System.lineSeparator());
                raRegistros.close();

                // Guardar índice por ID
                String id = campos[0];
                raIndiceId.writeBytes(id + " " + posicion + System.lineSeparator());

                // Guardar índice por apellido
                String apellido = campos[2];
                raIndiceApellido.writeBytes(apellido + " " + posicion + System.lineSeparator());

                // Actualizar posición
                posicion += linea.length() + System.lineSeparator().length();
            }

            br.close();
            raIndiceId.close();
            raIndiceApellido.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
