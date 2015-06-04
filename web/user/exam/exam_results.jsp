<%@page import="org.json.simple.parser.JSONParser"%>
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
								<h2 class="page-header">Exam Results - ${exam.getExamTitle()}</h2>
							</div>
							<!-- /.col-lg-12 -->
						</div>
						<!-- /.row -->
						<div class="row">
							<div class="col-md-10">
								<div class="panel panel-default">
									<div class="panel-body">
										<h4>You got ${exam_score} out of 10!</h4>
										<hr/>
										<form action="home.htm" method="POST">
											<% int x = 0;%>
											<c:set var="count" value="0" scope="page" />
											<c:forEach items="${questions}" var="question">
												<div class="row">
													<div class="col-md-4">
														<div class="question">Question #<%=x + 1%></div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-10 col-md-offset-1">
														<h6>${question}</h6>
													</div>
												</div>
												<div class="row">
													<div class="col-md-10 col-md-offset-1">
														<div class="row">
															<div class="col-md-3 pull-right">Your Answer</div>
															<c:choose>
																<c:when test="${user_answers.get(count) == correct_answers.get(count)}">
																	<div class="col-md-9"><label class="text-success">${user_answers.get(count)}</label></div>
																</c:when>
																<c:otherwise>
																	<div class="col-md-9"><label class="text-danger">${user_answers.get(count)}</label></div>
																</c:otherwise>
															</c:choose>
														</div>
														<div class="row">
															<div class="col-md-3 pull-right">Correct Answer</div>
															<div class="col-md-9"><label class="text-success">${correct_answers.get(count)}</label></div>
														</div>
															<h5>${correctOrWrong.get(count)} </h5>
													</div>
												</div>
												<% x++;%>
												<hr/>
												<c:set var="count" value="${count+1}" scope="page"/>
											</c:forEach>
											<button class="submit pull-right" type="submit">Back to Home</button>
										</form>
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

