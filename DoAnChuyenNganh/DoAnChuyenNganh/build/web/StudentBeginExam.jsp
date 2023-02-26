<%@page import="Model.User"%>
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
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

</script>
<body>
    <%@ include file="layout/userNavigation.jsp" %>  

    <div id="main-content" class="h-full w-full bg-gray-50 relative overflow-y-auto ">
        <main class="p-6">
            <!-- strat content -->
            <div id="main-content" class="h-full w-full bg-gray-50 relative overflow-y-auto ">
                <main class="px-8 py-4">
                    <div>
                        <div class="text-center font-bold break-normal text-3xl md:text-5xl mb-20">
                            <h1>${details_exam.examName }</h1>
                        </div>
                    </div> 
                    <form action="ResultServlet"  method="post">       

                        <div class="grid grid-cols-2 gap-8 mt-10">
                            <c:forEach var="tempSubject" items="${QUIZ_LIST}">
                                <div>
                                    <h3 class="text-lg font-bold "> Câu hỏi <%=count%>: ${tempSubject.quiz}</h3>
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
                                        <li class="hidden w-full rounded-t-lg border-b border-gray-200 dark:border-gray-600">
                                            <div class="flex items-center pl-3">
                                                <input type="text" value='${tempSubject.correct}' name="ans<%=count%>"/>
                                            </div>
                                        </li>
                                    </ul> 
                                </div>

                                <%count++;%>
                            </c:forEach>
                        </div>
                        <div class="hidden rounded rounded-t-lg overflow-hidden shadow max-w-xs my-3">
                            <% User user = (User) session.getAttribute("currentUser");
                                if (user == null) {
                                    response.sendRedirect("login.jsp");
                                }
                            %>
                            <input class="w-full" name="email" value="<%= user.getEmail()%> ">
                            <input class="w-full" name="ngayLam" value="${details_exam.examDay}">
                            <input class="w-full" name="examId" value="${details_exam.examId}">
                            <input class="w-full" name="quizCount" value="${QUIZ_LIST.size()}">
                            <input class="w-full" name="nguoiLam" value="<%= user.getFullname()%> ">

                        </div>
                        <button type="submit" class="mt-10 border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 bg-teal-500 hover:bg-teal-400 cursor-pointer text-white mx-auto block">Nộp bài</button>
                    </form>
                </main>
            </div>
        </main>

    </div>
    <%@ include file="layout/userFooterHomePage.jsp" %>  

</body>
</html>
