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
        <title>Alliance E-Learning System | Edit Chapter</title>
        <jsp:include page="../resources/empire_includes/above_links.html" />         
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="../resources/empire_includes/empire_navigationbar.jsp"/>
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12" align="center">
                        <h1 class="page-header">
                            <i class="fa fa-plus-square fa-fw"></i>
                            Edit Chapter
                        </h1>
                    </div>
                    <div class="col-lg-8">
                        <form:form class="form-horizontal" role="form" method="POST" 
                                   action="chapteractions.htm" commandName="tempChapter">
                            <input type="hidden" name="action" value="edit"/>
                            <input type="hidden" name="chapterId" value="${tempChapter.getChapterId()}"/>
                            <h4>Chapter Details:</h4>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Courses</label>
                                <div class="col-sm-7">
                                    <select class="form-control" name="courseId">
                                        <c:forEach items="${courses}" var="temp">
                                            <option value="${temp.getCourseId()}" ${courseTitle.equals(temp.getCourseTitle())? "selected" : ""}> 
                                                ${temp.getCourseTitle()}</option>                                                
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Chapter Number: </label>
                                <div class="col-sm-7">
                                    <form:input path="chapterNumber" type="text" value="${temp.getChapterNumber()}" class="form-control"/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Chapter Title: </label>
                                <div class="col-sm-7">
                                    <form:input path="chapterTitle" type="text" value="${temp.getChapterTitle()}" class="form-control"/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Description</label>
                                <div class="col-sm-7">
                                    <form:textarea path="description" type="text" value="${temp.getDescription()}" class="form-control"/>
                                </div>
                            </div>                                                        
                                                        
                            <div class="form-group" align="right">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-7">                              
                                  <button onclick="return confirm('Are you sure you want to add chapter?')" type="submit" class="btn btn-primary">
                                    <i class="fa fa-pencil fa-fw"></i>
                                        Update Chapter
                                  </button>
                                </div>
                            </div>

                        </form:form>
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
