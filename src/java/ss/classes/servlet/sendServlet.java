package ss.classes.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ss.classes.bean.PublicacaoBean;
import ss.classes.bean.UsuarioBean;
import ss.classes.dao.PublicacaoDAO;
import ss.classes.dao.SSDAOException;

public class sendServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        UsuarioBean objUsuario = new UsuarioBean();
        int nAutor = 0;
        PublicacaoBean objPublicacao = new PublicacaoBean();
        objPublicacao.setTitulo(request.getParameter("tituloArtigo"));
        if (!(request.getParameter("hidden3")).equals("")) {
            nAutor = Integer.parseInt(request.getParameter("hidden3"));
        }

        String[] autor = new String[nAutor + 1];
        autor[0] = request.getParameter("autorArtigo");
        if (!(request.getParameter("hidden3")).equals("")) {


            for (int i = 1; i <= nAutor; i++) {
                autor[i] = request.getParameter("arq" + i);
            }
        }
        objPublicacao.setAutor(autor);
        objPublicacao.setLocal(request.getParameter("localArtigo"));
        String paginas = "";
        paginas = request.getParameter("paginaDeArtigo") + "-" + request.getParameter("paginaAteArtigo");
        objPublicacao.setPaginas(paginas);
        objPublicacao.setAno(Integer.parseInt(request.getParameter("anoArtigo")));


        try {
            PublicacaoDAO publicacao = new PublicacaoDAO();
            publicacao.ultimoID(objPublicacao);
            publicacao = new PublicacaoDAO();

            objUsuario = (UsuarioBean) session.getAttribute("login");
            publicacao.incluir(objPublicacao, objUsuario);
            request.setAttribute("publicacaoBean", objPublicacao);

        } catch (SSDAOException e) {
            request.setAttribute("publicacaoBean", null);
        }
        RequestDispatcher rd = null;
        rd = request.getRequestDispatcher("/sendSuccessPage.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(registerServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(registerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void acaoAlterar(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        UsuarioBean objUsuario = new UsuarioBean();
        int nAutor = 0;
        int id = 0;
        if (request.getParameter("ID") != null) {
            id = Integer.parseInt(request.getParameter("ID"));
        }
        PublicacaoBean objPublicacao = new PublicacaoBean();
        objPublicacao.setID(id);
        objPublicacao.setTitulo(request.getParameter("tituloArtigo"));
        if (!(request.getParameter("hidden3")).equals("")) {
            nAutor = Integer.parseInt(request.getParameter("hidden3"));
        }

        String[] autor = new String[nAutor + 1];
        autor[0] = request.getParameter("autorArtigo");
        if (!(request.getParameter("hidden3")).equals("")) {


            for (int i = 1; i <= nAutor; i++) {
                autor[i] = request.getParameter("arq" + i);
            }
        }
        objPublicacao.setAutor(autor);
        objPublicacao.setLocal(request.getParameter("localArtigo"));
        String paginas = "";
        paginas = request.getParameter("paginaDeArtigo") + "-" + request.getParameter("paginaAteArtigo");
        objPublicacao.setPaginas(paginas);
        objPublicacao.setAno(Integer.parseInt(request.getParameter("anoArtigo")));


        try {
            PublicacaoDAO publicacao = new PublicacaoDAO();
            publicacao = new PublicacaoDAO();

            objUsuario = (UsuarioBean) session.getAttribute("login");
            publicacao.alterar(objPublicacao, objUsuario);
            request.setAttribute("publicacaoBean", objPublicacao);

        } catch (SSDAOException e) {
            request.setAttribute("publicacaoBean", null);
        }
        RequestDispatcher rd = null;
        rd = request.getRequestDispatcher("/sendSuccessPage.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(registerServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(registerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
