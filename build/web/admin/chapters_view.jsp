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
                            ${course.getCourseTitle()} Chapters List
                        </h1>
                    </div>                    
                    <div class="col-sm-12">                        
                        </br><h4><font color="blue">${message}</font></h4></br>
                    </div> 
                    <div class="col-lg-12">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Chapter Number</th>       
                                    <th>Chapter Title</th>                                                                     
                                    <th>Chapter Description</th>
                                    <th colspan="3"></th>
                                </tr>
                            </thead>
                                <c:forEach items="${chapters}" var="temp">
                                <tr>
                                    <td>${temp.getChapterNumber()}</td>
                                    <td>${temp.getChapterTitle()}</td>
                                    <td>${temp.getDescription()}</td>
                                    <td>
                                        <form action="edit_chapter.htm" method="POST">
                                            <input type="hidden" name="courseId" value="${course.getCourseId()}"/>  
                                            <input type="hidden" name="chapterId" value="${temp.getChapterId()}"/>
                                            <input type="submit" name="action" value="Edit" class="btn btn-info btn-sm" />
                                        </form>
                                    <td>
                                        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target=".${temp.getChapterId()}delete">
                                            Delete
                                        </button>
                                        <!-- Modal Warning <DELETE> -->
                                        <div class="${temp.getChapterId()}delete modal fade" id="myModal" role="dialog">
                                            <div class="modal-dialog modal-sm">
                                              <!-- Modal content-->
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                  <h4 class="modal-title">Alliance E-Learning System</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Are you sure you want to delete Chapter ${temp.getChapterNumber()}: ${temp.getChapterTitle()}?</p>
                                                </div>
                                                <div class="modal-footer">
                                                  <form action="chapteractions.htm" method="POST">                                            
                                                        <input type="hidden" name="courseId" value="${course.getCourseId()}"/>  
                                                        <input type="hidden" name="chapterId" value="${temp.getChapterId()}"/>  
                                                        <input type="submit" name="action" value="Delete" class="btn btn-danger" />
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                   </form>
                                                </div>
                                              </div>
                                            </div>
                                        </div>          
                                    </td>
                                    <td>    
                                        <form action="add_presentation.htm" method="POST">                                            
                                            <input type="hidden" name="chapterId" value="${temp.getChapterId()}"/>  
                                            <input type="submit" name="action" class="btn btn-success" value="View Presentations"/>
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
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
<!-- _____________________________________________________________________________________________ -->
        <jsp:include page="../resources/empire_includes/scripts.html" /> 
    </body>    
</html>
