<%-- 
    Document   : Curso
    Created on : 27/05/2013, 10:23:46
    Author     : 770600067
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>


<%




    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    Class.forName("org.postgresql.Driver");
    conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/cursos", "postgres", "senacrs");

    String sql = "select * from professor";


    ps = conn.prepareStatement(sql);
    rs = ps.executeQuery();
//conn.close();




%>	
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css"  href="css/estilos.css"> 
        <title>Cladimir, Leonardo Danieli - 17/06/2013</title>
    </head>
    <body>
        <h1>Lista Professores!</h1>
        
        <a href="index.xhtml">Voltar</a><br />
        <a href="cadProfessor.jsp">Novo Professor!</a>
        <ol type="1">
            <%
            while(    rs.next())
                out.print("<li><a href='cadProfessor.jsp?id="+rs.getString("id")+"&oper=E'>"+rs.getString("nome")+" - "+rs.getString("email")+"</a></li>");
                        
            %>
        </ol>

    </body>
</html>
