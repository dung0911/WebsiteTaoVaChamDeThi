<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <title>Quản lý đề thi</title>
        <link rel="stylesheet" href="https://unpkg.com/tailwindcss/dist/tailwind.min.css" />
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700" rel="stylesheet" />
        <script src="https://cdn.tailwindcss.com"></script>
    </head>

    <body  class="leading-normal tracking-normal text-white gradient" style="font-family: 'Source Sans Pro', sans-serif;">
        <!--Nav-->
        <%@ include file="layout/loginNavigation.jsp" %>  

        <!--Register-->
        <div class="grid place-items-center h-screen">
            <div class="p-10 xs:p-0 mx-auto md:w-full md:max-w-md">
                <h1 class="font-bold text-center text-2xl mb-5">Đăng ký</h1>
                <div class="bg-white shadow w-full rounded-lg divide-y divide-gray-200">
                    <div class="px-5 py-7">
                        <form  action="<%= request.getContextPath()%>/RegisterServlet" method="post">
                            <label  class="font-semibold text-sm text-gray-600 pb-1 block" for="email">Full name: </label>
                            <input required class="border rounded-lg px-3 py-2 mt-1 mb-5 text-sm w-full text-black" placeholder="Enter your email" name="fullname" size="30" />
                            <br><br>
                            <label  class="font-semibold text-sm text-gray-600 pb-1 block" for="email">Email:</label>
                            <input required type="email"  class="border rounded-lg px-3 py-2 mt-1 mb-5 text-sm w-full text-black" placeholder="Enter your email" name="email" size="30" />
                            <br><br>
                            <label class="font-semibold text-sm text-gray-600 pb-1 block" for="password">Password:</label>
                            <input required class="border rounded-lg px-3 py-2 mt-1 mb-5 text-sm w-full text-black" placeholder="Enter your password" type="password" name="password" size="30" />
                            <br>${message}

                            <br><br>           
                            <button class="transition duration-200 bg-blue-500 hover:bg-blue-600
                                    focus:bg-blue-700 focus:shadow-sm focus:ring-4 focus:ring-blue-500
                                    focus:ring-opacity-50 text-white w-full py-2.5 rounded-lg text-sm
                                    shadow-sm hover:shadow-md font-semibold text-center inline-block" type="submit">
                                Đăng ký
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>