<%-- 
    Document   : Principal
    Created on : 31/10/2022, 22:50:55
    Author     : betos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"><!-- comment -->
        <title>Principal</title>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark">
            <a  style = "color:white"class="navbar-toggler"><span class ="navbar-toggler-icon"> </span> Home</a>
            <div class = "dropdown">
                <a style=" color:white" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Cerrar Sesion</a>
                <div class="dropdown-menu text-center">
                    <a><img src="img/images.jpeg" height= "80" width=" 80"/></a><br>
                     <a>${nom}</a>
                      <a>${pass}</a> 
                      <div class="dropdown-divider"></div>
                      <a  href = "Controlador?accion=Salir"class="dropdown-item">Salir</a>
                </div>
            </div>
        </nav>
        <div class="container mt-4">
            <h1>Bienvenido al Sistema.....<strong>${nom}</strong></h1>
        </div>
        <div class="container mt-4"> 
            <a href="Universidad.jsp">
            <input class= "btn btn-primary btn-lg"  type="submit" name="accion" value="Universidad"  height= "80" width=" 100">
               </a>
           <a href="Sede.jsp">
            <input class= "btn btn-primary btn-lg"  type="submit" name="accion" value="Sede"  height= "80" width=" 80">
            </a>
            <a href="Facultad.jsp">
            <input class= "btn btn-primary btn-lg"  type="submit" name="accion" value="Facultades"  height= "80" width=" 80">
              </a>
            </div>
         <div class="container mt-4">
             <a href="Catedratico.jsp">
         <input class= "btn btn-primary btn-lg"  type="submit" name="accion" value="Catedraticos"  height= "80" width=" 80">
         </a>
             <a href="Alumno .jsp">
         <input class= "btn btn-primary btn-lg"  type="submit" name="accion" value="Alumnos"  height= "80" width=" 80">
         </a>
             <a href="Curso.jsp">
         <input class= "btn btn-primary btn-lg"  type="submit" name="accion" value="Cursos"  height= "80" width=" 80">
         </a> 
                <a href="AsignacionCurso.jsp">
         <input class= "btn btn-primary btn-lg"  type="submit" name="accion" value="AsignacionCursos"  height= "80" width=" 80">
            </a> 
        
        </div>
        
        
      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        
    </body>
</html>
