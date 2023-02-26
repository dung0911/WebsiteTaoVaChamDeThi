<%@page import="java.util.ArrayList"%>
<%@page import="Model.Quiz"%>
<%@page import="Model.Exam"%>
<%@page import="java.util.List"%>
<%@page import="Model.Subject"%>
<%@page import="Model.Subject"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%><!DOCTYPE html>
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
    <%
        int id = Integer.parseInt(request.getParameter("id"));

        UserDatabase bkd = new UserDatabase(ConnectionPro.getConnection());

        Exam bk = bkd.getSingleExam(id);
        request.setAttribute("details_exam", bk);

        Subject sj = bkd.getSinglesubject(id);
        request.setAttribute("edit_books", sj);

        List<Quiz> quiz = bkd.getAllQuestions(id);
        request.setAttribute("QUIZ_LIST", quiz);

        int count = 1;
    %>

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
                <main class="p-8">
                    <div>
                        <div id="progress" class="h-1 bg-white" style="background: linear-gradient(to right, #4dc0b5 var(--scroll), transparent 0); --scroll:0%;"></div>

                        <div class="text-center">
                            <h1 class="font-bold break-normal text-3xl md:text-5xl">${details_exam.examName }</h1>
                        </div>

                        <div class="flex justify-between border-b pb-5 mb-5 w-1/2 mx-auto">
                            <div class="flex justify-between pt-5">
                                <p class="text-md mx-5  font-bold">
                                    Môn học:  ${details_exam.subjectId }
                                </p>
                                <p class="text-md mx-5  font-bold">
                                    Mã đề: ${details_exam.examCode }
                                </p>
                            </div>
                            <div class="flex justify-between pt-5">
                                <p class="text-md mx-5  font-bold">
                                    Ngày thi: ${details_exam.examDay }
                                </p>
                                <p class="text-md mx-5  font-bold">
                                    Điểm: ${details_exam.score }
                                </p>
                            </div>
                        </div>
                        <p class="text-md text-center w-10/12 mx-auto">
                            Miêu tả: ${details_exam.examDesc }
                        </p>
                    </div> 
                    <div class="grid grid-cols-2 gap-8 mt-10">
                        <c:forEach var="tempSubject" items="${QUIZ_LIST}">

                            <div>
                                <h3 class="text-lg font-bold "> Câu hỏi <%=count%>: ${tempSubject.quiz}</h3>
                                <p>A. ${tempSubject.answer1}</p>
                                <p>B. ${tempSubject.answer2}</p>
                                <p>C. ${tempSubject.answer3}</p>
                                <p>D. ${tempSubject.answer4}</p>
                                <p>
                                    Đáp án:
                                    <c:if test="${tempSubject.correct=='answer1'}">
                                        A
                                    </c:if>
                                    <c:if test="${tempSubject.correct=='answer2'}">
                                        B
                                    </c:if>
                                    <c:if test="${tempSubject.correct=='answer3'}">
                                        C
                                    </c:if>
                                    <c:if test="${tempSubject.correct=='answer4'}">
                                        D
                                    </c:if>
                                </p>
                            </div>
                            <%count++;%>
                        </c:forEach>
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>
