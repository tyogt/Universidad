/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author betos
 */
public class AlumnoDao {
   Connection con;
 Conexion cn= new Conexion();
    PreparedStatement ps;
public int agregaralumno(Alumno al){
       int r=0;
        String sql= "insert into CATEDRATICO (ID,NOMBRE,EDAD,GENERO) values (?,?,?,?)";
    try {
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.setString(1,al.getId());
        ps.setString(2, al.getNombre());
        ps.setString(3,al.getEdad());
         ps.setString(4,al.getGenero());
        
        r=ps.executeUpdate();
        if (r==1){
            r=1;
        } else {
            r=0;
        }
        
    } catch (Exception e){
     }
        return r;   
    }   
}
