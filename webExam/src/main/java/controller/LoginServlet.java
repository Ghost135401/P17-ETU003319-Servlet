package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;


public class LoginServlet extends HttpServlet {  
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String filepath = "/jsp/index.jsp";
    RequestDispatcher dispatcher = request.getRequestDispatcher(filepath);
    dispatcher.forward(request, response);
}

}
