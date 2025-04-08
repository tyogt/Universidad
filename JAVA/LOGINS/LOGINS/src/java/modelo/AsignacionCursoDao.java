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
public class AsignacionCursoDao {
     Connection con;
 Conexion cn= new Conexion();
    PreparedStatement ps;
public int agregarasginacion(AsignacionCurso as){
       int r=0;
        String sql= "insert into ASIGNACION (ID,ASIGNACION,IDCURSO,SECCION) values (?,?,?,?)";
    try {
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.setString(1,as.getId());
        ps.setString(2, as.getAsignacion());
        ps.setString(3,as.getIdCurso());
        ps.setString(4,as.getSeccion());
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
