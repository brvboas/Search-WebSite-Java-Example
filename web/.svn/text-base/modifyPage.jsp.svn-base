

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ss.classes.bean.PublicacaoBean" %>
<%@page import="ss.classes.dao.PublicacaoDAO" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <script src="js/sendFunctions.js" type="text/javascript"></script>
        <link rel="shortcut icon" HREF="img/tubo_de_ensaio copy.jpg"/>
        <link type="text/css" href="styles.css" rel="stylesheet"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Science Search - Enviar Publica&ccedil;&atilde;o</title>
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
        <form id="formSend" name="formSend" action="sendServlet" method="post">
            <table width="200" border="0" >
                <tr>
                    <td><img src="img/AlterarPublicacao.jpg" width="306" height="408" alt="LoginImage" /></td>
                    <td><table align="center" width="500"  border="0">

                            <tr>
                                <td>T&iacute;tulo:</td>
                                <td><input type="text" size="40" name="tituloArtigo" value="<%= objPublicacao.getTitulo()%>" maxlength="200"/></td>
                            </tr>
                            <tr>





                                <td align="topmargin">Autor: <br><a href="javascript:addInput();"  id="autor_add" tabindex="1">[+] Autor</a>
                                    <br><input type="hidden" name="hidden1" id="hidden1" value=""><input type="hidden" name="hidden2" id="hidden2"><input type="hidden" name="hidden3" id="hidden3"></td>
                            <input type="hidden" name="acao" value="alterar">
                            <input type="hidden" name="ID" value="<%= objPublicacao.getID()%>">
                            <td width="400"><input type="text" size="40" id="autorArtigo" name="autorArtigo" maxlength="60"/>
                            </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <script type="text/javascript">
                            //Escrevendo o c�digo-fonte HTML e ocultando os campos criados:
                            for (iLoop = 1; iLoop <= totalCampos; iLoop++) {
                                document.write("<span id='linha"+iLoop+"' style='display:none'><input type='text' id='arq"+iLoop+"' size='40' maxlength='60' name='arq"+iLoop+"'> <a id='autor_remover' href='javascript:RemoverCampos(\""+iLoop+"\")'> [-]Remover </a> </span>");
                            }
                        </script>

                    </td>
                </tr>
                <tr>
                    <td>Local de Publica&ccedil;&atilde;o:</td>
                    <td><input type="text" size="40" name="localArtigo" value="<%= objPublicacao.getLocal()%>" maxlength="60"/></td>
                </tr>

                <tr>
                    <% String s = objPublicacao.getPaginas();
            String pagina[] = s.split("-");
                    %>
                    <td>P&aacute;ginas:</td>
                    <td>de: <input type="text" size="5" name="paginaDeArtigo" value="<%= pagina[0]%>" maxlength="20"/> at&eacute;: <input type="text" size="5" name="paginaAteArtigo" value="<%= pagina[1]%>" maxlength="20"/> </td>
                </tr>
                <tr>
                    <td>Ano:</td>
                    <td><input type="text" size="5" name="anoArtigo" value="<%= objPublicacao.getAno()%>" maxlength="4"/></td>
                </tr>

                <tr>
                    <td></td>
                    <td><p align="center"><input type="button" value="Enviar" id="btEnviar" onClick="javascript: return valida()"> <input
                                type="button" value="Cancelar" id="btCancel" onClick="javascript:history.back();" /></p></td>
                </tr>
            </table>
        </table></td>
</tr>
</table>
<br>
<hr size="1" />
<p align="center" class="Fonts">&copy; 2010 - <a href="aboutPage.html" title="about" target="_blank">About</a></p>
</form>

<% for (int i = 0; i < (objPublicacao.getAutor()).length - 1; i++) {%>
<script>
    //alert('fdf');
    //document.getElementById('formSend:autor_add').onclick();
    javascript:addInput();
</script>
<%}%>
<% for (int i = 0; i < (objPublicacao.getAutor()).length; i++) {
                if (i == 0) {
%>
<script>
    document.getElementById("autorArtigo").value = "<%= (objPublicacao.getAutor())[i]%>";
</script>
<% } else {
%>
<script>
    document.getElementById("arq<%= i%>").value = "<%= (objPublicacao.getAutor())[i]%>";
</script>

<%}
            }%>
</body>
</html>
