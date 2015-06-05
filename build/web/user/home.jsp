<%@page import="com.aes.model.Course"%>
<%@page import="java.util.List"%>
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
							<%
							List<Course> courses=(List<Course>)session.getAttribute("courses");
							if(courses.size()==0){ 
							%>
							<h5>No assigned courses yet. Please contact your development head to start learning.</h5>
							<% } else{%>
							<h5>Click on "My Courses" to start learning.</h5>
							<% } %>
							<p></p>
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