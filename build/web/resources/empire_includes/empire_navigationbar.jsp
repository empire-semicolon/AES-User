
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="home.htm">
                    <img src="../resources/images/aes_logo_3.png" class="img-responsive" height="250" width="250" style="margin-top:-17px">
                </a>
            </div>
            <!-- /.navbar-header -->
            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> 
                           ${user.getFirstName()} ${user.getMiddleName()} ${user.getLastName()}
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">       
                        <li><a href="reset_password.htm"><i class="fa fa-keyboard-o"></i>  Reset Password</a></li>
                        <li class="divider"></li>
                        <li><a href="../admin/logout" onclick="return confirm('Are you sure?')"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="">
                            <a href="#"><i class="fa fa-users fa-fw"></i> Accounts<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level collapse">
                                <li>
                                    <a href="add_user_page.htm">Add User</a>
                                </li>
                                <li>
                                    <a href="view_all_users.htm">Manage Users</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li class="">
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> Courses<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level collapse">
                                <li>
                                    <a href="add_course.htm">Add Course</a>
                                </li>
                                <li>
                                    <a href="view_all_courses.htm">Manage Courses</a>
                                </li>
                                 <li>
                                    <a href="add_chapter.htm">Add Chapter</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-book fa-fw"></i> Exams<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level collapse">
                                <li>
                                    <a href="addexam.htm">Add Exam</a>
                                </li>
                                <li>
                                    <a href="view_exams.htm">Manage Exams</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>                        
                        <li class="">
                            <a href="#"><i class="fa fa-question-circle"></i> Miscellaneous<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level collapse">
                                <li>
                                    <a href="user_type.htm">User Types</a>
                                </li>
                                <li>
                                    <a href="business_unit.htm">Business Unit</a>
                                </li>
                                <li>
                                    <a href="course_category.htm">Course Category</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
            </div>
</nav>