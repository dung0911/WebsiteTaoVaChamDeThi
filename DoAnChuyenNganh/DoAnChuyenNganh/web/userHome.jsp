<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body class="text-gray-700 bg-white antialiased" style="font-family: 'Roboto', sans-serif">

        <!--Nav-->
        <%@ include file="layout/userNavigation.jsp" %>  

        <!--Hero
        style="background: linear-gradient(90deg, #2b4554 0%, #767ba2 100%)"
        -->
        <div class="py-20 bg-cover bg-no-repeat bg-fixed" style="background-image: url(images/a.jpg)">
            <div class="container m-auto text-center px-6 opacity-100">
                <h3 class="text-2xl mb-8 text-gray-200">“Define success on your own terms, achieve it by your own rules, and build a life you’re proud to live.”</h3>
            </div>
        </div>

        <!-- Features -->
        <section class="container mx-auto px-6 p-10">
            <h2 class="text-4xl font-bold text-center text-gray-800 mb-8">Let's Go!</h2>
            <div class="flex items-center flex-wrap mb-20">
                <div class="w-full md:w-1/2 pr-5">
                    <h4 class="text-3xl text-gray-800 font-bold mb-3">Phải làm gì nếu cần mài dũa kỹ năng của bản thân?</h4>
                    <p class="text-gray-600 mb-8">
                        Những đề thi này giúp cá nhân mỗi người nâng cao kỹ năng trong học tập, mài dũa cá nhân, giúp phát triển tư duy logic khi gặp những vấn đề khó và khuyến khích chúng ta để giải những vấn đề đó.

                    </p>
                </div>
                <div class="w-full md:w-1/2">
                    <img class="rounded-lg" src="images/study.png" alt="Syncing" />
                </div>
            </div>
            <div class="flex items-center flex-wrap mb-20">
                <div class="w-full md:w-1/2">
                    <img class="rounded-lg" src="images/unit-3-what-do-you-study.jpg" alt="Syncing" />
                </div>
                <div class="w-full md:w-1/2 pl-5">
                    <h4 class="text-3xl text-gray-800 font-bold mb-3">Con đường học của bạn để học tốt nhất.</h4>
                    <p class="text-gray-600 mb-8">
                        Từng  bài kiểm tra chuyên sâu làm cho việc học 
                        trở nên thú vị, hiệu quả và bổ ích. Cách tiếp cận độc đáo của chúng 
                        tôi khuyến khích sự tiến triển liên tục với một con đường rõ ràng để 
                        cải thiện các kỹ năng. Chúng tôi có trình độ cho các trường học, 
                        giáo dục nói chung và đại học và kinh doanh.
                    </p>
                </div>
            </div>

            <div class="flex items-center flex-wrap mb-20">
                <div class="w-full md:w-1/2  pr-5">
                    <h4 class="text-3xl text-gray-800 font-bold mb-3">Kiểm tra kỹ năng bản thân trên nền tảng trực tuyến</h4>
                    <p class="text-gray-600 mb-8">
                        Trang web cung cấp những bài kiểm tra trực tuyến 
                        nhanh chóng và thuận tiện để 
                        giúp các tổ chức giáo dục đại học và nhà tuyển 
                        dụng kiểm tra cấp độ bản thân, của các cá nhân và 
                        nhóm ứng cử viên. Nó kết hợp công nghệ mới nhất với 
                        độ tin cậy và chất lượng.
                    </p>
                </div>
                <div class="w-full md:w-1/2">
                    <img class="rounded-lg" src="images/books.png" alt="Syncing" />
                </div>
            </div>
        </section>

        <!--Footer-->
        <%@ include file="layout/userFooterHomePage.jsp" %>  
    </body>
</html>
