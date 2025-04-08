package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Credit;
import UtilDB.DAOaccess;

public  class CreditDAO {
    public static void Save(Credit credit) throws SQLException, ClassNotFoundException{
        Connection conn = DAOaccess.getConnection();
        String sql = "INSERT INTO Credit (libele, montant, DateDebut, DateFin) VALUES (?, ?, ?, ?)";
        try ( PreparedStatement stmt = conn.prepareStatement(sql)) {
       
        stmt.setString(1, credit.getLibelle());
        stmt.setInt(2, credit.getMontant());
        stmt.setString(3, credit.getDateDebut());
        stmt.setString(4, credit.getDateFin());
        int rowsAffected = stmt.executeUpdate();
        }
        catch (SQLException e) {
        e.printStackTrace();
        }
    }


    public static List<Credit> findAll() throws SQLException, ClassNotFoundException {
        List<Credit> credits = new ArrayList<>();
        Connection conn = DAOaccess.getConnection();
        String sql = "SELECT * FROM Credit";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            int id = rs.getInt("id"); 
            String libelle = rs.getString("libele");
            int montant = rs.getInt("montant");
            String dateDebut = rs.getString("DateDebut");
            String dateFin = rs.getString("DateFin");

            Credit credit = new Credit(id, libelle, montant, dateDebut, dateFin);
            credits.add(credit);
        }


        rs.close();
        stmt.close();
        conn.close();

        return credits;
    }
}
