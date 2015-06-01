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
        <title>Alliance E-Learning System | Manage Courses</title>
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
                                <i class="fa fa-cogs fa-fw"></i>
                                Manage Course
                            </h1>
                        </div>
                        <div class="col-sm-12">                        
                            </br><h4><font color="blue">${message}</font></h4></br>
                        </div> 
                        <!--<div class="col-sm-3">
                                </div>
                                <div class="col-sm-6">
                                    <div class="alert alert-info">
                                        <strong>No results found!</strong>
                                    </div>
                                </div>
                            <div class="col-sm-3">
                            </div>-->
                            <div class="row" style="padding-bottom: 20px">
                                <div class="col-lg-12">
                                    <form class="form-inline" role="form" method="POST" action="courseactions.htm">
                                        <div class="form-group">
                                            <input class="form-control" type="text" name="searchKey"/>
                                            <input type="hidden" name="courseId" value="111"/>
                                            <input type="hidden" name="tempCourse" value="null"/>                                                                                                               
                                            <input type="hidden" name="trainerChosen" value="322"/>
                                            <input type="hidden" name="trainerChosen1" value="322"/>
                                            <input type="hidden" name="categoryChosen" value="322"/>                               
                                            <input type="hidden" name="action" value="search"/>
                                            <button type="submit" class="btn btn-primary">
                                                <i class="fa fa-search fa-fw"></i>Search
                                            </button>
                                        </div>                                            
                                    </form>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Course ID</th>
                                                <th>Course Title</th>
                                                <th>Course Description</th>
                                                <th colspan="3"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           <c:forEach items="${allCourses}" var="temp">
                                           <tr>
                                                <td>${temp.getCourseId()}</td>
                                                <td>${temp.getCourseTitle()}</td>
                                                <td>${temp.getCourseDescription()}</td>
                                                <td>
                                                    <form action="courseedit.htm" method="POST">    
                                                        <input type="hidden" name="courseId" value="${temp.getCourseId()}"/>
                                                        <input type="hidden" name="tempCourse" value="null"/>                                                                                                               
                                                        <input type="hidden" name="trainerChosen" value="322"/>
                                                        <input type="hidden" name="trainerChosen1" value="322"/>
                                                        <input type="hidden" name="searchKey"/>
                                                        <input type="hidden" name="categoryChosen"/>
                                                        <input class="btn btn-info btn-sm" type="submit" name="action" value="Edit" />
                                                    </form> 
                                                </td>
                                                <td>
                                                    <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target=".${temp.getCourseId()}delete">
                                                        Delete
                                                    </button>
                                                    <!-- Modal Warning <DELETE> -->
                                                    <div class="${temp.getCourseId()}delete modal fade" id="myModal" role="dialog">
                                                        <div class="modal-dialog modal-sm">
                                                          <!-- Modal content-->
                                                          <div class="modal-content">
                                                            <div class="modal-header">
                                                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                              <h4 class="modal-title">Alliance E-Learning System</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <p>Are you sure you want to delete ${temp.getCourseTitle()}?</p>
                                                            </div>
                                                            <div class="modal-footer">
                                                              <form action="courseactions.htm" method="POST">    
                                                                    <input type="hidden" name="courseId" value="${temp.getCourseId()}"/>
                                                                    <input type="hidden" name="tempCourse" value="null"/>                                                                                                               
                                                                    <input type="hidden" name="trainerChosen" value="322"/>
                                                                    <input type="hidden" name="trainerChosen1" value="322"/>
                                                                    <input type="hidden" name="searchKey"/>
                                                                    <input type="hidden" name="categoryChosen"/>
                                                                    <input class="btn btn-danger" type="submit" name="action" value="Delete" />
                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                               </form>
                                                            </div>
                                                          </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <form action="view_chapters.htm" method="POST">                                                            
                                                        <input class="btn btn-success btn-sm" type="submit" name="action" value="View Chapters" />
                                                        <input type="hidden" name="courseId" value="${temp.getCourseId()}" />
                                                    </form> 
                                                </td>
                                           </tr>
                                           </c:forEach>
                                        </tbody>
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
        
        <jsp:include page="../resources/empire_includes/scripts.html" /> 
    </body>
</html>