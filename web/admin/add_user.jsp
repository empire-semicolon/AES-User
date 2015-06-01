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
<jsp:include page="../resources/empire_includes/redirect_empty.jsp" />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Alliance E-Learning System | Add User</title>
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
                            <i class="fa fa-plus-square fa-fw"></i>
                            Add User
                        </h1>
                    </div>
                    <div class="col-sm-12">                        
                        </br><h4><font color="blue">${message}</font></h4></br>
                    </div> 
                    <div class="col-lg-8">
                        <form:form class="form-horizontal" role="form" method="POST" 
                                   action="useractions.htm" commandName="tempUser">
                            <input type="hidden" name="action" value="add"/>
                            <input type="hidden" name="userId" value="322"/>
                            <input type="hidden" name="trainerChosen1">
                            <input class="form-control" type="hidden" name="searchKey"/>
                            <h4>Personal Information:</h4>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">First Name:</label>
                                <div class="col-sm-7">
                                    <form:input path="firstName" type="text" class="form-control"/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Middle Name:</label>
                                <div class="col-sm-7">
                                    <form:input path="middleName" type="text" class="form-control"/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Last Name:</label>
                                <div class="col-sm-7">
                                    <form:input path="lastName" type="text" class="form-control"/>
                                </div>
                            </div>                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Company ID:</label>
                                <div class="col-sm-7">
                                    <form:input path="companyId" type="number" class="form-control"/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Business Unit:</label>
                                <div class="col-sm-7">
                                    <select class="form-control" name="buChosen">
                                        <c:forEach items="${businessUnit}" var="bu">
                                            <option value="${bu.businessUnitId}">${bu.businessUnit}</option>                                                
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Position:</label>
                                <div class="col-sm-7">
                                    <form:input path="position" type="text" class="form-control"/>
                                </div>
                            </div>                                                       
                                
                            <div class="form-group">
                                <label class="col-sm-3 control-label">E-mail:</label>
                                <div class="col-sm-7">                                    
                                    <form:input path="email" type="email" class="form-control" value="${tempUser.email}"/>
                                </div>
                            </div>

                            <h4>Credentials:</h4>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Username:</label>
                                <div class="col-sm-7">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="fa fa-user fa-fw"></i>
                                        </span>
                                        <form:input path="userName" type="text" class="form-control"/>
                                    </div>
                                </div>
                            </div>                            

                            <div class="form-group">
                                <label class="col-sm-3 control-label">User Type:</label>
                                <div class="col-sm-7">
                                    <select class="form-control" name="userTypeChosen">
                                        <c:forEach items="${userType}" var="type">
                                            <option value="${type.userTypeId}">${type.userType}</option>                                                
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group" align="right">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-7">                              
                                  <button onclick="return confirm('Are you sure you want to add user?')" type="submit" class="btn btn-primary">
                                    <i class="fa fa-pencil fa-fw"></i>
                                        Add User
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
