<%-- 
    Document   : Universidad
    Created on : 2/11/2022, 01:27:50
    Author     : betos
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"><!-- comment -->
        <title>SEDE</title>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark">
            <a  style = "color:white"class="navbar-toggler"><span class ="navbar-toggler-icon"> </span> Sede</a>
            <div class = "dropdown">
                <a style=" color:white" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Cerrar Sesion</a>
                <div class="dropdown-menu text-center">
                    <a><img src="img/images.jpeg" height= "80" width=" 80"/></a><br>
                     <a>${nom}</a>
                      <a>${pass}</a> 
                      <div class="dropdown-divider"></div>
                      <a  href = "Controlador?accion=Salir"class="dropdown-item">Salir</a>
                      <a  href = "Principal.jsp"class="dropdown-item">MenuPrincipal</a>
                </div>
            </div>
        </nav>
        <div class="container mt-4">
            <h1>Bienvenido al Menú SEDE <strong>${nom}</strong></h1>
        </div>

        
        
      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <div>
                <form action = "Controlador" method = "POST">
                   <br> ID:        <input type="text" name ="txtId"> <br>
                     Nombre:  <input type="text" name ="txtNombre"> 
                    <br>Direccion:  <input type="text" name ="txtDireccion"> 
                   <br> Telefono:  <input type="text" name ="txtTelefono"> 
                   <br>  ID Universidad:  <input type="text" name ="txtTelefono"> <br>
                    
                                    
                    <input type="submit" name="accion" value="GuardarSede">
                </form> 
        </div>
  <div>
 <form action="Controlador" method="POST">
                <input type="submit" name="accion3" value="ListarSedes">
                   </form>
            <div>
                
                <table border = "5">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                         <th>Direccion</th>
                          <th>Telefono</th>
                           <th>IdUniversidad</th>
                       
                    </tr>
               
                    </thead> 
                    <tbody> 
                       
                    <c:forEach var="dato" items="${datos}">
                    <tr>
                        <td>${dato.getId}</td>
                        <td>${dato.getNombre()}</td>
                        <td>${dato.getDireccion()}</td>
                        <td>${dato.getTelefono()}</td>
                          <td>${dato.getIdUniversidad()}</td>
                        
                              </tr>
                    </c:forEach>
               
                       </tbody>  
                </table>
  </div>



    </body>
</html>
