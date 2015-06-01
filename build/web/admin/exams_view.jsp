<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
    <head>
<%

response.setHeader("Cache-Control","no-store, must-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires", -1);
    
    if (session.getAttribute("user") == null){
        response.sendRedirect("redirect.jsp");
    }
    
%>
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
        <jsp:include page="../resources/empire_includes/empire_navigationbar.jsp" />

<!-- _____________________________________________________________________________________________ -->
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12" align="center">
                        <h1 class="page-header">
                            <i class="fa fa-plus-square fa-fw"></i>
                            Exams List
                        </h1>
                    </div>  
                    <div class="col-sm-12">                        
                        </br><h4><font color="blue">${message}</font></h4></br>
                    </div> 
                    <div class="col-lg-8">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Exam Title</th>                                                                     
                                    <th>Exam Start</th>                                                                     
                                    <th>Exam Due</th>
                                    <th>Items</th>
                                    <th>Time Limit</th>
                                    <th colspan="2">Actions</th>
                                </tr>
                            </thead>
                                <c:forEach items="${exams}" var="temp">
                                <tr>
                                    <td>${temp.getExamTitle()}</td>
                                    <td>${temp.getExamStart()}</td>
                                    <td>${temp.getExamDue()}</td>
                                    <td>${temp.getNumQuestions()}</td>
                                    <td>${temp.getTimeLimit()}</td>
                                    <td>
                                        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target=".${temp.getExamId()}delete">
                                            Delete
                                        </button>
                                        <!-- Modal Warning <DELETE> -->
                                        <div class="${temp.getExamId()}delete modal fade" id="myModal" role="dialog">
                                            <div class="modal-dialog modal-sm">
                                              <!-- Modal content-->
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                  <h4 class="modal-title">Alliance E-Learning System</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Are you sure you want to delete ${temp.getExamTitle()}?</p>
                                                </div>
                                                <div class="modal-footer">
                                                 <form action="examactions.htm" method="POST">                                            
                                                        <input type="hidden" name="examId" value="${temp.getExamId()}"/>  
                                                        <input type="hidden" name="courseId" value=""/>
                                                        <input type="submit" name="action" value="Delete" class="btn btn-danger" />
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                   </form>
                                                </div>
                                              </div>
                                            </div>
                                        </div>
                                    </td>
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
