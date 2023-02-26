<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%
    //HERE WE GETTING THE ATTRIBUTE DECLARED IN VALIDATE.JSP AND CHECKING IF IT IS NULL, THE USER WILL BE REDIRECTED TO LOGIN PAGE
%><!-- NOT A VALID USER, IF THE USER TRIES TO EXECUTE LOGGED IN PAGE DIRECTLY, ACCESS IS RESTRICTED -->
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body  class="leading-normal tracking-normal text-white gradient" style="font-family: 'Source Sans Pro', sans-serif;">
        <!--Start Nav-->
        <%@ include file="layout/loginNavigation.jsp" %>  
        <!--End Nav-->
        <div class="grid place-items-center h-screen">
            <div class="p-10 xs:p-0 mx-auto md:w-full md:max-w-md">
                <h1 class="font-bold text-center text-2xl mb-5">Đăng nhập</h1>
                <div class="bg-white shadow w-full rounded-lg divide-y divide-gray-200">
                    <div class="px-5 py-7">
                        <form action="<%=request.getContextPath()%>/LoginServlet" method="post">
                            <label class="font-semibold text-sm text-gray-600 pb-1 block" for="email">Email:</label>
                            <input  required class="border rounded-lg px-3 py-2 mt-1 mb-5 text-sm w-full text-black" placeholder="Enter your Email" type="email" required name="email" size="30" />
                            <br><br>
                            <label class="font-semibold text-sm text-gray-600 pb-1 block" for="password">Password:</label>
                            <input  required class="border rounded-lg px-3 py-2 mt-1 mb-5 text-sm w-full text-black" placeholder="Enter your password" type="password" required name="password" size="30" />
                            <br>${message}
                            <br><br>           
                            <button class="transition duration-200 bg-blue-500 hover:bg-blue-600
                                    focus:bg-blue-700 focus:shadow-sm focus:ring-4 focus:ring-blue-500
                                    focus:ring-opacity-50 text-white w-full py-2.5 rounded-lg text-sm
                                    shadow-sm hover:shadow-md font-semibold text-center inline-block" type="submit">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>