<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%

response.setHeader("Cache-Control","no-store, must-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires", -1);
    
    if (session.getAttribute("user") == null){
        response.sendRedirect("admin/redirect.jsp");
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
        <title>Alliance E-Learning System | Manage Users</title>
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
                                Manage Users
                            </h1>
                        </div>
                        <div class="col-sm-12">                        
                         </br><h4><font color="blue">${message}</font></h4></br>
                        <!--<div class="col-sm-3"></div>
                            <div class="col-sm-6">
                                <div class="alert alert-info">
                                    <strong>${message}</strong>
                                </div>
                            </div>
                            <div class="col-sm-3"></div>-->
                        </div>     
                            <div class="row" style="padding-bottom: 20px">
                                <div class="col-lg-12">
                                    <form class="form-inline" role="form" method="POST" action="useractions.htm">
                                        <div class="form-group">
                                            <input class="form-control" type="text" name="searchKey"/>
                                            <input type="hidden" name="action" value="search"/>
                                            <input type="hidden" name="userId" value="322"/>
                                            <input type="hidden" name="tempUser" value="null"/>
                                            <input type="hidden" name="buChosen" value="null"/>
                                            <input type="hidden" name="userTypeChosen" value="null"/>
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
                                                <th>Name</th>
                                                <th>Position</th>
                                                <th>Username</th>
                                                <th>Email</th>
                                                <th colspan="4"></th>
                                            </tr>
                                        </thead>                                                                                            
                                        <tbody>
                                            <c:forEach items="${allUsers}" var="temp">   
                                            <tr>
                                                <td>${temp.getFirstName()} ${temp.getMiddleName()} ${temp.getLastName()}</td>
                                                <td>${temp.getPosition()}</td>
                                                <td>${temp.getUserName()}</td>
                                                <td>${temp.getEmail()}</td>
                                                <td>
                                                    <form action="useredit.htm" method="POST">
                                                        <input type="hidden" name="userId" value="${temp.getUserId()}"/>
                                                        <input type="hidden" name="searchKey"/>
                                                        <input type="hidden" name="tempUser" value="null"/>
                                                        <input type="hidden" name="buChosen" value="null"/>
                                                        <input type="hidden" name="userTypeChosen" value="null"/>
                                                        <input class="btn btn-info btn-sm" type="submit" name="action" value="Edit" />
                                                    </form>
                                                </td>
                                                <td>
                                                    <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target=".${temp.getUserId()}delete">
                                                        Delete
                                                    </button>
                                                    <!-- Modal Warning <DELETE> -->
                                                    <div class="${temp.getUserId()}delete modal fade" id="myModal" role="dialog">
                                                        <div class="modal-dialog modal-sm">
                                                          <!-- Modal content-->
                                                          <div class="modal-content">
                                                            <div class="modal-header">
                                                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                              <h4 class="modal-title">Alliance E-Learning System</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <p>Are you sure you want to delete ${temp.getFirstName()} ${temp.getLastName()}?</p>
                                                            </div>
                                                            <div class="modal-footer">
                                                              <form action="useractions.htm" method="POST">    
                                                                    <input type="hidden" name="userId" value="${temp.getUserId()}"/>
                                                                    <input type="hidden" name="searchKey"/>
                                                                    <input type="hidden" name="tempUser" value="null"/>                                                        
                                                                    <input type="hidden" name="buChosen" value="null"/>
                                                                    <input type="hidden" name="userTypeChosen" value="null"/>
                                                                    <input class="btn btn-danger" type="submit" name="action" value="Delete" />
                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                               </form>
                                                            </div>
                                                          </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target=".${temp.getUserId()}reset">
                                                        Reset Password
                                                    </button>
                                                    <!-- Modal Warning <RESET PASSWORD> -->
                                                    <div class="${temp.getUserId()}reset modal fade" id="myModal" role="dialog">
                                                        <div class="modal-dialog modal-sm">
                                                          <!-- Modal content-->
                                                          <div class="modal-content">
                                                            <div class="modal-header">
                                                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                              <h4 class="modal-title">Alliance E-Learning System</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                              <p>Are you sure you want to the reset password of ${temp.getFirstName()} ${temp.getLastName()}?</p>
                                                            </div>
                                                            <div class="modal-footer">
                                                              <form action="useractions.htm" method="POST">
                                                                    <input type="hidden" name="userId" value="${temp.getUserId()}"/>
                                                                    <input type="hidden" name="searchKey"/>
                                                                    <input type="hidden" name="tempUser" value="null"/>                                                        
                                                                    <input type="hidden" name="buChosen" value="null"/>
                                                                    <input type="hidden" name="userTypeChosen" value="null"/>                                                                                     
                                                                    <input class="btn btn-default" type="submit" name="action" value="Reset Password" />
                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                               </form>
                                                            </div>
                                                          </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <form action="assign_course.htm" method="POST">    
                                                        <input type="hidden" name="userId" value="${temp.getUserId()}"/>
                                                        <input class="btn btn-success btn-sm" type="submit" name="action" value="View Courses" /> 
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
        <jsp:include page="../resources/empire_includes/scripts.html" /> 
    </body>
</html>
