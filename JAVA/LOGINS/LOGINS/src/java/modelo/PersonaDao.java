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
 *
 * @author betos
 */
public class PersonaDao implements Validar {
Connection con;
 Conexion cn= new Conexion();
    PreparedStatement ps;
ResultSet rs;

    @Override
    public int validar(Persona per) {
    int r=0;
        String   sql=" Select * from USUARIOS where USUARIO =?  and PASS=?";
    try{
    con=cn.getConnection();
    ps=con.prepareStatement(sql);
    ps.setString(1,per.getNom());
    ps.setString(2,per.getPass());
        rs=ps.executeQuery();
         while(rs.next())  {
             r=r+1;
           per.setNom(rs.getString("USUARIO"));
           per.setPass(rs.getString("PASS"));
                    }
           if (r==1){
               return 1;
           }  else {
               return 0;
           }
             
             }
    catch (Exception  e){
     return  0;  
    }
    }
    
}
