import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class BaseDatos {
    private String nombreArchivoDatos;
    private String nombreArchivoIndiceID;
    private String nombreArchivoIndiceApellido;
    private List<Estudiante> registros;
    private ArbolB<String> arbolID;
    private ArbolB<String> arbolApellido;

    public BaseDatos(String nombreArchivoDatos, String nombreBD) {
        this.nombreArchivoDatos = nombreArchivoDatos;
        this.nombreArchivoIndiceID = nombreBD + ".ix1";
        this.nombreArchivoIndiceApellido = nombreBD + ".ix2";
        this.registros = new ArrayList<>();
        this.arbolID = new ArbolB<>(3); // Orden del árbol B para el índice de ID
        this.arbolApellido = new ArbolB<>(3); // Orden del árbol B para el índice de Apellido
    }

    public void construirBaseDatos() {
        leerArchivoDatos();
        construirIndices();
    }

    private void leerArchivoDatos() {
        try {
            File archivoDatos = new File(nombreArchivoDatos);
            Scanner scanner = new Scanner(archivoDatos);

            while (scanner.hasNextLine()) {
                String linea = scanner.nextLine();
                String[] campos = linea.split(" ");
                if (campos.length == 5) {
                    String id = campos[0];
                    String nombre = campos[1];
                    String apellido = campos[2];
                    String telefono = campos[3];
                    String correo = campos[4];
                    Estudiante estudiante = new Estudiante(id, nombre, apellido, telefono, correo);
                    registros.add(estudiante);
                }
            }

            scanner.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void construirIndices() {
        for (Estudiante estudiante : registros) {
            arbolID.insertar(estudiante.getId());
            arbolApellido.insertar(estudiante.getApellido());
        }
    }

    public void procesarComandos(String nombreArchivoComandos, String nombreArchivoSalida) {
        try {
            File archivoComandos = new File(nombreArchivoComandos);
            File archivoSalida = new File(nombreArchivoSalida);
            FileWriter writer = new FileWriter(archivoSalida);

            Scanner scanner = new Scanner(archivoComandos);
            while (scanner.hasNextLine()) {
                String linea = scanner.nextLine();
                String[] comando = linea.split(" ");

                if (comando[0].equals("Encontrar")) {
                    if (comando[1].equals("ID")) {
                        String idBusqueda = comando[2];
                        buscarPorID(idBusqueda, writer);
                    } else if (comando[1].equals("Apellido")) {
                        String apellidoBusqueda = comando[2];
                        buscarPorApellido(apellidoBusqueda, writer);
                    }
                } else if (comando[0].equals("Agregar")) {
                    String id = comando[1];
                    String nombre = comando[2];
                    String apellido = comando[3];
                    String telefono = comando[4];
                    String correo = comando[5];
                    Estudiante nuevoEstudiante = new Estudiante(id, nombre, apellido, telefono, correo);
                    agregarEstudiante(nuevoEstudiante, writer);
                } else if (comando[0].equals("Listar")) {
                    if (comando[2].equals("ID")) {
                        listarPorID(writer);
                    } else if (comando[2].equals("apellido")) {
                        listarPorApellido(writer);
                    }
                }
            }

            scanner.close();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void buscarPorID(String idBusqueda, FileWriter writer) throws IOException {
        List<String> resultados = arbolID.buscar(idBusqueda);

        if (resultados.isEmpty()) {
            writer.write("NO ENCONTRADO\n");
        } else {
            for (String id : resultados) {
                Estudiante estudiante = obtenerEstudiantePorID(id);
                String registro = generarRegistro(estudiante);
                writer.write(registro + "\n");
            }
        }
    }

    private void buscarPorApellido(String apellidoBusqueda, FileWriter writer) throws IOException {
        List<String> resultados = arbolApellido.buscar(apellidoBusqueda);

        if (resultados.isEmpty()) {
            writer.write("NO ENCONTRADO\n");
        } else {
            for (String apellido : resultados) {
                List<Estudiante> estudiantes = obtenerEstudiantesPorApellido(apellido);
                for (Estudiante estudiante : estudiantes) {
                    String registro = generarRegistro(estudiante);
                    writer.write(registro + "\n");
                }
            }
        }
    }

    private void agregarEstudiante(Estudiante estudiante, FileWriter writer) throws IOException {
        registros.add(estudiante);
        arbolID.insertar(estudiante.getId());
        arbolApellido.insertar(estudiante.getApellido());

        int posicion = obtenerPosicionRegistro(estudiante);
        int divisionesID = arbolID.obtenerNumeroDivisiones();
        int divisionesApellido = arbolApellido.obtenerNumeroDivisiones();

        String mensaje = "ESTUDIANTE " + estudiante.getId() + " AGREGADO. (" + posicion + "; " + divisionesID + "; " + divisionesApellido + ")";
        writer.write(mensaje + "\n");
    }

    private void listarPorID(FileWriter writer) throws IOException {
        for (Estudiante estudiante : registros) {
            String registro = generarRegistro(estudiante);
            writer.write(registro + "\n");
        }
    }

    private void listarPorApellido(FileWriter writer) throws IOException {
        for (String apellido : arbolApellido.inorden()) {
            List<Estudiante> estudiantes = obtenerEstudiantesPorApellido(apellido);
            for (Estudiante estudiante : estudiantes) {
                String registro = generarRegistro(estudiante);
                writer.write(registro + "\n");
            }
        }
    }

    private Estudiante obtenerEstudiantePorID(String id) {
        for (Estudiante estudiante : registros) {
            if (estudiante.getId().equals(id)) {
                return estudiante;
            }
        }
        return null;
    }

    private List<Estudiante> obtenerEstudiantesPorApellido(String apellido) {
        List<Estudiante> estudiantes = new ArrayList<>();
        for (Estudiante estudiante : registros) {
            if (estudiante.getApellido().equals(apellido)) {
                estudiantes.add(estudiante);
            }
        }
        return estudiantes;
    }

    private int obtenerPosicionRegistro(Estudiante estudiante) {
        int posicion = 0;
        for (Estudiante registro : registros) {
            if (registro.getId().equals(estudiante.getId())) {
                break;
            }
            posicion++;
        }
        return posicion;
    }

    private String generarRegistro(Estudiante estudiante) {
        return estudiante.getId() + " " + estudiante.getNombre() + " " + estudiante.getApellido() + " " + estudiante.getTelefono() + " " + estudiante.getCorreo();
    }

	public void cargarArchivoDatos(String archivoDatos) {
		// TODO Auto-generated method stub
		
	}

	public void procesarArchivoComandos(String archivoComandos, String archivoSalida) {
		// TODO Auto-generated method stub
		
	}
}
