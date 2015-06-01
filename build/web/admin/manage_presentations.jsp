
<%@page import="java.sql.Timestamp"%>
<%@page import="com.aes.model.PresentationBean"%>
<%@page import="com.aes.model.ChapterBean"%>
<%@page import="com.aes.model.CourseBean"%>
<%
    String presentationNames[] = new String[] {"Spring Framework", "Lambda Expressions", "Management Concepts"};
    String courseNames[] = new String[] {"J2EE", "J2SE", "Project Management"};
    int courseIDs[] = new int[] {12, 14, 5};
    int chapterNos[] = new int[] {8, 13, 1};
    int presentationIDs[] = new int[] {124, 114, 225};
    
    CourseBean courses[] = new CourseBean[3];
    ChapterBean chapters[] = new ChapterBean[3];
    PresentationBean presentations[] = new PresentationBean[3];
    
    for(int i = 0; i < 3; i++) {
        courses[i] = new CourseBean();
        courses[i].setIntCourseId(courseIDs[i]);
        courses[i].setStrCourseTitle(courseNames[i]);
        
        chapters[i] = new ChapterBean();
        chapters[i].setIntCourseId(courseIDs[i]); 
        
        presentations[i] = new PresentationBean();
        presentations[i].setStrFileName(presentationNames[i]);
        presentations[i].setIntPresentationId(presentationIDs[i]);
        presentations[i].setTsDateUploaded(new Timestamp(System.currentTimeMillis()));
    }
    
    session.setAttribute("presentations", presentations);
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
                            Manage Presentations
                        </h1>
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
                                        <td><%= ((PresentationBean[]) session.getAttribute("presentations"))[i].getStrFileName() %></td>
                                        <td><%= chapterNos[i] %></td>
                                        <td><%= ((CourseBean[]) session.getAttribute("courses"))[i].getStrCourseTitle() %></td>
                                        <td><%= ((PresentationBean[]) session.getAttribute("presentations"))[i].getTsDateUploaded() %></td>
                                        <td>
                                            <input type="button" class="btn btn-warning" value="Edit" onclick="location.href='courses?<%= ((PresentationBean[]) session.getAttribute("presentations"))[i].getIntPresentationId() %>'">
                                            <input type="button" class="btn btn-danger" value="Delete">
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