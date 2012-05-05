

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ss.classes.bean.UsuarioBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <script src="js/mainFunctions.js" type="text/javascript" ></script>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" HREF="img/tubo_de_ensaio copy.jpg"/>
        <link rel="stylesheet" type="text/css" href="styles.css"/>
        <title>Science Search - Inicio</title>
    </head>

    <body>
        <!--
        <p align="right"><a href="registerPage.html" title="Registre-se" >Register</a> | <a href="loginPage.html" title="Login" class="Fonts">Login</a></p>
        -->
        <%
            UsuarioBean objUsuarioBean = (UsuarioBean) session.getAttribute("login");
            //String atribute=(String) session.getAttribute("login");

            if (objUsuarioBean == null) {%>
        <p align="right">Olá <b>Visitante</b> | <a href="registerPage.html" title="Registre-se" >Register</a> | <a href="loginPage.html" title="Login" class="Fonts">Login</a></p>
        <%         } else {%>
        <form id="off" name="off" method="get" action="loginServlet">
            <p align="right">Bem vindo, <b> <a href="modifyPerfil.jsp?id=null" title="Alterar perfil" class="Fonts"><%=objUsuarioBean.getLogin()%></a></b>

                <%if (objUsuarioBean.getTipoUsuario() == 2) {%>
                | <a href="myPublicationsPage.jsp?id=0&p=null" title="Suas Publicações">Minhas Publicações</a>
                <%} else if (objUsuarioBean.getTipoUsuario() == 3) {%>
                | <a href="publicationsManagerPage.jsp?id=0&p=null&busca=null" title="Gerencie todas as publicações">Publicações</a> | <a href="userManagerPage.jsp?id=0&p=null&busca=null" title="Gerencie todos os usuários">Usuários</a>
                <%}%>
                | <a href="#" onclick="off.submit()" title="Logoff" class="Fonts">Logoff</a></p>
        </form>
        <% }
        %>



        <hr size="1" />

        <div class="imagem"></div>
        <br>
        <form id="formSearch" action="" method="get">
            <table align="center" width="538" border="0">
                <tr>
                    <td align="right">Titulo: </td>
                    <td width="360"><input id="textTitulo" name="textTitulo" type="text" maxlength="800" size="60"  /></td>
                </tr>
                <tr>
                    <td align="right" width="168">Local de Publica&ccedil;&atilde;o: </td>
                    <td><input id="textLocal" name="textLocal" type="text" maxlength="800" size="60"  /></td>
                </tr>

            </table>
            <p align="center"><input name="btSearch" type="button" onclick="<% if (objUsuarioBean != null) {
                out.println("javascript:Pesquisa()");
            } else {
                out.println("document.location='loginPage.html'");
            }%>" dir="ltr" lang="pt" value="Busca"/></p>
        </form>
        <br>
        <hr size="1" />
        <p align="center">&copy; 2010 - <a href="aboutPage.html" title="About" target="_blank">About</a></p>
    </body>
</html>
