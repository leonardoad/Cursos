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
        <h1>Cadastro de Professor!</h1>
        
<form id="form1" method="POST" action="response.jsp">
            <div id="container">
            <fieldset class="item" style="float: left">
                <legend> Dados Pessoais</legend>
                <table >
                    <tr>
                        <td> Nome:</td>
                        <td><input type="text" id="nome" name="nome" value="" /></td>
                    </tr>
                    <tr>
                        <td>Digite seu RG:  </td>
                        <td><input type="text" id="rg" name="rg" value="" /></td>
                    </tr>
                    <tr>
                        <td> Digite seu CPF:</td>
                        <td><input type="text" id="cpf" name="cpf" value="" /></td>
                    </tr>
                    <tr>
                        <td>Digite seu Endereço: </td>
                        <td><input type="text" id="endereco" name="endereco" value="" /></td>
                    </tr>
                    <tr>
                        <td>Telefone:  </td>
                        <td><input type="text" id="telefone" name="telefone" value="" /></td>
                    </tr>
                    <tr>
                        <td>Data de Nasc: </td>
                        <td><input type="text" id="datanasc" name="datanasc" value="" /></td>
                    </tr>
                    <tr>
                        <td> Cargo:</td>
                        <td><input type="text" id="cargo" name="cargo" value="" /></td>
                    </tr>
                    <tr>
                        <td>Data de Admissão: </td>
                        <td><input type="text" name="dataadmissao" id="dataadmissao" value="" /></td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="item" style="float: none">
                <legend> Dados Salariais</legend>
                <table >
                    <tr>
                        <td> Salario por Hora:</td>
                        <td><input type="text" id="salariohora" name="salariohora" value="" /></td>
                    </tr>
                    <tr>
                        <td>Horas trabalhadas:  </td>
                        <td><input type="text" name="horastrabalhadas" id="horastrabalhadas" value="" /></td>
                    </tr>
                    <tr>

                </table>
            </fieldset>
            <fieldset class="item" style="float: none">
                <legend> Dados Cálculos</legend>
                <table >
                    <tr>
                        <td> Salário Bruto:</td>
                        <td><input type="text" readonly="" class="readonly" id="salariobruto" value="" /></td>
                    </tr>
                    <tr>
                        <td>INSS:  </td>
                        <td><input type="text" readonly="" class="readonly" id="inss" value="" /></td>
                    </tr>
                    <tr>
                        <td> IRRF:</td>
                        <td><input type="text" readonly="" class="readonly" id="irrf" value="" /></td>
                    </tr>
                    <tr>
                        <td>Salario Liquido: </td>
                        <td><input type="text" readonly="" class="readonly" id="satarioliquido" value="" /></td>
                    </tr>
                     
                </table>
            </fieldset>
                
            </div>
            <input type="button" onclick="validar();" value="Enviar" />
            <input type="reset" value="Limpar" />

        </form>
    </body>
</html>
