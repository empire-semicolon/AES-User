<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

response.setHeader("Cache-Control","no-store, must-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires", -1);
    
    if (session.getAttribute("user") == null){
        response.sendRedirect("redirect.jsp");
    }
    
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Alliance E-Learning System | Administrator</title>
        <jsp:include page="../resources/empire_includes/above_links.html" />        
    </head>
    <body>
    <div id="wrapper">        
        <jsp:include page="../resources/empire_includes/empire_header.jsp" />
        <jsp:include page="../resources/empire_includes/empire_sidebar.jsp" />           
        </nav>
        <div id="page-wrapper">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12" align="center">
                        <h1 class="page-header">
                            <img src="../resources/images/aes_logo_1.png" height="100"><span>Alliance E-learning System</span>
                            <br><small>>Admin Section<</small>
                        </h1> 
                        <strong><i>Welcome to AES: Admin Section!</i></strong>
                        </div>
                    </div>
                </div>                               
            </div>
        </div>
    </div>
        <jsp:include page="../resources/empire_includes/scripts.html" />        
    </body>
</html>