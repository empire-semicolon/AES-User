<%-- 
    Document   : index
    Created on : May 16, 2015, 8:16:21 PM
    Author     : Bryan
--%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" />
        <title>Alliance E-Learning System | Log In</title>
    </head>
    <body>
        <div>
            <form action="login" method="POST">
                Username: <input type="text" name="username"/>
                Password: <input type="password" name="password"/>
                <input type="submit" value="LOGIN"/>
            </form>
        </div>
    </body>
</html>
