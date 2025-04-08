package controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import dao.*;
import model.*;
import UtilDB.DAOaccess;

public class DepenseController extends HttpServlet {
         protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException { 
         PrintWriter out = res.getWriter();
        res.setContentType("text/plain");
        String libelle = req.getParameter("libelle");
        String montant = req.getParameter("montant");
        int mont=Integer.parseInt(montant);
        String DateDebut = req.getParameter("DateDebut");
        String DateFin = req.getParameter("DateFin");
        Depense Depense=new Depense(0, libelle, mont, DateDebut, DateFin);
        List<Depense> Depenselist=null;
        List<Credit> creditlist=null;
        int depense=0;
        try {
            Depenselist = DepenseDAO.findAll();
            for (Depense dep : Depenselist) {
                depense=depense+dep.getMontant();
            }
          } catch (Exception  e) {
            e.printStackTrace();
          }
        int credit=0;
        try {
            creditlist = CreditDAO.findAll();
            for (Credit cre : creditlist) {
                credit=credit+cre.getMontant();
            }
            if(credit-depense<0){
                out.println("Credit Insuffisant "+credit+" Ar,"+" depense"+depense);
                int reste1=credit-depense;
                out.println(" reste: "+reste1+" Ar");
            }else{
                DepenseDAO.Save(Depense);
                int reste=credit-depense;
                out.println("Depense Ajouter reste: "+reste+" Ar");

            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            
        }
       
       

    }
}
