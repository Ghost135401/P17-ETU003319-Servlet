package UtilDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAOaccess {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        String url = "jdbc:mysql://localhost:3306/db_s2_ETU003319";
        String user = "ETU003319";
        String password = "qDzQc7Nt";
    
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(url, user, password);
      

        System.out.println("Connexion réussie à la base de données !");
        return connection;
    }
    
}
