package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import dao.*;
import model.*;
import UtilDB.DAOaccess;

public class ListDepense extends HttpServlet {  
        public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

              DepenseDAO depenseDAO = new DepenseDAO();
              List<Depense> Depenselist=null;
              try {
                Depenselist = depenseDAO.findAll();
              } catch (Exception  e) {
                e.printStackTrace();
              }
              
              request.setAttribute("depense", Depenselist);
  
              request.getRequestDispatcher("/jsp/listd.jsp").forward(request, response);
        
}
}