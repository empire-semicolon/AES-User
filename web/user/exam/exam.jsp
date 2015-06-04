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
									<h2 class="page-header">${exam.getExamTitle()}</h2>
								</div>
								<!-- /.col-lg-12 -->
							</div>
							<!-- /.row -->
							<div class="row">
								<div class="col-md-10">
									<div class="panel panel-default">
										<div class="panel-body">
											<form action="submit_exam.htm" method="POST">
												<% int x = 0; %>
												<c:set var="count" value="0" scope="page" />
												<c:forEach items="${questions}" var="question">
												<div class="row">
													<div class="col-md-4">
														<div class="question">Question #<%=x+1%></div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6 col-md-offset-1">
														<h6>${question}</h6>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6 col-md-offset-1">
														<c:forEach items="${choices.get(count)}" var="choice">
														<div class="radio">
															<label>
																<input type="radio" name="radio${count}" value="${choice}"
																onclick="answeredQuestion()">
																${choice}
															</label>
														</div>

													</c:forEach>
													</div>
												</div>
											<% x++; %>
												<hr/>
												<c:set var="count" value="${count+1}" scope="page"/>
												</c:forEach>
												<input type="hidden" name="examId" value="${exam.getExamId()}"/>
												<input type="hidden" id="answers" name="answers" value=""/>
												<button class="submit" type="submit" class="pull-right">Submit</button>
											</form>
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
								<div class="col-md-2">
									<div class="panel panel-default">
										<div class="panel-heading">
											Time
										</div>
										<div class="panel-body">
											<h6>${exam.getTimeLimit()} mins</h6>
										</div>
									</div>
								</div>
								<div class="col-md-2">
									<div class="panel panel-default">
										<div class="panel-heading">
											Questions Answered
										</div>
										<div class="panel-body">
											<div id="answered">0</div> / 10
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

<script type="text/javascript">
	var elem=document.getElementById("answered");
	var elem2=document.getElementById("answers");
	var radios=document.querySelectorAll('input[type=radio]');
	var amountAnswered=0;

	function answeredQuestion() {
		amountAnswered=0;
		for(var j = 0; j < radios.length; j++) {
			var radio = radios[j];
			if(radio.checked) {
				amountAnswered++;
			}
		}
		//elem.value=amountAnswered;
		elem.innerHTML = amountAnswered;
		handleAnswers();
	}

	function handleAnswers(){
		var answers="";
		for(var i = 0; i <= 9; i++) {
			var radios2 = document.getElementsByName("radio"+i);
			var answer=" ";
			for(var j = 0; j < radios2.length; j++) {
				var radio2=radios2[j];
				if(radio2.checked){
					answer=radio2.value;
				}
			}
			answers=answers.concat(answer);
			if(i!=9){
				answers=answers.concat(",");
			}
		}
		elem2.value=answers;
	}

</script>