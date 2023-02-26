<%@page import="Model.Quiz"%>
<%@page import="Model.Exam"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ConnectionPro"%>
<%@page import="DAO.UserDatabase"%>
<%@page import="Model.Subject"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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

        <div class="bg-gray-900 opacity-50 hidden fixed inset-0 z-10" id="sidebarBackdrop"></div>
        <div id="main-content" class="h-full w-full bg-gray-50 relative overflow-y-auto ">
            <main class="p-6">
                <!-- strat content -->
                <div class="overflow-x-auto">
                    <div class="col-span-2 card flex flex-col">
                        <div class="overflow-x-auto">
                            <div class="w-full">
                                <form action="StudentBeginExam.jsp?id=${details_exam.examId}" method="post">
                                    <div class="grid place-items-center">
                                        <div class="rounded rounded-t-lg overflow-hidden shadow max-w-xs my-3">
                                            <img src="https://i.imgur.com/w1Bdydo.jpg" alt="" class="w-full">
                                            <div class="flex justify-center -mt-8">
                                                <img src="images/books.png" alt="" class="rounded-full border-solid border-white border-2 -mt-3 w-1/2">
                                            </div>
                                            <img src="" alt=""/>
                                            <div class="text-center px-3 pb-6 pt-2">
                                                <h3 class="text-black text-sm bold font-sans text-2xl">${details_exam.examName}</h3>
                                            </div>
                                            <div class="flex justify-center pb-3 text-grey-dark">
                                                <div class="text-center mr-3 border-r pr-3">
                                                    <h2>Thời gian: ${details_exam.examTime}</h2>
                                                    <span>Điểm: ${details_exam.score }</span>
                                                </div>
                                                <div class="text-center">
                                                    <h2>Ngày làm: ${details_exam.examDay}</h2>
                                                    <span>Mã đề: ${details_exam.examCode}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <button class="border border-gray-300 text-sm rounded-lg py-4 px-12 bg-teal-500 hover:bg-teal-400 text-white focus:ring-blue-500 mb-6">Bắt đầu</button>

                                    </div>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <%@ include file="layout/userFooterHomePage.jsp" %>  

    </body>
</html>
