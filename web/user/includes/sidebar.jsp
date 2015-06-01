<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">
            <li class="">
                <a href="#"><span class="glyphicon glyphicon-tasks"></span>  My Courses<span class="fa arrow"></span></a>
								<% if(session.getAttribute("courses") == null) {%>
										Courses is out
								<% } %>
								<c:forEach items="${courses}" var="course">
									<ul class="nav nav-second-level" >
                    
                        <li>
                            <a href="#">${course.getCourseTitle()}<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="course_outline.html">Course Outline</a>
                                </li>
                                <li>
                                    <a href="course_exams.htm?courseId=${course.getCourseId()}">Exams</a>
                            </li></ul>
                            <!-- /.nav-third-level -->
                        </li>
									</ul>
                </c:forEach>
                <!-- /.nav-second-level -->
            </li>
            <li class="">
                <a href="#"><span class="glyphicon glyphicon-question-sign"></span>  My Exams<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a id="upcoming_exams" href="upcoming_exams.htm">Upcoming Exams</a>
                        <!-- <a id="upcoming_exams" href="#/upcoming_exams">Upcoming Exams</a> -->
                    </li>
                    <li>
                        <a id="past_exams" href="past_exams.htm">Past Exams</a>
                    </li>
                </ul>
                <!-- /.nav-second-level -->
            </li>
            <li>
                <a href="#"><span class="glyphicon glyphicon-user"></span>  My Profile<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <!--<a id="view_profile" href="user/view_profile.jsp">View Profile</a>-->
                        <a id="view_profile" href="view_profile.htm">View Profile</a>
                    </li>
                    <li>
                        <a id="edit_profile" href="edit_profile.htm">Edit Profile</a>
                    </li>
                    <li>
                        <a id="change_password" href="change_password.htm">Change Password</a>
                    </li>
                </ul>
                <!-- /.nav-second-level -->
            </li>
        </ul>
    </div>
    <!-- /.sidebar-collapse -->
</div>