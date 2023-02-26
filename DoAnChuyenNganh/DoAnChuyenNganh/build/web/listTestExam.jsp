<%@page import="Model.Exam"%>
<%@page import="java.util.List"%>
<%@page import="Model.Subject"%>
<%@page import="Model.Subject"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
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
    <style>
        .td-exam__desc,.td-exam__name {
            display: inline-block;
            width: 180px;
            white-space: nowrap;
            overflow: hidden !important;
            text-overflow: ellipsis;
            padding-top:10px;
        }
    </style>
    <body>
        <!-- Start nav -->
        <%@ include file="layout/header.jsp" %>  
        <!-- End nav -->
        <div class="flex overflow-hidden bg-white h-screen pt-14">
            <!-- Start aside -->
            <%@ include file="layout/aside.jsp" %>  
            <!-- End aside -->
            <div class="bg-gray-900 opacity-50 hidden fixed inset-0 z-10" id="sidebarBackdrop"></div>
            <div id="main-content" class="h-full w-full bg-gray-50 relative overflow-y-auto ">
                <main>
                    <div class="p-6 overflow-auto">
                        <h1 class="text-5xl mb-5">Danh sách đề thi</h1>
                        <form action="" method="get">
                            <label class="flex w-full item-center text-center items-center">
                                <p class="font-medium text-slate-700 pb-2 mr-5">Tìm kiếm</p>
                                <div class="relative w-1/2">
                                    <span class="absolute inset-y-0 right-5 flex items-center pl-3"><svg class="w-5 h-5 text-gray-500" viewBox="0 0 24 24" fill="none"><path d="M21 21L15 15M17 10C17 13.866 13.866 17 10 17C6.13401 17 3 13.866 3 10C3 6.13401 6.13401 3 10 3C13.866 3 17 6.13401 17 10Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path></svg></span>
                                    <input type="text" name="search" placeholder="Tìm kiếm..." 
                                           class="border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full">
                                </div>
                            </label>
                        </form>

                        <div class="overflow-x-auto mt-10 col-span-2 card flex flex-col">
                            <table class="min-w-max w-full table-auto text-center border shadow-lg rounded-md bg-white">
                                <thead>
                                    <tr class="bg-teal-500 sm:table-row rounded-l-lg sm:rounded-none mb-2 sm:mb-0 text-white">
                                        <th class="p-3">Id</th>
                                        <th class="p-3">Tên môn học</th>
                                        <th class="p-3">Tên đề kiểm tra</th>
                                        <th class="p-3">Mã đề</th>
                                        <th class="p-3">Ngày làm bài</th>
                                        <th class="p-3">Thời gian làm bài</th>
                                        <th class="p-3">Miêu tả</th>
                                        <th class="p-3">Nhập điểm tối đa</th>
                                        <th class="p-3">Actions</th>
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

                                            String query = request.getParameter("search");
                                            String data;

                                            if (query != null) {
                                                data = "SELECT * from subjects INNER JOIN exam ON subjects.subjectId=exam.subjectId where examName like '%" + query + "%' or examCode like'%" + query + "%' or subjectName like'%" + query + "%'";
                                            } else {
                                                data = "SELECT * from subjects INNER JOIN exam ON subjects.subjectId=exam.subjectId";
                                            }

                                            ResultSet rs = stmt.executeQuery(data);

                                            while (rs.next()) {

                                    %>

                                    <tr class="border-b border-gray-200 hover:bg-gray-100">
                                        <td><%=id%></td>
                                        <td>
                                            <%out.println(rs.getString("subjectName")); %>
                                        </td>
                                        <td class="td-exam__name">
                                            <%out.println(rs.getString("examName")); %>
                                        </td>
                                        <td><%out.println(rs.getString("examCode")); %></td>
                                        <td><%out.println(rs.getString("examDay")); %></td>
                                        <td><%out.println(rs.getString("examTime")); %></td>
                                        <td class="td-exam__desc">
                                            <%out.println(rs.getString("examDesc")); %>
                                        </td>
                                        <td><%out.println(rs.getString("score")); %></td>

                                        <td class="py-3 text-center">
                                            <div class="flex item-center justify-center">
                                                <a href="detailExam.jsp?id=<%out.println(rs.getString("examId")); %> ">
                                                    <div class="w-4 mr-2 transform hover:text-purple-500 hover:scale-110">
                                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
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

                </main>
            </div>
        </div>

    </body>
</html>
