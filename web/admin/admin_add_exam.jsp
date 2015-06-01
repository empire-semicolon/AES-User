<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
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
<script type='text/javascript'>
</script>


    <head>
        <title>Alliance E-Learning System | Add Exam</title> 
    </head>
    <body>
    <div id="wrapper">
        <%@ page errorPage="admin/error_page.jsp" %>
        <jsp:include page="../resources/empire_includes/above_links.html" />
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
                            Add Exam
                        </h1>
                    </div>                                                                                                
                    
                    <div class="col-lg-8">
                        <form class="form-horizontal" role="form" action="examactions.htm" method="POST">
                            <input type="hidden" name="action" value="add" />
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Courses</label>
                                <div class="col-sm-7">
                                    <select class="form-control" name="courseId" required>
                                        <c:forEach items="${courses}" var="temp">
                                            <option value="${temp.getCourseId()}">${temp.getCourseTitle()}</option>                                                
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                                                        
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Exam Title:</label>
                                <div class="col-sm-7">
                                    <input name="examTitle" type="text" class="form-control" required/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <div class="form-group">
                                <label class="col-sm-3 control-label">Exam Start:</label>
                                <div class="col-sm-7">
                                    <input name="examStart" type="datetime-local" class="form-control" required/>
                                </div>
                                </div>
                            </div>
                                
                            <div class="form-group">
                                <div class="form-group">
                                <label class="col-sm-3 control-label">Exam Due:</label>
                                <div class="col-sm-7">
                                    <input name="examDue" type="datetime-local" class="form-control" required/>
                                </div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Time Limit:</label>
                                <div class="col-sm-7">
                                    <input name="timeLimit" type="number" class="form-control" required/>
                                </div>
                            </div>                                                        
                                                                                    
                    <%
                        for (int j = 0; j < 10; j++){
                    %>
                    <div class="col-lg-10" aliign="right">
                        <div style="vertical-align: top;">
                            <label>Question <%=j+1%>: </label> 
                            <textarea name="questions" rows="5" class="form-control" required></textarea>
                        </div>
                        <div style="width: 100%;">
                            <div style="display: inline-block; width: 10%; vertical-align: top;">
                                <label>Answer: </label> <input type="text" name="answers" class="form-control" required/>
                            </div>
                            <div style="display: inline-block; width: 15%;">
                                <label>Choices: </label> 
                                <input type="text" name="choice<%=j+1%>" class="form-control choice"/>
                                <input type="text" name="choice<%=j+1%>" class="form-control choice" required/>
                                <input type="text" name="choice<%=j+1%>" class="form-control choice" required/>
                            </div>
                        </div>
                    </div>
                    <%}%>  
                    
                    <div class="form-group" align="right">
                        <label class="col-sm-3 control-label"></label>
                        <div class="col-sm-7">                              
                          <button onclick="return confirm('Are you sure you want to add Exam? This will delete any created exam for this course.')" type="submit" class="btn btn-primary">
                            <i class="fa fa-plus-circle fa-fw"></i>
                            Add Exam
                          </button>
                        </div>
                    </div>                    
                    </form>
                </div>                               
            </div>
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
<!-- _____________________________________________________________________________________________ -->


    <script>
            $(".btn").click(function(){
                $.ajax({
                    data: $(".form").serialize(),
                    success: function (data) {
                    }
                });
            });
    </script>

    
    <jsp:include page="../resources/empire_includes/scripts.html" /> 
    </body>
