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
        .td-quiz__name{
            display: inline-block;
            width: 180px;
            white-space: nowrap;
            overflow: hidden !important;
            text-overflow: ellipsis;
            align-items: center;
            margin-top:15px;
        }
    </style>
    <body class="bg-gray-100">
        <!-- Start nav -->
        <%@ include file="layout/header.jsp" %>  
        <!-- End nav -->

        <div class="flex overflow-hidden  h-screen  pt-14"  x-data="setup()" >
            <!-- Start aside -->
            <%@ include file="layout/aside.jsp" %>  
            <!-- End aside -->
            <br>
            <div id="main-content" class="h-full w-full relative h-full overflow-auto">
                <main>
                    <div class="flex-1 px-6 pt-4 mb-10 overflow-auto">
                        <div class="col-span-8 card flex flex-col p-5 lg:p-10">
                            <h1 class="text-5xl whitespace-nowrap mb-12">Danh sách câu hỏi</h1>

                            <table class="min-w-max w-full table-auto text-center rounded-lg border shadown-lg bg-white">
                                <thead>
                                    <tr class="bg-teal-500 sm:table-row rounded-l-lg sm:rounded-none mb-2 sm:mb-0 text-white">
                                        <th class="py-3 px-6">Id</th>
                                        <th class="py-3 px-6">Mã đề</th>
                                        <th class="py-3 px-6">Tên đề</th>
                                        <th class="py-3 px-6">Câu hỏi</th>
                                        <th class="py-3 px-6">Đáp án</th>
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

                                            String query = "SELECT * from quiz INNER JOIN exam ON quiz.examId=exam.examId";
                                            ResultSet rs = stmt.executeQuery(query);

                                            while (rs.next()) {

                                    %>
                                    <tr class="border-b border-gray-200 hover:bg-gray-100">
                                        <td><%=id%></td>
                                        <td><%out.println(rs.getString("examCode")); %></td>
                                        <td class="truncate text-md p-4"><%out.println(rs.getString("examName")); %></td>
                                        <td class="td-quiz__name"><%out.println(rs.getString("quiz")); %></td>
                                        <td>
                                            <%
                                                String dapan = rs.getString("correct");
                                                if (dapan == "answer1") {
                                                    out.println("A");
                                                } else if (dapan == "answer2") {
                                                    out.println("B");
                                                } else if (dapan == "answer3") {
                                                    out.println("C");
                                                } else {
                                                    out.println("D");
                                                }
                                            %>
                                        </td>
                                        <td class="py-3 px-6 text-center">
                                            <div class="flex item-center justify-center">
                                                <a href="DeleteQuizServlet?id=<%out.println(rs.getString("quizId")); %>">
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
                </main>
            </div>
        </div>
    </body>
</html>
