<%-- 
    Document   : login
    Created on : 05 22, 15, 7:29:22 AM
    Author     : RCBG
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Alliance E-Learning System</title>

        <!-- Bootstrap Core CSS -->
        <link href="resources/bower_components/bootstrap/dist/css/bootstrap_paper.css" rel="stylesheet">

        <link href="resources/bower_components/bootstrap/dist/css/additional.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="resources/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

        <!-- Timeline CSS -->
        <link href="resources/dist/css/timeline.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="resources/dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts (for images) -->
        <link href="resources/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">        

        <link rel="stylesheet" type="text/css" href="resources/bower_components/datatables/media/css/jquery.dataTables.min.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <div class="account-wall">
                        <div id="my-tab-content" class="tab-content">
                            <div class="tab-pane active" id="login">
                                <img class="center-block" src="resources/images/aes_logo_1.png" height="141" width="164"
                            alt="">
								<form class="form-signin" action="login.htm" method="POST">
									<input name="username" maxlength="50" type="text" class="form-control" placeholder="Username" />
									<input name="password" maxlength="50" type="password" class="form-control" placeholder="Password" />
									<input type="submit" class="btn btn-lg btn-default btn-block" value="Sign In" />
								</form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <!-- jQuery -->
    <script src="resources/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="resources/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="resources/dist/js/sb-admin-2.js"></script>

    <script src="resources/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>

    <!-- DataTables Scripts -->
    <script src="resources/bower_components/datatables/media/js/dataTables-init.js"></script>

    <!-- AJAX Scripts -->
    <!-- <script src="../resources/dist/js/user_ajax.js"></script>
    <script src="../resources/dist/js/admin_ajax.js"></script> -->
</html>
