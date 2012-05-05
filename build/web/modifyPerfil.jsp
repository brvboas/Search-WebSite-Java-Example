

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ss.classes.bean.UsuarioBean" %>
<%@page import="ss.classes.dao.UsuarioDAO" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%!int dia = 0, mes = 0, ano = 0;

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>

    <head>
        <script src="js/modifyPerfilFunctions.js" type="text/javascript"></script>
        <link rel="shortcut icon" HREF="img/tubo_de_ensaio copy.jpg"/>
        <link type="text/css" href="styles.css" rel="stylesheet"/>
        <meta http-equiv="Content-Type" content="text/html;  charset=utf-8" />
        <title>Science Search - Registro</title>
    </head>
    <body>
        <form id="off" name="off" method="get" action="loginServlet">
            <p align="right"><a href="index.jsp" title="Voltar para página principal">Home</a> | <a href="#" onclick="off.submit()" title="Logoff" class="Fonts">Logoff</a></p>
        </form>
        <hr size="1" />

        <%
            UsuarioBean u = new UsuarioBean();
            //String parametro = request.getParameter("id");
            if (request.getParameter("id").equals("null")) {
                u = (UsuarioBean) session.getAttribute("login");
            } else {
                UsuarioDAO usuario = new UsuarioDAO();
                int id = Integer.parseInt(request.getParameter("id"));
                u = usuario.retornaUsuario(id);
            }
            String Sexo = u.getSexo();
            //int dia=0,mes=0,ano=0;
            Calendar cal = Calendar.getInstance();
            cal.setTime(u.getDtnasc());
            dia = cal.get(cal.DAY_OF_MONTH);
            mes = cal.get(cal.MONTH) + 1;
            ano = cal.get(cal.YEAR);
            //System.out.println(dia+"/"+mes+"/"+ano);

        %>

        <form id="cadastro" name="cadastro" action="registerServlet" method="post">
            <table width="966" border="0" >
                <tr>
                    <td width="295"><img src="img/Alterar.jpg" width="327" height="532" alt="PerfilImage" /></td>
                    <td width="661"><table align="left" border="0" width="628">

                            <tr>
                            <input type="hidden" value="<%=u.getIdusuario()%>" name="idusuario" size="50" maxlength="250">
                            <td height="23" width="94">Nome:</td>
                            <td height="23" width="373"><input type="text" value="<%=u.getNome()%>" name="nome" size="50" maxlength="250"></td>
                            <td height="23" width="373"><input type="hidden" name="acao" value="alterar"></td>
                </tr>

                <tr>
                    <td height="23" width="94">E-mail:</td>
                    <td height="23" width="373"><input type="text" value="<%=u.getEmail()%>" name="email1" size="25" maxlength="250"></td>
                </tr>

                <tr>
                    <td height="17" width="94">Sexo:</td>
                    <td height="17" width="373">

                        <input <% if ((u.getSexo()).equals("F")) {
                out.print("checked");
            }%> type="radio" name="sexo" value="F">Feminino
                        <input <% if ((u.getSexo()).equals("M")) {
                out.print("checked");
            }%> type="radio" name="sexo" value="M">Masculino
                    </td>
                </tr>

                <tr>
                    <td height="23" width="94">Data de Nascimento:</td>
                    <td height="23" width="373">
                        <select name="dia_nasc">
                            <option  value="-1">Dia</option>
                            <option <%if (dia == 1) {
                out.print("selected");
            }%> value=01>01</option>
                            <option <%if (dia == 2) {
                out.print("selected");
            }%> value=02>02</option>
                            <option <%if (dia == 3) {
                out.print("selected");
            }%> value=03>03</option>
                            <option <%if (dia == 4) {
                out.print("selected");
            }%> value=04>04</option>
                            <option <%if (dia == 5) {
                out.print("selected");
            }%> value=05>05</option>
                            <option <%if (dia == 6) {
                out.print("selected");
            }%> value=06>06</option>
                            <option <%if (dia == 7) {
                out.print("selected");
            }%> value=07>07</option>
                            <option <%if (dia == 8) {
                out.print("selected");
            }%> value=08>08</option>
                            <option <%if (dia == 9) {
                out.print("selected");
            }%> value=09>09</option>
                            <option <%if (dia == 10) {
                out.print("selected");
            }%> value=10>10</option>
                            <option <%if (dia == 11) {
                out.print("selected");
            }%> value=11>11</option>
                            <option <%if (dia == 12) {
                out.print("selected");
            }%> value=12>12</option>
                            <option <%if (dia == 13) {
                out.print("selected");
            }%> value=13>13</option>
                            <option <%if (dia == 14) {
                out.print("selected");
            }%> value=14>14</option>
                            <option <%if (dia == 15) {
                out.print("selected");
            }%> value=15>15</option>
                            <option <%if (dia == 16) {
                out.print("selected");
            }%> value=16>16</option>
                            <option <%if (dia == 17) {
                out.print("selected");
            }%> value=17>17</option>
                            <option <%if (dia == 18) {
                out.print("selected");
            }%> value=18>18</option>
                            <option <%if (dia == 19) {
                out.print("selected");
            }%> value=19>19</option>
                            <option <%if (dia == 20) {
                out.print("selected");
            }%> value=20>20</option>
                            <option <%if (dia == 21) {
                out.print("selected");
            }%> value=21>21</option>
                            <option <%if (dia == 22) {
                out.print("selected");
            }%> value=22>22</option>
                            <option <%if (dia == 23) {
                out.print("selected");
            }%> value=23>23</option>
                            <option <%if (dia == 24) {
                out.print("selected");
            }%> value=24>24</option>
                            <option <%if (dia == 25) {
                out.print("selected");
            }%> value=25>25</option>
                            <option <%if (dia == 26) {
                out.print("selected");
            }%> value=26>26</option>
                            <option <%if (dia == 27) {
                out.print("selected");
            }%> value=27>27</option>
                            <option <%if (dia == 28) {
                out.print("selected");
            }%> value=28>28</option>
                            <option <%if (dia == 29) {
                out.print("selected");
            }%> value=29>29</option>
                            <option <%if (dia == 30) {
                out.print("selected");
            }%> value=30>30</option>
                            <option <%if (dia == 31) {
                out.print("selected");
            }%> value=31>31</option>
                        </select>
                        / <select name="mes_nasc">
                            <option value="-1">Mês</option>
                            <option <%if (mes == 1) {
                out.print("selected");
            }%> value=1>JAN</option>
                            <option <%if (mes == 2) {
                out.print("selected");
            }%> value=2>FEV</option>
                            <option <%if (mes == 3) {
                out.print("selected");
            }%> value=3>MAR</option>
                            <option <%if (mes == 4) {
                out.print("selected");
            }%> value=4>ABR</option>
                            <option <%if (mes == 5) {
                out.print("selected");
            }%> value=5>MAI</option>
                            <option <%if (mes == 6) {
                out.print("selected");
            }%> value=6>JUN</option>
                            <option <%if (mes == 7) {
                out.print("selected");
            }%> value=7>JUL</option>
                            <option <%if (mes == 8) {
                out.print("selected");
            }%> value=8>AGO</option>
                            <option <%if (mes == 9) {
                out.print("selected");
            }%> value=9>SET</option>
                            <option <%if (mes == 10) {
                out.print("selected");
            }%> value=10>OUT</option>
                            <option <%if (mes == 11) {
                out.print("selected");
            }%> value=11>NOV</option>
                            <option <%if (mes == 12) {
                out.print("selected");
            }%> value=12>DEZ</option>
                        </select>
                        / <select name="ano_nasc">
                            <option value="-1">Ano</option>
                            <option <%if (ano == 1900) {
                out.print("selected");
            }%> value=1900>1900</option>
                            <option <%if (ano == 1901) {
                out.print("selected");
            }%> value=1901>1901</option>
                            <option <%if (ano == 1902) {
                out.print("selected");
            }%> value=1902>1902</option>
                            <option <%if (ano == 1903) {
                out.print("selected");
            }%> value=1903>1903</option>
                            <option <%if (ano == 1904) {
                out.print("selected");
            }%> value=1904>1904</option>
                            <option <%if (ano == 1905) {
                out.print("selected");
            }%> value=1905>1905</option>
                            <option <%if (ano == 1906) {
                out.print("selected");
            }%> value=1906>1906</option>
                            <option <%if (ano == 1907) {
                out.print("selected");
            }%> value=1907>1907</option>
                            <option <%if (ano == 1908) {
                out.print("selected");
            }%> value=1908>1908</option>
                            <option <%if (ano == 1909) {
                out.print("selected");
            }%> value=1909>1909</option>
                            <option <%if (ano == 1910) {
                out.print("selected");
            }%> value=1910>1910</option>
                            <option <%if (ano == 1911) {
                out.print("selected");
            }%> value=1911>1911</option>
                            <option <%if (ano == 1912) {
                out.print("selected");
            }%> value=1912>1912</option>
                            <option <%if (ano == 1913) {
                out.print("selected");
            }%> value=1913>1913</option>
                            <option <%if (ano == 1914) {
                out.print("selected");
            }%> value=1914>1914</option>
                            <option <%if (ano == 1915) {
                out.print("selected");
            }%> value=1915>1915</option>
                            <option <%if (ano == 1916) {
                out.print("selected");
            }%> value=1916>1916</option>
                            <option <%if (ano == 1917) {
                out.print("selected");
            }%> value=1917>1917</option>
                            <option <%if (ano == 1918) {
                out.print("selected");
            }%> value=1918>1918</option>
                            <option <%if (ano == 1919) {
                out.print("selected");
            }%> value=1919>1919</option>
                            <option <%if (ano == 1920) {
                out.print("selected");
            }%> value=1920>1920</option>
                            <option <%if (ano == 1921) {
                out.print("selected");
            }%> value=1921>1921</option>
                            <option <%if (ano == 1922) {
                out.print("selected");
            }%> value=1922>1922</option>
                            <option <%if (ano == 1923) {
                out.print("selected");
            }%> value=1923>1923</option>
                            <option <%if (ano == 1924) {
                out.print("selected");
            }%> value=1924>1924</option>
                            <option <%if (ano == 1925) {
                out.print("selected");
            }%> value=1925>1925</option>
                            <option <%if (ano == 1926) {
                out.print("selected");
            }%> value=1926>1926</option>
                            <option <%if (ano == 1927) {
                out.print("selected");
            }%> value=1927>1927</option>
                            <option <%if (ano == 1928) {
                out.print("selected");
            }%> value=1928>1928</option>
                            <option <%if (ano == 1929) {
                out.print("selected");
            }%> value=1929>1929</option>
                            <option <%if (ano == 1930) {
                out.print("selected");
            }%> value=1930>1930</option>
                            <option <%if (ano == 1931) {
                out.print("selected");
            }%> value=1931>1931</option
                            <option <%if (ano == 1932) {
                out.print("selected");
            }%> value=1932>1932</option>
                            <option <%if (ano == 1933) {
                out.print("selected");
            }%> value=1933>1933</option>
                            <option <%if (ano == 1934) {
                out.print("selected");
            }%> value=1934>1934</option>
                            <option <%if (ano == 1935) {
                out.print("selected");
            }%> value=1935>1935</option>
                            <option <%if (ano == 1936) {
                out.print("selected");
            }%> value=1936>1936</option>
                            <option <%if (ano == 1937) {
                out.print("selected");
            }%> value=1937>1937</option>
                            <option <%if (ano == 1938) {
                out.print("selected");
            }%> value=1938>1938</option>
                            <option <%if (ano == 1939) {
                out.print("selected");
            }%> value=1939>1939</option>
                            <option <%if (ano == 1940) {
                out.print("selected");
            }%> value=1940>1940</option>
                            <option <%if (ano == 1941) {
                out.print("selected");
            }%> value=1941>1941</option>
                            <option <%if (ano == 1942) {
                out.print("selected");
            }%> value=1942>1942</option>
                            <option <%if (ano == 1943) {
                out.print("selected");
            }%> value=1943>1943</option>
                            <option <%if (ano == 1944) {
                out.print("selected");
            }%> value=1944>1944</option>
                            <option <%if (ano == 1945) {
                out.print("selected");
            }%> value=1945>1945</option>
                            <option <%if (ano == 1946) {
                out.print("selected");
            }%> value=1946>1946</option>
                            <option <%if (ano == 1947) {
                out.print("selected");
            }%> value=1947>1947</option>
                            <option <%if (ano == 1948) {
                out.print("selected");
            }%> value=1948>1948</option>
                            <option <%if (ano == 1949) {
                out.print("selected");
            }%> value=1949>1949</option>
                            <option <%if (ano == 1950) {
                out.print("selected");
            }%> value=1950>1950</option>
                            <option <%if (ano == 1951) {
                out.print("selected");
            }%> value=1951>1951</option>
                            <option <%if (ano == 1952) {
                out.print("selected");
            }%> value=1952>1952</option>
                            <option <%if (ano == 1953) {
                out.print("selected");
            }%> value=1953>1953</option>
                            <option <%if (ano == 1954) {
                out.print("selected");
            }%> value=1954>1954</option>
                            <option <%if (ano == 1955) {
                out.print("selected");
            }%> value=1955>1955</option>
                            <option <%if (ano == 1956) {
                out.print("selected");
            }%> value=1956>1956</option>
                            <option <%if (ano == 1957) {
                out.print("selected");
            }%> value=1957>1957</option>
                            <option <%if (ano == 1958) {
                out.print("selected");
            }%> value=1958>1958</option>
                            <option <%if (ano == 1959) {
                out.print("selected");
            }%> value=1959>1959</option>
                            <option <%if (ano == 1960) {
                out.print("selected");
            }%> value=1960>1960</option>
                            <option <%if (ano == 1961) {
                out.print("selected");
            }%> value=1961>1961</option>
                            <option <%if (ano == 1962) {
                out.print("selected");
            }%> value=1962>1962</option>
                            <option <%if (ano == 1963) {
                out.print("selected");
            }%> value=1963>1963</option>
                            <option <%if (ano == 1964) {
                out.print("selected");
            }%> value=1964>1964</option>
                            <option <%if (ano == 1965) {
                out.print("selected");
            }%> value=1965>1965</option>
                            <option <%if (ano == 1966) {
                out.print("selected");
            }%> value=1966>1966</option>
                            <option <%if (ano == 1967) {
                out.print("selected");
            }%> value=1967>1967</option>
                            <option <%if (ano == 1968) {
                out.print("selected");
            }%> value=1968>1968</option>
                            <option <%if (ano == 1969) {
                out.print("selected");
            }%> value=1969>1969</option>
                            <option <%if (ano == 1970) {
                out.print("selected");
            }%> value=1970>1970</option>
                            <option <%if (ano == 1971) {
                out.print("selected");
            }%> value=1971>1971</option>
                            <option <%if (ano == 1972) {
                out.print("selected");
            }%> value=1972>1972</option>
                            <option <%if (ano == 1973) {
                out.print("selected");
            }%> value=1973>1973</option>
                            <option <%if (ano == 1974) {
                out.print("selected");
            }%> value=1974>1974</option>
                            <option <%if (ano == 1975) {
                out.print("selected");
            }%> value=1975>1975</option>
                            <option <%if (ano == 1976) {
                out.print("selected");
            }%> value=1976>1976</option>
                            <option <%if (ano == 1977) {
                out.print("selected");
            }%> value=1977>1977</option>
                            <option <%if (ano == 1978) {
                out.print("selected");
            }%> value=1978>1978</option>
                            <option <%if (ano == 1979) {
                out.print("selected");
            }%> value=1979>1979</option>
                            <option <%if (ano == 1980) {
                out.print("selected");
            }%> value=1980>1980</option>
                            <option <%if (ano == 1981) {
                out.print("selected");
            }%> value=1981>1981</option>
                            <option <%if (ano == 1982) {
                out.print("selected");
            }%> value=1982>1982</option>
                            <option <%if (ano == 1983) {
                out.print("selected");
            }%> value=1983>1983</option>
                            <option <%if (ano == 1984) {
                out.print("selected");
            }%> value=1984>1984</option>
                            <option <%if (ano == 1985) {
                out.print("selected");
            }%> value=1985>1985</option>
                            <option <%if (ano == 1986) {
                out.print("selected");
            }%> value=1986>1986</option>
                            <option <%if (ano == 1987) {
                out.print("selected");
            }%> value=1987>1987</option>
                            <option <%if (ano == 1988) {
                out.print("selected");
            }%> value=1988>1988</option>
                            <option <%if (ano == 1989) {
                out.print("selected");
            }%> value=1989>1989</option>
                            <option <%if (ano == 1990) {
                out.print("selected");
            }%> value=1990>1990</option>
                            <option <%if (ano == 1991) {
                out.print("selected");
            }%> value=1991>1991</option>
                            <option <%if (ano == 1992) {
                out.print("selected");
            }%> value=1992>1992</option>
                            <option <%if (ano == 1993) {
                out.print("selected");
            }%> value=1993>1993</option>
                            <option <%if (ano == 1994) {
                out.print("selected");
            }%> value=1994>1994</option>
                            <option <%if (ano == 1995) {
                out.print("selected");
            }%> value=1995>1995</option>
                            <option <%if (ano == 1996) {
                out.print("selected");
            }%> value=1996>1996</option>
                            <option <%if (ano == 1997) {
                out.print("selected");
            }%> value=1997>1997</option>
                            <option <%if (ano == 1998) {
                out.print("selected");
            }%> value=1998>1998</option>
                            <option <%if (ano == 1999) {
                out.print("selected");
            }%> value=1999>1999</option>
                            <option <%if (ano == 2000) {
                out.print("selected");
            }%> value=2000>2000</option>
                            <option <%if (ano == 2001) {
                out.print("selected");
            }%> value=2001>2001</option>
                            <option <%if (ano == 2002) {
                out.print("selected");
            }%> value=2002>2002</option>
                            <option <%if (ano == 2003) {
                out.print("selected");
            }%> value=2003>2003</option>
                            <option <%if (ano == 2004) {
                out.print("selected");
            }%> value=2004>2004</option>
                            <option <%if (ano == 2005) {
                out.print("selected");
            }%> value=2005>2005</option>
                            <option <%if (ano == 2006) {
                out.print("selected");
            }%> value=2006>2006</option>
                            <option <%if (ano == 2007) {
                out.print("selected");
            }%> value=2007>2007</option>
                            <option <%if (ano == 2008) {
                out.print("selected");
            }%> value=2008>2008</option>
                            <option <%if (ano == 2009) {
                out.print("selected");
            }%> value=2009>2009</option>

                        </select></td>
                </tr>

                <tr>
                    <td height="23" width="94">País:</td>
                    <td height="23" width="373"><select name="pais" >
                            <option value = "-1">Selecione</option>
                            <option  <%if (u.getPais() == 1) {
                out.print("selected");
            }%> value = "1">Afeganistao</option>
                            <option  <%if (u.getPais() == 2) {
                out.print("selected");
            }%> value = "2">Africa do Sul</option>
                            <option  <%if (u.getPais() == 3) {
                out.print("selected");
            }%> value = "3">Akrotiri</option>
                            <option  <%if (u.getPais() == 4) {
                out.print("selected");
            }%> value = "4">Albania</option>
                            <option  <%if (u.getPais() == 5) {
                out.print("selected");
            }%> value = "5">Alemanha</option>
                            <option  <%if (u.getPais() == 6) {
                out.print("selected");
            }%> value = "6">Andorra</option>
                            <option  <%if (u.getPais() == 7) {
                out.print("selected");
            }%> value = "7">Angola</option>
                            <option  <%if (u.getPais() == 8) {
                out.print("selected");
            }%> value = "8">Anguila</option>
                            <option  <%if (u.getPais() == 9) {
                out.print("selected");
            }%> value = "9">Antarctida</option>
                            <option  <%if (u.getPais() == 10) {
                out.print("selected");
            }%> value = "10">Antigua e Barbuda</option>
                            <option  <%if (u.getPais() == 11) {
                out.print("selected");
            }%> value = "11">Antilhas Neerlandesas</option>
                            <option  <%if (u.getPais() == 12) {
                out.print("selected");
            }%> value = "12">Arabia Saudita</option>
                            <option  <%if (u.getPais() == 13) {
                out.print("selected");
            }%> value = "13">Arctic Ocean</option>
                            <option  <%if (u.getPais() == 14) {
                out.print("selected");
            }%> value = "14">Argelia</option>
                            <option  <%if (u.getPais() == 15) {
                out.print("selected");
            }%> value = "15">Argentina</option>
                            <option  <%if (u.getPais() == 16) {
                out.print("selected");
            }%> value = "16">Armenia</option>
                            <option  <%if (u.getPais() == 17) {
                out.print("selected");
            }%> value = "17">Aruba</option>
                            <option  <%if (u.getPais() == 18) {
                out.print("selected");
            }%> value = "18">Ashmore and Cartier Islands</option>
                            <option  <%if (u.getPais() == 19) {
                out.print("selected");
            }%> value = "19">Atlantic Ocean</option>
                            <option  <%if (u.getPais() == 20) {
                out.print("selected");
            }%> value = "20">Australia</option>
                            <option  <%if (u.getPais() == 21) {
                out.print("selected");
            }%> value = "21">Austria</option>
                            <option  <%if (u.getPais() == 22) {
                out.print("selected");
            }%> value = "22">Azerbaijao</option>
                            <option  <%if (u.getPais() == 23) {
                out.print("selected");
            }%> value = "23">Baamas</option>
                            <option  <%if (u.getPais() == 24) {
                out.print("selected");
            }%> value = "24">Bangladeche</option>
                            <option  <%if (u.getPais() == 25) {
                out.print("selected");
            }%> value = "25">Barbados</option>
                            <option  <%if (u.getPais() == 26) {
                out.print("selected");
            }%> value = "26">Barem</option>
                            <option  <%if (u.getPais() == 27) {
                out.print("selected");
            }%> value = "27">Belgica</option>
                            <option  <%if (u.getPais() == 28) {
                out.print("selected");
            }%> value = "28">Belize</option>
                            <option  <%if (u.getPais() == 29) {
                out.print("selected");
            }%> value = "29">Benim</option>
                            <option  <%if (u.getPais() == 30) {
                out.print("selected");
            }%> value = "30">Bermudas</option>
                            <option  <%if (u.getPais() == 31) {
                out.print("selected");
            }%> value = "31">Bielorrussia</option>
                            <option  <%if (u.getPais() == 32) {
                out.print("selected");
            }%> value = "32">Birmania</option>
                            <option  <%if (u.getPais() == 33) {
                out.print("selected");
            }%> value = "33">Bolivia</option>
                            <option  <%if (u.getPais() == 34) {
                out.print("selected");
            }%> value = "34">Bosnia e Herzegovina</option>
                            <option  <%if (u.getPais() == 35) {
                out.print("selected");
            }%> value = "35">Botsuana</option>
                            <option  <%if (u.getPais() == 36) {
                out.print("selected");
            }%> value = "36">Brasil</option>
                            <option  <%if (u.getPais() == 37) {
                out.print("selected");
            }%> value = "37">Brunei</option>
                            <option  <%if (u.getPais() == 38) {
                out.print("selected");
            }%> value = "38">Bulgaria</option>
                            <option  <%if (u.getPais() == 39) {
                out.print("selected");
            }%> value = "39">Burquina Faso</option>
                            <option  <%if (u.getPais() == 40) {
                out.print("selected");
            }%> value = "40">Burundi</option>
                            <option  <%if (u.getPais() == 41) {
                out.print("selected");
            }%> value = "41">Butao</option>
                            <option  <%if (u.getPais() == 42) {
                out.print("selected");
            }%> value = "42">Cabo Verde</option>
                            <option  <%if (u.getPais() == 43) {
                out.print("selected");
            }%> value = "43">Camaroes</option>
                            <option  <%if (u.getPais() == 44) {
                out.print("selected");
            }%> value = "44">Camboja</option>
                            <option  <%if (u.getPais() == 45) {
                out.print("selected");
            }%> value = "45">Canada</option>
                            <option  <%if (u.getPais() == 46) {
                out.print("selected");
            }%> value = "46">Catar</option>
                            <option  <%if (u.getPais() == 47) {
                out.print("selected");
            }%> value = "47">Cazaquistao</option>
                            <option  <%if (u.getPais() == 48) {
                out.print("selected");
            }%> value = "48">Chade</option>
                            <option  <%if (u.getPais() == 49) {
                out.print("selected");
            }%> value = "49">Chile</option>
                            <option  <%if (u.getPais() == 50) {
                out.print("selected");
            }%> value = "50">China</option>
                            <option  <%if (u.getPais() == 51) {
                out.print("selected");
            }%> value = "51">Chipre</option>
                            <option  <%if (u.getPais() == 52) {
                out.print("selected");
            }%> value = "52">Clipperton Island</option>
                            <option  <%if (u.getPais() == 53) {
                out.print("selected");
            }%> value = "53">Colombia</option>
                            <option  <%if (u.getPais() == 54) {
                out.print("selected");
            }%> value = "54">Comores</option>
                            <option  <%if (u.getPais() == 55) {
                out.print("selected");
            }%> value = "55">Congo-Brazzaville</option>
                            <option  <%if (u.getPais() == 56) {
                out.print("selected");
            }%> value = "56">Congo-Kinshasa</option>
                            <option  <%if (u.getPais() == 57) {
                out.print("selected");
            }%> value = "57">Coral Sea Islands</option>
                            <option  <%if (u.getPais() == 58) {
                out.print("selected");
            }%> value = "58">Coreia do Norte</option>
                            <option  <%if (u.getPais() == 59) {
                out.print("selected");
            }%> value = "59">Coreia do Sul</option>
                            <option  <%if (u.getPais() == 60) {
                out.print("selected");
            }%> value = "60">Costa do Marfim</option>
                            <option  <%if (u.getPais() == 61) {
                out.print("selected");
            }%> value = "61">Costa Rica</option>
                            <option  <%if (u.getPais() == 62) {
                out.print("selected");
            }%> value = "62">Croacia</option>
                            <option  <%if (u.getPais() == 63) {
                out.print("selected");
            }%> value = "63">Cuba</option>
                            <option  <%if (u.getPais() == 64) {
                out.print("selected");
            }%> value = "64">Dhekelia</option>
                            <option  <%if (u.getPais() == 65) {
                out.print("selected");
            }%> value = "65">Dinamarca</option>
                            <option  <%if (u.getPais() == 66) {
                out.print("selected");
            }%> value = "66">Dominica</option>
                            <option  <%if (u.getPais() == 67) {
                out.print("selected");
            }%> value = "67">Egipto</option>
                            <option  <%if (u.getPais() == 68) {
                out.print("selected");
            }%> value = "68">Emiratos Arabes Unidos</option>
                            <option  <%if (u.getPais() == 69) {
                out.print("selected");
            }%> value = "69">Equador</option>
                            <option  <%if (u.getPais() == 70) {
                out.print("selected");
            }%> value = "70">Eritreia</option>
                            <option  <%if (u.getPais() == 71) {
                out.print("selected");
            }%> value = "71">Eslovaquia</option>
                            <option  <%if (u.getPais() == 72) {
                out.print("selected");
            }%> value = "72">Eslovenia</option>
                            <option  <%if (u.getPais() == 73) {
                out.print("selected");
            }%> value = "73">Espanha</option>
                            <option  <%if (u.getPais() == 74) {
                out.print("selected");
            }%> value = "74">Estados Unidos</option>
                            <option  <%if (u.getPais() == 75) {
                out.print("selected");
            }%> value = "75">Estonia</option>
                            <option  <%if (u.getPais() == 76) {
                out.print("selected");
            }%> value = "76">Etiopia</option>
                            <option  <%if (u.getPais() == 77) {
                out.print("selected");
            }%> value = "77">Faroe</option>
                            <option  <%if (u.getPais() == 78) {
                out.print("selected");
            }%> value = "78">Fiji</option>
                            <option  <%if (u.getPais() == 79) {
                out.print("selected");
            }%> value = "79">Filipinas</option>
                            <option  <%if (u.getPais() == 80) {
                out.print("selected");
            }%> value = "80">Finlandia</option>
                            <option  <%if (u.getPais() == 81) {
                out.print("selected");
            }%> value = "81">Franca</option>
                            <option  <%if (u.getPais() == 82) {
                out.print("selected");
            }%> value = "82">Gabao</option>
                            <option  <%if (u.getPais() == 83) {
                out.print("selected");
            }%> value = "83">Gambia</option>
                            <option  <%if (u.getPais() == 84) {
                out.print("selected");
            }%> value = "84">Gana</option>
                            <option  <%if (u.getPais() == 85) {
                out.print("selected");
            }%> value = "85">Gaza Strip</option>
                            <option  <%if (u.getPais() == 86) {
                out.print("selected");
            }%> value = "86">Georgia</option>
                            <option  <%if (u.getPais() == 87) {
                out.print("selected");
            }%> value = "87">Georgia do Sul e Sandwich do Sul</option>
                            <option  <%if (u.getPais() == 88) {
                out.print("selected");
            }%> value = "88">Gibraltar</option>
                            <option  <%if (u.getPais() == 89) {
                out.print("selected");
            }%> value = "89">Granada</option>
                            <option  <%if (u.getPais() == 90) {
                out.print("selected");
            }%> value = "90">Grecia</option>
                            <option  <%if (u.getPais() == 91) {
                out.print("selected");
            }%> value = "91">Gronelandia</option>
                            <option  <%if (u.getPais() == 92) {
                out.print("selected");
            }%> value = "92">Guame</option>
                            <option  <%if (u.getPais() == 93) {
                out.print("selected");
            }%> value = "93">Guatemala</option>
                            <option  <%if (u.getPais() == 94) {
                out.print("selected");
            }%> value = "94">Guernsey</option>
                            <option  <%if (u.getPais() == 95) {
                out.print("selected");
            }%> value = "95">Guiana</option>
                            <option  <%if (u.getPais() == 96) {
                out.print("selected");
            }%> value = "96">Guine</option>
                            <option  <%if (u.getPais() == 97) {
                out.print("selected");
            }%> value = "97">Guine Equatorial</option>
                            <option  <%if (u.getPais() == 98) {
                out.print("selected");
            }%> value = "98">Guine-Bissau</option>
                            <option  <%if (u.getPais() == 99) {
                out.print("selected");
            }%> value = "99">Haiti</option>
                            <option  <%if (u.getPais() == 100) {
                out.print("selected");
            }%> value = "100">Honduras</option>
                            <option  <%if (u.getPais() == 101) {
                out.print("selected");
            }%> value = "101">Hong Kong</option>
                            <option  <%if (u.getPais() == 102) {
                out.print("selected");
            }%> value = "102">Hungria</option>
                            <option  <%if (u.getPais() == 103) {
                out.print("selected");
            }%> value = "103">Iemen</option>
                            <option  <%if (u.getPais() == 104) {
                out.print("selected");
            }%> value = "104">Ilha Bouvet</option>
                            <option  <%if (u.getPais() == 105) {
                out.print("selected");
            }%> value = "105">Ilha do Natal</option>
                            <option  <%if (u.getPais() == 106) {
                out.print("selected");
            }%> value = "106">Ilha Norfolk</option>
                            <option  <%if (u.getPais() == 107) {
                out.print("selected");
            }%> value = "107">Ilhas Caimao</option>
                            <option  <%if (u.getPais() == 108) {
                out.print("selected");
            }%> value = "108">Ilhas Cook</option>
                            <option  <%if (u.getPais() == 109) {
                out.print("selected");
            }%> value = "109">Ilhas dos Cocos</option>
                            <option  <%if (u.getPais() == 110) {
                out.print("selected");
            }%> value = "110">Ilhas Falkland</option>
                            <option  <%if (u.getPais() == 111) {
                out.print("selected");
            }%> value = "111">Ilhas Heard e McDonald</option>
                            <option  <%if (u.getPais() == 112) {
                out.print("selected");
            }%> value = "112">Ilhas Marshall</option>
                            <option  <%if (u.getPais() == 113) {
                out.print("selected");
            }%> value = "113">Ilhas Salomao</option>
                            <option  <%if (u.getPais() == 114) {
                out.print("selected");
            }%> value = "114">Ilhas Turcas e Caicos</option>
                            <option  <%if (u.getPais() == 115) {
                out.print("selected");
            }%> value = "115">Ilhas Virgens Americanas</option>
                            <option  <%if (u.getPais() == 116) {
                out.print("selected");
            }%> value = "116">Ilhas Virgens Britanicas</option>
                            <option  <%if (u.getPais() == 117) {
                out.print("selected");
            }%> value = "117">India</option>
                            <option  <%if (u.getPais() == 118) {
                out.print("selected");
            }%> value = "118">Indian Ocean</option>
                            <option  <%if (u.getPais() == 119) {
                out.print("selected");
            }%> value = "119">Indonesia</option>
                            <option  <%if (u.getPais() == 120) {
                out.print("selected");
            }%> value = "120">Irao</option>
                            <option  <%if (u.getPais() == 121) {
                out.print("selected");
            }%> value = "121">Iraque</option>
                            <option  <%if (u.getPais() == 122) {
                out.print("selected");
            }%> value = "122">Irlanda</option>
                            <option  <%if (u.getPais() == 123) {
                out.print("selected");
            }%> value = "123">Islandia</option>
                            <option  <%if (u.getPais() == 124) {
                out.print("selected");
            }%> value = "124">Israel</option>
                            <option  <%if (u.getPais() == 125) {
                out.print("selected");
            }%> value = "125">Italia</option>
                            <option  <%if (u.getPais() == 126) {
                out.print("selected");
            }%> value = "126">Jamaica</option>
                            <option  <%if (u.getPais() == 127) {
                out.print("selected");
            }%> value = "127">Jan Mayen</option>
                            <option  <%if (u.getPais() == 128) {
                out.print("selected");
            }%> value = "128">Japao</option>
                            <option  <%if (u.getPais() == 129) {
                out.print("selected");
            }%> value = "129">Jersey</option>
                            <option  <%if (u.getPais() == 130) {
                out.print("selected");
            }%> value = "130">Jibuti</option>
                            <option  <%if (u.getPais() == 131) {
                out.print("selected");
            }%> value = "131">Jordania</option>
                            <option  <%if (u.getPais() == 132) {
                out.print("selected");
            }%> value = "132">Kuwait</option>
                            <option  <%if (u.getPais() == 133) {
                out.print("selected");
            }%> value = "133">Laos</option>
                            <option  <%if (u.getPais() == 134) {
                out.print("selected");
            }%> value = "134">Lesoto</option>
                            <option  <%if (u.getPais() == 135) {
                out.print("selected");
            }%> value = "135">Letonia</option>
                            <option  <%if (u.getPais() == 136) {
                out.print("selected");
            }%> value = "136">Libano</option>
                            <option  <%if (u.getPais() == 137) {
                out.print("selected");
            }%> value = "137">Liberia</option>
                            <option  <%if (u.getPais() == 138) {
                out.print("selected");
            }%> value = "138">Libia</option>
                            <option  <%if (u.getPais() == 139) {
                out.print("selected");
            }%> value = "139">Listenstaine</option>
                            <option  <%if (u.getPais() == 140) {
                out.print("selected");
            }%> value = "140">Lituania</option>
                            <option  <%if (u.getPais() == 141) {
                out.print("selected");
            }%> value = "141">Luxemburgo</option>
                            <option  <%if (u.getPais() == 142) {
                out.print("selected");
            }%> value = "142">Macau</option>
                            <option  <%if (u.getPais() == 143) {
                out.print("selected");
            }%> value = "143">Macedonia</option>
                            <option  <%if (u.getPais() == 144) {
                out.print("selected");
            }%> value = "144">Madagascar</option>
                            <option  <%if (u.getPais() == 145) {
                out.print("selected");
            }%> value = "145">Malasia</option>
                            <option  <%if (u.getPais() == 146) {
                out.print("selected");
            }%> value = "146">Malavi</option>
                            <option  <%if (u.getPais() == 147) {
                out.print("selected");
            }%> value = "147">Maldivas</option>
                            <option  <%if (u.getPais() == 148) {
                out.print("selected");
            }%> value = "148">Mali</option>
                            <option  <%if (u.getPais() == 149) {
                out.print("selected");
            }%> value = "149">Malta</option>
                            <option  <%if (u.getPais() == 150) {
                out.print("selected");
            }%> value = "150">Marianas do Norte</option>
                            <option  <%if (u.getPais() == 151) {
                out.print("selected");
            }%> value = "151">Marrocos</option>
                            <option  <%if (u.getPais() == 152) {
                out.print("selected");
            }%> value = "152">Mauricia</option>
                            <option  <%if (u.getPais() == 153) {
                out.print("selected");
            }%> value = "153">Mauritania</option>
                            <option  <%if (u.getPais() == 154) {
                out.print("selected");
            }%> value = "154">Mayotte</option>
                            <option  <%if (u.getPais() == 155) {
                out.print("selected");
            }%> value = "155">Mexico</option>
                            <option  <%if (u.getPais() == 156) {
                out.print("selected");
            }%> value = "156">Micronesia</option>
                            <option  <%if (u.getPais() == 157) {
                out.print("selected");
            }%> value = "157">Mocambique</option>
                            <option  <%if (u.getPais() == 158) {
                out.print("selected");
            }%> value = "158">Moldavia</option>
                            <option  <%if (u.getPais() == 159) {
                out.print("selected");
            }%> value = "159">Monaco</option>
                            <option  <%if (u.getPais() == 160) {
                out.print("selected");
            }%> value = "160">Mongolia</option>
                            <option  <%if (u.getPais() == 161) {
                out.print("selected");
            }%> value = "161">Monserrate</option>
                            <option  <%if (u.getPais() == 162) {
                out.print("selected");
            }%> value = "162">Montenegro</option>
                            <option  <%if (u.getPais() == 163) {
                out.print("selected");
            }%> value = "163">Mundo</option>
                            <option  <%if (u.getPais() == 164) {
                out.print("selected");
            }%> value = "164">Namibia</option>
                            <option  <%if (u.getPais() == 165) {
                out.print("selected");
            }%> value = "165">Nauru</option>
                            <option  <%if (u.getPais() == 166) {
                out.print("selected");
            }%> value = "166">Navassa Island</option>
                            <option  <%if (u.getPais() == 167) {
                out.print("selected");
            }%> value = "167">Nepal</option>
                            <option  <%if (u.getPais() == 168) {
                out.print("selected");
            }%> value = "168">Nicaragua</option>
                            <option  <%if (u.getPais() == 169) {
                out.print("selected");
            }%> value = "169">Niger</option>
                            <option  <%if (u.getPais() == 170) {
                out.print("selected");
            }%> value = "170">Nigeria</option>
                            <option  <%if (u.getPais() == 171) {
                out.print("selected");
            }%> value = "171">Niue</option>
                            <option  <%if (u.getPais() == 172) {
                out.print("selected");
            }%> value = "172">Noruega</option>
                            <option  <%if (u.getPais() == 173) {
                out.print("selected");
            }%> value = "173">Nova Caledonia</option>
                            <option  <%if (u.getPais() == 174) {
                out.print("selected");
            }%> value = "174">Nova Zelandia</option>
                            <option  <%if (u.getPais() == 175) {
                out.print("selected");
            }%> value = "175">Oma</option>
                            <option  <%if (u.getPais() == 176) {
                out.print("selected");
            }%> value = "176">Pacific Ocean</option>
                            <option  <%if (u.getPais() == 177) {
                out.print("selected");
            }%> value = "177">Paises Baixos</option>
                            <option  <%if (u.getPais() == 178) {
                out.print("selected");
            }%> value = "178">Palau</option>
                            <option  <%if (u.getPais() == 179) {
                out.print("selected");
            }%> value = "179">Panama</option>
                            <option  <%if (u.getPais() == 180) {
                out.print("selected");
            }%> value = "180">Papua-Nova Guine</option>
                            <option  <%if (u.getPais() == 181) {
                out.print("selected");
            }%> value = "181">Paquistao</option>
                            <option  <%if (u.getPais() == 182) {
                out.print("selected");
            }%> value = "182">Paracel Islands</option>
                            <option  <%if (u.getPais() == 183) {
                out.print("selected");
            }%> value = "183">Paraguai</option>
                            <option  <%if (u.getPais() == 184) {
                out.print("selected");
            }%> value = "184">Peru</option>
                            <option  <%if (u.getPais() == 185) {
                out.print("selected");
            }%> value = "185">Pitcairn</option>
                            <option  <%if (u.getPais() == 186) {
                out.print("selected");
            }%> value = "186">Polinesia Francesa</option>
                            <option  <%if (u.getPais() == 187) {
                out.print("selected");
            }%> value = "187">Polonia</option>
                            <option  <%if (u.getPais() == 188) {
                out.print("selected");
            }%> value = "188">Porto Rico</option>
                            <option  <%if (u.getPais() == 189) {
                out.print("selected");
            }%> value = "189">Portugal</option>
                            <option  <%if (u.getPais() == 190) {
                out.print("selected");
            }%> value = "190">Quenia</option>
                            <option  <%if (u.getPais() == 191) {
                out.print("selected");
            }%> value = "191">Quirguizistao</option>
                            <option  <%if (u.getPais() == 192) {
                out.print("selected");
            }%> value = "192">Quiribati</option>
                            <option  <%if (u.getPais() == 193) {
                out.print("selected");
            }%> value = "193">Reino Unido</option>
                            <option  <%if (u.getPais() == 194) {
                out.print("selected");
            }%> value = "194">Republica Centro-Africana</option>
                            <option  <%if (u.getPais() == 195) {
                out.print("selected");
            }%> value = "195">Republica Checa</option>
                            <option  <%if (u.getPais() == 196) {
                out.print("selected");
            }%> value = "196">Republica Dominicana</option>
                            <option  <%if (u.getPais() == 197) {
                out.print("selected");
            }%> value = "197">Romenia</option>
                            <option  <%if (u.getPais() == 198) {
                out.print("selected");
            }%> value = "198">Ruanda</option>
                            <option  <%if (u.getPais() == 199) {
                out.print("selected");
            }%> value = "199">Russia</option>
                            <option  <%if (u.getPais() == 200) {
                out.print("selected");
            }%> value = "200">Salvador</option>
                            <option  <%if (u.getPais() == 201) {
                out.print("selected");
            }%> value = "201">Samoa</option>
                            <option  <%if (u.getPais() == 202) {
                out.print("selected");
            }%> value = "202">Samoa Americana</option>
                            <option  <%if (u.getPais() == 203) {
                out.print("selected");
            }%> value = "203">Santa Helena</option>
                            <option  <%if (u.getPais() == 204) {
                out.print("selected");
            }%> value = "204">Santa Lucia</option>
                            <option  <%if (u.getPais() == 205) {
                out.print("selected");
            }%> value = "205">Sao Cristovao e Neves</option>
                            <option  <%if (u.getPais() == 206) {
                out.print("selected");
            }%> value = "206">Sao Marinho</option>
                            <option  <%if (u.getPais() == 207) {
                out.print("selected");
            }%> value = "207">Sao Pedro e Miquelon</option>
                            <option  <%if (u.getPais() == 208) {
                out.print("selected");
            }%> value = "208">Sao Tome e Principe</option>
                            <option  <%if (u.getPais() == 209) {
                out.print("selected");
            }%> value = "209">Sao Vicente e Granadinas</option>
                            <option  <%if (u.getPais() == 210) {
                out.print("selected");
            }%> value = "210">Sara Ocidental</option>
                            <option  <%if (u.getPais() == 211) {
                out.print("selected");
            }%> value = "211">Seicheles</option>
                            <option  <%if (u.getPais() == 212) {
                out.print("selected");
            }%> value = "212">Senegal</option>
                            <option  <%if (u.getPais() == 213) {
                out.print("selected");
            }%> value = "213">Serra Leoa</option>
                            <option  <%if (u.getPais() == 214) {
                out.print("selected");
            }%> value = "214">Servia</option>
                            <option  <%if (u.getPais() == 215) {
                out.print("selected");
            }%> value = "215">Singapura</option>
                            <option  <%if (u.getPais() == 216) {
                out.print("selected");
            }%> value = "216">Siria</option>
                            <option  <%if (u.getPais() == 217) {
                out.print("selected");
            }%> value = "217">Somalia</option>
                            <option  <%if (u.getPais() == 218) {
                out.print("selected");
            }%> value = "218">Southern Ocean</option>
                            <option  <%if (u.getPais() == 219) {
                out.print("selected");
            }%> value = "219">Spratly Islands</option>
                            <option  <%if (u.getPais() == 220) {
                out.print("selected");
            }%> value = "220">Sri Lanca</option>
                            <option  <%if (u.getPais() == 221) {
                out.print("selected");
            }%> value = "221">Suazilandia</option>
                            <option  <%if (u.getPais() == 222) {
                out.print("selected");
            }%> value = "222">Sudao</option>
                            <option  <%if (u.getPais() == 223) {
                out.print("selected");
            }%> value = "223">Suecia</option>
                            <option  <%if (u.getPais() == 224) {
                out.print("selected");
            }%> value = "224">Suica</option>
                            <option  <%if (u.getPais() == 225) {
                out.print("selected");
            }%> value = "225">Suriname</option>
                            <option  <%if (u.getPais() == 226) {
                out.print("selected");
            }%> value = "226">Svalbard e Jan Mayen</option>
                            <option  <%if (u.getPais() == 227) {
                out.print("selected");
            }%> value = "227">Tailandia</option>
                            <option  <%if (u.getPais() == 228) {
                out.print("selected");
            }%> value = "228">Taiwan</option>
                            <option  <%if (u.getPais() == 229) {
                out.print("selected");
            }%> value = "229">Tajiquistao</option>
                            <option  <%if (u.getPais() == 230) {
                out.print("selected");
            }%> value = "230">Tanzania</option>
                            <option  <%if (u.getPais() == 231) {
                out.print("selected");
            }%> value = "231">Territorio Britanico do Oceano Indico</option>
                            <option  <%if (u.getPais() == 232) {
                out.print("selected");
            }%> value = "232">Territorios Austrais Franceses</option>
                            <option  <%if (u.getPais() == 233) {
                out.print("selected");
            }%> value = "233">Timor Leste</option>
                            <option  <%if (u.getPais() == 234) {
                out.print("selected");
            }%> value = "234">Togo</option>
                            <option  <%if (u.getPais() == 235) {
                out.print("selected");
            }%> value = "235">Tokelau</option>
                            <option  <%if (u.getPais() == 236) {
                out.print("selected");
            }%> value = "236">Tonga</option>
                            <option  <%if (u.getPais() == 237) {
                out.print("selected");
            }%> value = "237">Trindade e Tobago</option>
                            <option  <%if (u.getPais() == 238) {
                out.print("selected");
            }%> value = "238">Tunisia</option>
                            <option  <%if (u.getPais() == 239) {
                out.print("selected");
            }%> value = "239">Turquemenistao</option>
                            <option  <%if (u.getPais() == 240) {
                out.print("selected");
            }%> value = "240">Turquia</option>
                            <option  <%if (u.getPais() == 241) {
                out.print("selected");
            }%> value = "241">Tuvalu</option>
                            <option  <%if (u.getPais() == 242) {
                out.print("selected");
            }%> value = "242">Ucrania</option>
                            <option  <%if (u.getPais() == 243) {
                out.print("selected");
            }%> value = "243">Uganda</option>
                            <option  <%if (u.getPais() == 244) {
                out.print("selected");
            }%> value = "244">Uniao Europeia</option>
                            <option  <%if (u.getPais() == 245) {
                out.print("selected");
            }%> value = "245">Uruguai</option>
                            <option  <%if (u.getPais() == 246) {
                out.print("selected");
            }%> value = "246">Usbequistao</option>
                            <option  <%if (u.getPais() == 247) {
                out.print("selected");
            }%> value = "247">Vanuatu</option>
                            <option  <%if (u.getPais() == 248) {
                out.print("selected");
            }%> value = "248">Vaticano</option>
                            <option  <%if (u.getPais() == 249) {
                out.print("selected");
            }%> value = "249">Venezuela</option>
                            <option  <%if (u.getPais() == 250) {
                out.print("selected");
            }%> value = "250">Vietname</option>
                            <option  <%if (u.getPais() == 251) {
                out.print("selected");
            }%> value = "251">Wake Island</option>
                            <option  <%if (u.getPais() == 252) {
                out.print("selected");
            }%> value = "252">Wallis e Futuna</option>
                            <option  <%if (u.getPais() == 253) {
                out.print("selected");
            }%> value = "253">West Bank</option>
                            <option  <%if (u.getPais() == 254) {
                out.print("selected");
            }%> value = "254">Zambia</option>
                            <option  <%if (u.getPais() == 255) {
                out.print("selected");
            }%> value = "255">Zimbabue</option>

                        </select>  </td>
                </tr>

                <tr>
                    <td height="23" width="94">Cidade:</td>
                    <td height="23" width="373"><input value="<%out.print(u.getCidade());%>" type="text" name="cidade" size="20" maxlength="100"></td>
                </tr>

                <tr>
                    <td valign="top" height="118" width="94">Escolaridade: </td>
                    <td height="118" width="373">

                        <input <%if (u.getEscolaridade() == 1) {
                out.print("checked");
            }%> type="radio" name="escolaridade" value="1"> Ensino Médio Incompleto<br>
                        <input <%if (u.getEscolaridade() == 2) {
                out.print("checked");
            }%> type="radio" name="escolaridade" value="2"> Ensino Médio Completo<br>
                        <input <%if (u.getEscolaridade() == 3) {
                out.print("checked");
            }%> type="radio" name="escolaridade" value="3"> Ensino Superior Incompleto<br>
                        <input <%if (u.getEscolaridade() == 4) {
                out.print("checked");
            }%> type="radio" name="escolaridade" value="4"> Ensino Superior Completo<br>
                        <input <%if (u.getEscolaridade() == 5) {
                out.print("checked");
            }%> type="radio" name="escolaridade" value="5"> Pós Graduação<br>
                        <input <%if (u.getEscolaridade() == 6) {
                out.print("checked");
            }%> type="radio" name="escolaridade" value="6"> Mestrado<br>
                        <input <%if (u.getEscolaridade() == 7) {
                out.print("checked");
            }%> type="radio" name="escolaridade" value="7"> Doutorado<br>
                        <input <%if (u.getEscolaridade() == 8) {
                out.print("checked");
            }%> type="radio" name="escolaridade" value="8"> PHD

                    </td>
                </tr>

                <tr>
                    <td valign="top" height="1" width="94">Login: </td>
                    <td><input value="<%out.print(u.getLogin());%>" type="text" name="username" size="20" maxlength="12" tabindex="12">&nbsp;(no m&aacute;x. 12 caracteres, S&oacute; Letras MIN&Uacute;SCULAS)</td>
                </tr>

                <tr>
                    <td valign="top" height="1" width="94">Senha: </td>
                    <td><font size="1"><input value="<%out.print(u.getPass());%>" type="password" name="password" size="10" maxlength="20" tabindex="12">&nbsp;(no m&iacute;n. 8 e no m&aacute;x. 20 caracteres)</font></td>
                </tr>

                <tr>
                    <td valign="top" height="1" width="94">Confirmar Senha: </td>
                    <td height="1" width="373"><input value="<%out.print(u.getPass());%>" type="password" name="confpassword" size="10" maxlength="20" tabindex="12"></td>
                </tr>
                <tr>
                    <td colspan=2 align=center height="15"><p align="left"><font size="1" face="Verdana"><input <%if (u.getTipoUsuario() == 2) {
                out.print("checked");
            }%> type="checkbox" name="publicador"> Quero me tornar um publicador.</font></p></td>
                </tr>


                <tr>
                    <td colspan="2"><p align="center"><br><input type="button" value="Alterar" name="btenviar" onclick="javascript: return valida()" />
                            <input type="button" onclick="document.location='index.jsp'" value="Cancelar">


                        </p></td>
                </tr>
            </table></td>
    </tr>
</table>
</form>
<br>
<hr size="1" />
<p align="center" class="Fonts">&copy; 2010 - <a href="aboutPage.html" title="about" target="_blank">About</a></p>
</body>
</html>
