<%-- 
    Document   : quizTest
    Created on : Nov 15, 2022, 10:23:38 PM
    Author     : ADMIN
--%>
<%@page import="Model.Exam"%>
<%@page import="java.util.List"%>
<%@page import="Model.Subject"%>
<%@page import="Model.Subject"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%
    UserDatabase examData = new UserDatabase(ConnectionPro.getConnection());

    List<Exam> exam = examData.getAllExams();
    request.setAttribute("EXAM_LIST", exam);
%>
<% int id = 1; %>
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
        .option-test__exam{
            display: inline-block;
            width: 100%;
            white-space: nowrap;
            overflow: hidden !important;
            text-overflow: ellipsis;
        }
        .td-exam__name{
            display: inline-block;
            width: 180px;
            white-space: nowrap;
            overflow: hidden !important;
            text-overflow: ellipsis;
        }
    </style>
    <body class="bg-gray-100">
        <!-- Start nav -->
        <%@ include file="layout/header.jsp" %>  
        <!-- End nav -->

        <div class="flex overflow-hidden h-screen  pt-14"  x-data="setup()" >
            <!-- Start aside -->
            <%@ include file="layout/aside.jsp" %>  
            <!-- End aside -->
            <br>
            <div id="main-content" class="h-full w-full relative h-full overflow-auto">
                <main>
                    <div class="flex-1 px-6 pt-4">
                        <div class="col-span-8 card flex flex-col p-10 bg-white shadown-lg border-2">
                            <h1 class="text-5xl mb-5">Tạo câu hỏi</h1>
                            <form action="AddQuizServlet" method="post" class="my-5">
                                <div class="flex justify-between my-5">
                                    <label class="w-1/4">
                                        <p class="font-medium text-slate-700 pb-2">Tên môn học</p>
                                        <select name="examId" class="option-test__exam border px-3 py-4 rounded-lg" 
                                                <c:forEach var="tempSubject" items="${EXAM_LIST}">
                                                    class="border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full">
                                                    <option value="${tempSubject.examId}">${tempSubject.examName}</option>
                                                </c:forEach>
                                        </select>
                                    </label>
                                    <div class="w-2/3">
                                        <label>
                                            <p class="font-medium text-slate-700 pb-2">Câu hỏi</p>
                                            <textarea name="quiz" placeholder="Câu hỏi" required
                                                      class="border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full"></textarea>
                                        </label>
                                        <div class="flex justify-between w-full">
                                            <label class="w-full mr-2">
                                                <p class="font-medium text-slate-700 pb-2">Đáp án A</p>
                                                <input type="text" name="answer1" placeholder="đáp án" required
                                                       class="border border-gray-300 w-full text-sm rounded-lg p-4 focus:ring-blue-500 w-full">
                                            </label>
                                            <label class="w-full ml-2">
                                                <p class="font-medium text-slate-700 pb-2">Đáp án B</p>
                                                <input type="text" name="answer2" placeholder="đáp án" required
                                                       class="border w-full border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full">
                                            </label>
                                        </div>
                                        <div class="flex justify-between w-full">
                                            <label class="w-full mr-2">
                                                <p class="font-medium text-slate-700 pb-2">Đáp án C</p>
                                                <input type="text" name="answer3" placeholder="đáp án" required
                                                       class="border border-gray-300 w-full text-sm rounded-lg p-4 focus:ring-blue-500 w-full">
                                            </label>
                                            <label class="w-full ml-2">
                                                <p class="font-medium text-slate-700 pb-2">Đáp án D</p>
                                                <input type="text" name="answer4" placeholder="đáp án" required
                                                       class="border w-full border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full">
                                            </label>
                                        </div>
                                        <label>
                                            <p class="font-medium text-slate-700 pb-2">Câu trả lời đúng</p>
                                            <select name="correct" class="border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full">
                                                <option value="answer1">A</option>
                                                <option value="answer2">B</option>
                                                <option value="answer3">C</option>
                                                <option value="answer4">D</option>
                                            </select>
                                        </label>
                                    </div>
                                </div>
                                <input type="submit" value="Thêm"
                                       class="rounded-lg border bg-teal-500 hover:bg-teal-400 text-white px-8 py-3 flex justify-center mx-auto cursor-pointer">
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
