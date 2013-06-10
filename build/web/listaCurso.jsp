<%-- 
    Document   : Curso
    Created on : 27/05/2013, 10:23:46
    Author     : 770600067
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>


<%

    String oper = request.getParameter("oper");
    String id = request.getParameter("id");

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    if (oper != null) {

        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/cursos", "postgres", "senacrs");

        if (oper.equals("D")) {

            String sql = "DELETE FROM curso  "
                    + " WHERE id = ? ";

            ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
            ps.executeUpdate();
            
            sql = "select * from curso";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
        }
    } else {
        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/cursos", "postgres", "senacrs");

        String sql = "select curso.*, professor.nome as professor from curso,professor where curso.id_professor = professor.id ";
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();
    }
%>		
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css"  href="css/estilos.css"> 
        <title>Cladimir, Leonardo Danieli - 17/06/2013</title>

        <!-- DC DataGrid CSS -->
        <link rel="stylesheet" href="css/tsc_datagrid.css" />

        <!-- jQuery Library (skip this step if already called on page ) -->
        <script type="text/javascript" src="js/jquery.min.js"></script> <!-- (do not call twice) -->

        <!-- DC DataGrid JS -->
        <script type="text/javascript" src="js/tsc_datagrid.js"></script>

        <!-- DC Fixed Table Header Settings -->
        <script type="text/javascript">

            $(document).ready(function() {

                $("#fixed-table1").chromatable({
                    width: "600px", // specify 100%, auto, or a fixed pixel amount
                    height: "400px",
                    scrolling: "yes" // must have the jquery-1.3.2.min.js script installed to use

                });

            });

        </script>
        <style>
            a,img{
                border: none;
                text-decoration: none;

            }
        </style>
    </head>
    <body>
        <h1>Lista Cursos</h1>

        <input type="button" value="Voltar!" onclick="window.location = 'index.xhtml'" />
        <input type="button" value="Novo Curso!" onclick="window.location = 'cadCurso.jsp'" />
        <table id="fixed-table1" class="tsc_fixed_tables" width="400px" border="0" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Professor</th> 
                    <th>Valor</th> 
                    <th width="100px">&nbsp;</th> 
                </tr>
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
//                        out.print("<li><a href='cadProfessor.jsp?id=" + rs.getString("id") + "&oper=E'>" + rs.getString("nome") + " - " + rs.getString("email") + "</a></li>");
                        out.print("<tr>");
                        out.print("<td>" + rs.getString("nome") + "</td>");
                        out.print("<td>" + rs.getString("professor") + "</td>");
                        out.print("<td>" + rs.getString("valor") + "</td>");
                        out.print("<td align='center'>"
                                + "<a href='cadCurso.jsp?id=" + rs.getString("id") + "&oper=E'><img src='img/edit.png' width='20px' height='20px' /></a>"
                                + " &nbsp;<a href='listaCurso.jsp?id=" + rs.getString("id") + "&oper=D'><img src='img/delete.png' width='20px' height='20px' /></a>"
                                + "</td>");
                        out.print("</tr>");
                    }

                %>

            </tbody>
        </table>

        <!-- DC Fixed Table Header End -->
        <div class="tsc_clear"></div> <!-- line break/clear line -->


    </body>
</html>
