<%@page import="Model.Exam"%>
<%@page import="java.util.List"%>
<%@page import="Model.Subject"%>
<%@page import="Model.Subject"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<% int id = 1;
    UserDatabase examData = new UserDatabase(ConnectionPro.getConnection());

    List<Subject> subject = examData.getAllsubjects();
    request.setAttribute("SUBJECT_LIST", subject);
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
                <main class="flex-1 p-6">
                    <div class="col-span-8 card flex flex-col bg-white ">
                        <h1 class="text-5xl">Tạo đề thi</h1>
                        <form action="AddExamTestServlet" method="post" class="my-5">
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
                                    <input type="text" name="examName" id="" placeholder="nhập tên đề kiểm tra"
                                           class="border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full" required>
                                </label>
                                <label>
                                    <p class="font-medium text-slate-700 pb-2">Mã đề</p>
                                    <input type="text" name="examCode" id="" placeholder="abcd"
                                           class="border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full" required>
                                </label>
                            </div>
                            <div class="grid grid-cols-3 gap-4 my-5">
                                <label>
                                    <p class="font-medium text-slate-700 pb-2">Thời gian làm bài</p>
                                    <input type="number" name="examTime" id="" placeholder="45,60,75,..."
                                           class="border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full" required>
                                </label>
                                <label>
                                    <p class="font-medium text-slate-700 pb-2">Ngày làm bài</p>
                                    <input type="date" name="examDay" id="userdate" onchange="TDate()"
                                           class="border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full" required>
                                </label>
                                <label>
                                    <p class="font-medium text-slate-700 pb-2">Nhập điểm tối đa</p>
                                    <input type="number" name="score" value="10"
                                           class="border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full" required>
                                </label>
                            </div>
                            <label class="mb-5">
                                <p class="font-medium text-slate-700 pb-2">Miêu tả</p>
                                <textarea  name="examDesc" placeholder="10,20,40,..."   rows="4"
                                           class="border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full mb-6"></textarea>
                            </label>

                            <input type="submit" value="Thêm"
                                   class="border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full bg-teal-500 hover:bg-teal-400 cursor-pointer text-white">
                        </form>
                        <div class="mt-4">
                            <div class="col-span-2 card flex flex-col" style="height:300px">
                                <div class="overflow-x-auto">
                                    <div class="w-full">
                                        <table class="min-w-max w-full table-auto text-center border relative">
                                            <thead>
                                                <tr class="bg-teal-500 sm:table-row rounded-l-lg sm:rounded-none mb-2 sm:mb-0 text-white sticky top-0 z-10">
                                                    <th class="py-3 px-6">Id</th>
                                                    <th class="py-3 px-6">Tên môn học</th>
                                                    <th class="py-3 px-6">Tên đề kiểm tra</th>
                                                    <th class="py-3 px-6">Mã đề</th>
                                                    <th class="py-3 px-6">Ngày làm bài</th>
                                                    <th class="py-3 px-6">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody class="text-gray-600 text-sm font-light">
                                                <%try {
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        String url = "jdbc:mysql://localhost:3306/quanlydethi";
                                                        String username = "root";
                                                        String password = "";

                                                        Connection conn = DriverManager.getConnection(url, username, password);
                                                        Statement stmt = conn.createStatement();

                                                        String query = "SELECT * from subjects INNER JOIN exam ON subjects.subjectId=exam.subjectId";
                                                        ResultSet rs = stmt.executeQuery(query);

                                                        while (rs.next()) {

                                                %>
                                                <tr class="border-b border-gray-200 hover:bg-gray-100">
                                                    <td><%=id%></td>
                                                    <td><%out.println(rs.getString("subjectName")); %></td>
                                                    <td class="td-exam__name"><%out.println(rs.getString("examName")); %></td>
                                                    <td><%out.println(rs.getString("examCode")); %></td>
                                                    <td><%out.println(rs.getString("examDay")); %></td>
                                                    <td class="py-3 px-6 text-center">
                                                        <div class="flex item-center justify-center">
                                                            <a href="editExamTest.jsp?id=<%out.println(rs.getString("examId")); %>">
                                                                <div class="w-4 mr-2 transform hover:text-purple-500 hover:scale-110">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                                                         stroke="currentColor">
                                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                                          d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                                                    </svg>
                                                                </div>
                                                            </a> 
                                                            <a href="DeleteExamServlet?id=<%out.println(rs.getString("examId")); %>">
                                                                <div class="w-4 mr-2 transform hover:text-purple-500 hover:scale-110">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                                                         stroke="currentColor">
                                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                                          d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                                                    </svg>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <%id++;%>
                                                <%
                                                        }
                                                        rs.close();
                                                        stmt.close();
                                                        conn.close();
                                                    } catch (Exception e) {
                                                        e.printStackTrace();
                                                    }
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
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
