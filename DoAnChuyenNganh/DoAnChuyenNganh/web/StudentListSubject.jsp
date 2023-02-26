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
    <body style=" text-align:center;display:grid;grid-template-rows: auto 1fr auto;min-height:100vh;">
        <%@ include file="layout/userNavigation.jsp" %>  
        <div id="main-content" class="h-full w-full bg-gray-50 relative overflow-y-auto">
            <main>
                <!-- strat content -->
                <h3 class="text-4xl text-black text-sm font-bold font-sans p-6 text-center">Danh sách môn học</h3>

                <div class="overflow-x-auto p-6">
                    <div class="w-full grid grid-cols-1 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-5">
                        <c:forEach var="tempSubject" items="${SUBJECT_LIST}">
                            <a href="StudentListExamBySubject.jsp?id=${tempSubject.subjectId}">
                                <div class="rounded rounded-t-lg overflow-hidden shadow my-3">
                                    <img src="images/books.png" alt="" class="w-full">
                                    <div class="text-center px-3 pb-6 pt-2">
                                        <h3 class="text-2xl text-black text-sm bold font-sans">${tempSubject.subjectName}</h3>
                                    </div>
                                </div>
                            </a>

                        </c:forEach>
                    </div>
                </div>
            </main>
        </div>
        <%@ include file="layout/userFooterHomePage.jsp" %>  

    </body>
</html>
