package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Principal_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css\" integrity=\"sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO\" crossorigin=\"anonymous\"><!-- comment -->\n");
      out.write("        <title>Principal</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"navbar navbar-dark bg-dark\">\n");
      out.write("            <a  style = \"color:white\"class=\"navbar-toggler\"><span class =\"navbar-toggler-icon\"> </span> Home</a>\n");
      out.write("            <div class = \"dropdown\">\n");
      out.write("                <a style=\" color:white\" href=\"#\" class=\"nav-link dropdown-toggle\" data-toggle=\"dropdown\">Cerrar Sesion</a>\n");
      out.write("                <div class=\"dropdown-menu text-center\">\n");
      out.write("                    <a><img src=\"img/images.jpeg\" height= \"80\" width=\" 80\"/></a><br>\n");
      out.write("                     <a>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${nom}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</a>\n");
      out.write("                      <a>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pass}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</a> \n");
      out.write("                      <div class=\"dropdown-divider\"></div>\n");
      out.write("                      <a  href = \"Controlador?accion=Salir\"class=\"dropdown-item\">Salir</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("        <div class=\"container mt-4\">\n");
      out.write("            <h1>Bienvenido al Sistema.....<strong>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${nom}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</strong></h1>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"container mt-4\"> \n");
      out.write("            <a href=\"Universidad.jsp\">\n");
      out.write("            <input class= \"btn btn-primary btn-lg\"  type=\"submit\" name=\"accion\" value=\"Universidad\"  height= \"80\" width=\" 100\">\n");
      out.write("               </a>\n");
      out.write("           <a href=\"Sede.jsp\">\n");
      out.write("            <input class= \"btn btn-primary btn-lg\"  type=\"submit\" name=\"accion\" value=\"Sede\"  height= \"80\" width=\" 80\">\n");
      out.write("            </a>\n");
      out.write("            <a href=\"Facultad.jsp\">\n");
      out.write("            <input class= \"btn btn-primary btn-lg\"  type=\"submit\" name=\"accion\" value=\"Facultades\"  height= \"80\" width=\" 80\">\n");
      out.write("              </a>\n");
      out.write("            </div>\n");
      out.write("         <div class=\"container mt-4\">\n");
      out.write("             <a href=\"Catedratico.jsp\">\n");
      out.write("         <input class= \"btn btn-primary btn-lg\"  type=\"submit\" name=\"accion\" value=\"Catedraticos\"  height= \"80\" width=\" 80\">\n");
      out.write("         </a>\n");
      out.write("             <a href=\"Alumno .jsp\">\n");
      out.write("         <input class= \"btn btn-primary btn-lg\"  type=\"submit\" name=\"accion\" value=\"Alumnos\"  height= \"80\" width=\" 80\">\n");
      out.write("         </a>\n");
      out.write("             <a href=\"Curso.jsp\">\n");
      out.write("         <input class= \"btn btn-primary btn-lg\"  type=\"submit\" name=\"accion\" value=\"Cursos\"  height= \"80\" width=\" 80\">\n");
      out.write("         </a> \n");
      out.write("                <a href=\"AsignacionCurso.jsp\">\n");
      out.write("         <input class= \"btn btn-primary btn-lg\"  type=\"submit\" name=\"accion\" value=\"AsignacionCursos\"  height= \"80\" width=\" 80\">\n");
      out.write("            </a> \n");
      out.write("        \n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("      <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js\" integrity=\"sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49\" crossorigin=\"anonymous\"></script>\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js\" integrity=\"sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy\" crossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
