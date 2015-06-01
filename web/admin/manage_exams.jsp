
<%@page import="java.sql.Timestamp"%>
<%@page import="com.aes.model.ExamBean"%>
<%@page import="com.aes.model.ChapterBean"%>
<%@page import="com.aes.model.CourseBean"%>
<%
    String examNames[] = new String[] {"Spring Framework", "Lambda Expressions", "Management Concepts"};
    String courseNames[] = new String[] {"J2EE", "J2SE", "Project Management"};
    int courseIDs[] = new int[] {12, 14, 5};
    int chapterNos[] = new int[] {8, 13, 1};
    int examIDs[] = new int[] {124, 114, 225};
    
    CourseBean courses[] = new CourseBean[3];
    ChapterBean chapters[] = new ChapterBean[3];
    ExamBean exams[] = new ExamBean[3];
    
    for(int i = 0; i < 3; i++) {
        courses[i] = new CourseBean();
        courses[i].setIntCourseId(courseIDs[i]);
        courses[i].setStrCourseTitle(courseNames[i]);
        
        chapters[i] = new ChapterBean();
        chapters[i].setIntCourseId(courseIDs[i]); 
        
        exams[i] = new ExamBean();
        exams[i].setStrExamTitle(examNames[i]);
        exams[i].setIntExamId(examIDs[i]);
        exams[i].setDateEdited(new Timestamp(System.currentTimeMillis()));
    }
    
    session.setAttribute("exams", exams);
    session.setAttribute("chapters", chapters);
    session.setAttribute("courses", courses);
%>

<html lang="en">
    <head>
        <jsp:include page="head.jsp" />
    </head>
    <body>
        <div id="wrapper">
            <!-- Navigation -->
            <jsp:include page="navigation.jsp" />

            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="col-lg-12" align="center">
                        <h1 class="page-header">
                            <i class="fa fa-cogs fa-fw"></i>
                            Manage Exams
                        </h1>
                    </div>
                    <div class="col-sm-12">                        
                        </br><h4><font color="blue">${message}</font></h4></br>
                    </div> 
                    <div class="col-lg-12">
                        <div>Search Presentation: <input type="text"> <input type="button" value="Search" class="btn btn-primary"></div><br>
                        <div class="table-responsive" align="center">
                            <table class="table">
                                <tr>
                                    <th>Presentation</th>
                                    <th>Chapter</th>
                                    <th>Course</th>
                                    <th>Last Modified</th>
                                    <th>Actions</th>
                                </tr>
                                <!-- Sample entry -->
                                <%
                                    for(int i = 0; i < 3; i++) {
                                %>
                                    <tr>
                                        <td><%= ((ExamBean[]) session.getAttribute("exams"))[i].getStrExamTitle() %></td>
                                        <td><%= chapterNos[i] %></td>
                                        <td><%= ((CourseBean[]) session.getAttribute("courses"))[i].getStrCourseTitle() %></td>
                                        <td><%= ((ExamBean[]) session.getAttribute("exams"))[i].getDateEdited() %></td>
                                        <td>
                                            <form method="POST" action="examactions.htm">
                                                <input type="button" class="btn btn-danger" name="action" value="Delete">
                                            </form>
                                        </td>
                                    </tr>
                                <%
                                }
                                %>
                            </table>
                        </div>
                    </div>
                        
                        
                    </div>                               
                </div>
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <jsp:include page="jquery.jsp" />
    </body>
</html>