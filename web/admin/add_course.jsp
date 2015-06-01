
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

response.setHeader("Cache-Control","no-store, must-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires", -1);
    
    if (session.getAttribute("user") == null){
        response.sendRedirect("redirect.jsp");
    }
    
%>
    <head>
        <title>Alliance E-Learning System | Add Course</title> 
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
                            Add Course
                        </h1>
                    </div>
                    <div class="col-sm-12">                        
                        </br><h4><font color="blue">${message}</font></h4></br>
                    </div> 
                    <div class="col-lg-8">
                        <form:form class="form-horizontal" role="form" method="POST" 
                                   action="courseactions.htm" commandName="tempCourse">
                            <input type="hidden" name="action" value="add" />
                            <input type="hidden" name="courseId" value="322" />
                            <input type="hidden" name="searchKey" value="add" />                            
                            <input type="hidden" name="trainerChosen1" value="" />                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Course Title:</label>
                                <div class="col-sm-7">
                                    <form:input path="courseTitle" type="text" class="form-control"/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Course Category:</label>
                                <div class="col-sm-7">
                                    <select class="form-control" name="categoryChosen">
                                    <c:forEach items="${categories}" var="temp">
                                            <option value="${temp.getCourseCategoryId()}">${temp.getCourseCategory()}</option>                                                
                                    </c:forEach>
                                    </select>        
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Course Outline:</label>
                                <div class="col-sm-7">
                                    <form:textarea class="form-control textarea" path="courseDescription" rows="10" />
                                </div>
                            </div>     
                                
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Course Trainer:</label>
                                <div class="col-sm-7">
                                    <select class="form-control" name="trainerChosen">
                                    <c:forEach items="${trainers}" var="temp">
                                            <option value="${temp.getUserId()}">${temp.getFirstName()} ${temp.getMiddleName()} ${temp.getLastName()}</option>                                                
                                    </c:forEach>
                                    </select>        
                                </div>
                            </div>
                                
                            <div class="form-group" align="right">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-7">                              
                                  <button onclick="return confirm('Are you sure you want to add course?')" type="submit" class="btn btn-primary">
                                    <i class="fa fa-plus-circle fa-fw"></i>
                                    Add Course
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
