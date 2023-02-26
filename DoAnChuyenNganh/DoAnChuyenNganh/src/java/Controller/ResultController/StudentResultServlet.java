/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.ResultController;

import DAO.ConnectionPro;
import DAO.UserDatabase;
import Model.Results;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ResultServlet", urlPatterns = {"/ResultServlet"})
public class StudentResultServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String ngayLam = request.getParameter("ngayLam");
        String nguoiLam = request.getParameter("nguoiLam");
        String email = request.getParameter("email");
        int examId = Integer.parseInt(request.getParameter("examId"));
        int quizCount = Integer.parseInt(request.getParameter("quizCount"));

        String getid[] = new String[100];
        for (int i = 1; i <= quizCount; i++) {
            getid[i] = request.getParameter("radio" + i);
        }
        String str[] = new String[100];
        for (int j = 1; j <= quizCount; j++) {
            str[j] = request.getParameter("ans" + j);
        }

        int dem = 0;
        //String answers[]=str.split(" ");
        for (int i = 0; i < str.length; i++) {
            if ((str[i] != null) && (getid[i] != null)) {
                if (getid[i].equals(str[i])) {
                    dem++;
                }
            }
        }
        String soCauDung = String.valueOf(dem);
        Float diem;
        if (dem == 0) {
            diem = Float.valueOf(0);
        } else {
            diem = Float.valueOf(10 / quizCount * dem);
        }
        Results book = new Results(soCauDung, diem, ngayLam, nguoiLam, email, examId);
        try {
            UserDatabase bkdao = new UserDatabase(ConnectionPro.getConnection());
            if (bkdao.addResult(book)) {
                response.sendRedirect("userHome.jsp");
            } else {
                response.sendRedirect("errorpage.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
