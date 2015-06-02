<%-- 
    Document   : navbar
    Created on : May 18, 2015, 1:21:21 AM
    Author     : Mark
--%>

<%@page import="com.aes.model.UserBean"%>
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0; height: 50px">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="home.htm">
            <img src="../resources/images/aes_logo_3.png" class="img-responsive" height="40" width="210" style="margin-top:-20px">
        </a>
    </div>
    <!-- /.navbar-header -->
    <ul class="nav navbar-top-links navbar-right">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-user fa-fw"></i> ${userName}<i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="view_profile.htm"><i class="fa fa-user fa-fw"></i> User Profile</a>
                </li>
                <li class="divider"></li>
                <li><a href="../logout.htm"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->
    <!-- Sidebar Navigation Here -->
    <jsp:include page="sidebar.jsp" />
    <!-- /.navbar-static-side -->
</nav>
