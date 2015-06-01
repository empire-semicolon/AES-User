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
        <title>Alliance E-Learning System | Assign Course</title>
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
                            Assign Course
                        </h1>
                    </div>
                    <div class="col-lg-8">
                        <form:form class="form-horizontal" role="form" method="POST" 
                                   action="assignmentactions.htm" commandName="tempAssignment">
                            <input type="hidden" name="userId" value="${userId}"/>
                            <input type="hidden" name="assignmentId" value=""/>                            
                            <input type="hidden" name="action" value="add"/>  
                            <h4>Assign Courses for ${name}</h4></br>
                            <font color="blue"><h5>${message}</h5></font></br>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Courses</label>
                                <div class="col-sm-7">
                                    <select class="form-control" name="courseId">
                                        <c:forEach items="${courses}" var="temp">
                                            <option value="${temp.getCourseId()}">${temp.getCourseTitle()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>                                                                                                                                                                                                                                                                       
                                                        
                            <div class="form-group" align="right">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-7">                              
                                  <button onclick="return confirm('Are you sure you want to assign course to user?')" type="submit" class="btn btn-primary">
                                        Add
                                  </button>
                                </div>
                            </div>
                        </form:form>
                        <div class="col-lg-10">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Courses Assigned</th>                                                                           
                                        <th>Description</th>  
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                    <c:forEach items="${assigned}" var="temp">
                                    <tr>
                                        <td>${temp.getCourse().getCourseTitle()}</td>
                                        <td>${temp.getCourse().getCourseDescription()}</td>                                    
                                        <td> 
                                            <form class="form-horizontal" role="form" method="POST" 
                                                  action="assignmentactions.htm">
                                                <input type="hidden" name="userId" value="${userId}"/>
                                                <input type="hidden" name="assignmentId" value="${temp.getAssignmentId()}"/>                            
                                                <input type="hidden" name="action" value="delete"/> 
                                                <input type="hidden" name="courseId" value=""/>
                                                <button onclick="return confirm('Are you sure you want to delete assignment?')" type="submit" class="btn btn-danger">
                                                    <i class="fa fa-pencil fa-fw"></i>
                                                        Delete
                                                 </button>
                                            </form>
                                        </td>
                                    </tr>
                                    </c:forEach>
                             </table>           
                        </div>
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
