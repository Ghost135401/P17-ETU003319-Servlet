package controller;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;


public class CheckLogin extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) 
    throws ServletException, IOException { 
        res.setContentType("text/plain");
        String nom = req.getParameter("nom");
        String pwd = req.getParameter("pwd");
        HttpSession session = req.getSession();

        if ("admin".equals(nom) && "admin".equals(pwd)) {
            session.setAttribute("count", "test");
        } 
        res.sendRedirect("Verification");

    }
}
