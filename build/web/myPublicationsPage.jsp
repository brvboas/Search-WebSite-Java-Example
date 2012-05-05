

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ss.classes.bean.UsuarioBean" %>
<%@page import="ss.classes.bean.PublicacaoBean" %>
<%@page import="ss.classes.dao.PublicacaoDAO" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <script src="js/myPublicationsFunctions.js" type="text/javascript"></script>
        <link rel="shortcut icon" HREF="img/tubo_de_ensaio copy.jpg"/>
        <link rel="stylesheet" type="text/css" href="styles.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Science Search - Minhas Publicações</title>
    </head>

    <%
            if (!(request.getParameter("p")).equals("null")) {
                int id = 0;
                if (request.getParameter("id") != null) {
                    id = Integer.parseInt(request.getParameter("id"));
                }
                //int id = 0;
                if ((request.getParameter("p")).equals("del")) {
                    PublicacaoDAO pd = new PublicacaoDAO();
                    pd.excluir(id);
                }
            }
    %>

    <body>
        <form id="off" name="off" method="get" action="loginServlet">
            <p align="right"><a href="index.jsp" title="Voltar para página principal">Home</a> | <a href="#" onclick="off.submit()" title="Logoff" class="Fonts">Logoff</a></p>
        </form>
        <hr size="1" />

        <form id="formPublication" method="post" action="" name="formPublication" >
            <table width="723" cellspacing="0" border="0" >
                <tr>
                    <td width="278"><img src="img/MinhasPublicacoes.jpg" width="278" height="548" alt="LoginImage" /></td>
                    <td width="435">
                        <input type="button" value="Nova Publica&ccedil;&atilde;o" onClick="window.location='sendPage.html'" id="btEnviar"/>

                        <table width="800" border="0">
                            <tr>
                                <td><hr size="1" /></td>
                                <td><hr size="1" /></td>
                                <td><hr size="1" /></td>

                            </tr>
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

            UsuarioBean objUsuario = (UsuarioBean) session.getAttribute("login");
            PublicacaoDAO publicacao = new PublicacaoDAO();

            ArrayList<PublicacaoBean> lista = new ArrayList<PublicacaoBean>();
            lista = publicacao.retornaPublicacoes(objUsuario);
            //PublicacaoBean[] objPublicacao = publicacao.retornaPublicacoes(objUsuario);
            int nPaginas = 0;
            if (lista.size() == 0) {
                            %>
                            <tr><td><h1>Você não possui nenhuma publicação. Para publicar clique em <br><font color="red">NOVA PUBLICAÇÃO</font></h1></td></tr>
                                        <%        } else {
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
                                <td width="51" align="center"><%= i + 1%>  </td>
                                <td width="400"><a href="descriptionPage.jsp?id=<%= (lista.get(i)).getID()%>" title="" onclick=""><%= lista.get(i).getTitulo()%></a></td>
                                <td width="72"> | <a href="modifyPage.jsp?id=<%= (lista.get(i)).getID()%>" title="" onClick="">Alterar</a> | <a href="#" title="" onClick="javascript:remover2('<%= (lista.get(i)).getID()%>')">Excluir</a></td>


                            </tr>

                            <%
                                    }
                                }
                            %>

                            <tr>
                                <td></td>
                                <td></td>
                                <td><p align="right"><input
                                            type="button" value="Voltar para p&aacute;gina principal" id="btCancel" onclick="document.location='index.jsp'"/></p></td>
                            </tr>
                        </table></td>
                </tr>
            </table>
            <table align="center" cellpadding="0" cellspacing="0" border="0">
                <tr>

                    <% if (atual != 1) {%>
                    <td width="32"><a href="myPublicationsPage.jsp?id=0&p=null&start=<% if (start == 10) {
         out.println("0");
     } else {
         out.println(start - 10);
     }%>&atual=<%= atual - 1%>" title="Página Anterior" onclick=""><img alt="Imagem n&atilde;o dispon&iacute;vel." src="img/setaAnterior.jpg" name="ImagemAnterior" width="27" height="24" border="0" id="ImagemAnterior" /></a>&nbsp;</td>
                            <%}
            for (int i = 0; i < nPaginas; i++) {%>
                            <% if (atual == i + 1) {%>
                    <td><p><%= i + 1%>&nbsp;</p></td>
                    <%} else {%>
                    <td width="15"><a href="myPublicationsPage.jsp?id=0&p=null&start=<% if (i == 0) {
         out.println(i);
     } else {
         out.println((i * 10));
     }%>&atual=<% out.println(i + 1);%>" title="<%= i + 1%>" onclick=""><%= i + 1%></a></td>
                    <%}%>

                    <% }
            if (atual != nPaginas) {%>
                    <td width="32"><a href="myPublicationsPage.jsp?id=0&p=null&start=<% if (start == (nPaginas - 1) * 10) {
                out.println((nPaginas * 10));
            } else {
                out.println(start + 10);
            }%>&atual=<%= atual + 1%>" title="Próxima Pagina" onclick=""><img alt="Imagem n&atilde;o dispon&iacute;vel." src="img/setaProximo.jpg" name="ImagemProxima" width="27" height="24" border="0" id="ImagemProxima" /></a>&nbsp;</td>
                            <%}%>
                </tr>
            </table>
        </form>

        <br/>
        <hr size="1" />
        <p align="center" class="Fonts">&copy; 2010 - <a href="aboutPage.html" title="about" target="_blank">About</a></p>

    </body>
</html>

