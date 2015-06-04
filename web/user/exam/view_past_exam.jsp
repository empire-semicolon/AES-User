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
									<h2 class="page-header">Java Assessment</h2>
								</div>
								<!-- /.col-lg-12 -->
							</div>
							<div class="row">
								<div class="col-md-10">
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="row">
												<div class="col-md-4">
													<strong>Due</strong>&nbsp;&nbsp;May 25, 2015 @ 11:59pm
												</div>
												<div class="col-md-4">
													<strong>Course</strong>&nbsp;&nbsp;J2EE Intermediate
												</div>
											</div>
											<div class="row">
												<div class="col-md-4">
													<strong>Time Limit</strong>&nbsp;&nbsp;60 mins
												</div>
												<div class="col-md-4">
													<strong>Score</strong>&nbsp;&nbsp; 20 / 20
												</div>
												<div class="col-md-4">
													<strong>Questions</strong>&nbsp;&nbsp;20
												</div>
											</div>
											<hr/>
											<div class="row">
												<div class="col-md-6">
													<strong>Instructions</strong>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<p>Description of the course, consectetur adipisicing elit, sed do eiusmod
													tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
													quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
													consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
													cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
													proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /.row -->
							<div class="row">
								<div class="col-md-10">
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="row">
												<div class="col-md-4">
													<strong>Question #1</strong>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<h6>OOP is an acronym for: </h6>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<div class="radio">
														<label>
															<input type="radio" name="radio1" value="option1">
															Object-Oriented Programmer
														</label>
													</div>
													<div class="radio">
														<label>
															<input type="radio" name="radio1" value="option2">
															Object-Oriented Programming
														</label>
													</div>
													<div class="radio">
														<label>
															<input type="radio" name="radio1" value="option2">
															Outer-object programming
														</label>
													</div>
													<div class="radio">
														<label>
															<input type="radio" name="radio1" value="option2">
															Functional Programming
														</label>
													</div>
												</div>
											</div>
											<hr/>
											<div class="row">
												<div class="col-md-4">
													<strong>Question #2</strong>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<h6> 1 + 1 = __ </h6>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<div class="radio">
														<label class="text-danger">
															<input type="radio" name="radio2" value="option1" checked disabled>
															Zxc
														</label>
													</div>
													<div class="radio">
														<label class="text-success">
															<input type="radio" name="radio2" value="option2" disabled>
															Asd
														</label>
													</div>
													<div class="radio">
														<label>
															<input type="radio" name="radio2" value="option2" disabled>
															Qwe
														</label>
													</div>
													<div class="radio">
														<label>
															<input type="radio" name="radio2" value="option2" disabled>
															Test
														</label>
													</div>
												</div>
											</div>
										</div>
										<!-- <div class="row">
											<div class="col-md-4 pull-right">
												<ul class="pagination">
												<li><a href="#" class="disabled">&laquo;</a></li>
												<li><a href="#" class="active">1</a></li>
												<li><a href="#">2</a></li>
												<li><a href="#">3</a></li>
												<li><a href="#">&raquo;</a></li>
											</ul>
											</div>
										</div> -->
									</div>
								</div>
								<div class="col-md-2">
									<!-- <div class="panel panel-default">
										<div class="panel-heading">
											Time
										</div>
										<div class="panel-body">
											<h6>56 mins</h6>
										</div>
									</div> -->
								</div>
								<div class="col-md-2">
									<!-- <div class="panel panel-default">
										<div class="panel-heading">
											Questions Answered
										</div>
										<div class="panel-body">
											<h6>0/20</h6>
										</div>
									</div> -->
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