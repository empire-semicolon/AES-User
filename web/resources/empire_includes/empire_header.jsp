
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
                        <li><a href="../admin/logout" onclick="return confirm('Are you sure you want to sign out?')"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                </li>
            </ul>
