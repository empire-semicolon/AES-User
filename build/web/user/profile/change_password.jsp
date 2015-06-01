<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
							<h2 class="page-header">Change Password</h2>
						</div>
						<!-- /.col-lg-12 -->
						<div class="row">
							<div class="col-lg-2">
								
							</div>
							<div class="col-lg-8">
                                                            <!--<p>Old Password: ${old_pw}<p>-->
								<form:form class="form-horizontal" role="form" method="POST"
                                                                           action="useractions.htm">
									<div class="form-group">
                                                                            <label  class="col-sm-3 control-label"><strong>Username</strong></label>
                                                                            <div class="col-sm-7">
                                                                                <input class="form-control"  value="${userName}" type="text" readonly="true"/>
                                                                            </div>
                                                                        </div>
									<div class="form-group">
                                                                            <label  class="col-sm-3 control-label"><strong>Old Password</strong></label>
                                                                            <div class="col-sm-7">
                                                                                <input name="old_pw" class="form-control" type="password"/>
                                                                            </div>
                                                                        </div>
									<div class="form-group">
                                                                            <label  class="col-sm-3 control-label"><strong>New Password</strong></label>
                                                                            <div class="col-sm-7">
                                                                                <input name="new_pw" class="form-control" type="password"/>
                                                                            </div>
                                                                        </div>
									<div class="form-group">
                                                                            <label  class="col-sm-3 control-label"><strong>Confirm Password</strong></label>
                                                                            <div class="col-sm-7">
                                                                                <input name="confirm_pw" class="form-control" type="password"/>
                                                                            </div>
                                                                        </div>
                                                                        <input type="hidden" name="action" value="change_password"/>
                                                                        <input type="hidden" name="firstname" value=""/>
                                                                        <input type="hidden" name="middlename" value=""/>
                                                                        <input type="hidden" name="lastname" value=""/>
                                                                        <input type="hidden" name="buChosen" value=""/>
                                                                        <input type="hidden" name="email" value=""/>
                                                                        <input type="hidden" name="position" value=""/>
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label"></label>
										<div class="col-sm-7">                              
											<button type="submit" class="btn btn-primary">Submit</button>
											<button type="reset" class="btn btn-default">Reset</button>
											<button class="btn btn-danger">Cancel</button>
										</div>
									</div>
								</form:form>
							</div>
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