<%@page import="Model.Exam"%>
<%@page import="java.util.List"%>
<%@page import="Model.Subject"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%
    UserDatabase subjectData = new UserDatabase(ConnectionPro.getConnection());

    List<Exam> exam = subjectData.getAllExams();
    request.setAttribute("EXAM_LIST", exam);

    int id = 1;
%>
<!DOCTYPE html>
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
    </head>
    <style>
        .td-exam__desc,.td-exam__name {
            display: inline-block;
            width: 180px;
            white-space: nowrap;
            overflow: hidden !important;
            text-overflow: ellipsis;
            padding-top:10px;
        }
    </style>
    <body class="bg-gray-100">
        <!-- Start nav -->
        <%@ include file="layout/header.jsp" %>  
        <!-- End nav -->

        <div class="flex overflow-hidden bg-white h-screen  pt-14"  x-data="setup()" >
            <!-- Start aside -->
            <%@ include file="layout/aside.jsp" %>  
            <!-- End aside -->
            <br>
            <div id="main-content" class="h-full w-full bg-gray-50 relative  h-full overflow-auto">
                <main>
                    <div class="px-4 ml-4">
                        <div class="mt-4 w-full grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">
                            <div class="shadow-lg rounded-md flex items-center justify-between p-3 border-b-4 border-teal-600 font-medium group p-8 mt-4">
                                <div class="flex justify-center items-center w-14 h-14 bg-white rounded-full transition-all duration-300 transform group-hover:rotate-12">
                                    <svg width="30" height="30" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="stroke-current text-blue-800 dark:text-gray-800 transform transition-transform duration-500 ease-in-out"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"></path></svg>
                                </div>
                                <div class="text-right">
                                    <p class="text-2xl">
                                        <%try {
                                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quanlydethi", "root", "");
                                                Statement st = con.createStatement();
                                                String strQuery = "SELECT COUNT(*) FROM exam";
                                                ResultSet rs = st.executeQuery(strQuery);

                                                String Countrow = "";
                                                while (rs.next()) {
                                                    Countrow = rs.getString(1);
                                                    out.println(Countrow);
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>
                                    </p>
                                    <p>Đề thi</p>
                                </div>
                            </div>
                            <div class="shadow-lg rounded-md flex items-center justify-between p-3 border-b-4 border-teal-600 font-medium group p-8 mt-4">
                                <div class="flex justify-center items-center w-14 h-14 bg-white rounded-full transition-all duration-300 transform group-hover:rotate-12">
                                    <svg width="30" height="30" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="stroke-current text-blue-800 dark:text-gray-800 transform transition-transform duration-500 ease-in-out"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"></path></svg>
                                </div>
                                <div class="text-right">
                                    <p class="text-2xl">
                                        <%
                                            try {
                                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quanlydethi", "root", "");
                                                Statement st = con.createStatement();
                                                String strQuery = "SELECT COUNT(*) FROM subjects";
                                                ResultSet rs = st.executeQuery(strQuery);

                                                String Countrow = "";
                                                while (rs.next()) {
                                                    Countrow = rs.getString(1);
                                                    out.println(Countrow);
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>
                                    </p>
                                    <p>Môn học</p>
                                </div>
                            </div>
                            <div class="shadow-lg rounded-md flex items-center justify-between p-3 border-b-4 border-teal-600  font-medium group p-8">
                                <div class="flex justify-center items-center w-14 h-14 bg-white rounded-full transition-all duration-300 transform group-hover:rotate-12">
                                    <svg width="30" height="30" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="stroke-current text-blue-800 dark:text-gray-800 transform transition-transform duration-500 ease-in-out"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
                                </div>
                                <div class="text-right">
                                    <p class="text-2xl">
                                        <%
                                            try {
                                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quanlydethi", "root", "");
                                                Statement st = con.createStatement();
                                                String strQuery = "SELECT COUNT(*) FROM accounts";
                                                ResultSet rs = st.executeQuery(strQuery);

                                                String Countrow = "";
                                                while (rs.next()) {
                                                    Countrow = rs.getString(1);
                                                    out.println(Countrow);
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>
                                    </p>
                                    <p>Tài khoản</p>
                                </div>
                            </div>
                        </div>
                        <div class="grid grid-cols-1 2xl:grid-cols-2 xl:gap-4 my-4">
                            <div class="bg-white shadow rounded-lg mb-4 p-4 sm:p-6 h-full">
                                <div class="card bg-teal-400 border-teal-400 shadow-md text-white">
                                    <div class="card-body lg:flex flex-row">

                                        <!-- image -->
                                        <div class="img-wrapper w-40 h-40 flex justify-center items-center" style="width:160px; height:160px;">
                                            <svg id="1cf4a4b6-30d3-491e-a53d-552d6204f4f6" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="906.42" height="756" viewBox="0 0 906.42 756"><defs><linearGradient id="af67113a-287e-4ea5-97c7-bca3f36ab9af" x1="670.67" y1="828" x2="670.67" y2="91.4" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="gray" stop-opacity="0.25"/><stop offset="0.54" stop-color="gray" stop-opacity="0.12"/><stop offset="1" stop-color="gray" stop-opacity="0.1"/></linearGradient><clipPath id="07e7d08c-c6f9-475f-8fa6-c69f2c72c8fe" transform="translate(-146.79 -72)"><path id="c8ed4358-d450-436c-89b2-67b880a93208" data-name="&lt;Clipping Path&gt;" d="M413.56,230.63s50.57,15.17,121.38-7.59,217.47,32.87,217.47,32.87,116.32,0,288.28-73.33c0,0-78.39,75.86-22.76,121.38s5.06,111.26-60.69,136.55-70.8,75.86-65.75,123.91,0,2.53,0,2.53-197.24-35.4-247.82,86L393.33,258.45S378.16,228.11,413.56,230.63Z" fill="#0a7e71"/></clipPath></defs><title>superhero</title><path d="M1028.76,300.38a65.25,65.25,0,0,1-7.44-7.1c0,.61,0,1.22,0,1.83-18.17-18.54-17.53-41-10.09-61.49l2.46-.91c11.68-30.88,38.45-56.78,38.45-56.78l-4,1.68c1.24-1.28,1.95-2,1.95-2-166,70.81-281.5,74.94-294.38,75.18-7.94-3-73.36-26.82-136.65-35.7-19.91-2.89-39.68-4.34-57.44-3.22l-19.94-85.61-.38.23c-.93-7.34-4.38-23.32-17-33.23C507.45,80.1,520,140.65,520,140.65l1.38-.65,7.06,76.24L525,219.12a262.06,262.06,0,0,1-61.32,10.57A43.15,43.15,0,0,0,473,217.26a8.29,8.29,0,0,0,7.51-2.23,10.19,10.19,0,0,0,1.65-2.31,22,22,0,0,0,2.2-4.73c4.14-11.12,8.66-22.27,10-34.05s-.86-24.56-8.79-33.39-22.39-12.19-32.1-5.37c-2.51,1.76-4.64,4.1-7.4,5.44-8.41,4.07-17.74-2.53-25.57-7.63-9.1-5.93-21.12-10.18-30.55-4.8a18.7,18.7,0,0,0-7,7.18,22.84,22.84,0,0,0-3.47,13.75c.54,7.77,4.73,15,10.34,20.36a17.65,17.65,0,0,0,6.77,4.42,12.56,12.56,0,0,0,2,.44,43.11,43.11,0,0,0-6.26,32.46l-3.49,21.12c-3.1,1.45-4.83,4.62-5.8,7.72-14.59.43-29.52,10.43-29.52,10.43l-57.34,57.34c-14.87,10.09-4.78,28.67-4.78,28.67l33.45,100.35,1.85-1.38c6.86,12.5,27,47,30.87,29.8,4.73-20.84-10-39.76-10-39.76l-.18,0-3.81-4.9-14-74.6L347.29,324l23.8-3.47L372.15,475c-43.54,114.69-38.23,167.25-38.23,167.25l38.23,143.36,4.88-.81,1.18,4.72.43-.15,2.12,10.58h-3.82l-4.78,14.34s-24.42-.53-23.89,4.78,13.81,14.34,47.79,4.78l9.56-9.56s4.78-4.78-4.78-14.34h-.68l-2.65-18.56,3.33-.56L372.15,637.44c23.89-19.65,66.9-95.57,66.9-95.57s43,75.93,66.9,95.57L477.28,780.79l3.33.56L478,799.91h-.68c-9.56,9.56-4.78,14.34-4.78,14.34l9.56,9.56c34,9.56,47.26.53,47.79-4.78S506,814.25,506,814.25l-4.78-14.34h-3.82l2.75-13.76.49-1.47,5.36.89,38.23-143.36s-.71-82.83-37.83-186.37l76.26,106.94L643,657.92a129.34,129.34,0,0,1,11.73-22l43.66-40.79c50.75-30.19,118.5-32,160.34-29.51l38.58,4.17,18.14-95.56c10.57-13.61,26.26-25.35,49.07-34.13,47.32-18.2,87-56.84,86.68-94.41.69.77,1.36,1.54,2,2.32C1053.69,331.39,1046.48,314.89,1028.76,300.38ZM505,442.13l-.05-1.76,2.2,3.46Z" transform="translate(-146.79 -72)" fill="url(#af67113a-287e-4ea5-97c7-bca3f36ab9af)"/><path d="M355.67,422l-.18,0L347,411.05l-13.74,13.74,1.52,2.28-1.73.42s27.73,53.56,32.35,33.23S355.67,422,355.67,422Z" transform="translate(-146.79 -72)" fill="#fdb797"/><path id="83eae6ee-46c5-4585-a2a2-a187faac01c1" data-name="&lt;Clipping Path&gt;" d="M413.56,230.63s50.57,15.17,121.38-7.59,217.47,32.87,217.47,32.87,116.32,0,288.28-73.33c0,0-78.39,75.86-22.76,121.38s5.06,111.26-60.69,136.55-70.8,75.86-65.75,123.91,0,2.53,0,2.53-197.24-35.4-247.82,86L393.33,258.45S378.16,228.11,413.56,230.63Z" transform="translate(-146.79 -72)" fill="#0a7e71"/><g clip-path="url(#07e7d08c-c6f9-475f-8fa6-c69f2c72c8fe)"><polygon points="141.46 84.18 771.11 536.82 809.04 425.56 141.46 84.18" opacity="0.1"/><polygon points="179.39 225.79 528.35 579.81 578.93 541.88 179.39 225.79" opacity="0.1"/></g><g opacity="0.1"><path d="M428.17,266.32s50.57,15.17,121.38-7.59S767,291.61,767,291.61s94.1,0,238.14-53.36c11.39-30.12,37.49-55.38,37.49-55.38-172,73.33-288.28,73.33-288.28,73.33s-146.67-55.63-217.47-32.87-121.38,7.59-121.38,7.59c-35.4-2.53-20.23,27.82-20.23,27.82l10.41,16.41C407.85,269.62,413.9,265.3,428.17,266.32Z" transform="translate(-146.79 -72)"/><path d="M1019.9,304.25a63.64,63.64,0,0,1-7.26-6.93c-.58,14.93,4.57,29.78,19.9,42.33a78.94,78.94,0,0,1,11.18,11.06C1044.21,334.49,1037.18,318.39,1019.9,304.25Z" transform="translate(-146.79 -72)"/></g><polygon points="358.58 700.77 353.92 724.08 335.27 724.08 339.94 691.45 358.58 700.77" fill="#fdb797"/><polygon points="358.2 703.99 356.89 707.93 338.5 702.68 339.81 700.05 358.2 703.99" opacity="0.1"/><polygon points="237.41 700.77 242.07 724.08 260.71 724.08 256.05 691.45 237.41 700.77" fill="#fdb797"/><polygon points="237.34 703.99 238.65 709.24 257.05 702.68 257.05 700.05 237.34 703.99" opacity="0.1"/><path d="M544.82,138.49s-.52-23.36-16.93-36.22-4.13,46.19-4.13,46.19Z" transform="translate(-146.79 -72)" fill="#fdb797"/><path d="M407.5,791.42H384.2l-4.66,14s-23.82-.52-23.3,4.66,13.46,14,46.6,4.66l9.32-9.32S416.82,800.74,407.5,791.42Z" transform="translate(-146.79 -72)" fill="#333"/><path d="M482.06,791.42h23.3l4.66,14s23.82-.52,23.3,4.66-13.46,14-46.6,4.66l-9.32-9.32S472.74,800.74,482.06,791.42Z" transform="translate(-146.79 -72)" fill="#333"/><path d="M510,474.51H379.54c-42.46,111.85-37.28,163.12-37.28,163.12l37.28,139.81,28-4.66L379.54,633c23.3-19.16,65.25-93.21,65.25-93.21S486.72,613.8,510,633l-28,139.81,28,4.66,37.28-139.81S552.49,586.36,510,474.51Z" transform="translate(-146.79 -72)" fill="#333"/><path d="M379.54,476.32s74,28,130.49,0H379.54Z" transform="translate(-146.79 -72)" opacity="0.1"/><path d="M375.42,307.19l-37.28,37.28,14,74.57-18.64,14-32.62-97.87s-9.84-18.12,4.66-28l55.93-55.93s24-16.08,40.5-7.84-26.87,63.2-26.87,63.2" transform="translate(-146.79 -72)" fill="#3ad29f"/><path d="M374.87,306.73l4.66,167.78s74,28,130.49,0l-4.66-157.94-1.19-5.22.86-2.57,56-46.44c15.35-8.45,7.24-27.41,7.24-27.41l-23.4-100.47L525,146.64l7,75.54-39.88,33.08-1-.05,0,.25-102.23-4.65" transform="translate(-146.79 -72)" fill="#3ad29f"/><rect x="279.61" y="155.76" width="37.28" height="41.94" rx="15.83" ry="15.83" fill="#fdb797"/><path d="M427.59,245.67a41.93,41.93,0,0,0,36-4,18.71,18.71,0,0,0-17.52-12.29h0A18.7,18.7,0,0,0,427.59,245.67Z" transform="translate(-146.79 -72)" opacity="0.1"/><circle cx="293.59" cy="132.46" r="41.94" fill="#fdb797"/><path d="M411.25,181.33a21.6,21.6,0,0,1-7.8-.44,17.22,17.22,0,0,1-6.6-4.32c-5.48-5.26-9.56-12.28-10.09-19.86s3-15.61,9.57-19.37c9.2-5.24,20.93-1.1,29.8,4.68,7.63,5,16.74,11.41,24.94,7.44,2.69-1.3,4.77-3.59,7.22-5.3,9.47-6.65,23.57-3.37,31.3,5.24s9.9,21.07,8.57,32.57-5.73,22.37-9.77,33.21a16.11,16.11,0,0,1-3.13,5.83c-4.92,5.05-14.13,1.13-17.37-5.13-5.63-10.89,0-29.77-13.3-36.12C444,174.72,422.62,180.59,411.25,181.33Z" transform="translate(-146.79 -72)" opacity="0.1"/><path d="M411.88,180.29a21.6,21.6,0,0,1-7.8-.44,17.22,17.22,0,0,1-6.6-4.32c-5.48-5.26-9.56-12.28-10.09-19.86s3-15.61,9.57-19.37c9.2-5.24,20.93-1.1,29.8,4.68,7.63,5,16.74,11.41,24.94,7.44,2.69-1.3,4.77-3.59,7.22-5.3,9.47-6.65,23.57-3.37,31.3,5.24s9.9,21.07,8.57,32.57S493,203.3,489,214.14a16.11,16.11,0,0,1-3.13,5.83c-4.92,5.05-14.13,1.13-17.37-5.13-5.63-10.89,0-29.77-13.3-36.12C444.66,173.68,423.24,179.56,411.88,180.29Z" transform="translate(-146.79 -72)" fill="#333"/><ellipse cx="316.89" cy="132.46" rx="4.66" ry="9.32" fill="#fdb797"/><polygon points="228.14 234.71 239.97 240.25 228.14 254.71 228.14 234.71" opacity="0.1"/><polygon points="358.2 236.75 350.32 245.51 355.57 253.39 358.64 244.63 358.2 236.75" opacity="0.1"/><path d="M445.59,266v7.59s-55.35-10.11-56.76-25.29l36.53,2.53Z" transform="translate(-146.79 -72)" fill="#0a7e71"/><path d="M445.59,266v7.59s55.35-10.11,56.76-25.29l-36.53,2.53Z" transform="translate(-146.79 -72)" fill="#0a7e71"/><polygon points="637.09 276.36 819.16 319.35 753.41 347.17 637.09 276.36" opacity="0.1"/><path d="M389,248.67s0-15.89,10.6-15.89,21.19,31.79,21.19,31.79Z" transform="translate(-146.79 -72)" fill="#0a7e71"/><circle cx="11.56" cy="293.66" r="6.94" fill="#f55f44" opacity="0.5"/><circle cx="98.27" cy="456.68" r="6.94" fill="#f55f44" opacity="0.5"/><circle cx="837.05" cy="19.65" r="6.94" fill="#f55f44" opacity="0.5"/><path d="M649.59,96.23a4.25,4.25,0,0,1-2.37-5.13,2,2,0,0,0,.09-.47h0a2.13,2.13,0,0,0-3.83-1.41h0a2,2,0,0,0-.24.42A4.25,4.25,0,0,1,638.12,92a2,2,0,0,0-.47-.09h0a2.13,2.13,0,0,0-1.41,3.83h0a2,2,0,0,0,.42.24A4.25,4.25,0,0,1,639,101.1a2,2,0,0,0-.09.47h0a2.13,2.13,0,0,0,3.83,1.41h0a2,2,0,0,0,.24-.42,4.25,4.25,0,0,1,5.13-2.37,2,2,0,0,0,.47.09h0A2.13,2.13,0,0,0,650,96.46h0A2,2,0,0,0,649.59,96.23Z" transform="translate(-146.79 -72)" fill="#4d8af0" opacity="0.5"/><path d="M990.65,518.22a4.25,4.25,0,0,1-2.37-5.13,2,2,0,0,0,.09-.47h0a2.13,2.13,0,0,0-3.83-1.41h0a2,2,0,0,0-.24.42,4.25,4.25,0,0,1-5.13,2.37,2,2,0,0,0-.47-.09h0a2.13,2.13,0,0,0-1.41,3.83h0a2,2,0,0,0,.42.24,4.25,4.25,0,0,1,2.37,5.13,2,2,0,0,0-.09.47h0a2.13,2.13,0,0,0,3.83,1.41h0a2,2,0,0,0,.24-.42,4.25,4.25,0,0,1,5.13-2.37,2,2,0,0,0,.47.09h0a2.13,2.13,0,0,0,1.41-3.83h0A2,2,0,0,0,990.65,518.22Z" transform="translate(-146.79 -72)" fill="#4d8af0" opacity="0.5"/><circle cx="587.32" cy="643.97" r="6.94" fill="#47e6b1" opacity="0.5"/><circle cx="11.56" cy="595.42" r="6.94" fill="#47e6b1" opacity="0.5"/><circle cx="566.51" cy="92.49" r="6.94" fill="#47e6b1" opacity="0.5"/><g opacity="0.5"><rect x="8.09" width="3.47" height="19.65" fill="#47e6b1"/><rect x="154.88" y="72" width="3.47" height="19.65" transform="translate(91.65 -146.79) rotate(90)" fill="#47e6b1"/></g><g opacity="0.5"><rect x="71.68" y="188.45" width="3.47" height="19.65" fill="#47e6b1"/><rect x="218.47" y="260.45" width="3.47" height="19.65" transform="translate(343.69 -21.93) rotate(90)" fill="#47e6b1"/></g><g opacity="0.5"><rect x="707.56" y="104.05" width="3.47" height="19.65" fill="#47e6b1"/><rect x="854.35" y="176.05" width="3.47" height="19.65" transform="translate(895.18 -742.21) rotate(90)" fill="#47e6b1"/></g></svg>
                                        </div>
                                        <!-- end image -->

                                        <!-- info -->
                                        <div class="py-2 ml-10">
                                            <h1 class="h6">
                                                Good Job, Dũng!</h1>
                                            <p class="text-white text-xs">You've finished all of your tasks for this week.</p>

                                            <ul class="mt-4">
                                                <li class="text-sm font-light"><i class="fad fa-check-double mr-2 mb-2"></i> Thêm đề thi theo môn học
                                                </li>
                                                <li class="text-sm font-light"><i class="fad fa-check-double mr-2 mb-2"></i> Sửa chữa đề thi</li>
                                                <li class="text-sm font-light"><i class="fad fa-check-double mr-2"></i> Cập nhật đề thi</li>
                                            </ul>
                                        </div>
                                        <!-- end info -->

                                    </div>
                                </div>
                            </div>
                            <div class="bg-white shadow rounded-lg overflow-x-auto" style="height:230px">
                                <table class="min-w-max w-full table-auto text-center">
                                    <thead>
                                        <tr class="bg-teal-500 sm:table-row rounded-l-lg sm:rounded-none mb-2 sm:mb-0 text-white">
                                            <th class="p-3">Id</th>
                                            <th class="p-3">Tên môn học</th>
                                            <th class="p-3">Tên đề kiểm tra</th>
                                            <th class="p-3">Mã đề</th>
                                            <th class="p-3">Actions</th>
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

                                                String query = request.getParameter("search");
                                                String data;

                                                if (query != null) {
                                                    data = "SELECT * from subjects INNER JOIN exam ON subjects.subjectId=exam.subjectId where examName like '%" + query + "%' or examCode like'%" + query + "%' or subjectName like'%" + query + "%'";
                                                } else {
                                                    data = "SELECT * from subjects INNER JOIN exam ON subjects.subjectId=exam.subjectId";
                                                }

                                                ResultSet rs = stmt.executeQuery(data);

                                                while (rs.next()) {

                                        %>

                                        <tr class="border-b border-gray-200 hover:bg-gray-100">
                                            <td><%=id%></td>
                                            <td>
                                                <%out.println(rs.getString("subjectName")); %>
                                            </td>
                                            <td class="td-exam__name">
                                                <%out.println(rs.getString("examName")); %>
                                            </td>
                                            <td><%out.println(rs.getString("examCode")); %></td>
                                            <td class="py-3 text-center">
                                                <div class="flex item-center justify-center">
                                                    <a href="detailExam.jsp?id=<%out.println(rs.getString("examId")); %> ">
                                                        <div class="w-4 mr-2 transform hover:text-purple-500 hover:scale-110">
                                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                                            </svg>
                                                        </div>
                                                    </a> 
                                                    <a href="DeleteExamServlet?id=<%out.println(rs.getString("examId")); %> ">
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
                </main>
            </div>
        </div>
        <script async defer src="https://buttons.github.io/buttons.js"></script>
        <script src="https://demo.themesberg.com/windster/app.bundle.js"></script>