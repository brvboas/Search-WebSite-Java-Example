package ss.classes.servlet;

import ss.classes.bean.UsuarioBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ss.classes.dao.SSDAOException;
import ss.classes.dao.UsuarioDAO;

public class loginServlet extends HttpServlet {

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

    // <editor-fold defaultstate="collapsed" desc="Métodos HttpServlet. Clique no sinal de + à esquerda para editar o código.">
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
        HttpSession session = request.getSession();
        session.setAttribute("login", null);

        response.sendRedirect("index.jsp");
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

        acaoLogin(request, response);

    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void acaoLogin(HttpServletRequest request, HttpServletResponse response) {
        UsuarioBean objUsuario = new UsuarioBean();
        objUsuario.setLogin(request.getParameter("login"));
        objUsuario.setPass(request.getParameter("senha"));
        HttpSession session = request.getSession();
        try {
            UsuarioDAO usuario = new UsuarioDAO();

            if (usuario.login(objUsuario)) {

                session.setAttribute("login", objUsuario);
                String url = response.encodeRedirectURL("index.jsp");
                try {
                    response.sendRedirect(url);
                } catch (IOException ex) {
                    Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                session.setAttribute("login", null);
                String url = response.encodeRedirectURL("loginPage.jsp");
                try {
                    response.sendRedirect(url);
                } catch (IOException ex) {
                    Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        } catch (SSDAOException e) {
            session.setAttribute("login", null);
        }
    }
}
