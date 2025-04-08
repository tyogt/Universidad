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
public class CursoDao {
     Connection con;
 Conexion cn= new Conexion();
    PreparedStatement ps;
public int agregarcurso(Curso cur){
       int r=0;
        String sql= "insert into CURSO (ID,NOMBRE) values (?,?)";
    try {
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.setString(1,cur.getId());
        ps.setString(2, cur.getNombre());
   
        
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
