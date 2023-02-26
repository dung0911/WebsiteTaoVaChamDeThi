<%@page import="Model.Quiz"%>
<%@page import="Model.Exam"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ConnectionPro"%>
<%@page import="DAO.UserDatabase"%>
<%@page import="Model.Subject"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

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
    <body  onload="timer()">
        <%@ include file="layout/userNavigation.jsp" %>  

        <div class="bg-gray-900 opacity-50 hidden fixed inset-0 z-10" id="sidebarBackdrop"></div>
        <div id="main-content" class="h-full w-full bg-gray-50 relative overflow-y-auto ">
            <main class="p-6">
                <!-- strat content -->
                <div id="main-content" class="h-full w-full bg-gray-50 relative overflow-y-auto ">
                    <main class="p-8">
                        <div>
                            <div id="progress" class="h-1 bg-white" style="background: linear-gradient(to right, #4dc0b5 var(--scroll), transparent 0); --scroll:0%;"></div>

                            <div class="text-center">
                                <h1 class="font-bold break-normal text-3xl md:text-5xl">${details_exam.examName }</h1>
                                <a href="StudentExam.jsp" class="float-right border border-gray-300 text-sm rounded-lg py-4 px-12 bg-teal-500 hover:bg-teal-400 text-white focus:ring-blue-500">Thoát</a>

                            </div>

                            <div class="lg:flex justify-between border-b pb-5 mb-5 md:w-1/2 mx-auto">
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
                        </div> 

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mt-10">
                            <c:forEach var="tempSubject" items="${QUIZ_LIST}">
                                <div>
                                    <h3 class="text-lg font-bold "> Câu hỏi <%=count%>: ${tempSubject.quiz}</h3>
                                    <h3 class="text-lg font-bold ">Id cau hoi <%=count%>: ${tempSubject.quizId}</h3>
                                    <ul>
                                        <li class="w-full rounded-t-lg border-b border-gray-200 dark:border-gray-600">
                                            <div class="flex items-center pl-3">
                                                <input type="radio" name="radio<%=count%>" value="answer1" class="w-4 h-4 text-blue-600 cursor-pointer bg-gray-100 border-gray-300">
                                                <label  class="py-3 ml-2 w-full text-sm font-medium">${tempSubject.answer1}</label>
                                            </div>
                                        </li>
                                        <li class="w-full rounded-t-lg border-b border-gray-200 dark:border-gray-600">
                                            <div class="flex items-center pl-3">
                                                <input type="radio" name="radio<%=count%>" value="answer2" class="w-4 h-4 text-blue-600 cursor-pointer bg-gray-100 border-gray-300">
                                                <label class="py-3 ml-2 w-full text-sm font-medium">${tempSubject.answer2}</label>
                                            </div>
                                        </li>
                                        <li class="w-full rounded-t-lg border-b border-gray-200 dark:border-gray-600">
                                            <div class="flex items-center pl-3">
                                                <input  type="radio" name="radio<%=count%>" value="answer3" class="w-4 h-4 text-blue-600 cursor-pointer bg-gray-100 border-gray-300">
                                                <label class="py-3 ml-2 w-full text-sm font-medium">${tempSubject.answer3}</label>
                                            </div>
                                        </li>
                                        <li class="w-full rounded-t-lg border-b border-gray-200 dark:border-gray-600">
                                            <div class="flex items-center pl-3">
                                                <input type="radio" name="radio<%=count%>" value="answer4" class="w-4 h-4 text-blue-600 cursor-pointer bg-gray-100 border-gray-300">
                                                <label class="py-3 ml-2 w-full text-sm font-medium">${tempSubject.answer4}</label>
                                            </div>
                                        </li>
                                        <li class="w-ful">
                                            <div class="flex items-center pl-3">
                                                <label class="py-3 ml-2 w-full text-md font-medium">
                                                    <span class="font-bold text-lg underline mr-5">Đáp án:</span> 
                                                    <c:if test="${tempSubject.correct=='answer1'}">
                                                        A. ${tempSubject.answer1}
                                                    </c:if>
                                                    <c:if test="${tempSubject.correct=='answer2'}">
                                                        B. ${tempSubject.answer2}
                                                    </c:if>
                                                    <c:if test="${tempSubject.correct=='answer3'}">
                                                        C. ${tempSubject.answer3}
                                                    </c:if>
                                                    <c:if test="${tempSubject.correct=='answer4'}">
                                                        D. ${tempSubject.answer4};
                                                    </c:if>
                                                </label>
                                            </div>
                                        </li>
                                    </ul> 
                                </div>

                                <%count++;%>
                            </c:forEach>
                        </div>


                    </main>
                </div>
            </main>

        </div>
        <%@ include file="layout/userFooterHomePage.jsp" %>  

    </body>
</html>
