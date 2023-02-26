<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.User"%>
<%@page import="DAO.UserDatabase"%>
<%@page import="DAO.ConnectionPro"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<% //In case, if Admin session is not set, redirect to Login page
    if ((request.getSession(false).getAttribute("Admin") == null)) {
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%} %>
<%-- 
    Document   : header.jsp
    Created on : Nov 10, 2022, 10:10:27 AM
    Author     : ADMIN
--%>

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
        <!--Replace with your tailwind.css once created-->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700" rel="stylesheet" />
        <!-- Define your gradient here - use online tools to find a gradient matching your branding-->
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <style>
        .dropdown:hover .dropdown-menu {
            display: block;
        }

    </style>

    <body>
        <nav class="bg-white border-b border-gray-200 z-30 w-full fixed top-0">
            <div class="px-3 py-3 lg:px-5 lg:pl-3 relative">
                <div class="flex items-center justify-between">
                    <div class="flex items-center justify-start">
                        <a href="home.jsp" class="text-xl font-bold flex items-center lg:ml-2.5">
                            <img src="https://demo.themesberg.com/windster/images/logo.svg" class="h-6 mr-2" alt="Windster Logo">
                            <span class="self-center whitespace-nowrap">Windster</span>
                        </a>
                        <a href="home.jsp"></a>
                    </div>


                    <div class="dropdown inline-block relative">
                        <button class="menu-btn focus:outline-none focus:shadow-outline flex flex-wrap items-center">
                            <div class="w-8 h-8 overflow-hidden rounded-full">
                                <%
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
                                    <%=session.getAttribute("Admin")%>

                                </h1>
                                <i class="fad fa-chevron-down ml-2 text-xs leading-none"></i>
                            </div>
                        </button>
                        <ul class="dropdown-menu absolute hidden text-gray-700 bg-white shadown-lg w-full border rounded">
                            <li class="">
                                <a href="profileAdmin.jsp" class="px-2 border-b py-2 block capitalize font-medium text-sm tracking-wide bg-white hover:bg-gray-200 hover:text-gray-900 transition-all duration-300 ease-in-out" href="#">
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
    </body>
</html>
