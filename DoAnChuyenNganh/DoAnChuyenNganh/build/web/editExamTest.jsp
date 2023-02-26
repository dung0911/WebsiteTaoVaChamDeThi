<%-- 
    Document   : quizTest
    Created on : Nov 15, 2022, 10:23:38 PM
    Author     : ADMIN
--%>
<%@page import="Model.Quiz"%>
<%@page import="Model.Exam"%>
<%@page import="java.util.List"%>
<%@page import="Model.Subject"%>
<%@page import="Model.Subject"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    UserDatabase bkd = new UserDatabase(ConnectionPro.getConnection());
    Exam bk = bkd.getSingleExam(id);
    request.setAttribute("edit_books", bk);

    UserDatabase examData = new UserDatabase(ConnectionPro.getConnection());
    List<Subject> subject = examData.getAllsubjects();
    request.setAttribute("SUBJECT_LIST", subject);

    List<Exam> exam = examData.getAllExams();
    request.setAttribute("EXAM_LIST", exam);

    List<Quiz> quiz = bkd.getAllQuiz();
    request.setAttribute("QUIZ_LIST", quiz);

    int count = 1;
%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%><!DOCTYPE html>
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
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.0/angular.min.js"></script>

    </head>
    <style>
        .td-exam__name {
            display: inline-block;
            width: 180px;
            white-space: nowrap;
            overflow: hidden !important;
            text-overflow: ellipsis;
            padding-top:10px;
        }
    </style>
    <body>
        <!-- Start nav -->
        <%@ include file="layout/header.jsp" %>  
        <!-- End nav -->

        <div class="flex overflow-hidden bg-white h-screen  pt-14"  x-data="setup()" >
            <!-- Start aside -->
            <%@ include file="layout/aside.jsp" %>  
            <!-- End aside -->
            <br>
            <div id="main-content" class="h-full w-full relative h-full overflow-auto">
                <main>
                    <div class="flex-1 p-6">
                        <div class="col-span-8 card flex flex-col p-10 bg-white shadown-lg border-2">
                            <h1 class="text-5xl mb-5">Chỉnh sửa đề thi </h1>

                            <form action="EditExamTestServlet" method="post" class="my-5">
                                <label>
                                    <p class="font-medium text-slate-700 pb-2">Id</p>
                                    <input type="text" name="examId"value="${edit_books.examId }" 
                                           class="border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full">
                                </label>
                                <div class="grid grid-cols-3 gap-4 my-5">
                                    <label>
                                        <p class="font-medium text-slate-700 pb-2">Tên môn học</p>
                                        <select name="subject"
                                                <c:forEach var="tempSubject" items="${SUBJECT_LIST}">
                                                    class="border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full">
                                                    <option  value="${tempSubject.subjectId}">${tempSubject.subjectName}</option>
                                                </c:forEach>
                                        </select>
                                    </label>
                                    <label>
                                        <p class="font-medium text-slate-700 pb-2">Tên đề kiểm tra</p>
                                        <input type="text" name="examName" id="" value="${edit_books.examName }" 
                                               class="border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full">
                                    </label>
                                    <label>
                                        <p class="font-medium text-slate-700 pb-2">Mã đề</p>
                                        <input type="text" name="examCode" id=""  value="${edit_books.examCode }"
                                               class="border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full">
                                    </label>
                                </div>
                                <div class="grid grid-cols-3 gap-4 my-5">
                                    <label>
                                        <p class="font-medium text-slate-700 pb-2">Thời gian làm bài</p>
                                        <input type="number" name="examTime"  value="${edit_books.examTime }"
                                               class="border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full">
                                    </label>
                                    <label>
                                        <p class="font-medium text-slate-700 pb-2">Ngày làm bài</p>
                                        <input type="date" name="examDay" id="userdate" onchange="TDate()"
                                               class="border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full">
                                    </label>
                                    <label>
                                        <p class="font-medium text-slate-700 pb-2">Nhập điểm tối đa</p>
                                        <input type="number" name="score" value="${edit_books.score}"
                                               class="border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full">
                                    </label>
                                </div>
                                <label>
                                    <p class="font-medium text-slate-700 pb-2">Miêu tả</p>
                                    <textarea  name="examDesc" placeholder="10,20,40,..."  rows="4"
                                               class="border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full mb-6">${edit_books.examDesc} </textarea>
                                </label>

                                <div class="flex text-center w-1/2 mx-auto">
                                    <button type="submit"
                                            class="mx-5 border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full bg-teal-500 hover:bg-teal-400 cursor-pointer text-white">Lưu</button>
                                    <a href="testExam.jsp" 
                                       class="border mx-5  border-gray-300 text-sm rounded-lg
                                       p-4 focus:ring-blue-500 w-full bg-gray-500 hover:bg-gray-400 cursor-pointer text-white">Hủy</a>
                                </div>
                            </form>
                        </div>

                    </div>

                </main>
            </div>
        </div>
        <script>
            function TDate() {
                var UserDate = document.getElementById("userdate").value;
                var ToDate = new Date();

                if (new Date(UserDate).getTime() <= ToDate.getTime()) {
                    alert("The Date must be Bigger or Equal to today date");
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
