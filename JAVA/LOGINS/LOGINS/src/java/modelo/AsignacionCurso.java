/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author betos
 */
public class AsignacionCurso {
        String Id;
    String Asignacion;
    String IdCurso ;
    String Seccion ;
    
            public AsignacionCurso(){
    
}

    public AsignacionCurso(String Id, String Asignacion, String IdCurso, String Seccion) {
        this.Id = Id;
        this.Asignacion = Asignacion;
        this.IdCurso = IdCurso;
        this.Seccion = Seccion;
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public String getAsignacion() {
        return Asignacion;
    }

    public void setAsignacion(String Asignacion) {
        this.Asignacion = Asignacion;
    }

    public String getIdCurso() {
        return IdCurso;
    }

    public void setIdCurso(String IdCurso) {
        this.IdCurso = IdCurso;
    }

    public String getSeccion() {
        return Seccion;
    }

    public void setSeccion(String Seccion) {
        this.Seccion = Seccion;
    }
    
}
