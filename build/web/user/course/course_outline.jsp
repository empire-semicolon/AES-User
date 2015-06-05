<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
    <%@include file="../includes/header.jsp" %>
    <%@include file="../include.jsp" %>
    <div id="wrapper">
        <!-- Navigation -->
        <jsp:include page="../includes/navbar.jsp" />
        <!-- Page Content -->
        <div id="page-wrapper" style="min-height: 99px;">
            <div class="container-fluid">
                <!-- start of AJAX container -->
                <div id="content">
                    <!-- _____________________________________________________________________________________________ -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h2 class="page-header">${course.getCourseTitle()}</h2>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <div class="row">
                        <div class="col-md-10">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <p>${course.getCourseDescription()}</p>
                                    <div class="col-md-2" align="right" ><strong> Instructor </strong></div>
                                    <div class="col-md-10">${course.getUserDetails().getFirstName()} ${course.getUserDetails().getMiddleName()} ${course.getUserDetails().getLastName()}</div>
                                </div>
                            </div>
                            <% int x = 0;%>
                            <c:forEach items="${chapter}" var="tempChapter">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><strong>Chapter <%= ++x %>: ${tempChapter.getChapterTitle()} </strong></h3>
                                    </div>
                                    <div class="panel-body">
                                        ${tempChapter.getDescription()} <br><br>

                                        <h4>Presentations</h4>
                                        <div class="list-group">
                                            <c:forEach items="${tempChapter.getPresentations()}" var="tempPresentation">
                                                <a href="download.htm?file=${tempPresentation.getFilePath()}&name=${tempPresentation.getFileName()}" class="list-group-item"><span class="glyphicon glyphicon-paperclip"></span> ${tempPresentation.getFileName()}
                                                </a>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!-- _____________________________________________________________________________________________ -->
                </div>
                <!-- end of AJAX container -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <%@include file="../includes/footer.jsp" %>
</body>
</html>