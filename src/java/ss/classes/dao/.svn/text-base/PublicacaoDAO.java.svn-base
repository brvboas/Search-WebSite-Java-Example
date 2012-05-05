package ss.classes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import ss.classes.bean.PublicacaoBean;
import ss.classes.bean.UsuarioBean;

public class PublicacaoDAO {

    private Connection conn;
    private static int TBAUTHOR = 1;
    private static int TBPAGES = 2;
    private static int TBIDAUTHOR = 3;

    public PublicacaoDAO() throws SSDAOException {
        try {
            this.conn = ConnectionSSFactory.getConnection();
        } catch (Exception e) {
            throw new SSDAOException("Erro: :\n" + e.getMessage());
        }
    }

    public void ultimoID(PublicacaoBean objPublicacao) throws SSDAOException {
        PreparedStatement ps = null;

        Connection conn = null;
        if (objPublicacao == null) {
            throw new SSDAOException("O valor passado nao pode ser nulo");
        }
        try {


            String SQL = "SELECT max(ID) as ultimo FROM PUBLICATION";

            conn = this.conn;
            ps = conn.prepareStatement(SQL);

            ResultSet rs = ps.executeQuery();
            int ultimo = 0;
            while (rs.next()) {
                ultimo = rs.getInt("ultimo");
            }
            ultimo++;
            objPublicacao.setID(ultimo);

        } catch (SQLException e) {
            throw new SSDAOException("Erro ao inserir dados " + e);
        } finally {
            ConnectionSSFactory.closeConnection(conn, ps);
        }
    }

    public void incluir(PublicacaoBean objPublicacao, UsuarioBean objUsuarioBean) throws SSDAOException {

        PreparedStatement ps = null;
        PreparedStatement ps2 = null;

        Connection conn = null;
        if (objPublicacao == null) {
            throw new SSDAOException("O valor passado nao pode ser nulo");
        }
        try {
            int ID = objPublicacao.getID();
            String titulo = objPublicacao.getTitulo();
            String[] autor = objPublicacao.getAutor();
            String local = objPublicacao.getLocal();
            String pagina = objPublicacao.getPaginas();
            int ano = objPublicacao.getAno();

            String SQL = "INSERT INTO PUBLICATION(ID,BOOKTITLE,TITLE,YEAR) " + "VALUES (?,?,?,?) ";
            conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.clearParameters();
            ps.setInt(1, ID);
            ps.setString(2, local);
            ps.setString(3, titulo);
            ps.setInt(4, ano);
            ps.executeUpdate();


            SQL = "INSERT INTO ID_AUTHOR (ID,AUTHOR) VALUES (?,?)";
            String SQL2 = "INSERT INTO T_AUTHOR (AUTHOR) VALUES (?)";
            ps = conn.prepareStatement(SQL);
            ps2 = conn.prepareStatement(SQL2);
            for (int i = 0; i < autor.length; i++) {
                if (!verificarExistencia(TBAUTHOR, autor[i])) {
                    ps2.clearParameters();
                    ps2.setString(1, autor[i]);
                    ps2.executeUpdate();
                }
                ps.clearParameters();
                ps.setInt(1, ID);
                ps.setString(2, autor[i]);
                ps.executeUpdate();
            }

            SQL = "INSERT INTO ID_PAGES (ID,PAGES) VALUES (?,?)";
            SQL2 = "INSERT INTO T_PAGES (PAGES) VALUES (?)";
            ps = conn.prepareStatement(SQL);
            if (!verificarExistencia(TBPAGES, pagina)) {
                ps2 = conn.prepareStatement(SQL2);
                ps2.clearParameters();
                ps2.setString(1, pagina);
                ps2.executeUpdate();
            }
            ps.clearParameters();
            ps.setInt(1, ID);
            ps.setString(2, pagina);
            ps.executeUpdate();

            SQL = "INSERT INTO ID_PUBLICADOR(ID,ID_PUBLICADOR) VALUES(?,?)";
            ps = conn.prepareStatement(SQL);
            ps.setInt(1, ID);
            ps.setInt(2, objUsuarioBean.getIdusuario());
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new SSDAOException("Erro ao inserir dados " + e);
        } finally {
            ConnectionSSFactory.closeConnection(conn, ps);
        }
    }

