<%-- 
    Document   : Curso
    Created on : 27/05/2013, 10:23:46
    Author     : 770600067
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>


<%

    String nome = "";
    String telefone = "";
    String email = "";
    String custohora = "";
    String oper = request.getParameter("oper");
    String id = request.getParameter("id");

    out.println(oper + " oper!");

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
        }else
        if (oper.equals("U")) {

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
        }else
        if (oper.equals("E")) {
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


%>	
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css"  href="estilos.css">
        <script src="validator.js" type="text/javascript"></script>
        <title>Cladimir, Leonardo Danieli - 17/06/2013</title>
    </head>
    <body>
        <h1>Cadastro de Professor!</h1>
 
        <a href="listaProfessor.jsp">Voltar</a><br /><br />
        <form id="form1" method="POST" action="cadProfessor.jsp">
            <div id="container">
                <fieldset class="item"  >
                    <legend> Dados Pessoais</legend>
                    <table >
                        <tr>
                            <td> Nome:</td>
                            <td><input type="text" id="nome" name="nome" value="<% out.print(nome);%>" /></td>
                        </tr>
                        <tr>
                            <td>Email: </td>
                            <td><input type="text" name="email" id="email" value="<% out.print(email);%>" /></td>
                        </tr>
                        <tr>
                            <td>Telefone: </td>
                            <td><input type="text" name="telefone" id="telefone" value="<% out.print(telefone);%>" /></td>
                        </tr>
                        <tr>
                            <td>Custo Hora: </td>
                            <td><input type="text" name="custohora" id="custohora" value="<% out.print(custohora);%>" /></td>
                        </tr>
                    </table>
                </fieldset>
           
            <input type="hidden" name="oper" id="oper" value="<% out.print(oper);%>" />
            <input type="hidden" name="id" id="id" value="<% out.print(id);%>" />
            <input type="button" onclick="validarProfessor();" value="Enviar" /> 
            <input type="reset" value="Limpar" />
 </div>
        </form>
    </body>
</html>
