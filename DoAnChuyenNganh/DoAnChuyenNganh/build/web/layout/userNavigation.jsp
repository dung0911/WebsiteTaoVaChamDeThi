<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <style>
        .dropdown:hover .dropdown-menu {
            display: block;
        }

    </style>
    <body>
        <nav class="flex items-center justify-between flex-wrap py-3 px-6 sticky top-0 z-1 bg-white shadown-lg border-b-2 z-50">

            <div class="flex items-center flex-shrink-0 text-dark md:text-right mr-6">
                <span class="font-semibold text-xl tracking-tight hover:text-green-800"><a href="./userHome.jsp">Đề thi online</a></span>
            </div>
            <div class="block lg:hidden">
                <button id="nav-toggle" class="flex items-center px-3 py-2 border rounded text-gray-500 border-gray-600 hover:text-gray-800 hover:border-teal-500 appearance-none focus:outline-none">
                    <svg class="fill-current h-3 w-3" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                    <title>Menu</title>
                    <path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z"/>
                    </svg>
                </button>
            </div>

            <div id="nav-content" class="w-full flex-grow lg:flex lg:items-center lg:w-auto hidden lg:block pt-6 lg:pt-0 md:text-right">
                <div class='hidden lg:block'>
                    <a href="StudentExam.jsp" class='px-2 hover:bg-gray-200 rounded py-3 mx-2'>Đề kiểm tra</a>
                    <a href="StudentListSubject.jsp" class='px-2 hover:bg-gray-200 rounded py-3 mx-2'>Danh sách môn học</a> 
                </div>

                <nav class='lg:hidden'>
                    <ul class='w-full text-left'>
                        <li>
                            <a href="StudentExam.jsp" class='px-2 hover:bg-gray-200 rounded py-3 mx-2'>Đề kiểm tra</a>
                        </li>
                        <li>
                            <a href="StudentListSubject.jsp" class='px-2 hover:bg-gray-200 rounded py-3 mx-2'>Danh sách môn học</a>
                        </li>
                        <li>
                            <a  href="userProfile.jsp" class='px-2 hover:bg-gray-200 rounded py-3 mx-2'>Tài khoản của tôi</a>
                        </li>
                        <li>
                            <a href="LogoutServlet" class='px-2 hover:bg-gray-200 rounded py-3 mx-2'>Đăng xuất</a>
                        </li>
                    </ul>
                </nav>

                <div class="text-sm lg:flex-grow items-center hidden lg:block">

                    <div class="dropdown inline-block relative">
                        <button class="menu-btn focus:outline-none focus:shadow-outline flex flex-wrap items-center">
                            <div class="w-8 h-8 overflow-hidden rounded-full">
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        String url = "jdbc:mysql://localhost:3306/dbsignin";
                                        String username = "root";
                                        String password = "";
                                        String query = "select * from accounts";
                                        Connection conn = DriverManager.getConnection(url, username, password);
                                        Statement stmt = conn.createStatement();
                                        ResultSet rs = stmt.executeQuery(query);
                                        while (rs.next()) {
                                %>
                                <img id="showImage" class="items-center border w-8 h-8" src="images/<% out.println(rs.getString("thumb"));%>" alt="">                          
                                <%       rs.close();
                                            stmt.close();
                                            conn.close();
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </div>
                            <div class="ml-2 capitalize flex ">
                                <h1 class="text-sm text-gray-800 font-semibold m-0 p-0 leading-none w-full">
                                    <%=session.getAttribute("Student")%>
                                </h1>
                                <i class="fad fa-chevron-down ml-2 text-xs leading-none"></i>
                            </div>
                        </button>
                        <ul class="dropdown-menu absolute hidden text-gray-700 bg-white shadown-lg w-full border rounded">
                            <li class="">
                                <a href="userProfile.jsp" class="px-2 border-b py-2 block capitalize font-medium text-sm tracking-wide bg-white hover:bg-gray-200 hover:text-gray-900 transition-all duration-300 ease-in-out" href="#">
                                    My Account</a>
                            </li>
                            <li class="">
                                <a href="LogoutServlet" class="px-2 py-2 block capitalize font-medium text-sm tracking-wide bg-white hover:bg-gray-200 hover:text-gray-900 transition-all duration-300 ease-in-out" href="#">
                                    Logout</a>
                            </li>
                        </ul>

                    </div>
                </div>
            </div>

        </nav>
        <script>
            // javascript to toggle the menu
            document.getElementById('nav-toggle').onclick = function () {
                document.getElementById("nav-content").classList.toggle("hidden");
            }
        </script>
    </body>
</html>
