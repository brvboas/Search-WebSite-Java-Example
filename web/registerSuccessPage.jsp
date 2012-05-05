
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="ss.classes.bean.UsuarioBean" %>
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
                <td width="265"><img src="img/sucesso copy.jpg" width="294" height="418" alt="LoginImage" />
                </td>
                <td width="560">
                    <table border="0">
                        <%
            UsuarioBean objUsuarioBean = (UsuarioBean) request.getAttribute("usuarioBean");
            UsuarioBean objUsuarioBean2 = (UsuarioBean) session.getAttribute("login");

            int acao = (Integer) request.getAttribute("acao");
            if (objUsuarioBean == null) {

                        %>
                        <tr><td width="522"><h1><font color="#008000">Não foi possivel inserir os dados</font></h1></td></tr>
                        <%        } else {
                        %>
                        <tr><td width="522"><h1><font color="#008000"> <%if (acao == 1) {%> Cadastro efetuado com sucesso!!!<%} else {%> Alteração efetuado com sucesso!<%}%>  </font></h1></td>
                        </tr>
                        <tr><br></tr>
                        <tr><td><font color="#008000">Nome: <i> <%=objUsuarioBean.getNome()%></i> </font></td>
                        </tr>
                        <tr>     <td><font color="#008000">Email: <i><%=objUsuarioBean.getEmail()%></i> </font></td>   </tr>
                        <tr>       <td><font color="#008000">Dt. Nascimento: <i><%=objUsuarioBean.getDtnasc()%></i> </font></td>   </tr>
                        <tr>     <td><font color="#008000">Cidade: <i><%=objUsuarioBean.getCidade()%></i></font></td>   </tr>
                        <tr>       <td><font color="#008000">Login: <i><%=objUsuarioBean.getLogin()%></i></font></td>   </tr>
                        <tr>     <td align="center"><form id="formLogin" action="loginServlet" method="post">
                                    <input type="hidden" name="login" value="<%=objUsuarioBean.getLogin()%>" />
                                    <input type="hidden" name="senha" value="<%=objUsuarioBean.getPass()%>" />
                                    <input type="<% if (acao == 1 || (acao == 2 && objUsuarioBean2.getTipoUsuario() != 3)) {
                    out.print("submit");
                } else {
                    out.print("button");
                }%>" onclick="<% if (acao == 1 || (acao == 2 && objUsuarioBean2.getTipoUsuario() != 3)) {
                    out.print("");
                } else {
                    out.print("document.location='userManagerPage.jsp?id=0&p=null&busca=null'");
                }%>" name="btLogin2" value="<% if (acao == 1 || (acao == 2 && objUsuarioBean2.getTipoUsuario() != 3)) {
                    out.print("Retornar para a página principal");
                } else {
                    out.print("Voltar");
                }%>"/>
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

