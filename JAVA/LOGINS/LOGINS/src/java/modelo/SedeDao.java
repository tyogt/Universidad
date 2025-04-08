/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author betos
 */
public class SedeDao {
      Connection con;
 Conexion cn= new Conexion();
    PreparedStatement ps;
ResultSet rs;

public int agregarsede(Sede sede){
       int r=0;
        String sql= "insert into SEDE (ID,NOMBRE,DIRECCION,TELEFONO, IDSEDE ) values (?, ?,?,?,?)";
    try {
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.setString(1,sede.getId());
        ps.setString(2, sede.getNombre());
        ps.setString(3,sede.getDireccion());
        ps.setString(4, sede.getTelefono());
         ps.setString(5, sede.getIdUniversidad());
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

      public List listarsede(){
        List<Sede>lista = new ArrayList<>();
        String sql= "select * from SEDE";
        try{
            con = cn.getConnection();
            ps=con.prepareCall(sql);
            rs=ps.executeQuery();
            while (rs.next()){
              Sede sede= new Sede();
              sede.setId(rs.getString(1));
              sede.setNombre(rs.getString(2));
              sede.setDireccion(rs.getString(3));
              sede.setTelefono(rs.getString(4));
             sede.setIdUniversidad(rs.getString(5));
               lista.add(sede);
            }
            
              } catch(Exception e) {
                  
              }
        return lista;
    }



}
