package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Model.Exam;
import java.util.List;
import Model.Subject;
import Model.Subject;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import Model.User;
import DAO.UserDatabase;
import DAO.ConnectionPro;

public final class testExam_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/layout/header.jsp");
    _jspx_dependants.add("/layout/aside.jsp");
  }

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_var_items;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_forEach_var_items = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_forEach_var_items.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    UserDatabase examData = new UserDatabase(ConnectionPro.getConnection());
    List<Subject> subject = examData.getAllsubjects();
    request.setAttribute("SUBJECT_LIST", subject);

    List<Exam> exam = examData.getAllExams();
    request.setAttribute("EXAM_LIST", exam);

      out.write('\n');
 int id = 1; 
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <title>\n");
      out.write("            Quản lý đề thi\n");
      out.write("        </title>\n");
      out.write("        <meta name=\"description\" content=\"\" />\n");
      out.write("        <meta name=\"keywords\" content=\"\" />\n");
      out.write("        <meta name=\"author\" content=\"\" />\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://kit-pro.fontawesome.com/releases/v5.12.1/css/pro.min.css\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700\" rel=\"stylesheet\" />\n");
      out.write("        <script src=\"https://cdn.tailwindcss.com\"></script>\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/angularjs/1.4.0/angular.min.js\"></script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <style>\n");
      out.write("        .td-exam__name {\n");
      out.write("            display: inline-block;\n");
      out.write("            width: 180px;\n");
      out.write("            white-space: nowrap;\n");
      out.write("            overflow: hidden !important;\n");
      out.write("            text-overflow: ellipsis;\n");
      out.write("            padding-top:10px;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("    <body>\n");
      out.write("        <!-- Start nav -->\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
 //In case, if Admin session is not set, redirect to Login page
    if ((request.getSession(false).getAttribute("Admin") == null)) {

      out.write('\n');
      if (true) {
        _jspx_page_context.forward("login.jsp");
        return;
      }
      out.write('\n');
} 
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\" />\n");
      out.write("        <title>\n");
      out.write("            Quản lý đề thi\n");
      out.write("        </title>\n");
      out.write("        <meta name=\"description\" content=\"\" />\n");
      out.write("        <meta name=\"keywords\" content=\"\" />\n");
      out.write("        <meta name=\"author\" content=\"\" />\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://kit-pro.fontawesome.com/releases/v5.12.1/css/pro.min.css\">\n");
      out.write("        <!--Replace with your tailwind.css once created-->\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700\" rel=\"stylesheet\" />\n");
      out.write("        <!-- Define your gradient here - use online tools to find a gradient matching your branding-->\n");
      out.write("        <script src=\"https://cdn.tailwindcss.com\"></script>\n");
      out.write("    </head>\n");
      out.write("    <style>\n");
      out.write("        .dropdown:hover .dropdown-menu {\n");
      out.write("            display: block;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("    </style>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"bg-white border-b border-gray-200 z-30 w-full fixed top-0\">\n");
      out.write("            <div class=\"px-3 py-3 lg:px-5 lg:pl-3 relative\">\n");
      out.write("                <div class=\"flex items-center justify-between\">\n");
      out.write("                    <div class=\"flex items-center justify-start\">\n");
      out.write("                        <a href=\"home.jsp\" class=\"text-xl font-bold flex items-center lg:ml-2.5\">\n");
      out.write("                            <img src=\"https://demo.themesberg.com/windster/images/logo.svg\" class=\"h-6 mr-2\" alt=\"Windster Logo\">\n");
      out.write("                            <span class=\"self-center whitespace-nowrap\">Windster</span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"home.jsp\"></a>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <div class=\"dropdown inline-block relative\">\n");
      out.write("                        <button class=\"menu-btn focus:outline-none focus:shadow-outline flex flex-wrap items-center\">\n");
      out.write("                            <div class=\"w-8 h-8 overflow-hidden rounded-full\">\n");
      out.write("                                ");

                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        String url = "jdbc:mysql://localhost:3306/examdb";
                                        String username = "root";
                                        String password = "";
                                        String query = "select * from accounts";
                                        Connection conn = DriverManager.getConnection(url, username, password);
                                        Statement stmt = conn.createStatement();
                                        ResultSet rs = stmt.executeQuery(query);
                                        while (rs.next()) {
                                
      out.write("\n");
      out.write("                                <img id=\"showImage\" class=\"items-center border w-8 h-8\" src=\"images/");
 out.println(rs.getString("thumb"));
      out.write("\" alt=\"\">                          \n");
      out.write("                                ");
       rs.close();
                                            stmt.close();
                                            conn.close();
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"ml-2 capitalize flex \">\n");
      out.write("                                <h1 class=\"text-sm text-gray-800 font-semibold m-0 p-0 leading-none w-full\">\n");
      out.write("                                    ");
      out.print(session.getAttribute("Admin"));
      out.write("\n");
      out.write("\n");
      out.write("                                </h1>\n");
      out.write("                                <i class=\"fad fa-chevron-down ml-2 text-xs leading-none\"></i>\n");
      out.write("                            </div>\n");
      out.write("                        </button>\n");
      out.write("                        <ul class=\"dropdown-menu absolute hidden text-gray-700 bg-white shadown-lg w-full border rounded\">\n");
      out.write("                            <li class=\"\">\n");
      out.write("                                <a href=\"profileAdmin.jsp\" class=\"px-2 border-b py-2 block capitalize font-medium text-sm tracking-wide bg-white hover:bg-gray-200 hover:text-gray-900 transition-all duration-300 ease-in-out\" href=\"#\">\n");
      out.write("                                    My Account</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"\">\n");
      out.write("                                <a href=\"LogoutServlet\" class=\"px-2 py-2 block capitalize font-medium text-sm tracking-wide bg-white hover:bg-gray-200 hover:text-gray-900 transition-all duration-300 ease-in-out\" href=\"#\">\n");
      out.write("                                    Logout</a>\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("  \n");
      out.write("        <!-- End nav -->\n");
      out.write("\n");
      out.write("        <div class=\"flex overflow-hidden bg-white h-screen  pt-14\"  x-data=\"setup()\" >\n");
      out.write("            <!-- Start aside -->\n");
      out.write("            ");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\" />\n");
      out.write("        <title>\n");
      out.write("            Quản lý đề thi\n");
      out.write("        </title>\n");
      out.write("        <meta name=\"description\" content=\"\" />\n");
      out.write("        <meta name=\"keywords\" content=\"\" />\n");
      out.write("        <meta name=\"author\" content=\"\" />\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://kit-pro.fontawesome.com/releases/v5.12.1/css/pro.min.css\">\n");
      out.write("        <!--Replace with your tailwind.css once created-->\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700\" rel=\"stylesheet\" />\n");
      out.write("        <!-- Define your gradient here - use online tools to find a gradient matching your branding-->\n");
      out.write("        <script src=\"https://cdn.tailwindcss.com\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <aside  class=\"relative flex flex-col top-0 left-0 w-14 hover:w-64 md:w-64 bg-blue-900 dark:bg-gray-900 h-full text-white transition-all duration-300 border-none z-10 sidebar\" aria-label=\"Sidebar\">\n");
      out.write("            <div class=\"relative flex-1 flex flex-col min-h-0 border-r border-gray-200 bg-white pt-0\">\n");
      out.write("                <div class=\"flex-1 flex flex-col pt-6 pb-4 overflow-y-auto\">\n");
      out.write("                    <div class=\"flex-1 px-3 bg-white divide-y space-y-1\">\n");
      out.write("                        <ul class=\"space-y-2 pb-2\">\n");
      out.write("                            <p class=\"uppercase text-xs text-gray-600 mb-4 tracking-wider\">Trang chủ</p>\n");
      out.write("\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"home.jsp\"  class=\"text-base text-gray-900 font-normal rounded-lg hover:bg-gray-100 flex items-center p-2 group \">\n");
      out.write("                                    <span class=\"w-6 h-6 text-gray-500 flex-shrink-0 group-hover:text-gray-900 transition duration-75\">\n");
      out.write("                                        <svg fill=\"currentColor\" stroke=\"currentColor\" viewBox=\"0 0 24 24\" xmlns=\"http://www.w3.org/2000/svg\"><path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6\"></path></svg>\n");
      out.write("                                    </span>\n");
      out.write("                                    <span class=\"ml-3 flex-1 whitespace-nowrap\">Trang chủ</span>\n");
      out.write("                                </a>\n");
      out.write("                            </li>\n");
      out.write("                            <p class=\"uppercase text-xs text-gray-600 mb-4 mt-4 tracking-wider\">Môn học</p>\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"subject.jsp\"  class=\"text-base text-gray-900 font-normal rounded-lg hover:bg-gray-100 flex items-center p-2 group \">\n");
      out.write("                                    <svg class=\"w-6 h-6 text-gray-500 flex-shrink-0 group-hover:text-gray-900 transition duration-75\" fill=\"currentColor\" viewBox=\"0 0 20 20\" xmlns=\"http://www.w3.org/2000/svg\">\n");
      out.write("                                    <path d=\"M8.707 7.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l2-2a1 1 0 00-1.414-1.414L11 7.586V3a1 1 0 10-2 0v4.586l-.293-.293z\"></path>\n");
      out.write("                                    <path d=\"M3 5a2 2 0 012-2h1a1 1 0 010 2H5v7h2l1 2h4l1-2h2V5h-1a1 1 0 110-2h1a2 2 0 012 2v10a2 2 0 01-2 2H5a2 2 0 01-2-2V5z\"></path>\n");
      out.write("                                    </svg>\n");
      out.write("                                    <span class=\"ml-3 flex-1 whitespace-nowrap\">Môn học</span>\n");
      out.write("                                </a>\n");
      out.write("                            </li>\n");
      out.write("                            <p class=\"uppercase text-xs text-gray-600 mb-4 mt-4 tracking-wider\">Bài kiểm tra</p>\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"testExam.jsp\" class=\"text-base text-gray-900 font-normal rounded-lg hover:bg-gray-100 flex items-center p-2 group \">\n");
      out.write("                                    <svg class=\"w-6 h-6 text-gray-500 flex-shrink-0 group-hover:text-gray-900 transition duration-75\" fill=\"currentColor\" viewBox=\"0 0 20 20\" xmlns=\"http://www.w3.org/2000/svg\">\n");
      out.write("                                    <path d=\"M9 2a1 1 0 000 2h2a1 1 0 100-2H9z\"></path>\n");
      out.write("                                    <path fill-rule=\"evenodd\" d=\"M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z\" clip-rule=\"evenodd\"></path>\n");
      out.write("                                    </svg>\n");
      out.write("                                    <span class=\"ml-3 flex-1 whitespace-nowrap\">Tạo đề kiểm tra</span>\n");
      out.write("                                </a>\n");
      out.write("                                <a href=\"Quiz.jsp\" class=\"text-base text-gray-900 font-normal rounded-lg hover:bg-gray-100 flex items-center p-2 group \">\n");
      out.write("                                    <svg class=\"w-6 h-6 text-gray-500 flex-shrink-0 group-hover:text-gray-900 transition duration-75\" fill=\"currentColor\" viewBox=\"0 0 20 20\" xmlns=\"http://www.w3.org/2000/svg\">\n");
      out.write("                                    <path d=\"M9 2a1 1 0 000 2h2a1 1 0 100-2H9z\"></path>\n");
      out.write("                                    <path fill-rule=\"evenodd\" d=\"M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z\" clip-rule=\"evenodd\"></path>\n");
      out.write("                                    </svg>\n");
      out.write("                                    <span class=\"ml-3 flex-1 whitespace-nowrap\">Thêm câu hỏi</span>\n");
      out.write("                                </a>\n");
      out.write("                                <a href=\"listTestExam.jsp\" class=\"text-base text-gray-900 font-normal rounded-lg hover:bg-gray-100 flex items-center p-2 group \">\n");
      out.write("                                    <svg class=\"w-6 h-6 text-gray-500 flex-shrink-0 group-hover:text-gray-900 transition duration-75\" fill=\"currentColor\" viewBox=\"0 0 20 20\" xmlns=\"http://www.w3.org/2000/svg\">\n");
      out.write("                                    <path d=\"M9 2a1 1 0 000 2h2a1 1 0 100-2H9z\"></path>\n");
      out.write("                                    <path fill-rule=\"evenodd\" d=\"M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z\" clip-rule=\"evenodd\"></path>\n");
      out.write("                                    </svg>\n");
      out.write("                                    <span class=\"ml-3 flex-1 whitespace-nowrap\">Danh sách bài kiểm tra</span>\n");
      out.write("                                </a>\n");
      out.write("                            </li>\n");
      out.write("                            <p class=\"uppercase text-xs text-gray-600 mb-4 mt-4 tracking-wider\">Danh sách tài khoản</p>\n");
      out.write("\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"accountManagerment.jsp\" class=\"text-base text-gray-900 font-normal rounded-lg hover:bg-gray-100 flex items-center p-2 group \">\n");
      out.write("                                    <svg class=\"w-6 h-6 text-gray-500 flex-shrink-0 group-hover:text-gray-900 transition duration-75\" fill=\"currentColor\" viewBox=\"0 0 20 20\" xmlns=\"http://www.w3.org/2000/svg\">\n");
      out.write("                                    <path d=\"M9 2a1 1 0 000 2h2a1 1 0 100-2H9z\"></path>\n");
      out.write("                                    <path fill-rule=\"evenodd\" d=\"M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z\" clip-rule=\"evenodd\"></path>\n");
      out.write("                                    </svg>\n");
      out.write("                                    <span class=\"ml-3 flex-1 whitespace-nowrap\">Danh sách tài khoản</span>\n");
      out.write("                                </a>\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("        </aside>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("  \n");
      out.write("            <!-- End aside -->\n");
      out.write("            <br>\n");
      out.write("            <div id=\"main-content\" class=\"h-full w-full relative h-full overflow-auto\">\n");
      out.write("                <main>\n");
      out.write("                    <div class=\"flex-1 p-6\">\n");
      out.write("                        <div class=\"col-span-8 card flex flex-col p-10 bg-white shadown-lg border-2\">\n");
      out.write("                            <h1 class=\"text-5xl mb-5\">Tạo đề thi</h1>\n");
      out.write("                            <form action=\"AddExamTestServlet\" method=\"post\" class=\"my-5\">\n");
      out.write("                                <div class=\"grid grid-cols-3 gap-4 my-5\">\n");
      out.write("                                    <label>\n");
      out.write("                                        <p class=\"font-medium text-slate-700 pb-2\">Tên môn học</p>\n");
      out.write("                                        <select name=\"subject\"\n");
      out.write("                                                ");
      if (_jspx_meth_c_forEach_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                                        </select>\n");
      out.write("                                    </label>\n");
      out.write("                                    <label>\n");
      out.write("                                        <p class=\"font-medium text-slate-700 pb-2\">Tên đề kiểm tra</p>\n");
      out.write("                                        <input type=\"text\" name=\"examName\" id=\"\" placeholder=\"nhập tên đề kiểm tra\"\n");
      out.write("                                               class=\"border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full\">\n");
      out.write("                                    </label>\n");
      out.write("                                    <label>\n");
      out.write("                                        <p class=\"font-medium text-slate-700 pb-2\">Mã đề</p>\n");
      out.write("                                        <input type=\"text\" name=\"examCode\" id=\"\" placeholder=\"abcd\"\n");
      out.write("                                               class=\"border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full\">\n");
      out.write("                                    </label>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"grid grid-cols-3 gap-4 my-5\">\n");
      out.write("                                    <label>\n");
      out.write("                                        <p class=\"font-medium text-slate-700 pb-2\">Thời gian làm bài</p>\n");
      out.write("                                        <input type=\"number\" name=\"examTime\" id=\"\" placeholder=\"45,60,75,...\"\n");
      out.write("                                               class=\"border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full\">\n");
      out.write("                                    </label>\n");
      out.write("                                    <label>\n");
      out.write("                                        <p class=\"font-medium text-slate-700 pb-2\">Ngày làm bài</p>\n");
      out.write("                                        <input type=\"date\" name=\"examDay\" id=\"userdate\" onchange=\"TDate()\"\n");
      out.write("                                               class=\"border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full\">\n");
      out.write("                                    </label>\n");
      out.write("                                    <label>\n");
      out.write("                                        <p class=\"font-medium text-slate-700 pb-2\">Nhập điểm tối đa</p>\n");
      out.write("                                        <input type=\"number\" name=\"score\" placeholder=\"10,20,40,...\"\n");
      out.write("                                               class=\"border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full\">\n");
      out.write("                                    </label>\n");
      out.write("                                </div>\n");
      out.write("                                <label>\n");
      out.write("                                    <p class=\"font-medium text-slate-700 pb-2\">Miêu tả</p>\n");
      out.write("                                    <textarea  name=\"examDesc\" placeholder=\"10,20,40,...\"\n");
      out.write("                                              class=\"border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full\"></textarea>\n");
      out.write("\n");
      out.write("                                </label>\n");
      out.write("\n");
      out.write("                                <input type=\"submit\" value=\"Thêm\"\n");
      out.write("                                       class=\"bg-cyan-50 w-full border border-cyan-300 text-cyan-900 text-sm rounded-lg p-4 focus:ring-blue-500 focus:border-blue-500 block p-2.5 dark:bg-cyan-700 dark:border-cyan-600 dark:placeholder-cyan-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 mt-5\">\n");
      out.write("                            </form>\n");
      out.write("                            <div class=\"mt-12\">\n");
      out.write("                                <div class=\"col-span-2 card flex flex-col\">\n");
      out.write("                                    <div class=\"overflow-x-auto\">\n");
      out.write("                                        <div class=\"w-full\">\n");
      out.write("                                            <table class=\"min-w-max w-full table-auto text-center\">\n");
      out.write("                                                <thead>\n");
      out.write("                                                    <tr class=\"bg-teal-500 sm:table-row rounded-l-lg sm:rounded-none mb-2 sm:mb-0 text-white\">\n");
      out.write("                                                        <th class=\"py-3 px-6\">Id</th>\n");
      out.write("                                                        <th class=\"py-3 px-6\">Tên môn học</th>\n");
      out.write("                                                        <th class=\"py-3 px-6\">Tên đề kiểm tra</th>\n");
      out.write("                                                        <th class=\"py-3 px-6\">Mã đề</th>\n");
      out.write("                                                        <th class=\"py-3 px-6\">Ngày làm bài</th>\n");
      out.write("                                                        <th class=\"py-3 px-6\">Actions</th>\n");
      out.write("                                                    </tr>\n");
      out.write("                                                </thead>\n");
      out.write("                                                <tbody class=\"text-gray-600 text-sm font-light\">\n");
      out.write("                                                    ");
      //  c:forEach
      org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_1 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
      _jspx_th_c_forEach_1.setPageContext(_jspx_page_context);
      _jspx_th_c_forEach_1.setParent(null);
      _jspx_th_c_forEach_1.setVar("tempExam");
      _jspx_th_c_forEach_1.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${EXAM_LIST}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
      int[] _jspx_push_body_count_c_forEach_1 = new int[] { 0 };
      try {
        int _jspx_eval_c_forEach_1 = _jspx_th_c_forEach_1.doStartTag();
        if (_jspx_eval_c_forEach_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\n");
            out.write("                                                        <tr class=\"border-b border-gray-200 hover:bg-gray-100\">\n");
            out.write("                                                            <td>");
            out.print(id);
            out.write("</td>\n");
            out.write("                                                            <td class=\"td-exam__name\">");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${tempExam.examName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
            out.write("</td>\n");
            out.write("                                                            <td>");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${tempExam.subjectId}", java.lang.String.class, (PageContext)_jspx_page_context, null));
            out.write("</td>\n");
            out.write("                                                            <td>");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${tempExam.examCode}", java.lang.String.class, (PageContext)_jspx_page_context, null));
            out.write("</td>\n");
            out.write("                                                            <td>");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${tempExam.examDay}", java.lang.String.class, (PageContext)_jspx_page_context, null));
            out.write("</td>\n");
            out.write("                                                            <td class=\"py-3 px-6 text-center\">\n");
            out.write("                                                                <div class=\"flex item-center justify-center\">\n");
            out.write("                                                                    <a href=\"editExamTest.jsp?id=");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${tempExam.examId}", java.lang.String.class, (PageContext)_jspx_page_context, null));
            out.write("\">\n");
            out.write("                                                                        <div class=\"w-4 mr-2 transform hover:text-purple-500 hover:scale-110\">\n");
            out.write("                                                                            <svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"none\" viewBox=\"0 0 24 24\"\n");
            out.write("                                                                                 stroke=\"currentColor\">\n");
            out.write("                                                                            <path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\"\n");
            out.write("                                                                                  d=\"M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z\" />\n");
            out.write("                                                                            </svg>\n");
            out.write("                                                                        </div>\n");
            out.write("                                                                    </a> \n");
            out.write("                                                                    <a href=\"DeleteSubjectsServlet?id=");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${tempExam.examId}", java.lang.String.class, (PageContext)_jspx_page_context, null));
            out.write("\">\n");
            out.write("                                                                        <div class=\"w-4 mr-2 transform hover:text-purple-500 hover:scale-110\">\n");
            out.write("                                                                            <svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"none\" viewBox=\"0 0 24 24\"\n");
            out.write("                                                                                 stroke=\"currentColor\">\n");
            out.write("                                                                            <path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\"\n");
            out.write("                                                                                  d=\"M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16\" />\n");
            out.write("                                                                            </svg>\n");
            out.write("                                                                        </div>\n");
            out.write("                                                                    </a>\n");
            out.write("                                                            </td>\n");
            out.write("                                                        </tr>\n");
            out.write("                                                        ");
id++;
            out.write("\n");
            out.write("                                                    ");
            int evalDoAfterBody = _jspx_th_c_forEach_1.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_c_forEach_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return;
        }
      } catch (Throwable _jspx_exception) {
        while (_jspx_push_body_count_c_forEach_1[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_c_forEach_1.doCatch(_jspx_exception);
      } finally {
        _jspx_th_c_forEach_1.doFinally();
        _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_1);
      }
      out.write("\n");
      out.write("                                                </tbody>\n");
      out.write("                                            </table>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </main>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <script>\n");
      out.write("            function TDate() {\n");
      out.write("                var UserDate = document.getElementById(\"userdate\").value;\n");
      out.write("                var ToDate = new Date();\n");
      out.write("\n");
      out.write("                if (new Date(UserDate).getTime() <= ToDate.getTime()) {\n");
      out.write("                    alert(\"The Date must be Bigger or Equal to today date\");\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("                return true;\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_forEach_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_0.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_0.setParent(null);
    _jspx_th_c_forEach_0.setVar("tempSubject");
    _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${SUBJECT_LIST}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
      if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                                                    class=\"border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full\">\n");
          out.write("                                                    <option  value=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${tempSubject.subjectId}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write('"');
          out.write('>');
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${tempSubject.subjectName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</option>\n");
          out.write("                                                ");
          int evalDoAfterBody = _jspx_th_c_forEach_0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_0.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_0);
    }
    return false;
  }
}
