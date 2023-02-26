/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.AccountController;

import DAO.ConnectionPro;
import DAO.UserDatabase;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User loginBean = new User();

        loginBean.setEmail(email);
        loginBean.setPassword(password);

        UserDatabase loginDao = new UserDatabase(ConnectionPro.getConnection());
        User u = loginDao.getUserByEmailAndPassword(email, password);

        try {
            String userValidate = loginDao.authenticateUser(loginBean);

            if (userValidate.equals("Admin_Role")) {

                HttpSession session = request.getSession(); //Creating a session

                session.setAttribute("currentUser", u);

                session.setAttribute("Admin", email); //setting session attribute
                request.setAttribute("email", email);
                request.getRequestDispatcher("home.jsp").forward(request, response);

            } else if (userValidate.equals("User_Role")) {

                HttpSession session = request.getSession();

                session.setAttribute("currentUser", u);

                session.setAttribute("Student", email);
                request.setAttribute("email", email);

                request.getRequestDispatcher("userHome.jsp").forward(request, response);
            } else {
                System.out.println("Error message = " + userValidate);
                request.setAttribute("errMessage", userValidate);

                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (IOException e1) {
            e1.printStackTrace();
        }
    }
}
