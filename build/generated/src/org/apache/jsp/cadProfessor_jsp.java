package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class cadProfessor_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("\r\n");
      out.write("\r\n");


    String nome = "";
    String telefone = "";
    String email = "";
    String custohora = "";
    String oper = request.getParameter("oper");
    String id = request.getParameter("id");

    if (oper != null) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/cursos", "postgres", "senacrs");

        if (oper.equals("C")) {

            nome = request.getParameter("nome");
            telefone = request.getParameter("telefone");
            email = request.getParameter("email");
            custohora = request.getParameter("custohora");

            if (!nome.equals(null) && !email.equals(null)) {

                String sql = "INSERT INTO professor (nome,email,telefone,custohora) values (?,?,?,?)";

                ps = conn.prepareStatement(sql);
                ps.setString(1, nome);
                ps.setString(2, email);
                ps.setString(3, telefone);
                ps.setFloat(4, Float.parseFloat(custohora));

                ps.executeUpdate();


                out.print("Professor cadastrado com sucesso!");

//                conn.close();
            }
        } else if (oper.equals("U")) {

            nome = request.getParameter("nome");
            telefone = request.getParameter("telefone");
            email = request.getParameter("email");
            custohora = request.getParameter("custohora");

            if (!nome.equals(null) && !email.equals(null)) {

                String sql = "UPDATE professor SET "
                        + "nome = ?,email = ?,telefone = ?,custohora = ? "
                        + "WHERE id = ?";

                out.print("Dados atualizados com sucesso!");

                ps = conn.prepareStatement(sql);
                ps.setString(1, nome);
                ps.setString(2, email);
                ps.setString(3, telefone);
                ps.setFloat(4, Float.parseFloat(custohora));
                ps.setInt(5, Integer.parseInt(id));

                ps.executeUpdate();

//                conn.close();
            }
        } else if (oper.equals("E")) {
            id = request.getParameter("id");
            String sql = "select * from professor where id=" + id;

            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            rs.next();
            nome = rs.getString("nome");
            telefone = rs.getString("telefone");
            email = rs.getString("email");
            custohora = rs.getString("custohora");
            oper = "U";
        }
    } else {
        oper = "C";
    }



      out.write("\t\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\"  href=\"css/estilos.css\">\r\n");
      out.write("        <script src=\"js/validator.js\" type=\"text/javascript\"></script>\r\n");
      out.write("        <title>Cladimir, Leonardo Danieli - 17/06/2013</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <h1>Cadastro de Professor!</h1>\r\n");
      out.write("\r\n");
      out.write("        <a href=\"listaProfessor.jsp\">Voltar</a><br /><br />\r\n");
      out.write("        <form id=\"form1\" method=\"POST\" action=\"cadProfessor.jsp\">\r\n");
      out.write("            <div id=\"container\">\r\n");
      out.write("                <fieldset class=\"item\"  >\r\n");
      out.write("                    <legend> Dados Pessoais</legend>\r\n");
      out.write("                    <table >\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td> Nome:</td>\r\n");
      out.write("                            <td><input type=\"text\" id=\"nome\" name=\"nome\" value=\"");
 out.print(nome);
      out.write("\" /></td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>Email: </td>\r\n");
      out.write("                            <td><input type=\"text\" name=\"email\" id=\"email\" value=\"");
 out.print(email);
      out.write("\" /></td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>Telefone: </td>\r\n");
      out.write("                            <td><input type=\"text\" name=\"telefone\" id=\"telefone\" value=\"");
 out.print(telefone);
      out.write("\" /></td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>Custo Hora: </td>\r\n");
      out.write("                            <td><input type=\"text\" name=\"custohora\" id=\"custohora\" value=\"");
 out.print(custohora);
      out.write("\" /></td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                </fieldset>\r\n");
      out.write("\r\n");
      out.write("                <input type=\"hidden\" name=\"oper\" id=\"oper\" value=\"");
 out.print(oper);
      out.write("\" />\r\n");
      out.write("                <input type=\"hidden\" name=\"id\" id=\"id\" value=\"");
 out.print(id);
      out.write("\" />\r\n");
      out.write("                <input type=\"button\" onclick=\"validarProfessor();\" value=\"Enviar\" /> \r\n");
      out.write("                <input type=\"reset\" value=\"Limpar\" />\r\n");
      out.write("            </div>\r\n");
      out.write("        </form>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
