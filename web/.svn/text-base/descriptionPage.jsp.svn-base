
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ss.classes.bean.PublicacaoBean" %>
<%@page import="ss.classes.dao.PublicacaoDAO" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" HREF="img/tubo_de_ensaio copy.jpg"/>
        <link type="text/css" href="styles.css" rel="stylesheet"/>
        <title>Science Search - Descri&ccedil;&atilde;o</title>
    </head>
    <body>
        <form id="off" name="off" method="get" action="loginServlet">
            <p align="right"><a href="index.jsp" title="Voltar para página principal">Home</a> | <a href="#" onclick="off.submit()" title="Logoff" class="Fonts">Logoff</a></p>
        </form>
        <hr size="1" />
        <%
            int id = 0;
            if (request.getParameter("id") != null) {
                id = Integer.parseInt(request.getParameter("id"));
            }
            //PublicacaoBean objPublicacao = (PublicacaoBean) request.getAttribute("ID"+id);
            PublicacaoDAO publicacao = new PublicacaoDAO();
            PublicacaoBean objPublicacao = new PublicacaoBean();
            objPublicacao = publicacao.recuperaPublicacoes(id);

        %>
        <table border="0" >
            <tr>
                <td width="265"><img src="img/Descricao.jpg" width="301" height="444" alt="LoginImage" />
                </td>
                <td width="560">
                    <table border="0">
                        <% if (objPublicacao != null) {%>
                        <tr><td width="572"><h1>Publica&ccedil;&atilde;o:</h1></td>
                        </tr>
                        <tr><td><br></td></tr>
                        <tr><td>Titulo: <i><%= objPublicacao.getTitulo()%></i></td>
                        </tr>
                        <tr>     <td>Autor(es): <i><% for (int i = 0; i < (objPublicacao.getAutor()).length; i++) {%>
                                    <%= (objPublicacao.getAutor())[i]%> <% if (i != (objPublicacao.getAutor()).length - 1) {%>, <% }%>
                                    <%}%>
                                </i></td>   </tr>
                        <tr>       <td>Local de Publica&ccedil;&atilde;o: <i><%= objPublicacao.getLocal()%></i></td>   </tr>
                        <tr>     <td>P&aacute;ginas: <i><%= objPublicacao.getPaginas()%></i></td>   </tr>
                        <tr>       <td>Ano: <i><%= objPublicacao.getAno()%></i></td>   </tr>

                        <% }%>
                        <tr>     <td align="center"><form id="formMyPublication" action="" method="post">
                                    <input type="button" name="btLogin2" value="Retornar" onClick="javascript:history.back()"/>
                                </form>     </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br/> <hr size="1" /> <p align="center" class="Fonts">&copy; 2010 - <a href="aboutPage.jsp" title="about" target="_blank">About</a></p>
    </body>
</html>
