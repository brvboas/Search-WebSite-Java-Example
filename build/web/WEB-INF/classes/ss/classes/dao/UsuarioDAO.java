package ss.classes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import ss.classes.bean.UsuarioBean;

public class UsuarioDAO {

    private Connection conn;

    public UsuarioDAO() throws SSDAOException {


        try {
            this.conn = ConnectionSSFactory.getConnection();
        } catch (Exception e) {
            throw new SSDAOException("Erro: :\n" + e.getMessage());
        }

    }

    public void incluir(UsuarioBean objUsuario) throws SSDAOException {

        PreparedStatement ps = null;

        Connection conn = null;
        if (objUsuario == null) {
            throw new SSDAOException("O valor passado nao pode ser nulo");
        }
        try {
            String nome = objUsuario.getNome();
            int tipoUsuario = objUsuario.getTipoUsuario();
            String email = objUsuario.getEmail();
            String sexo = objUsuario.getSexo();
            Date dtnasc = objUsuario.getDtnasc();
            int pais = objUsuario.getPais();
            String cidade = objUsuario.getCidade();
            int escolaridade = objUsuario.getEscolaridade();
            String login = objUsuario.getLogin();
            String pass = objUsuario.getPass();
            java.util.Date dataUtil = dtnasc;
            java.sql.Date dataSql = new java.sql.Date(dataUtil.getTime());
            String SQL = "INSERT INTO usuario (nome,tipousuario,email,sexo,dtnasc, " +
                    "cidade,pais,escolaridade,senha,login) VALUES (?,?,?,?,?,?,?,?,?,?) ";
            conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.clearParameters();
            ps.setString(1, nome);
            ps.setInt(2, tipoUsuario);
            ps.setString(3, email);
            ps.setString(4, sexo);
            ps.setDate(5, dataSql);
            ps.setString(6, cidade);
            ps.setInt(7, pais);
            ps.setInt(8, escolaridade);
            ps.setString(9, pass);
            ps.setString(10, login);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new SSDAOException("Erro ao inserir dados " + e);
        } finally {
            ConnectionSSFactory.closeConnection(conn, ps);
        }
    }

    public boolean login(UsuarioBean objUsuario) throws SSDAOException {
        PreparedStatement ps = null;

        Connection conn = null;
        if (objUsuario == null) {
            throw new SSDAOException("O valor passado nao pode ser nulo");
        }

        try {
            String login = objUsuario.getLogin();
            String pass = objUsuario.getPass();

            String SQL = "SELECT * FROM usuario where login=? AND senha=?";
            conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.clearParameters();
            ps.setString(1, login);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            int cont = 0;
            while (rs.next()) {
                objUsuario.setIdusuario(rs.getInt("idusuario"));
                objUsuario.setNome(rs.getString("nome"));
                objUsuario.setEmail(rs.getString("email"));
                objUsuario.setTipoUsuario(rs.getInt("tipousuario"));
                objUsuario.setSexo(rs.getString("sexo"));
                java.sql.Date sqlDate = rs.getDate("dtnasc");
                java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
                objUsuario.setDtnasc(utilDate);
                objUsuario.setCidade(rs.getString("cidade"));
                objUsuario.setPais(rs.getInt("pais"));
                objUsuario.setEscolaridade(rs.getInt("escolaridade"));
                cont++;
            }

            if (cont == 0) {
                objUsuario = null;
                return false;
            }

        } catch (SQLException e) {
            throw new SSDAOException("Erro ao consultar dados " + e);

        } finally {
            ConnectionSSFactory.closeConnection(conn, ps);
        }
        return true;
    }

    public void alterar(UsuarioBean objUsuario) throws SSDAOException {
        PreparedStatement ps = null;

        Connection conn = null;
        if (objUsuario == null) {
            throw new SSDAOException("O valor passado nao pode ser nulo");
        }

        try {
            int idusuario = objUsuario.getIdusuario();
            String nome = objUsuario.getNome();
            int tipoUsuario = objUsuario.getTipoUsuario();
            String email = objUsuario.getEmail();
            String sexo = objUsuario.getSexo();
            Date dtnasc = objUsuario.getDtnasc();
            int pais = objUsuario.getPais();
            String cidade = objUsuario.getCidade();
            int escolaridade = objUsuario.getEscolaridade();
            String login = objUsuario.getLogin();
            String pass = objUsuario.getPass();
            java.util.Date dataUtil = dtnasc;
            java.sql.Date dataSql = new java.sql.Date(dataUtil.getTime());

            String SQL = "UPDATE usuario SET nome=?,tipousuario=?,email=?,sexo=?,dtnasc=?, " +
                    "cidade=?,pais=?,escolaridade=?,senha=?,login=? WHERE idusuario =?";
            conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.clearParameters();
            ps.setString(1, nome);
            ps.setInt(2, tipoUsuario);
            ps.setString(3, email);
            ps.setString(4, sexo);
            ps.setDate(5, dataSql);
            ps.setString(6, cidade);
            ps.setInt(7, pais);
            ps.setInt(8, escolaridade);
            ps.setString(9, pass);
            ps.setString(10, login);
            ps.setInt(11, idusuario);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new SSDAOException("Erro ao inserir dados " + e);
        } finally {
            ConnectionSSFactory.closeConnection(conn, ps);
        }
    }

