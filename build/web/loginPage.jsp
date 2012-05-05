<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ss.classes.bean.UsuarioBean" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <script src="js/loginFunctions.js" type="text/javascript" ></script>
        <link rel="shortcut icon" HREF="img/tubo_de_ensaio copy.jpg"/>
        <link rel="stylesheet" type="text/css" href="styles.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Science Search - Login</title>
    </head>

    <body>
        <p align="right"><a href="index.jsp" title="Voltar para página principal">Home</a></p>
        <hr size="1" />
        <form id="formLogin" name="formLogin" action="loginServlet" method="post">
            <table width="200" border="0" >
                <tr>
                    <td><img src="img/Login copy copy.jpg" width="265" height="259" alt="LoginImage" /></td>
                    <td><table align="center" width="200" border="0">
                            <tr>
                                <td>Login:</td>
                                <td align="left"><input  type="text" name="login" size="22" maxlength="60"/></td>
                            </tr>
                            <tr>
                                <td>Password:</td>
                                <td><input type="password" size="22" name="senha" maxlength="20"/></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td><p align="center"><input type="button" value="Login" id="btLogin" onclick="valida()">
                                        <input type="button" value="Cancel" id="btCancel" onclick="document.location='index.jsp'"/></p></td>
                            </tr>
                        </table>
                        <%
            UsuarioBean objUsuarioBean = (UsuarioBean) session.getAttribute("login");
            if (objUsuarioBean == null) {
                        %>
                        <p align="right"><font color="blue">Aten&ccedil;&atilde;o: usu&aacute;rio ou senha n&atilde;o confere.</font></p>
                        <%            }
                        %>
                        <p align="right">Ainda n&atilde;o &eacute; usu&aacute;rio? Cadastre-se <a href="registerPage.html">aqui</a>.</p>
                    </td>
                </tr>
            </table>
        </form>

        <br/>
        <hr size="1" />
        <p align="center" class="Fonts">&copy; 2010 - <a href="aboutPage.HTML" title="about" target="_blank">About</a></p>

    </body>
</html>
