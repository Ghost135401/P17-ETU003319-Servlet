package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

public class Verification extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) 
    throws ServletException, IOException { 
        res.setContentType("text/plain");
        String erreur=" ";
        HttpSession session = req.getSession(false); 
        if (session != null && session.getAttribute("count") != null) {
            erreur="bonjour admin";
            res.setCharacterEncoding("UTF-8");
            req.setAttribute("erreur", erreur);
            req.getRequestDispatcher("/jsp/acceuil.jsp").forward(req, res);
            
        } else {
           erreur="Acces refuse !";
           res.setCharacterEncoding("UTF-8");
           req.setAttribute("erreur", erreur);
           req.getRequestDispatcher("/jsp/index.jsp").forward(req, res);
        }
       
    }
}
