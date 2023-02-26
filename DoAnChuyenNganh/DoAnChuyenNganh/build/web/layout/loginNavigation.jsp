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
    <style>
        .gradient {
            background: linear-gradient(90deg, #d53369 0%, #daae51 100%);
        }
    </style>
    <body style=" text-align:center;display:grid;grid-template-rows: auto 1fr auto;min-height:100vh;">
        <nav class="fixed w-full z-30 top-0 text-white bg-gray-600">
            <div class="w-full container mx-auto flex flex-wrap items-center justify-between mt-0 py-2">
                <div class="pl-4 flex items-center">
                    <a href="index.html" class="toggleColour text-white no-underline hover:no-underline font-bold text-2xl lg:text-4xl" href="#">
                        ĐỒ ÁN CHUYÊN NGÀNH
                    </a>
                </div>
                <div class="block lg:hidden pr-4">
                    <button id="nav-toggle" class="flex items-center p-1 text-pink-800 hover:text-gray-900 focus:outline-none focus:shadow-outline transform transition hover:scale-105 duration-300 ease-in-out">
                        <svg class="fill-current h-6 w-6" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <title>Menu</title>
                        <path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z" />
                        </svg>
                    </button>
                </div>
                <div class="w-full flex-grow lg:flex lg:items-center lg:w-auto hidden mt-2 lg:mt-0 bg-white lg:bg-transparent text-black p-4 lg:p-0 z-20" id="nav-content">
                    <ul class="list-reset lg:flex justify-end flex-1 items-center">
                        <li class="mr-3">
                            <a href="login.jsp" class="inline-block md:text-white text-black no-underline  hover:text-underline py-2 px-4 hover:text-gray-300" href="#">Đăng nhập</a>
                        </li>
                        <li class="mr-3">
                            <a href="register.jsp" class="inline-block md:text-white text-black no-underline  hover:text-underline py-2 px-4 hover:text-gray-300" href="#">Đăng ký</a>
                        </li>
                    </ul>
                </div>
            </div>
            <hr class="border-b border-gray-100 opacity-25 my-0 py-0" />
        </nav>
    </body>
</html>
