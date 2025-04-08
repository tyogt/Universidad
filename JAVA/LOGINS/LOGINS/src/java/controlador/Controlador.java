
package controlador;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Persona;
import modelo.PersonaDao;
import modelo.Universidad;
import modelo.UniversidadDao;


/**
 *
 * @author betos
 */
public class Controlador extends HttpServlet {
PersonaDao dao= new PersonaDao();
Persona p= new Persona();
UniversidadDao daouni = new UniversidadDao();
Universidad u= new Universidad();
int r;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String accion= request.getParameter("accion");
       
         if (accion.equals("Ingresar"))
         {
              String nom=request.getParameter("txtnom");
              String pass=request.getParameter("txtpass");
              p.setNom(nom);
              p.setPass(pass);
              r= dao.validar(p);
              if(r==1){
                 request.getSession().setAttribute("nom",nom);
                  request.getRequestDispatcher("Principal.jsp").forward(request, response);
              }
              else {
                  request.getRequestDispatcher("index.jsp").forward(request, response);
              }
            
         } else {
             request.getRequestDispatcher("index.jsp").forward(request, response);
         }
      
           
        }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String accion2= request.getParameter("accion2");
            switch (accion2){
                case "Universidad":
               request.getRequestDispatcher("Universidad.jsp").forward(request, response);
             
                break;
               case "GuardarUniversidad":
                String IdU= request.getParameter("txtId");
               String Nombre= request.getParameter("txtNombre");
                String Dire= request.getParameter("txtDireccion");
                String Tel= request.getParameter("textTelefono");
               
                u.setId(IdU);
              u.setNombre(Nombre);
              u.setDireccion(Dire);
              u.setTelefono(Tel);
              daouni.agregar(u);    
              request.getRequestDispatcher("Controlador?accion=GuardarUniversidad").forward(request, response);
                 break; 
                     case "Listar":
                List<Universidad>datos=daouni.listar();
                request.setAttribute("datos",datos);
                request.getRequestDispatcher("Controlador?accion3=Listar").forward(request, response);
               // processRequest(request, response);
                break;
                
                   default:
                throw new AssertionError();
            }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
