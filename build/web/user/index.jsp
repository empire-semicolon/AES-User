<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
	<%@include file="includes/header.jsp" %>
  <%@include file="include.jsp" %>
		<div id="wrapper">
			<!-- Navigation -->
			<jsp:include page="includes/navbar.jsp" />
			<!-- Page Content -->
			<div id="page-wrapper" style="min-height: 99px;">
				<div class="container-fluid">
					<!-- start of AJAX container -->
					<div id="content">
						<!-- _____________________________________________________________________________________________ -->
							<div class="row">
								<div class="col-lg-12">
									<h2 class="page-header">Home</h2>
									<div class="well">
										<h4>No assigned courses yet.</h4>
										<p>Please contact your development head for you to start learning on a course</p>
							                        <p>${userCourses}</p>
									</div>
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
		<%@include file="includes/footer.jsp" %>
	</body>
</html>