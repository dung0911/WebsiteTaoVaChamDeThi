<%@page import="DAO.UserDatabase"%>
<%@page import="Model.Subject"%>
<%@page import="DAO.ConnectionPro"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    UserDatabase bkd = new UserDatabase(ConnectionPro.getConnection());
    Subject bk = bkd.getSinglesubject(id);
    request.setAttribute("edit_books", bk);
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
    <style>
        .dropdown:hover .dropdown-menu {
            display: block;
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

            <div class="bg-gray-900 opacity-50 hidden fixed inset-0 z-10 " id="sidebarBackdrop"></div>
                <div class="grid w-full place-items-center relative">
                    <div class="">
                        <h1 class="text-5xl pb-10">Chỉnh sửa môn học</h1>
                        <form action="EditSubjectsServlet" method="post">
                            <div class="my-4">
                                <input class="w-full  px-4 py-3 rounded-lg border-2 border-black"
                                       name="subjectId"
                                       value="${edit_books.subjectId }" 
                                       required>
                            </div>
                            <div class="my-4">
                                <input class="w-full  px-4 py-3 rounded-lg border-2 border-black" 
                                       name="subjectName" 
                                       value="${edit_books.subjectName }" 
                                       required>
                            </div>

                            <div class="flex justify-between">
                                <button type="submit" 
                                        class="w-full text-white bg-teal-600 hover:bg-teal-500 px-4 py-3 mx-4 rounded-lg border-2 border-black">
                                    Submit</button>
                                <button  
                                    class="w-full px-4 py-3 mx-4 bg-rose-600 text-white hover:bg-rose-500 rounded-lg border-2 border-black">
                                    <a href="subject.jsp">Cancel</a>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
        </div>
    </body>
</html>