<%--
    Document   : registerSuccessPage
    Created on : 22/05/2010, 15:22:10
    Author     : Takeshi
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="ss.classes.bean.UsuarioBean" %>
<%@page import="ss.classes.dao.UsuarioDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" HREF="img/tubo_de_ensaio copy.jpg"/>
        <link type="text/css" href="styles.css" rel="stylesheet"/>
        <title>Science Search - Dados Cadastrados</title>
    </head>
    <body>
        <form id="off" name="off" method="get" action="loginServlet">
            <p align="right"><a href="index.jsp" title="Voltar para página principal">Home</a> | <a href="#" onclick="off.submit()" title="Logoff" class="Fonts">Logoff</a></p>
        </form>
        <hr size="1" />
        <table border="0" >
            <tr>
                <td width="265"><img src="img/Usuarios.jpg" width="294" height="418" alt="LoginImage" />
                </td>
                <td width="560">
                    <table border="0">
                        <%
            UsuarioBean objUsuarioBean = new UsuarioBean();
            UsuarioDAO usuario = new UsuarioDAO();
            int id = Integer.parseInt(request.getParameter("id"));
            objUsuarioBean = usuario.retornaUsuario(id);
            if (objUsuarioBean == null) {

                        %>
                        <tr><td width="522"><h1><font color="#008000">Não foi possível retornar os dados do usuário selecionado</font></h1></td></tr>
                        <%        } else {
                        %>
                        <tr><td width="522"><h1><font color="#008000"> Dados do Usuário </font></h1></td>
                        </tr>
                        <tr><br></tr>
                        <tr><td><font color="#008000">Nome: <i> <%=objUsuarioBean.getNome()%></i> </font></td>
                        </tr>
                        <tr>     <td><font color="#008000">Email: <i><%=objUsuarioBean.getEmail()%></i> </font></td>   </tr>
                        <tr>       <td><font color="#008000">Dt. Nascimento: <i><%=objUsuarioBean.getDtnasc()%></i> </font></td>   </tr>
                        <tr>     <td><font color="#008000">Cidade: <i><%=objUsuarioBean.getCidade()%></i></font></td>   </tr>
                        <tr>       <td><font color="#008000">Login: <i><%=objUsuarioBean.getLogin()%></i></font></td>   </tr>
                        <tr>     <td><font color="#008000">Senha:</font><font color="#66FF66"> <%=objUsuarioBean.getPass()%></font></td>   </tr>
                        <tr>     <td align="center"><form id="formLogin" action="" method="post">
                                    <input type="hidden" name="login" value="<%=objUsuarioBean.getLogin()%>" />
                                    <input type="hidden" name="senha" value="<%=objUsuarioBean.getPass()%>" />
                                    <input type="button" name="btLogin2" onclick="javascript:history.back()" value="Voltar"/>
                                </form>     </td>
                        </tr>
                        <%}
                        %>
                    </table>
                </td>
            </tr>
        </table>
        <br/> <hr size="1" /> <p align="center" class="Fonts">&copy; 2010 - <a href="aboutPage.jsp" title="about" target="_blank">About</a></p>

    </body>
</html>

