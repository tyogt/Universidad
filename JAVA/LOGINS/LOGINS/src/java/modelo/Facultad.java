/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author betos
 */
public class Facultad {
    String Id;
    String Nombre;
    String NombreCoordinador ;
       public Facultad(){
        
    }

    public Facultad(String Id, String Nombre, String NombreCoordinador) {
        this.Id = Id;
        this.Nombre = Nombre;
        this.NombreCoordinador = NombreCoordinador;
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

    public String getNombreCoordinador() {
        return NombreCoordinador;
    }

    public void setNombreCoordinador(String NombreCoordinador) {
        this.NombreCoordinador = NombreCoordinador;
    }


}
