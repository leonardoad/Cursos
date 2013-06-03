<%-- 
    Document   : Curso
    Created on : 27/05/2013, 10:23:46
    Author     : 770600067
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
 <%

            String nome = request.getParameter("nome");
            String cpf = request.getParameter("cpf");
            String email = request.getParameter("email");
            out.println(nome + " cadastrado com sucesso!");
            out.println(cpf + " cadastrado com sucesso!");
            out.println(email + " cadastrado com sucesso!");

            if (!nome.equals(null) && !email.equals(null)) {
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                
                Class.forName("org.postgresql.Driver");
                conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/cursos", "postgres", "senacrs");

                String sql = "INSERT INTO professor (nome,email) values (?,?)";

                ps = conn.prepareStatement(sql);
                ps.setString(1, nome);
                ps.setString(2, email);

                ps.executeUpdate();

//                conn.close();
            }
//	
//		
//	
//		try
//		{
//			Class.forName("org.postgresql.Driver").newInstance();
//			conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/curso?user=postgres&password=senacrs");
//			
//			String sql = "INSERT INTO usuario (nome,cpf,email) values (?,?,?)";
//			
//			ps = conn.prepareStatement(sql);
//			ps.setString(1, nome);
//			ps.setString(2, cpf);
//			ps.setString(3, email);
//			
//			ps.executeUpdate();
//		}
//		
//		catch(Exception e)
//		{
//			e.printStackTrace();
//		}
//		
//		finally
//		{
//			ps.close();
//			conn.close();
//		}
%>	

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cadastro de professor!</h1>

       
    </body>
</html>
