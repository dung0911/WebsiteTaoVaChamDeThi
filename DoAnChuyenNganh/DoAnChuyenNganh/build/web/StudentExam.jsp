<%@page import="Model.Exam"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ConnectionPro"%>
<%@page import="DAO.UserDatabase"%>
<%@page import="Model.Subject"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%
    response.setContentType("text/html; charset=UTF-8");
    request.setCharacterEncoding("UTF-8");

    UserDatabase subjectData = new UserDatabase(ConnectionPro.getConnection());

    List<Exam> exam = subjectData.getAllExams();
    request.setAttribute("EXAM_LIST", exam);

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
        <%@ include file="layout/userNavigation.jsp" %>  
        <div id="main-content" class="h-full w-full bg-gray-50 relative overflow-y-auto min-h-full">
            <main class="p-6">
                <!-- strat content -->
                <h3 class="text-4xl text-black text-sm font-bold font-sans">Danh sách đề kiểm tra</h3>
                <div class="overflow-x-auto">
                    <div class="mt-12">
                        <div class="col-span-2 card flex flex-col">
                            <div class="overflow-x-auto">
                                <div class="w-full">
                                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-7 xl:grid-cols-4">
                                        <c:forEach var="tempExam" items="${EXAM_LIST}">
                                            <a href="StudentStartExam.jsp?id=${tempExam.examId}">
                                                <div class="rounded rounded-t-lg overflow-hidden shadow my-3">
                                                    <img src="images/unit-3-what-do-you-study.jpg" alt="" class="w-full">
                                                    <div class="flex justify-center -mt-8">
                                                        <img src="images/books.png" alt="" class="rounded-full border-solid border-white border-2 -mt-3 w-1/2">
                                                    </div>
                                                    <img src="" alt=""/>
                                                    <div class="text-center px-3 pb-6 pt-2">
                                                        <h3 class="text-black text-md font-bold font-sans">${tempExam.examName}</h3>
                                                    </div>
                                                    <div class="flex justify-center pb-3 text-grey-dark">
                                                        <div class="text-center mr-3 border-r pr-3">
                                                            <h2>Thời gian: ${tempExam.examTime}</h2>
                                                            <span>Điểm: ${tempExam.score}</span>
                                                        </div>
                                                        <div class="text-center">
                                                            <h2>Ngày làm: ${tempExam.examDay}</h2>
                                                            <span>Mã đề: ${tempExam.examCode}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </c:forEach>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <%@ include file="layout/userFooterHomePage.jsp" %>  
    </body>
</html>
