<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <title>Alliance E-Learning System | Manage Course Category</title>
        <jsp:include page="../resources/empire_includes/above_links.html" />         
    </head>
    <body>
        <div id="wrapper">
        <jsp:include page="../resources/empire_includes/empire_header.jsp" />
        <jsp:include page="../resources/empire_includes/empire_sidebar.jsp" />           
        </nav>

<!-- _____________________________________________________________________________________________ -->
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12" align="center">
                        <h1 class="page-header">
                            <i class="fa fa-plus-square fa-fw"></i>
                            Manage Course Categories
                        </h1>
                    </div>
                    <div class="col-sm-4">
                        <div class="table-responsive">
                            <table class="table">
                                <form:form class="form-horizontal" role="form" method="POST" 
                                           action="categoryactions.htm" commandName="category">
                                        <tr>
                                            <td>Course Category ID</td>
                                            <td><form:input path="courseCategoryId" type="text" class="form-control" /></td>
                                        </tr>
                                        <tr>
                                            <td>Course Category Name</td>
                                            <td><form:input path="courseCategory" type="text" class="form-control"/></td>
                                        <tr>
                                            <td colspan="2" align="right">                                                
                                                <input onclick="return confirm('Are you sure you want to add?')" type="submit" name="action" value="Add" class="btn btn-info" />                                                
                                                <input onclick="return confirm('Are you sure you want to edit?')" type="submit" name="action" value="Edit" class="btn btn-success" />                                                
                                                <input type="submit" name="action" value="Search" class="btn btn-default" />                                                
                                            </td>                                         
                                        </tr>                            
                                </form:form>
                             </table>           
                        </div>
                    </div>
                    <div class="col-sm-12">                        
                            <table></table>
                    </div> 
                    <div class="col-lg-4">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Course Category Name</th>       
                                    <th>Course Category Id</th>                                                                     
                                </tr>
                            </thead>
                                <c:forEach items="${categories}" var="temp">
                                <tr>
                                    <td>${temp.getCourseCategory()}</td>
                                    <td>${temp.getCourseCategoryId()}</td>                                    
                                </tr>
                                </c:forEach>
                         </table>           
                    </div>
                    </div>
                </div>                               
            </div>
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
<!-- _____________________________________________________________________________________________ -->
        <jsp:include page="../resources/empire_includes/scripts.html" /> 
    </body>    
</html>
