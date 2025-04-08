/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author betos
 */
public class FacultadDao {
     Connection con;
 Conexion cn= new Conexion();
    PreparedStatement ps;
public int agregarfacultad(Facultad fac){
       int r=0;
        String sql= "insert into FACULTAD (ID,NOMBRE,NOMBRECORDINADOR) values (?,?,?)";
    try {
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.setString(1,fac.getId());
        ps.setString(2, fac.getNombre());
        ps.setString(3,fac.getNombreCoordinador());
        
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

