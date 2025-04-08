package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;

import model.Depense;
import UtilDB.DAOaccess;

public class DepenseDAO {
    public static List<Depense> findAll() throws Exception {
        Connection conn=null;
        Statement stmt = null;
        ResultSet resultSet = null;
        String sql = "SELECT * FROM Depense"; 
        List<Depense> v=new ArrayList<Depense>();
        try  {
            conn=DAOaccess.getConnection();
            stmt=conn.createStatement();
            resultSet=stmt.executeQuery(sql);
            while (resultSet.next()) {
                int id=resultSet.getInt("id");
                String Libelle=resultSet.getString("libele");
                int montant=resultSet.getInt("montant");
                String DateDebut=resultSet.getString("DateDebut");
                String DateFin=resultSet.getString("DateFin");
                Depense tmp=new Depense(id,Libelle,montant,DateDebut,DateFin);
                v.add(tmp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }
        return v;
    }
     public static void Save(Depense Depense) throws ClassNotFoundException, SQLException {
        Connection connection=DAOaccess.getConnection();
        String sql = "INSERT INTO Depense(libele,montant,DateDebut,DateFin) value (?,?,?,?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
       
             preparedStatement.setString(1, Depense.getLibelle());
             preparedStatement.setInt(2, Depense.getMontant());
             preparedStatement.setString(3, Depense.getDateDebut());
             preparedStatement.setString(4, Depense.getDateFin());
            int rowsAffected = preparedStatement.executeUpdate();
            System.out.println(rowsAffected + " Matiere(s) ajouté(s) avec succès !");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
   
}
