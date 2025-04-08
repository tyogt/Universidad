/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author betos
 */
public class Catedratico {
     String Id;
    String Nombre;
    String Edad ;
    String Genero ;
        public Catedratico(){
    
}

    public Catedratico(String Id, String Nombre, String Edad, String Genero) {
        this.Id = Id;
        this.Nombre = Nombre;
        this.Edad = Edad;
        this.Genero = Genero;
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

    public String getEdad() {
        return Edad;
    }

    public void setEdad(String Edad) {
        this.Edad = Edad;
    }

    public String getGenero() {
        return Genero;
    }

    public void setGenero(String Genero) {
        this.Genero = Genero;
    }
    
}
