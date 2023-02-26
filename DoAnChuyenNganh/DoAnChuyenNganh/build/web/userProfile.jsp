<%@page import="java.util.Enumeration"%>
<%@page import="javax.websocket.Session"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@page import="DAO.UserDatabase"%>
<%@page import="Model.User"%>
<%@page import="DAO.ConnectionPro"%>

<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
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
        <!--Replace with your tailwind.css once created-->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700" rel="stylesheet" />
        <!-- Define your gradient here - use online tools to find a gradient matching your branding-->
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <!-- Start nav -->
        <%@ include file="layout/userNavigation.jsp" %>  
        <!-- End nav -->

        <main>
            <div class="lg:p-4 mb-5"> 
                <h1 class="text-5xl p-10">Thông tin chi tiết </h1>

                <!-- This is an example component -->

                <form action="editProfileStudent"method="post" enctype="multipart/form-data"></form>
                <div class="lg:flex items-stretch  justify-center px-8">
                    <div class="flex-1 w-full lg:w-3/5 p-4 sm:p-6 lg:p-6 bg-white shadow-md">
                        <div class="flex justify-between items-center justify-center overflow-auto">
                            <span class="text-xl font-semibold block">Admin Profile</span>
                            <a  href="editProfileStudent.jsp?id=<%= user.getId()%>" class="px-4 py-3 text-white bg-teal-600 mb-4 hover:bg-teal-500 border rounded-md">Chỉnh sửa</a>
                        </div>

                        <span class="text-gray-600">This information is secret so be careful</span>
                        <div class="w-full p-8 mx-2 flex justify-center">
                            <img id="showImage" class="max-w-xs w-64 items-center border" src="images/<%= user.getThumb()%>" alt="">                          
                        </div>
                    </div>
                    <div class="flex-1 w-full lg:w-4/6 p-4 bg-white lg:ml-4 shadow-md">
                        <div class="md:flex justify-between">
                            <div class="pb-6 w-full md:mr-2">
                                <label for="name" class="font-semibold text-gray-700 block pb-1">Email</label>
                                <div class="flex">
                                    <span class="border-1 border bg-gray-50 rounded-r px-4 py-2 w-full">
                                        <%= user.getEmail()%> 
                                    </span>
                                </div>
                            </div>

                            <div class="pb-6 w-full md:ml-2">
                                <label for="name" class="font-semibold text-gray-700 block pb-1">Phân quyền</label>
                                <div class="flex">
                                    <span class="border-1 border bg-gray-50 rounded-r px-4 py-2 w-full">
                                        <%
                                            if (user.getRoleId() == 1) {
                                                out.println("Admin");
                                            } else {
                                                out.println("Student");
                                            }
                                        %>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="md:flex justify-between">
                            <div class="pb-6 w-full md:mr-2">
                                <label for="name" class="font-semibold text-gray-700 block pb-1">Họ và tên</label>
                                <div class="flex">
                                    <span class="border-1 border bg-gray-50 rounded-r px-4 py-2 w-full">
                                        <%= user.getFullname()%> 
                                    </span>
                                </div>
                            </div>
                            <div class="pb-6 w-full md:mx-2">
                                <label for="name" class="font-semibold text-gray-700 block pb-1">Giới tính</label>
                                <div class="flex">
                                    <span class="border-1 border bg-gray-50 rounded-r px-4 py-2 w-full">
                                        <%= user.getGioiTinh()%>
                                    </span>
                                </div>
                            </div>
                            <div class="pb-6 w-full md:ml-2">
                                <label for="name" class="font-semibold text-gray-700 block pb-1">Tuổi</label>
                                <div class="flex">
                                    <span class="border-1 border bg-gray-50 rounded-r px-4 py-2 w-full">
                                        <%= user.getTuoi()%>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="md:flex justify-between">
                            <div class="pb-6 w-full md:mr-2">
                                <label for="name" class="font-semibold text-gray-700 block pb-1">Địa chỉ</label>
                                <div class="flex">
                                    <span class="border-1 border bg-gray-50 rounded-r px-4 py-2 w-full">
                                        <%= user.getDiaChi()%>
                                    </span>
                                </div>
                            </div>
                            <div class="pb-6 w-full md:ml-2">
                                <label for="name" class="font-semibold text-gray-700 block pb-1">Số điện thoại</label>
                                <div class="flex">
                                    <span class="border-1 border bg-gray-50 rounded-r px-4 py-2 w-full">
                                        <%= user.getSdt()%>
                                    </span>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </main>
        <%@ include file="layout/userFooterHomePage.jsp" %>  

    </body>
</html>