

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ss.classes.bean.PublicacaoBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" HREF="img/tubo_de_ensaio copy.jpg"/>
        <link type="text/css" href="styles.css" rel="stylesheet"/>
        <title>Science Search - Dados Enviados</title>
    </head>
    <body>
        <form id="off" name="off" method="get" action="loginServlet">
            <p align="right"><a href="index.jsp" title="Voltar para página principal">Home</a> | <a href="#" onclick="off.submit()" title="Logoff" class="Fonts">Logoff</a></p>
        </form>
        <hr size="1" />
        <%
        PublicacaoBean objPublicacaoBean = (PublicacaoBean) request.getAttribute("publicacaoBean");
        %>
        <table border="0" >
            <tr>
                <td width="265"><img src="img/sucesso copy.jpg" width="294" height="418" alt="sendImage" />
                </td>
                <td width="560"><table border="0">
                        <tr><td width="572"><h1>Publica&ccedil;&atilde;o cadastrada/alterada com sucesso!!!</font></h1></td>
                        </tr>
                        <tr><td><br></td></tr>
                        <tr><td>Titulo: <i> <%= objPublicacaoBean.getTitulo()%> </i></td>
                        </tr>
                        <tr>     <td>Autor(es): <i> <% for (int i = 0; i < (objPublicacaoBean.getAutor()).length; i++) {%>
                                    <%= (objPublicacaoBean.getAutor())[i]%> <% if (i != (objPublicacaoBean.getAutor()).length - 1) {%>, <% }%>
                                    <%}%>
                                </i></td>   </tr>
                        <tr>       <td>Local de Publica&ccedil;&atilde;o: <i><%= objPublicacaoBean.getLocal()%></i></td>   </tr>
                        <tr>     <td>P&aacute;ginas: <i><%= objPublicacaoBean.getPaginas()%></i></font></td>   </tr>
                        <tr>       <td>Ano: <i><%= objPublicacaoBean.getAno()%></i></font></td>   </tr>
                        <tr>     <td align="center"><form id="formMyPublication" action="" method="post">
                                    <input type="button" name="btLogin2" value="Retornar" onClick="document.location='myPublicationsPage.jsp?id=0&p=null'"/>						</form>     </td>
                        </tr> </table>
                </td>
            </tr>
        </table>
        <br/> <hr size="1" /> <p align="center" class="Fonts">&copy; 2010 - <a href="aboutPage.html" title="about" target="_blank">About</a></p>
    </body>
</html>
