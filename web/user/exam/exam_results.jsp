<%@page import="org.json.simple.parser.JSONParser"%>
<<<<<<< HEAD
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
									<h2 class="page-header">Results - ${exam.getExamTitle()}</h2>
								</div>
								<!-- /.col-lg-12 -->
							</div>
							<!-- /.row -->
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
=======
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
	<div class="col-lg-12">
		<h2 class="page-header">${exam.getExamTitle()}</h2>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-md-10">
		<div class="panel panel-default">
			<div class="panel-body">
                            You got ${exam_score} out of 10!
                            <form action="home.htm" method="POST">
				<% int x = 0; %>
                                <c:set var="count" value="0" scope="page" />
				<c:forEach items="${questions}" var="question">
					<div class="row">
						<div class="col-md-4">
                                                    <div class="question">Question #<%=x+1%></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<h6>${question}</h6>
						</div>
					</div>
					<div class="row">
                                            <div class="col-md-12">
                                                Your Answer: ${user_answers.get(count)} <br>
                                                Correct Answer: ${correct_answers.get(count)} <br>
                                                ${correctOrWrong.get(count)} <br>
                                            </div>
					</div>
					<% x++; %>
				<hr/>
                                <c:set var="count" value="${count+1}" scope="page"/>
				</c:forEach>
                                <button class="submit" type="submit">Back to Home</button>
                            </form>
			</div>
			<div class="row">
				<div class="col-md-4 pull-right">
					<ul class="pagination">
					<li><a href="#" class="disabled">&laquo;</a></li>
					<li><a href="#" class="active">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-2">
		<div class="panel panel-default">
			<div class="panel-heading">
				Time
			</div>
			<div class="panel-body">
				<h6>${exam.getTimeLimit()} mins</h6>
			</div>
                        <span id="countdown" class="timer"></span>
		</div>
	</div>
</div>
>>>>>>> 336d662688892ec282776776d3cd936f0d5583e1
