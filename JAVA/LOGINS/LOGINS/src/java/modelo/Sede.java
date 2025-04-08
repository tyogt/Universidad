/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author betos
 */
public class Sede {
    String Id;
    String Nombre;
    String Direccion ;
    String Telefono ;
    String IdUniversidad;
    public Sede(){
    
}

    public Sede(String Id, String Nombre, String Direccion, String Telefono, String IdUniversidad) {
        this.Id = Id;
        this.Nombre = Nombre;
        this.Direccion = Direccion;
        this.Telefono = Telefono;
        this.IdUniversidad = IdUniversidad;
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public String getIdUniversidad() {
        return IdUniversidad;
    }

    public void setIdUniversidad(String IdUniversidad) {
        this.IdUniversidad = IdUniversidad;
    }
    
    
}
