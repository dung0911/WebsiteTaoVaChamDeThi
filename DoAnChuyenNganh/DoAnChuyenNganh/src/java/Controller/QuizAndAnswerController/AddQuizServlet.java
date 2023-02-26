/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.QuizAndAnswerController;

import DAO.ConnectionPro;
import DAO.UserDatabase;
import Model.Exam;
import Model.Quiz;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AddQuizServlet", urlPatterns = {"/AddQuizServlet"})
public class AddQuizServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String quiz = request.getParameter("quiz");
        String answer1 = request.getParameter("answer1");
        String answer2 = request.getParameter("answer2");
        String answer3 = request.getParameter("answer3");
        String answer4 = request.getParameter("answer4");
        String correct = request.getParameter("correct");
        int examId = Integer.parseInt(request.getParameter("examId"));

        Quiz book = new Quiz(quiz, answer1, answer2, answer3, answer4, correct, examId);
        try {
            UserDatabase bkdao = new UserDatabase(ConnectionPro.getConnection());
            if (bkdao.addQuiz(book)) {
                response.sendRedirect("Quiz.jsp");
            } else {
                response.sendRedirect("errorpage.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    

}
