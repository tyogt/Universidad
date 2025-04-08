/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
/**
/**
 *
 * @author betos
 */
public class UniversidadDao {
    Connection con;
 Conexion cn= new Conexion();
    PreparedStatement ps;
ResultSet rs;
    public int agregar(Universidad uni){
       int r=0;
        String sql= "insert into UNIVERSIDAD (IDUNI,NOMBRE,DIRECCION,TELEFONO ) values (?,?,?,?)";
    try {
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.setString(1,uni.getId());
        ps.setString(2, uni.getNombre());
        ps.setString(3,uni.getDireccion());
        ps.setString(4, uni.getTelefono());
        
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
    
    
      public List listar(){
        List<Universidad>lista = new ArrayList<>();
        String sql= "select * from UNIVERSIDAD";
        try{
            con = cn.getConnection();
            ps=con.prepareCall(sql);
            rs=ps.executeQuery();
            while (rs.next()){
              Universidad uni= new Universidad();
              uni.setId(rs.getString(1));
              uni.setNombre(rs.getString(2));
              uni.setDireccion(rs.getString(3));
              uni.setTelefono(rs.getString(4));
           
               lista.add(uni);
            }
            
              } catch(Exception e) {
                  
              }
        return lista;
    }




}
