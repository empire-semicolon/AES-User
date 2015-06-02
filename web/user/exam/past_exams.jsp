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
									<h2 class="page-header">Past Exams</h2>
								</div>
								<!-- /.col-lg-12 -->
							</div>
							<!-- /.row -->
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="table-responsive">
												<table id="pastExams" class="table table-striped">
													<thead>
														<tr>
															<th>Title</th>
															<th>Course</th>
															<th>Due</th>
															<th>Time Limit</th>
															<th>Score</th>
															<th></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${pastExams}" var="exam">
															<tr>
																<td>${exam.getExamTitle()}</td>
																<td>${exam.course.getCourseTitle()}</td>
																<td>${exam.getExamDue()}</td>
																<td>${exam.getTimeLimit()}</td>
																<td></td>
																<td>
																	<a href="past_exams.htm?examId=${exam.getExamId()}" class="btn btn-primary">View Exam</a>
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