    private boolean verificarExistencia(int n, String p) throws SSDAOException {
        PreparedStatement ps = null;
        String SQL = "";
        int cont = 0;
        try {
            if (n == TBAUTHOR) {
                SQL = "SELECT * FROM T_AUTHOR WHERE AUTHOR=?";
            } else if (n == TBPAGES) {
                SQL = "SELECT * FROM T_PAGES WHERE PAGES=?";
            } else if (n == TBIDAUTHOR) {
                SQL = "SELECT * FROM ID_AUTHOR WHERE AUTHOR=?";
            }
            //conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.clearParameters();
            ps.setString(1, p);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                cont++;
            }

        } catch (SQLException e) {
            throw new SSDAOException("Erro ao inserir dados " + e);
        } finally {
            if (cont == 0) {
                return false;
            } else {
                return true;
            }
        }
    }

    private boolean verificarExistencia(int n, String p, int par) throws SSDAOException {
        PreparedStatement ps = null;
        String SQL = "";
        int cont = 0;
        try {
            if (n == TBIDAUTHOR) {
                SQL = "SELECT * FROM ID_AUTHOR WHERE AUTHOR=? AND ID=?";
            }
            ps = conn.prepareStatement(SQL);
            ps.clearParameters();
            ps.setString(1, p);
            ps.setInt(2, par);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cont++;
            }

        } catch (SQLException e) {
            throw new SSDAOException("Erro ao inserir dados " + e);
        } finally {
            if (cont == 0) {
                return false;
            } else {
                return true;
            }
        }
    }

    public ArrayList<PublicacaoBean> retornaPublicacoes(UsuarioBean objUsuario) throws SSDAOException {

        ArrayList<PublicacaoBean> listaPublicacao = new ArrayList<PublicacaoBean>();

        PreparedStatement ps = null;
        Connection conn = null;
        String SQL = "";
        int cont = 0;
        try {

            SQL = "SELECT * FROM ID_PUBLICADOR " + "INNER JOIN PUBLICATION ON ID_PUBLICADOR.ID=PUBLICATION.ID " + "WHERE ID_PUBLICADOR.ID_PUBLICADOR=?";

            conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.clearParameters();
            ps.setInt(1, objUsuario.getIdusuario());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                PublicacaoBean pb = new PublicacaoBean();
                pb.setID(rs.getInt("ID"));
                pb.setTitulo(rs.getString("TITLE"));
                pb.setLocal(rs.getString("BOOKTITLE"));
                pb.setAno(rs.getInt("YEAR"));
                pb.setAutor(retornaAutores(pb.getID()));
                pb.setPaginas(retornaPaginas(pb.getID()));
                listaPublicacao.add(cont, pb);
                cont++;
            }

        } catch (SQLException e) {
            throw new SSDAOException("Erro ao consultar dados " + e);
        } finally {
            ConnectionSSFactory.closeConnection(conn, ps);
        }
        return listaPublicacao;
    }

    private String[] retornaAutores(int ID) throws SSDAOException {
        int nAutores = retornaNAutores(ID);
        String[] autores = new String[nAutores];
        PreparedStatement ps = null;
        Connection conn = null;
        String SQL = "";
        int cont = 0;
        try {
            SQL = "SELECT * FROM ID_AUTHOR WHERE ID=?";
            conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.clearParameters();
            ps.setInt(1, ID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                autores[cont] = rs.getString("AUTHOR");
                cont++;
            }

        } catch (SQLException e) {
            throw new SSDAOException("Erro ao consultar dados " + e);
        }

        return autores;
    }

    private String retornaPaginas(int ID) throws SSDAOException {
        String paginas = null;
        PreparedStatement ps = null;
        Connection conn = null;
        String SQL = "";
        try {
            SQL = "SELECT * FROM ID_PAGES WHERE ID=?";
            conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.clearParameters();
            ps.setInt(1, ID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                paginas = rs.getString("PAGES");
            }
        } catch (SQLException e) {
            throw new SSDAOException("Erro ao consultar dados " + e);
        } 
        return paginas;
    }

    private int retornaNAutores(int ID) throws SSDAOException {
        int n = 0;
        PreparedStatement ps = null;
        Connection conn = null;
        String SQL = "";
        try {
            SQL = "SELECT COUNT(*) AS n FROM ID_AUTHOR WHERE ID=?";
            conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.clearParameters();
            ps.setInt(1, ID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                n = rs.getInt("n");
            }
        } catch (SQLException e) {
            throw new SSDAOException("Erro ao consultar dados " + e);
        } 
        return n;
    }

    public PublicacaoBean recuperaPublicacoes(int id) throws SSDAOException {
        PublicacaoBean objPublicacao = new PublicacaoBean();
        PreparedStatement ps = null;
        Connection conn = null;
        String SQL = "";
        try {

            SQL = "SELECT * FROM PUBLICATION  " + "WHERE ID=?";

            conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.clearParameters();
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                objPublicacao.setID(rs.getInt("ID"));
                objPublicacao.setTitulo(rs.getString("TITLE"));
                objPublicacao.setLocal(rs.getString("BOOKTITLE"));
                objPublicacao.setAno(rs.getInt("YEAR"));
                objPublicacao.setAutor(retornaAutores(objPublicacao.getID()));
                objPublicacao.setPaginas(retornaPaginas(objPublicacao.getID()));
            }

        } catch (SQLException e) {
            throw new SSDAOException("Erro ao consultar dados " + e);
        } finally {
            ConnectionSSFactory.closeConnection(conn, ps);
        }
        return objPublicacao;
    }

    public void alterar(PublicacaoBean objPublicacao, UsuarioBean objUsuario) throws SSDAOException {
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        PreparedStatement ps4 = null;
        Connection conn = null;
        if (objPublicacao == null) {
            throw new SSDAOException("O valor passado nao pode ser nulo");
        }
        try {
            int ID = objPublicacao.getID();
            String titulo = objPublicacao.getTitulo();
            String[] autor = objPublicacao.getAutor();
            String local = objPublicacao.getLocal();
            String pagina = objPublicacao.getPaginas();
            int ano = objPublicacao.getAno();
            String SQL = "UPDATE PUBLICATION SET BOOKTITLE = ? , TITLE = ?,YEAR = ? WHERE ID = ?";
            conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.clearParameters();
            ps.setString(1, local);
            ps.setString(2, titulo);
            ps.setInt(3, ano);
            ps.setInt(4, ID);
            ps.executeUpdate();
            String SQL2 = "";
            String SQL3 = "";
            String SQL4 = "";
            SQL = "UPDATE ID_AUTHOR SET AUTHOR = ? WHERE ID = ? AND AUTHOR = ?";
            SQL2 = "INSERT INTO T_AUTHOR (AUTHOR) VALUES (?)";
            SQL3 = "DELETE FROM ID_AUTHOR WHERE ID = ? AND AUTHOR = ?";
            SQL4 = "INSERT INTO ID_AUTHOR (ID,AUTHOR) VALUES (?,?)";
            ps = conn.prepareStatement(SQL);
            ps2 = conn.prepareStatement(SQL2);
            ps3 = conn.prepareStatement(SQL3);
            ps4 = conn.prepareStatement(SQL4);
            String[] autoresAntigos = retornaAutores(ID);
            for (int i = 0; i < autor.length; i++) {
                if (!verificarExistencia(TBAUTHOR, autor[i])) {
                    ps2.clearParameters();
                    ps2.setString(1, autor[i]);
                    ps2.executeUpdate(); 

                } else if (!verificarExistencia(TBIDAUTHOR, autor[i], ID)) {
                    ps4.clearParameters();
                    ps4.setInt(1, ID);
                    ps4.setString(2, autor[i]);
                    ps4.executeUpdate();
                } else {

                    ps.clearParameters();
                    ps.setString(1, autor[i]);
                    ps.setInt(2, ID);
                    ps.setString(3, autoresAntigos[i]);
                    ps.executeUpdate();
                    autoresAntigos[i] = "";
                }
            }
            //verifica se existem autores a excluir
            for (int i = 0; i < autoresAntigos.length; i++) {
                if (!autoresAntigos[i].equals("")) {
                    ps3.clearParameters();
                    ps3.setInt(1, ID);
                    ps3.setString(2, autoresAntigos[i]);
                    ps3.executeUpdate();
                    autoresAntigos[i] = "";
                }
            }

            SQL = "UPDATE ID_PAGES SET PAGES = ? WHERE ID = ?";
            SQL2 = "INSERT INTO T_PAGES (PAGES) VALUES (?)";
            ps = conn.prepareStatement(SQL);
            if (!verificarExistencia(TBPAGES, pagina)) {
                ps2 = conn.prepareStatement(SQL2);
                ps2.clearParameters();
                ps2.setString(1, pagina);
                ps2.executeUpdate();
            }
            ps.clearParameters();
            ps.setString(1, pagina);
            ps.setInt(2, ID);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new SSDAOException("Erro ao inserir dados " + e);
        } finally {
            ConnectionSSFactory.closeConnection(conn, ps);
        }
    }

    public void excluir(int id) throws SSDAOException {
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;

        Connection conn = null;
        if (id == 0) {
            throw new SSDAOException("O valor passado nao pode ser nulo");
        }
        try {

            String SQL = "DELETE FROM ID_PUBLICADOR WHERE ID = ?";
            conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.clearParameters();
            ps.setInt(1, id);

            ps.executeUpdate();

        } catch (SQLException e) {
            throw new SSDAOException("Erro ao inserir dados " + e);
        } finally {
            ConnectionSSFactory.closeConnection(conn, ps);
        }
    }

    public ArrayList<PublicacaoBean> retornaPublicacoesRecentes(UsuarioBean objUsuario) throws SSDAOException {

        ArrayList<PublicacaoBean> listaPublicacao = new ArrayList<PublicacaoBean>();

        PreparedStatement ps = null;
        Connection conn = null;
        String SQL = "";
        int cont = 0;
        try {

            SQL = "SELECT TOP 100 * FROM PUBLICATION ORDER BY ID DESC ";

            conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.clearParameters();
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                //publicacao[cont]=new PublicacaoBean();
                PublicacaoBean pb = new PublicacaoBean();
                pb.setID(rs.getInt("ID"));
                pb.setTitulo(rs.getString("TITLE"));
                pb.setLocal(rs.getString("BOOKTITLE"));
                pb.setAno(rs.getInt("YEAR"));
                pb.setAutor(retornaAutores(pb.getID()));
                pb.setPaginas(retornaPaginas(pb.getID()));
                listaPublicacao.add(cont, pb);
                cont++;
            }

        } catch (SQLException e) {
            throw new SSDAOException("Erro ao consultar dados " + e);
        } finally {
            ConnectionSSFactory.closeConnection(conn, ps);
        }
        return listaPublicacao;
    }

    public ArrayList<PublicacaoBean> retornaPublicacoesPesquisa(String busca) throws SSDAOException {

        ArrayList<PublicacaoBean> listaPublicacao = new ArrayList<PublicacaoBean>();

        PreparedStatement ps = null;
        Connection conn = null;
        String SQL = "";
        int cont = 0;
        try {

            SQL = "SELECT TOP 500 * FROM PUBLICATION WHERE TITLE LIKE ? ORDER BY ID DESC ";
            String pesq = "%" + busca + "%";
            conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.clearParameters();
            ps.setString(1, pesq);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                PublicacaoBean pb = new PublicacaoBean();
                pb.setID(rs.getInt("ID"));
                pb.setTitulo(rs.getString("TITLE"));
                pb.setLocal(rs.getString("BOOKTITLE"));
                pb.setAno(rs.getInt("YEAR"));
                pb.setAutor(retornaAutores(pb.getID()));
                pb.setPaginas(retornaPaginas(pb.getID()));
                listaPublicacao.add(cont, pb);
                cont++;
            }

        } catch (SQLException e) {
            throw new SSDAOException("Erro ao consultar dados " + e);
        } finally {
            ConnectionSSFactory.closeConnection(conn, ps);
        }
        return listaPublicacao;
    }

    public ArrayList<PublicacaoBean> retornaPublicacoesPesquisa(String titulo, String local) throws SSDAOException {
        ArrayList<PublicacaoBean> listaPublicacao = new ArrayList<PublicacaoBean>();

        PreparedStatement ps = null;
        Connection conn = null;
        String SQL = "";
        int cont = 0;
        try {

            SQL = "SELECT TOP 100 * FROM PUBLICATION WHERE TITLE LIKE ? AND BOOKTITLE LIKE ? ORDER BY ID DESC ";
            String t = "%" + titulo + "%";
            String l = "%" + local + "%";
            conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.clearParameters();
            ps.setString(1, t);
            ps.setString(2, l);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                PublicacaoBean pb = new PublicacaoBean();
                pb.setID(rs.getInt("ID"));
                pb.setTitulo(rs.getString("TITLE"));
                pb.setLocal(rs.getString("BOOKTITLE"));
                pb.setAno(rs.getInt("YEAR"));
                pb.setAutor(retornaAutores(pb.getID()));
                pb.setPaginas(retornaPaginas(pb.getID()));
                listaPublicacao.add(cont, pb);
                cont++;
            }

        } catch (SQLException e) {
            throw new SSDAOException("Erro ao consultar dados " + e);
        } finally {
            ConnectionSSFactory.closeConnection(conn, ps);
        }
        return listaPublicacao;
    }
}
