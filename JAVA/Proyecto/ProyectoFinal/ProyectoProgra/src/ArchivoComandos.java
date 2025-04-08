import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.RandomAccessFile;

public class ArchivoComandos {
    private String nombreBD;
    private String archivoComandos;
    private String archivoSalida;

    public ArchivoComandos(String nombreBD, String archivoComandos, String archivoSalida) {
        this.nombreBD = nombreBD;
        this.archivoComandos = archivoComandos;
        this.archivoSalida = archivoSalida;
    }

    public void procesarComandos() {
        try {
            RandomAccessFile raRegistros = new RandomAccessFile(nombreBD + ".dat", "rw");
            RandomAccessFile raIndiceId = new RandomAccessFile(nombreBD + ".ix1", "rw");
            RandomAccessFile raIndiceApellido = new RandomAccessFile(nombreBD + ".ix2", "rw");
            PrintWriter writer = new PrintWriter(new FileWriter(archivoSalida));

            BufferedReader br = new BufferedReader(new FileReader(archivoComandos));
            String linea;

            while ((linea = br.readLine()) != null) {
                String[] comando = linea.split(" ");

                if (comando[0].equals("Encontrar")) {
                    String tipoBusqueda = comando[1];
                    String valorBusqueda = comando[2];

                    if (tipoBusqueda.equals("ID")) {
                        buscarPorID(valorBusqueda, raRegistros, raIndiceId, writer);
                    } else if (tipoBusqueda.equals("apellido")) {
                        buscarPorApellido(valorBusqueda, raRegistros, raIndiceApellido, writer);
                    }
                } else if (comando[0].equals("Agregar")) {
                    String id = comando[1];
                    String nombre = comando[2];
                    String apellido = comando[3];
                    String telefono = comando[4];
                    String correo = comando[5];

                    agregarRegistro(id, nombre, apellido, telefono, correo, raRegistros, raIndiceId, raIndiceApellido, writer);
                } else if (comando[0].equals("Listar")) {
                    String tipoListado = comando[2];

                    if (tipoListado.equals("ID")) {
                        listarPorID(raRegistros, writer);
                    } else if (tipoListado.equals("apellido")) {
                        listarPorApellido(raRegistros, writer);
                    }
                }
            }

            br.close();
            raRegistros.close();
            raIndiceId.close();
            raIndiceApellido.close();
            writer.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void buscarPorID(String id, RandomAccessFile raRegistros, RandomAccessFile raIndiceId, PrintWriter writer) throws IOException {
        raIndiceId.seek(0);
        String linea;
        boolean encontrado = false;

        while ((linea = raIndiceId.readLine()) != null) {
            String[] campos = linea.split(" ");
            if (campos[0].equals(id)) {
                long posicion = Long.parseLong(campos[1]);
                raRegistros.seek(posicion);
                String registro = raRegistros.readLine();
                writer.println(posicion + ":" + registro);
                encontrado = true;
                break;
            }
        }

        if (!encontrado) {
            writer.println("NO ENCONTRADO");
        }
    }

    private void buscarPorApellido(String apellido, RandomAccessFile raRegistros, RandomAccessFile raIndiceApellido, PrintWriter writer) throws IOException {
        raIndiceApellido.seek(0);
        String linea;
        boolean encontrado = false;

        while ((linea = raIndiceApellido.readLine()) != null) {
            String[] campos = linea.split(" ");
            if (campos[0].equals(apellido)) {
                long posicion = Long.parseLong(campos[1]);
                raRegistros.seek(posicion);
                String registro = raRegistros.readLine();
                writer.println(posicion + ":" + registro);
                encontrado = true;
            }
        }

        if (!encontrado) {
            writer.println("NO ENCONTRADO");
        }
    }

    private void agregarRegistro(String id, String nombre, String apellido, String telefono, String correo, RandomAccessFile raRegistros, RandomAccessFile raIndiceId, RandomAccessFile raIndiceApellido, PrintWriter writer) throws IOException {
        long posicion = raRegistros.length();
        String registro = id + " " + nombre + " " + apellido + " " + telefono + " " + correo;

        raRegistros.seek(posicion);
        raRegistros.writeBytes(registro + System.lineSeparator());

        raIndiceId.writeBytes(id + " " + posicion + System.lineSeparator());
        raIndiceApellido.writeBytes(apellido + " " + posicion + System.lineSeparator());

        writer.println("ESTUDIANTE " + id + " AGREGADO. (" + posicion + "; <s1>; <s2>)");
    }

    private void listarPorID(RandomAccessFile raRegistros, PrintWriter writer) throws IOException {
        raRegistros.seek(0);
        String linea;

        while ((linea = raRegistros.readLine()) != null) {
            long posicion = raRegistros.getFilePointer() - linea.length() - System.lineSeparator().length();
            writer.println(posicion + ":" + linea);
        }
    }

    private void listarPorApellido(RandomAccessFile raRegistros, PrintWriter writer) throws IOException {
        raRegistros.seek(0);
        String linea;

        while ((linea = raRegistros.readLine()) != null) {
            long posicion = raRegistros.getFilePointer() - linea.length() - System.lineSeparator().length();
            String[] campos = linea.split(" ");
            String apellido = campos[2];
            writer.println(posicion + ":" + linea);
        }
    }
}
