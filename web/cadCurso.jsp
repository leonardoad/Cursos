<%-- 
    Document   : Curso
    Created on : 27/05/2013, 10:23:46
    Author     : 770600067
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>


<%

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
            valor = request.getParameter("valor");

            
            if (!nome.equals(null) && !id_professor.equals(null)) {

                String sql = "INSERT INTO professor (nome,descricao,datainicio,datafim,horainicio,horafim,valor) values (?,?,?,?,?,?,?)";

                ps = conn.prepareStatement(sql);
                ps.setString(1, nome);
                ps.setString(2, descricao);
                ps.setString(3, datainicio);
                ps.setString(4, datafim);
                ps.setString(5, horainicio);
                ps.setString(6, horafim);
                ps.setFloat(7, Float.parseFloat(valor));

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

 
%>	
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css"  href="css/estilos.css">
        <script src="js/validator.js" type="text/javascript"></script>
        <title>Cladimir, Leonardo Danieli - 17/06/2013</title>
    </head>
    <body>
        <h1>Cadastro de Curso!</h1>

        <a href="listaCurso.jsp">Voltar</a><br /><br />
        <form id="form1" method="POST" action="cadCurso.jsp">
            <div id="container">
                <fieldset class="item"  >
                    <legend> Dados do Curso</legend>
                    <table >
                        <tr>
                            <td> Professor:</td>
                            <td>
                                <select name="id_professor" id="id_professor">
                                    <option value="">Selecione...</option>
            <%
            while(rsCombo.next())
                out.print("<option value="+rsCombo.getString("id")+">"+rsCombo.getString("nome")+"</option>");
            %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td> Nome:</td>
                            <td><input type="text" id="nome" name="nome" value="<% out.print(nome);%>" /></td>
                        </tr>
                        <tr>
                            <td> Descrição:</td>
                            <td><input type="text" id="descricao" name="descricao" value="<% out.print(descricao);%>" /></td>
                        </tr>
                        <tr>
                            <td> Data Inicio:</td>
                            <td><input type="text" id="datainicio" name="datainicio" value="<% out.print(datainicio);%>" /></td>
                        </tr>
                        <tr>
                            <td> Data Fim :</td>
                            <td><input type="text" id="datafim" name="datafim" value="<% out.print(datafim);%>" /></td>
                        </tr>
                        <tr>
                            <td> Hora Inicio:</td>
                            <td><input type="text" id="horainicio" name="horainicio" value="<% out.print(horainicio);%>" /></td>
                        </tr>
                        <tr>
                            <td> Hora Fim:</td>
                            <td><input type="text" id="horafim" name="horafim" value="<% out.print(horafim);%>" /></td>
                        </tr>
                        <tr>
                            <td> Conteudo:</td>
                            <td><input type="text" id="conteudo" name="conteudo" value="<% out.print(conteudo);%>" /></td>
                        </tr>
                        <tr>
                            <td> Valor:</td>
                            <td><input type="text" id="nome" name="nome" value="<% out.print(valor);%>" /></td>
                        </tr>
                    </table>
                </fieldset>
                            
                <input type="hidden" name="oper" id="oper" value="<% out.print(oper);%>" />
                <input type="hidden" name="id" id="id" value="<% out.print(id);%>"/>
                <input type="button" onclick="validarProfessor();" value="Enviar" /> 
                <input type="reset" value="Limpar" />
            </div>
        </form>
    </body>
</html>
