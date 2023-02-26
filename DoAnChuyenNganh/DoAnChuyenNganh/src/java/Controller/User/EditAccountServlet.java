/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.User;

import DAO.ConnectionPro;
import DAO.UserDatabase;
import Model.Subject;
import Model.User;
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
@WebServlet(name = "EditAccountServlet", urlPatterns = {"/EditAccountServlet"})
public class EditAccountServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        int id = Integer.parseInt(request.getParameter("id"));
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        String tuoi = request.getParameter("tuoi");
        String gioiTinh = request.getParameter("gioiTinh");
        String diaChi = request.getParameter("diaChi");
        String sdt = request.getParameter("sdt");
        int roleId = Integer.parseInt(request.getParameter("roleId"));

        User book = new User(email, fullname, tuoi, sdt, gioiTinh, diaChi, roleId);

        book.setId(id);
        book.setEmail(email);
        book.setFullname(fullname);
        book.setTuoi(tuoi);
        book.setGioiTinh(gioiTinh);
        book.setDiaChi(diaChi);
        book.setSdt(sdt);
        book.setRoleId(roleId);

        UserDatabase bkdao = new UserDatabase(ConnectionPro.getConnection());
        if (bkdao.editAccountInfo(book)) {
            response.sendRedirect("accountManagerment.jsp");
        } else {
            response.sendRedirect("errorpage.jsp");
        }
    }
}
