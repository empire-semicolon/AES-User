<%-- 
    Document   : index.jsp
    Created on : May 16, 2015, 9:52:05 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Alliance E-Learning System | Administrator</title>
       <jsp:include page="../resources/empire_includes/above_links.html" /> 
    </head>
    <body>
    <div id="wrapper">
        <jsp:include page="../resources/empire_includes/empire_navigationbar.jsp" />
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12" align="center">
                        <h1 class="page-header">
                            <img src="resources/images/aes_logo_1.png" height="100"><span>Alliance E-learning System</span>
                            <br><small>>Admin Section<</small>
                        </h1> 
                        <strong><i>Welcome to AES: Admin Section!</i></strong>
                        <br>In here, you can:
                        <div class="table-bordered">
                            <dl>
                                <dd><a href="">Link 1</a></dd>
                                <dd><a href="">Link 2</a></dd>
                                <dd><a href="">Link 3</a></dd>
                                <dd><a href="">Link 4</a></dd>
                            </dl>
                        </div>
                    </div>


                </div>                               
            </div>
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    
    <jsp:include page="jquery.jsp" />
    </body>
</html>