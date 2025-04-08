package controller;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import dao.*;
import model.*;
import UtilDB.DAOaccess;

public class CreditController extends HttpServlet  {
     protected void doPost(HttpServletRequest req, HttpServletResponse res) 
    throws ServletException, IOException { 
         PrintWriter out = res.getWriter();
        res.setContentType("text/plain");
        String libelle = req.getParameter("libelle");
        String montant = req.getParameter("montant");
        int mont=Integer.parseInt(montant);
        String DateDebut = req.getParameter("DateDebut");
        String DateFin = req.getParameter("DateFin");
        Credit credit=new Credit(0, libelle, mont, DateDebut, DateFin);
        CreditDAO creditDAO=new CreditDAO();
        try {
            CreditDAO.Save(credit);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            
        }
        out.println("Credit Ajouter");

    }
}

