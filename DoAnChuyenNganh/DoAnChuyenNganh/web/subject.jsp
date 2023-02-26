<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ConnectionPro"%>
<%@page import="DAO.UserDatabase"%>
<%@page import="Model.Subject"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%
    UserDatabase subjectData = new UserDatabase(ConnectionPro.getConnection());
    List<Subject> subject = subjectData.getAllsubjects();
    request.setAttribute("SUBJECT_LIST", subject);
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
    <body class="bg-gray-100">
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
                            <h1 class="text-5xl">Thêm môn học</h1>
                            <div class="lg:flex w-full mt-8">
                                <div class="p-10 lg:w-1/3 border rounded-sm mx-5 bg-white">
                                    <form action="AddSubjectsServlet" method="post">
                                        <div class="flex flex-col space-y-5">
                                            <label>
                                                <input type="text" name="subjectName" id="" required placeholder="Toán, Văn, Sử,..."
                                                       class="w-full px-4 py-3 border rounded-lg">
                                            </label>
                                            <input type="submit" value="Thêm"
                                                   class="w-full px-4 py-3 border rounded-lg bg-teal-500 hover:bg-teal-600 cursor-pointer text-white">
                                        </div>
                                    </form>
                                </div>

                                <div class="lg:w-2/3 mx-5 mt-12">
                                    <div class="col-span-2 card flex flex-col">
                                        <div class="overflow-x-auto w-full border shadown-lg rounded-md">
                                            <table class="min-w-max w-full table-auto text-center bg-white">
                                                <thead>
                                                    <tr class="bg-teal-500 sm:table-row rounded-l-lg sm:rounded-none mb-2 sm:mb-0 text-white">
                                                        <th class="py-3 px-6">Id</th>
                                                        <th class="py-3 px-6">Tên môn học</th>
                                                        <th class="py-3 px-6">Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="text-gray-600 text-sm font-light">
                                                    <c:forEach var="tempSubject" items="${SUBJECT_LIST}">
                                                        <tr class="border-b border-gray-200 hover:bg-gray-100">
                                                            <td><%=id%></td>
                                                            <td>${tempSubject.subjectName}</td>
                                                            <td class="py-3 px-6 text-center">
                                                                <div class="flex item-center justify-center">
                                                                    <a href="editSubject.jsp?id=${tempSubject.subjectId}">
                                                                        <div class="w-4 mr-2 transform hover:text-purple-500 hover:scale-110">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                                                                 stroke="currentColor">
                                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                                                  d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                                                            </svg>
                                                                        </div>
                                                                    </a> 
                                                                    <a href="DeleteSubjectsServlet?id=${tempSubject.subjectId}">
                                                                        <div class="w-4 mr-2 transform hover:text-purple-500 hover:scale-110">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                                                                 stroke="currentColor">
                                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                                                  d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                                                            </svg>
                                                                        </div>
                                                                    </a>
                                                            </td>
                                                        </tr>
                                                        <%id++;%>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>
