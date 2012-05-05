package ss.classes.servlet;

import java.util.logging.Level;
import java.util.logging.Logger;
import ss.classes.bean.UsuarioBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ss.classes.dao.SSDAOException;
import ss.classes.dao.UsuarioDAO;

public class registerServlet extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here
            
             */
        } finally {
            out.close();
        }
    }

    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");
        if (acao.compareTo("salvar") == 0) {
            acaoIncluir(request, response);
        } else if (acao.compareTo("alterar") == 0) {
            acaoAlterar(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void acaoIncluir(HttpServletRequest request, HttpServletResponse response) {
        UsuarioBean objUsuario = new UsuarioBean();
        objUsuario.setNome(request.getParameter("nome"));
        objUsuario.setEmail(request.getParameter("email1"));
        objUsuario.setSexo(request.getParameter("sexo"));


        int dia_nasc = Integer.parseInt(request.getParameter("dia_nasc"));
        int mes_nasc = Integer.parseInt(request.getParameter("mes_nasc"));
        mes_nasc--;
        int ano_nasc = Integer.parseInt(request.getParameter("ano_nasc"));
        ano_nasc = ano_nasc - 1900;
        objUsuario.setDtnasc(new Date(ano_nasc, mes_nasc, dia_nasc));
        objUsuario.setPais(Integer.parseInt(request.getParameter("pais")));
        objUsuario.setCidade(request.getParameter("cidade"));
        objUsuario.setEscolaridade(Integer.parseInt(request.getParameter("escolaridade")));
        objUsuario.setLogin(request.getParameter("username"));
        objUsuario.setPass(request.getParameter("password"));

        String tipoUsuario = request.getParameter("publicador");
        if (tipoUsuario == null) {
            objUsuario.setTipoUsuario(1);
        } else {
            objUsuario.setTipoUsuario(2);
        }
        try {
            UsuarioDAO usuario = new UsuarioDAO();
            usuario.incluir(objUsuario);
            request.setAttribute("usuarioBean", objUsuario);
            request.setAttribute("acao", 1);// 1 - acao de incluir
        } catch (SSDAOException e) {
            request.setAttribute("usuarioBean", null);
        }

        RequestDispatcher rd = null;
        rd = request.getRequestDispatcher("/registerSuccessPage.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(registerServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(registerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void acaoAlterar(HttpServletRequest request, HttpServletResponse response) {
        UsuarioBean objUsuario = new UsuarioBean();
        objUsuario.setIdusuario(Integer.parseInt(request.getParameter("idusuario")));
        objUsuario.setNome(request.getParameter("nome"));
        objUsuario.setEmail(request.getParameter("email1"));
        objUsuario.setSexo(request.getParameter("sexo"));

        int dia_nasc = Integer.parseInt(request.getParameter("dia_nasc"));
        int mes_nasc = Integer.parseInt(request.getParameter("mes_nasc"));
        mes_nasc--;
        int ano_nasc = Integer.parseInt(request.getParameter("ano_nasc"));
        ano_nasc = ano_nasc - 1900;
        objUsuario.setDtnasc(new Date(ano_nasc, mes_nasc, dia_nasc));
        objUsuario.setPais(Integer.parseInt(request.getParameter("pais")));
        objUsuario.setCidade(request.getParameter("cidade"));
        objUsuario.setEscolaridade(Integer.parseInt(request.getParameter("escolaridade")));
        objUsuario.setLogin(request.getParameter("username"));
        objUsuario.setPass(request.getParameter("password"));

        String tipoUsuario = request.getParameter("publicador");
        if (tipoUsuario == null) {
            objUsuario.setTipoUsuario(1);
        } else {
            objUsuario.setTipoUsuario(2);
        }
        try {
            UsuarioDAO usuario = new UsuarioDAO();
            usuario.alterar(objUsuario);
            request.setAttribute("usuarioBean", objUsuario);
            request.setAttribute("acao", 2);// 2 - acao de alterar
        } catch (SSDAOException e) {
            request.setAttribute("usuarioBean", null);
        }

        RequestDispatcher rd = null;
        rd = request.getRequestDispatcher("/registerSuccessPage.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(registerServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(registerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