    public ArrayList<UsuarioBean> retornaUsuarios() throws SSDAOException {
        ArrayList<UsuarioBean> lista = new ArrayList<UsuarioBean>();

        PreparedStatement ps = null;
        Connection conn = null;
        String SQL = "";
        int cont = 0;
        try {

            SQL = "SELECT * FROM usuario ORDER BY nome ";

            conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.clearParameters();
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                UsuarioBean usuario = new UsuarioBean();
                usuario.setIdusuario(rs.getInt("idusuario"));
                usuario.setNome(rs.getString("nome"));
                usuario.setTipoUsuario(rs.getInt("tipousuario"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSexo(rs.getString("sexo"));
                java.sql.Date sqlDate = rs.getDate("dtnasc");
                java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
                usuario.setDtnasc(utilDate);
                usuario.setCidade(rs.getString("cidade"));
                usuario.setPais(rs.getInt("pais"));
                usuario.setEscolaridade(rs.getInt("escolaridade"));
                usuario.setPass(rs.getString("senha"));
                usuario.setLogin(rs.getString("login"));
                lista.add(cont, usuario);
                cont++;
            }

        } catch (SQLException e) {
            throw new SSDAOException("Erro ao consultar dados " + e);
        } finally {
            ConnectionSSFactory.closeConnection(conn, ps);
        }

        return lista;
    }

    public ArrayList<UsuarioBean> retornaUsuarios(String pesquisa) throws SSDAOException {
        ArrayList<UsuarioBean> lista = new ArrayList<UsuarioBean>();
        PreparedStatement ps = null;
        Connection conn = null;
        String SQL = "";
        int cont = 0;
        try {

            SQL = "SELECT * FROM usuario where nome LIKE ? ORDER BY nome ";
            String pesq = "%" + pesquisa + "%";
            conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.clearParameters();
            ps.setString(1, pesq);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                UsuarioBean usuario = new UsuarioBean();
                usuario.setIdusuario(rs.getInt("idusuario"));
                usuario.setNome(rs.getString("nome"));
                usuario.setTipoUsuario(rs.getInt("tipousuario"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSexo(rs.getString("sexo"));
                java.sql.Date sqlDate = rs.getDate("dtnasc");
                java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
                usuario.setDtnasc(utilDate);
                usuario.setCidade(rs.getString("cidade"));
                usuario.setPais(rs.getInt("pais"));
                usuario.setEscolaridade(rs.getInt("escolaridade"));
                usuario.setPass(rs.getString("senha"));
                usuario.setLogin(rs.getString("login"));
                lista.add(cont, usuario);
                cont++;
            }

        } catch (SQLException e) {
            throw new SSDAOException("Erro ao consultar dados " + e);
        } finally {
            ConnectionSSFactory.closeConnection(conn, ps);
        }

        return lista;
    }

    public UsuarioBean retornaUsuario(int id) throws SSDAOException {
        PreparedStatement ps = null;
        Connection conn = null;
        String SQL = "";
        int cont = 0;
        UsuarioBean usuario = new UsuarioBean();
        try {

            SQL = "SELECT * FROM usuario where idusuario = ? ORDER BY nome ";
            conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.clearParameters();
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                //publicacao[cont]=new PublicacaoBean();

                usuario.setIdusuario(rs.getInt("idusuario"));
                usuario.setNome(rs.getString("nome"));
                usuario.setTipoUsuario(rs.getInt("tipousuario"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSexo(rs.getString("sexo"));
                java.sql.Date sqlDate = rs.getDate("dtnasc");
                java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
                usuario.setDtnasc(utilDate);
                usuario.setCidade(rs.getString("cidade"));
                usuario.setPais(rs.getInt("pais"));
                usuario.setEscolaridade(rs.getInt("escolaridade"));
                usuario.setPass(rs.getString("senha"));
                usuario.setLogin(rs.getString("login"));
                // lista.add(cont, usuario);
                cont++;
            }

        } catch (SQLException e) {
            throw new SSDAOException("Erro ao consultar dados " + e);
        } finally {
            ConnectionSSFactory.closeConnection(conn, ps);
        }
        return usuario;
    }

    public void excluir(int id) throws SSDAOException {
        PreparedStatement ps = null;
        Connection conn = null;
        String SQL = "";
        try {

            SQL = "DELETE FROM usuario where idusuario = ?";
            conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.clearParameters();
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new SSDAOException("Erro ao consultar dados " + e);
        } finally {
            ConnectionSSFactory.closeConnection(conn, ps);
        }
    }
}
