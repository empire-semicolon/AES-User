<%@page import="com.aes.model.UserBean"%>
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
							<h2 class="page-header">Edit Profile</h2>
						</div>
						<!-- /.col-lg-12 -->
					</div>
					<%// UserBean user = (UserBean)request.getAttribute("account"); %>
					<div class="row">
						<div class="col-lg-2">
						</div>

                                                <div class="col-lg-8">        
							<form class="form-horizontal" role="form" method="POST"
                                                                   action="useractions.htm">
								<div class="form-group">
									<label  class="col-sm-3 control-label"><strong>First Name</strong></label>
									<div class="col-sm-7">
                                                                            <input name="firstname" class="form-control"  value="${firstName}" type="text"/>
									</div>
								</div>
                                                                <div class="form-group">
									<label  class="col-sm-3 control-label"><strong>Middle Name</strong></label>
									<div class="col-sm-7">
                                                                            <input name="middlename" class="form-control"  value="${middleName}" type="text"/>
									</div>
								</div>
								<div class="form-group">
									<label  class="col-sm-3 control-label"><strong>Last Name</strong></label>
									<div class="col-sm-7">
                                                                            <input name="lastname" class="form-control"  value="${lastName}" type="text"/>
									</div>
								</div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-3 control-label"><strong>Business Unit:</strong></label>
                                                                    <div class="col-sm-7">
                                                                    <select class="form-control" name="buChosen">
                                                                    <c:forEach items="${businessUnits}" var="bu">
                                                                        <option value="${bu.getBusinessUnitId()}" ${userBU.equals(bu.businessUnit)?"selected":""}>${bu.getBusinessUnit()}</option>                                                
                                                                    </c:forEach>
                                                                    </select>
                                                                    </div>
                                                                </div>        
								<div class="form-group">
									<label  class="col-sm-3 control-label"><strong>Position</strong></label>
									<div class="col-sm-7">
                                                                            <input name="position" class="form-control"  value="${position}" type="text"/>
									</div>
								</div>
								<div class="form-group">
									<label  class="col-sm-3 control-label"><strong>Email</strong></label>
									<div class="col-sm-7">
                                                                            <input name="email" class="form-control"  value="${email}" type="text"/>
									</div>
								</div>
                                                                <input type="hidden" name="action" value="edit"/>
                                                                <input type="hidden" name="old_pw" value=""/>
                                                                <input type="hidden" name="new_pw" value=""/>
                                                                <input type="hidden" name="confirm_pw" value=""/>
								<div class="form-group">
									<label class="col-sm-3 control-label"></label>
									<div class="col-sm-7">                              
										<button type="submit" class="btn btn-primary">Submit</button>
										<button class="btn btn-danger">Cancel</button>
									</div>
								</div>
							</form>
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