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
                            <h2 class="page-header">Exams - ${exam.getCourse().getCourseTitle()}</h2>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><strong>Upcoming Exams</strong></h3>
                                </div>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <c:if test="${upcomingExam != null}">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Title</th>
                                                    <th>Course</th>
                                                    <th>Due</th>
                                                    <th>Time Limit</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${upcomingExam}" var="temp">
                                                <tr>
                                                    <td>${temp.getExamTitle()}</td>
                                                    <td>${temp.getCourse().getCourseTitle()}</td>
                                                    <td>${temp.getExamDue()}</td>
                                                    <td>${temp.getTimeLimit()}</td>
                                                    <td>
                                                        <button type="button" class="btn btn-primary">Take Exam</button>
                                                    </td>
                                                </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:if>
                                    <c:if test="${upcomingExam == null}">
                                        <p>No past exams.</p>
                                    </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><strong>Past Exams</strong></h3>
                                </div>
                                <div class="panel-body">
                                    <c:if test="${pastExam != null}">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Title</th>
                                                    <th>Course</th>
                                                    <th>Due</th>
                                                    <th>Time Limit</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${pastExam}" var="temp">
                                                <tr>
                                                    <td>${temp.getExamTitle()}</td>
                                                    <td>${temp.getCourse().getCourseTitle()}</td>
                                                    <td>${temp.getExamDue()}</td>
                                                    <td>${temp.getTimeLimit()}</td>
                                                    <td>
                                                        <button type="button" class="btn btn-primary">View Exam</button>
                                                    </td>
                                                </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:if>
                                    <c:if test="${pastExam == null}">
                                        <p>No past exams.</p>
                                    </c:if>
                                </div>
                            </div>
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