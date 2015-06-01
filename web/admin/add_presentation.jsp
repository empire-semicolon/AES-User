<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../resources/empire_includes/redirect_empty.jsp" />
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
        <title>Alliance E-Learning System | Assign Course</title>
        <jsp:include page="../resources/empire_includes/above_links.html" />  
        <style>
	 		.top-buffer { 
	 			margin-top:20px; 
                                margin-bottom:12px; 
                                margin-left: 12px;
                                margin-right: 12px;
	 		}	

	 </style>
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
                            Upload Presentation
                        </h1>
                    </div>                                        
                    <div class="col-sm-12">                        
                        </br><h4><font color="blue">${message}</font></h4></br>
                    </div> 
                    <div class="col-lg-8">                       
                        <form:form name="form1" id="form1" action="addpresentation.htm" method="POST" enctype="multipart/form-data">                            
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <input type="file" size="150" name="file1" required/>   
                                    <input type="hidden" name="chapterId" value="${chapterId}">
                                </div>
                            </div>                            
                                </br></br>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Description:</label>
                                <div class="col-sm-9">
                                    <textarea name="description" class="form-control"></textarea>
                                </div>
                            </div>
                                </br></br>
                        <div class="top-buffer">
                            <div class="form-group" align="right">
                                <div class="col-sm-12">                              
                                  <button onclick="return confirm('Are you sure you want to upload the presentation?')" type="submit" class="btn btn-primary">
                                        UPLOAD
                                  </button>
                                </div>
                            </div>
                        </div>   
                       </div>
                     </div>   
                </div>                                
                </form:form>   
        <div class="top-buffer" >                        
        <div class="container-fluid">                                
                <div class="row">                                                                 
                        <div class="col-lg-8">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>File Name</th>                                                                                                                   
                                        <th>Description</th>
                                        <th>Link</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                    <c:forEach items="${presentations}" var="temp">
                                    <tr>
                                        <td>${temp.getFileName()}</td>
                                        <td>${temp.getDescription()}</td>
                                        <td><a href="download.htm?file=${temp.getFilePath()}&name=${temp.getFileName()}">${temp.getFileName()}</a></td>
                                        <td>
                                            <form action="presentationactions.htm" method="POST">   
                                                <input type="hidden" name="chapterId" value="${chapterId}">
                                                <input type="hidden" name="presentationId" value="${temp.getPresentationId()}"/>                                                             
                                                <input onclick="return confirm('Are you sure you want to delete?')" class="btn btn-danger" type="submit" name="action" value="Delete" /> 
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
        </div>
        <!-- /#page-wrapper -->
    <!-- /#wrapper -->
<!-- _____________________________________________________________________________________________ -->
        <jsp:include page="../resources/empire_includes/scripts.html" /> 
    </body>    
</html>
