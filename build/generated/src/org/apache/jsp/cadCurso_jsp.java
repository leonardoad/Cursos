package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class cadCurso_jsp extends org.apache.jasper.runtime.HttpJspBase
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


    String id_professor = "";
    String nome = "";
    String descricao = "";
    String datainicio = "";
    String datafim = "";
    String horainicio = "";
    String horafim = "";
    String conteudo = "";
    String valor = "";

    String oper = request.getParameter("oper");
    String id = request.getParameter("id");

    if (oper != null) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/cursos", "postgres", "senacrs");

        if (oper.equals("C")) {

            id_professor = request.getParameter("id_professor");
            nome = request.getParameter("nome");
            descricao = request.getParameter("descricao");
            datainicio = request.getParameter("datainicio");
            datafim = request.getParameter("datafim");
            horainicio = request.getParameter("hotainicio");
            horafim = request.getParameter("horafim");
            conteudo = request.getParameter("conteudo");
            valor = request.getParameter("valor");
            
            if (!nome.equals(null) && !id_professor.equals(null)) {

                String sql = "INSERT INTO curso (id_professor, nome,descricao,datainicio,datafim,horainicio,horafim,conteudo, valor) values (?,?,?,?,?,?,?,?,?)";

                ps = conn.prepareStatement(sql);
                ps.setInt(1, Integer.parseInt(id_professor));
                ps.setString(2, nome);
                ps.setString(3, descricao);
                ps.setString(4, datainicio);
                ps.setString(5, datafim);
                ps.setString(6, horainicio);
                ps.setString(7, horafim);
                ps.setString(8, conteudo);
                ps.setFloat(9, Float.parseFloat(valor));
                

                ps.executeUpdate();


                out.print("Curso cadastrado com sucesso!");

//                conn.close();
            }
        } else if (oper.equals("U")) {

            id_professor = request.getParameter("id_professor");
            nome = request.getParameter("nome");
            descricao = request.getParameter("descricao");
            datainicio = request.getParameter("datainicio");
            datafim = request.getParameter("datafim");
            horainicio = request.getParameter("hotainicio");
            horafim = request.getParameter("horafim");
            valor = request.getParameter("valor");

            if (!nome.equals(null) && !id_professor.equals(null)) {

                String sql = "UPDATE curso SET "
                        + "id_professor = ?,nome = ?, descricao = ?, datainicio= ?, datafim= ? , horainicio= ?, horafim= ?"
                        + "WHERE id = ?";

                out.print("Dados atualizados com sucesso!");

                ps = conn.prepareStatement(sql);
                ps.setInt(1, Integer.parseInt(id_professor));
                ps.setString(2, nome);
                ps.setString(3, descricao);
                ps.setString(4, datainicio);
                ps.setString(5, datafim);
                ps.setString(6, horainicio);
                ps.setString(7, horafim);
                ps.setFloat(8, Float.parseFloat(valor));
                
                ps.executeUpdate();

//                conn.close();
            }
        } else if (oper.equals("E")) {
            id = request.getParameter("id");
            String sql = "select * from curso where id=" + id;

            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            rs.next();
            
            id_professor = request.getParameter("id_professor");
            nome = request.getParameter("nome");
            descricao = request.getParameter("descricao");
            datainicio = request.getParameter("datainicio");
            datafim = request.getParameter("datafim");
            horainicio = request.getParameter("hotainicio");
            horafim = request.getParameter("horafim");
            valor = request.getParameter("valor");
            
            oper = "U";
        }
    } else {
        oper = "C";
    }


    // LISTA CURSO PARA COMBO
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rsCombo = null;

    Class.forName("org.postgresql.Driver");
    conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/cursos", "postgres", "senacrs");

    String sqlCombo = "select * from professor";


    ps = conn.prepareStatement(sqlCombo);
    rsCombo = ps.executeQuery();
//conn.close();

 

      out.write("\t\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\"  href=\"css/estilos.css\">\r\n");
      out.write("        <script src=\"js/validator.js\" type=\"text/javascript\"></script>\r\n");
      out.write("        <title>Cladimir, Leonardo Danieli - 17/06/2013</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <h1>Cadastro de Curso!</h1>\r\n");
      out.write("\r\n");
      out.write("        <a href=\"listaCurso.jsp\">Voltar</a><br /><br />\r\n");
      out.write("        <form id=\"FrmCurso\" method=\"POST\" action=\"cadCurso.jsp\">\r\n");
      out.write("            <div id=\"container\">\r\n");
      out.write("                <fieldset class=\"item\"  >\r\n");
      out.write("                    <legend> Dados do Curso</legend>\r\n");
      out.write("                    <table >\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td> Professor:</td>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <select name=\"id_professor\" id=\"id_professor\">\r\n");
      out.write("                                    <option value=\"\">Selecione...</option>\r\n");
      out.write("            ");

            while(rsCombo.next())
                out.print("<option value="+rsCombo.getString("id")+">"+rsCombo.getString("nome")+"</option>");
            
      out.write("\r\n");
      out.write("                                </select>\r\n");
      out.write("                            </td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td> Nome:</td>\r\n");
      out.write("                            <td><input type=\"text\" id=\"nome\" name=\"nome\" value=\"");
 out.print(nome);
      out.write("\" /></td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td> Descrição:</td>\r\n");
      out.write("                            <td><input type=\"text\" id=\"descricao\" name=\"descricao\" value=\"");
 out.print(descricao);
      out.write("\" /></td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td> Data Inicio:</td>\r\n");
      out.write("                            <td><input type=\"text\" id=\"datainicio\" name=\"datainicio\" value=\"");
 out.print(datainicio);
      out.write("\" /></td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td> Data Fim :</td>\r\n");
      out.write("                            <td><input type=\"text\" id=\"datafim\" name=\"datafim\" value=\"");
 out.print(datafim);
      out.write("\" /></td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td> Hora Inicio:</td>\r\n");
      out.write("                            <td><input type=\"text\" id=\"horainicio\" name=\"horainicio\" value=\"");
 out.print(horainicio);
      out.write("\" /></td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td> Hora Fim:</td>\r\n");
      out.write("                            <td><input type=\"text\" id=\"horafim\" name=\"horafim\" value=\"");
 out.print(horafim);
      out.write("\" /></td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td> Conteudo:</td>\r\n");
      out.write("                            <td><input type=\"text\" id=\"conteudo\" name=\"conteudo\" value=\"");
 out.print(conteudo);
      out.write("\" /></td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td> Valor:</td>\r\n");
      out.write("                            <td><input type=\"text\" id=\"nome\" name=\"nome\" value=\"");
 out.print(valor);
      out.write("\" /></td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                </fieldset>\r\n");
      out.write("                            \r\n");
      out.write("                <input type=\"hidden\" name=\"oper\" id=\"oper\" value=\"");
 out.print(oper);
      out.write("\" />\r\n");
      out.write("                <input type=\"hidden\" name=\"id\" id=\"id\" value=\"");
 out.print(id);
      out.write("\"/>\r\n");
      out.write("                <input type=\"button\" onclick=\"validarCurso();\" value=\"Enviar\" /> \r\n");
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
