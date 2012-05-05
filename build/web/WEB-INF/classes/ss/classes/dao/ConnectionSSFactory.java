package ss.classes.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnectionSSFactory {

    public static Connection getConnection() throws SSDAOException {
        try {
            Class.forName("com.microsoft.sqlserver." +
                    "jdbc.SQLServerDriver");


            String conexao = "jdbc:sqlserver://localhost:1433;databasename=publicacoes";
            //String conexao = "jdbc:sqlserver://192.168.12.4:1433;databasename=317527";
            String usuario = "ssadm", senha = "qweasdws";
            //String usuario = "317527", senha = "#sorocaba2010";
            Connection conn = DriverManager.getConnection(conexao, usuario, senha);
            return conn;
        } catch (Exception e) {
            throw new SSDAOException(e.getMessage());
        }
    }

    public static void closeConnection(Connection conn, Statement stmt, ResultSet rs) throws SSDAOException {
        close(conn, stmt, rs);
    }

    public static void closeConnection(Connection conn, Statement stmt)
            throws SSDAOException {
        close(conn, stmt, null);
    }

    public static void closeConnection(Connection conn)
            throws SSDAOException {
        close(conn, null, null);
    }

    private static void close(Connection conn, Statement stmt, ResultSet rs)
            throws SSDAOException {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            throw new SSDAOException(e.getMessage());
        }
    }
}
