<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
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
        <!-- Start nav -->
        <%@ include file="layout/header.jsp" %>  
        <!-- End nav -->
        <div class="flex overflow-hidden bg-white h-screen pt-14">
            <!-- Start aside -->
            <%@ include file="layout/aside.jsp" %>  
            <!-- End aside -->
            <div class="bg-gray-900 opacity-50 hidden fixed inset-0 z-10" id="sidebarBackdrop"></div>
            <div id="main-content" class="h-full w-full bg-gray-50 relative overflow-y-auto ">
                <main>
                    <!-- strat wrapper -->
                    <div class="h-screen flex flex-row flex-wrap">
                        <!-- strat content -->
                        <div class="flex-1  overflow-hidden">
                            <div class="col-span-6 card flex flex-col p-4 overflow-x-auto">
                                <h1 class="text-5xl pt-10">Danh sách tài khoản</h1>
                                <form action="" method="get" class="mt-10">
                                    <label>
                                        <p class="font-medium text-slate-700 pb-2">Tìm kiếm</p>
                                        <div class="relative w-1/3">
                                            <span class="absolute inset-y-0 right-5 flex items-center pl-3"><svg class="w-5 h-5 text-gray-500" viewBox="0 0 24 24" fill="none"><path d="M21 21L15 15M17 10C17 13.866 13.866 17 10 17C6.13401 17 3 13.866 3 10C3 6.13401 6.13401 3 10 3C13.866 3 17 6.13401 17 10Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path></svg></span>
                                            <input type="text" placeholder="Tìm kiếm..." name="search"
                                                   class="border border-gray-300 text-sm rounded-lg p-4 focus:ring-blue-500 w-full">
                                        </div>
                                    </label>
                                </form>
                                <div class="flex items-center justify-center font-sans overflow-hidden mt-12">
                                    <div class="w-full overflow-x-scroll">
                                        <table class="table-auto w-full text-center border rounded-md">
                                            <thead class="text-sm font-semibold uppercase bg-gray-50 text-white py-4 leading-7">
                                                <tr class="bg-teal-400 sm:table-row rounded-l-lg sm:rounded-none mb-2 sm:mb-0">
                                                    <th  class="p-2 whitespace-nowrap">Id</th>
                                                    <th  class="p-2 whitespace-nowrap">Tên tài khoản</th>
                                                    <th  class="p-2 whitespace-nowrap">Email</th>
                                                    <th  class="p-2 whitespace-nowrap">Tuổi</th>
                                                    <th  class="p-2 whitespace-nowrap">Giới tính</th>
                                                    <th  class="p-2 whitespace-nowrap">Phân quyền</th>
                                                    <th  class="p-2 whitespace-nowrap">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody  class="text-sm divide-y divide-gray-100">
                                                <%try {
                                                        int id = 1;

                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        String url = "jdbc:mysql://localhost:3306/quanlydethi";
                                                        String username = "root";
                                                        String password = "";

                                                        Connection conn = DriverManager.getConnection(url, username, password);
                                                        Statement stmt = conn.createStatement();

                                                        String query = request.getParameter("search");

                                                        String data;

                                                        if (query != null) {
                                                            data = "select * from accounts where fullname like '%" + query + "%' or email like'%" + query + "%'";
                                                        } else {
                                                            data = "select * from accounts";
                                                        }
                                                        ResultSet rs = stmt.executeQuery(data);
                                                        while (rs.next()) {
                                                %>
                                                <tr >
                                                    <td><%=id%></td>
                                                    <td><%out.println(rs.getString("fullname")); %></td>
                                                    <td><%out.println(rs.getString("email")); %></td>
                                                    <td><%out.println(rs.getString("tuoi")); %></td>
                                                    <td>
                                                        <%
                                                            if (rs.getString("gioiTinh").equals("Male")) {
                                                                out.println("Nam");
                                                            } else if (rs.getString("gioiTinh").equals("Female")) {
                                                                out.println("Nữ");
                                                            } else {
                                                                out.println("Không xác định");
                                                            }
                                                        %>
                                                    </td>
                                                    <td>
                                                        <%
                                                            if (rs.getString("roleId").equals("1")) {
                                                                out.println("Admin");
                                                            } else {
                                                                out.println("Student");
                                                            }
                                                        %>
                                                    </td>
                                                    <td class="py-3 px-6 text-center">
                                                        <div class="flex item-center justify-center">
                                                            <a href="detailAccount.jsp?id=<%out.println(rs.getString("id")); %> ">
                                                                <div class="w-4 mr-2 transform hover:text-purple-500 hover:scale-110">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                                                    </svg>
                                                                </div>
                                                            </a> 
                                                            <a href="editAccount.jsp?id=<%out.println(rs.getString("id")); %> ">
                                                                <div class="w-4 mr-2 transform hover:text-purple-500 hover:scale-110">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                                                    </svg>
                                                                </div>
                                                            </a> 
                                                            <a href="DeleteAccountServlet?id=<%out.println(rs.getString("id")); %> ">
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
                                                <%
                                                            id++;
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
    </body>
</html>
