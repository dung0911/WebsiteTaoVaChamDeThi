<%@page import="Model.Results"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ConnectionPro"%>
<%@page import="DAO.UserDatabase"%>
<%@page import="Model.Subject"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%
    int id = 1;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>
            Quản lý đề thi
        </title>
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://kit-pro.fontawesome.com/releases/v5.12.1/css/pro.min.css">
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700" rel="stylesheet" />
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <!-- Start nav -->
        <%@ include file="layout/header.jsp" %>  
        <!-- End nav -->

        <div class="flex overflow-hidden h-screen pt-14">

            <!-- Start aside -->
            <%@ include file="layout/aside.jsp" %>  
            <!-- End aside -->

            <div class="bg-gray-900 opacity-50 hidden fixed inset-0 z-10" id="sidebarBackdrop"></div>
            <div id="main-content" class="h-full w-full bg-gray-50 relative overflow-y-auto ">
                <main>
                    <!-- strat content -->
                    <div class="flex-1">
                        <div class="col-span-6 card flex flex-col p-10">
                            <h1 class="text-5xl">Danh sách kết quả</h1>

                            <div class="w-full mx-5 mt-12 overflow-auto">
                                <div class="col-span-2 card flex flex-col text-center">
                                    <table class="min-w-max w-full table-auto shadow-md border rounded-md bg-white">
                                        <thead>
                                            <tr class="bg-teal-500 sm:table-row rounded-l-lg sm:rounded-none mb-2 sm:mb-0 text-white">
                                                <th class="py-3 px-6">Id</th>
                                                <th class="py-3 px-6">Môn</th>
                                                <th class="py-3 px-6">Đề thi</th>
                                                <th class="py-3 px-6">Số câu đúng</th>
                                                <th class="py-3 px-6">điểm</th>
                                                <th class="py-3 px-6">Ngày làm</th>
                                                <th class="py-3 px-6">Người làm</th>
                                                <th class="py-3 px-6">email</th>
                                                <th class="py-3 px-6">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-gray-600 text-sm font-light">
                                            <%try {
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    String url = "jdbc:mysql://localhost:3306/quanlydethi";
                                                    String username = "root";
                                                    String password = "";

                                                    Connection conn = DriverManager.getConnection(url, username, password);
                                                    Statement stmt = conn.createStatement();

                                                    String query = "SELECT * FROM results s INNER JOIN exam AS ci ON ci.examId = s.examId LEFT JOIN subjects cu ON cu.subjectId = ci.subjectId;";
                                                    ResultSet rs = stmt.executeQuery(query);

                                                    while (rs.next()) {

                                            %>
                                            <tr class="border-b border-gray-200 hover:bg-gray-100">
                                                <td><%=id%></td>
                                                <td><%out.println(rs.getString("subjectName")); %></td>
                                                <td class="truncate w-36 block pt-3"><%out.println(rs.getString("examName")); %></td>
                                                <td><%out.println(rs.getString("soCauDung")); %></td>
                                                <td><%out.println(rs.getString("diem")); %> điểm</td>
                                                <td><%out.println(rs.getString("ngayLam")); %></td>
                                                <td><%out.println(rs.getString("nguoiLam")); %></td>
                                                <td><%out.println(rs.getString("email")); %></td>
                                                <td class="py-3 px-6 text-center">
                                                    <div class="flex item-center justify-center">
                                                        <a href="DeleteResultServlet?id=<%out.println(rs.getString("ketQuaId")); %>">
                                                            <div class="w-4 mr-2 transform hover:text-purple-500 hover:scale-110">
                                                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                                                     stroke="currentColor">
                                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                                      d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                                                </svg>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <%id++;%>
                                            <%
                                                    }
                                                    rs.close();
                                                    stmt.close();
                                                    conn.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>
