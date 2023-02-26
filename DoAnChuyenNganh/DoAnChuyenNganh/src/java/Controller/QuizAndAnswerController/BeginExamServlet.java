/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.QuizAndAnswerController;

import DAO.ConnectionPro;
import DAO.UserDatabase;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "BeginExamServlet", urlPatterns = {"/BeginExamServlet"})
public class BeginExamServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BeginExamServlet</title>");
            out.println("</head>");
            out.println("<body>");

            String select[] = request.getParameterValues("enum");

            String paramName, paramValue[];
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;

            int cnt = 0;
            String ans = "";

//            String correct = request.getParameter("correct");
//
            Enumeration paramNames = request.getParameterNames();
//            out.println("asdhasdjhaskdjhaskdjhasdkjhas: " + paramNames);
//            out.print("asdhasdjhaskdjhaskdjhasdkjhas: " + correct);

            out.println("asdhasdjhaskdjhaskdjhasdkjhas: " + paramNames);
//            out.println("asdhasdjhaskdjhaskdjhasdkjhas: ");
//            try {
//                Class.forName("com.mysql.jdbc.Driver");
//                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/examdb?characterEncoding=UTF8", "root", "");
//                stmt = con.createStatement();
//                rs = stmt.executeQuery("select correct from quiz");
//                out.println(stmt.executeQuery("select correct from quiz"));
//                while (rs.next() && paramNames.hasMoreElements()) {
//                    String un = rs.getString(1);
//                    paramName = (String) paramNames.nextElement();
//                    paramValue = request.getParameterValues(paramName);
//                    for (int i = 0; i < paramValue.length; i++) {
//                        ans = paramValue[i];
//                    }
//                    if (un.equals(ans)) {
//                        cnt++;
//                    }
//                }
//                out.println("asdhasdjhaskdjhaskdjhasdkjhas: " + cnt);
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
