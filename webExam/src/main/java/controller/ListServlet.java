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

public class ListServlet extends HttpServlet {  
        public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

              CreditDAO creditDAO = new CreditDAO();
              List<Credit> creditlist=null;
              try {
                creditlist = creditDAO.findAll();
              } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
              }
              
              request.setAttribute("credit", creditlist);
  
              request.getRequestDispatcher("/jsp/list.jsp").forward(request, response);
        
}
}