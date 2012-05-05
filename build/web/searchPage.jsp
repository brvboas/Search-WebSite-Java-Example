
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ss.classes.bean.PublicacaoBean" %>
<%@page import="ss.classes.bean.UsuarioBean" %>
<%@page import="ss.classes.dao.PublicacaoDAO" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <script src="js/mainFunctions.js" type="text/javascript" ></script>
        <link rel="shortcut icon" HREF="img/tubo_de_ensaio copy.jpg"/>
        <link type="text/css" href="styles.css" rel="stylesheet"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Science Search - Busca</title>
    </head>

    <body>
        <%

            int start;
            if (request.getParameter("start") != null) {
                start = Integer.parseInt(request.getParameter("start"));
            } else {
                start = 0;
            }

            int atual;
            if (request.getParameter("atual") != null) {
                atual = Integer.parseInt(request.getParameter("atual"));
            } else {
                atual = 1;
            }

            String titulo = "";
            if (request.getParameter("t") != null) {
                titulo = request.getParameter("t");
            }

            String local = "";
            if (request.getParameter("l") != null) {
                local = request.getParameter("l");
            }


            PublicacaoDAO publicacao = new PublicacaoDAO();
            ArrayList<PublicacaoBean> lista = new ArrayList<PublicacaoBean>();
            lista = publicacao.retornaPublicacoesPesquisa(titulo, local);

            int nPaginas = 0;
        %>
        <%
            UsuarioBean objUsuarioBean = (UsuarioBean) session.getAttribute("login");
            //String atribute=(String) session.getAttribute("login");

            if (objUsuarioBean != null) {%>
        <form id="off" name="off" method="get" action="loginServlet">
            <p align="right">Bem vindo, <b> <a href="modifyPerfil.jsp" title="Alterar perfil" class="Fonts"><%=objUsuarioBean.getLogin()%></a></b>

                <%if (objUsuarioBean.getTipoUsuario() == 2) {%>
                | <a href="myPublicationsPage.jsp?id=0&p=null" title="Suas Publicações">Minhas Publicações</a>
                <%} else if (objUsuarioBean.getTipoUsuario() == 3) {%>
                | <a href="publicationsManagerPage.jsp?id=0&p=null&busca=null" title="Gerencie todas as publicações">Gerenciar Publicações</a>
                <%}%>
                | <a href="#" onclick="off.submit()" title="Logoff" class="Fonts">Logoff</a></p>
        </form><%}%><hr size="1" />

        <form id="formSearch" action="" method="get">
            <table width="627" border="0" cellspacing="0">
                <tr >
                    <td width="81"><img alt="Imagem n&atilde;o dispon&iacute;vel." src="img/tubo_de_ensaio copy.jpg" name="ImageScienceSearch" width="81" height="100" border="0" id="ImageScienceSearch" /></td>
                    <td width="536">
                        <table width="538" border="0">
                            <tr>
                                <td align="right">Titulo: </td>
                                <td width="360"><input id="textTitulo" value="<%= titulo%>" type="text" maxlength="800" size="60"  /></td>
                            </tr>
                            <tr>
                                <td align="right" width="168">Local de Publicação: </td>
                                <td><input id="textLocal" value="<%= local%>" type="text" maxlength="800" size="60"  /></td>
                            </tr>

                        </table></td>
                </tr>
                <tr>
                    <td></td>
                    <td align="right"><input name="btSearch" type="button" dir="ltr" lang="pt" value="Busca" onclick="javascript:Pesquisa()" /></td>
                </tr>
            </table>
        </form>
        <hr size="1" />

        <table border="0">
            <tr>
                <td width="278"><img src="img/Publicacoes.jpg" width="278" height="548" alt="LoginImage" /></td>

                <td>
                    <table cellpadding="0" cellspacing="0" width="635" border="0">
                        <%
                        if (lista.size() == 0) {
                        %>
                        <tr><td><h1>Desculpe, não encontramos nenhum resultado.<br><font color="red"><i>Faça uma nova busca!</i></font></h1></td></tr>
                                    <%       } else {
                   if (lista.size() % 10 == 0) {
                       nPaginas = lista.size() / 10;
                   } else {
                       nPaginas = (lista.size() / 10) + 1;
                   }
                   int tamPagina = lista.size();
                   if (start + 10 < tamPagina) {
                       tamPagina = start + 10;
                   }
                   for (int i = start; i < tamPagina; i++) {
                       request.setAttribute("ID" + (lista.get(i)).getID(), lista.get(i));

                                    %>
                        <tr>
                            <td width="283"><a href="descriptionPage.jsp?id=<%= (lista.get(i)).getID()%>" title="" onclick=""><%= lista.get(i).getTitulo()%></a></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <% }
            }%>

                    </table>
                </td>
            </tr>
        </table>
        <br>

        <table align="center" cellpadding="0" cellspacing="0" border="0">
            <tr>

                <% if (atual != 1) {%>
                <td width="32"><a href="searchPage.jsp?start=<% if (start == 10) {
         out.println("0");
     } else {
         out.println(start - 10);
     }%>&atual=<%= atual - 1%>&t=<%= titulo%>&l=<%= local%>" title="Página Anterior" onclick=""><img alt="Imagem n&atilde;o dispon&iacute;vel." src="img/setaAnterior.jpg" name="ImagemAnterior" width="27" height="24" border="0" id="ImagemAnterior" /></a>&nbsp;</td>
                        <%}
            for (int i = 0; i < nPaginas; i++) {%>
                        <% if (atual == i + 1) {%>
                <td><p><%= i + 1%>&nbsp;</p></td>
                <%} else {%>
                <td width="15"><a href="searchPage.jsp?start=<% if (i == 0) {
         out.println(i);
     } else {
         out.println((i * 10));
     }%>&atual=<% out.println(i + 1);%>&t=<%= titulo%>&l=<%= local%>" title="<%= i + 1%>" onclick=""><%= i + 1%></a></td>
                <%}%>

                <% }
            if (atual != nPaginas) {%>
                <td width="32"><a href="searchPage.jsp?start=<% if (start == (nPaginas - 1) * 10) {
                out.println((nPaginas * 10));
            } else {
                out.println(start + 10);
            }%>&atual=<%= atual + 1%>&t=<%= titulo%>&l=<%= local%>" title="Próxima Pagina" onclick=""><img alt="Imagem n&atilde;o dispon&iacute;vel." src="img/setaProximo.jpg" name="ImagemProxima" width="27" height="24" border="0" id="ImagemProxima" /></a>&nbsp;</td>
                        <%}%>
            </tr>
        </table>


        <br>
        <hr size="1" />
        <p align="center">&copy; 2010 - <a href="aboutPage.html" title="About" target="_blank">About</a></p>

    </body>
</html>