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
    <%
        int id = Integer.parseInt(request.getParameter("id"));
        UserDatabase bkd = new UserDatabase(ConnectionPro.getConnection());
        User bk = bkd.getSingleaccount(id);
        request.setAttribute("edit_account", bk);
    %>
    <body>
        <!-- Start nav -->
        <%@ include file="layout/header.jsp" %>  
        <!-- End nav -->

        <div class="flex overflow-hidden bg-white h-screen pt-14">

            <!-- Start aside -->
            <%@ include file="layout/aside.jsp" %>  
            <!-- End aside -->
            <div id="main-content" class="h-full w-full relative overflow-y-auto">
                <main>
                    <h1 class="text-5xl p-10">Thông tin chi tiết </h1>
                    <div class="px-4 mb-10"> 
                        <!-- This is an example component -->
                        <div class="h-full">
                            <form action="EditAccountServlet" method="post">
                                <div class="border-b-2 block lg:flex mt-12">
                                    <div class="w-full lg:w-2/5 p-4 sm:p-6 lg:p-8 bg-white shadow-md">
                                        <div class="flex justify-between">
                                            <span class="text-xl font-semibold block">Profile</span>
                                            <button type="submit" class="px-8 py-3 text-white bg-teal-600 mb-4 hover:bg-teal-500 border rounded-md">
                                                Lưu
                                            </button>
                                        </div>


                                        <span class="text-gray-600">This information is secret so be careful</span>
                                        <div class="w-full p-8 mx-2 flex justify-center">
                                            <img id="showImage" class="max-w-xs w-64 items-center border" src="images/${edit_account.thumb}" alt="">                          
                                        </div>
                                    </div>
                                    <div class="w-full lg:w-3/5 p-8 bg-white lg:ml-4 shadow-md">
                                        <div class="rounded  shadow p-6">
                                            <div class="md:flex justify-between">
                                                <div class="pb-6 w-full md:mr-4">
                                                    <label class="font-semibold text-gray-700 block pb-1">Role</label>
                                                    <select name="roleId" class="border-1 border bg-gray-50 rounded-r px-4 py-2 w-full">
                                                        <option selected value="1">Admin</option>
                                                        <option value="2">Student</option>
                                                    </select>
                                                </div>
                                                <div class="pb-6 w-full md:ml-4">
                                                    <label class="font-semibold text-gray-700 block pb-1">Họ và tên</label>
                                                    <div class="flex">
                                                        <input type="text" name="fullname" class="border-1 border bg-gray-50 rounded-r px-4 py-2 w-full"
                                                               value = "${edit_account.fullname }">
                                                    </div>
                                                </div>
                                                <div class="pb-6 w-full md:ml-4">
                                                    <label class="font-semibold text-gray-700 block pb-1">Id</label>
                                                    <div class="flex">
                                                        <input type="text" name="id" class="border-1 border bg-gray-50 rounded-r px-4 py-2 w-full"
                                                               value = "${edit_account.id }">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="md:flex justify-between">
                                                <div class="pb-6 w-full md:mr-4">
                                                    <label class="font-semibold text-gray-700 block pb-1">Email</label>
                                                    <div class="flex">
                                                        <input type="email" name="email" class="border-1 border bg-gray-50 rounded-r px-4 py-2 w-full" 
                                                               value = "${edit_account.email }">
                                                    </div>
                                                </div>
                                                <div class="pb-6 w-full md:ml-4">
                                                    <label class="font-semibold text-gray-700 block pb-1">Giới tính</label>
                                                    <select name="gioiTinh" class="border-1 border bg-gray-50 rounded-r px-4 py-2 w-full">
                                                        <option selected value="Male">Nam</option>
                                                        <option value="Female">Nữ</option>
                                                        <option value="I prefer not to say">Không tiết lộ</option>
                                                    </select>
                                                </div>
                                                <div class="pb-6 w-full md:ml-4">
                                                    <label class="font-semibold text-gray-700 block pb-1">Tuổi</label>
                                                    <div class="flex">
                                                        <input type="text" name="tuoi" class="border-1 border bg-gray-50 rounded-r px-4 py-2 w-full"
                                                               value = "${edit_account.tuoi }">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="md:flex justify-between">

                                                <div class="pb-6 w-full md:mr-4">
                                                    <label class="font-semibold text-gray-700 block pb-1">Địa chỉ</label>
                                                    <div class="flex">
                                                        <input type="text" name="diaChi" class="border-1 border bg-gray-50 rounded-r px-4 py-2 w-full" 
                                                               value = "${edit_account.diaChi }">
                                                    </div>
                                                </div>
                                                <div class="pb-6 w-full md:ml-4">
                                                    <label class="font-semibold text-gray-700 block pb-1">Số điện thoại</label>
                                                    <div class="flex">
                                                        <input type="text" name="sdt" class="border-1 border bg-gray-50 rounded-r px-4 py-2 w-full" 
                                                               value = "${edit_account.sdt }">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script async defer src="https://buttons.github.io/buttons.js"></script>
        <script src="https://demo.themesberg.com/windster/app.bundle.js"></script>