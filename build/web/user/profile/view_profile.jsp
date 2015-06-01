<%@page import="com.aes.model.UserBean"%>
<html lang="en">
	<%@include file="../includes/header.jsp" %>
	<body>
		<div id="wrapper">
			<!-- Navigation -->
			<jsp:include page="../includes/navbar.jsp" />

			<!-- Page Content -->
			<div id="page-wrapper" style="min-height: 99px;">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12">
							<h2 class="page-header">Profile</h2>
						</div>
						<!-- /.col-lg-12 -->
					</div>
					<%// UserBean user = (UserBean)request.getAttribute("account"); %>
					<div class="row">
						<div class="col-lg-2">
							
						</div>
						<div class="col-lg-2">
							<p class="text-right"><strong>First Name</strong></p>
                                                        <p class="text-right"><strong>Middle Name</strong></p>
							<p class="text-right"><strong>Last Name</strong></p>
							<p class="text-right"><strong>Username</strong></p>
							<p class="text-right"><strong>Business Unit</strong></p>
							<p class="text-right"><strong>Position</strong></p>
							<p class="text-right"><strong>Email</strong></p>


						</div>
						<div class="col-lg-8">
							<p>${firstName}</p>
                                                        <p>${middleName}</p>
                                                        <p>${lastName}</p>
                                                        <p>${userName}</p>
                                                        <p>${userBU}</p>
                                                        <p>${position}</p>
                                                        <p>${email}</p>
						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /#page-wrapper -->
		</div>
		<!-- /#wrapper -->
		<%@include file="../includes/footer.jsp" %>
	</body>
</html>