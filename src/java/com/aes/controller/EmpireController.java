/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aes.controller;

import com.aes.model.BusinessUnit;
import com.aes.model.Chapter;
import com.aes.model.Course;
import com.aes.model.CourseCategory;
import com.aes.model.CoursesAssigned;
import com.aes.model.Exam;
import com.aes.model.Presentation;
import com.aes.model.UserDetails;
import com.aes.model.UserType;
import com.aes.service.EmpireService;
import java.io.BufferedReader;
import java.util.List;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletContext;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import static javax.xml.bind.JAXBIntrospector.getValue;
 
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;

@Controller
@RequestMapping("/admin")
public class EmpireController {
    
    @Autowired
    private EmpireService service;
    
    @Autowired
    private ServletContext context;
    
    @RequestMapping(value="/home")
    public String setupForm(HttpServletRequest request, Map<String, Object> map){
        return "../../admin/admin_home";
    }
    
    @RequestMapping(value="/add_user_page")
    public String setupForm2 (@ModelAttribute UserDetails loggedUser, Map<String, Object> map){
        UserDetails tempUser = new UserDetails();
        map.put("tempUser", tempUser);
        map.put("businessUnit", service.getAllBusinessUnit());
        map.put("userType", service.getAllUserTypes());       
        return "../../admin/add_user";
    }
    
     @RequestMapping(value="/useredit", method=RequestMethod.POST)
     public String setupForm3 (@ModelAttribute UserDetails loggedUser, @RequestParam String userId, Map<String, Object> map){
        UserDetails tempUser = service.getUserById(Integer.parseInt(userId));
        map.put("tempUser", tempUser);
        map.put("businessUnit", service.getAllBusinessUnit());
        map.put("userType", service.getAllUserTypes());
        map.put("userBU", service.getUnitNameById(tempUser.getBusinessUnit().getBusinessUnitId()));        
        map.put("userTypeString", service.getTypeNameById(tempUser.getUserType().getUserTypeId()));
        return "../../admin/edit_user";
    }
     
    @RequestMapping(value="/view_all_users", method=RequestMethod.GET)
     public String setupForm4 (@ModelAttribute UserDetails loggedUser, Map<String, Object> map){
        map.put("allUsers", service.getAllUser());      
        return "../../admin/manage_users";
    }      
    
    @RequestMapping(value="/useractions", method=RequestMethod.POST)
    public String doActions(@ModelAttribute UserDetails loggedUser, @ModelAttribute UserDetails tempUser, 
                BindingResult result, @RequestParam String action, @RequestParam String userId, @RequestParam String searchKey,                 
                @RequestParam String buChosen, @RequestParam String userTypeChosen, Map<String, Object> map){                
        switch(action.toLowerCase()){            
        case "add":
            try {
                tempUser.setBusinessUnit(service.getBusinessUnit(Integer.parseInt(buChosen)));
                tempUser.setRecordStatus(true);
                tempUser.setUserType(service.getUserTypeById(Integer.parseInt(userTypeChosen)));
                service.addUser(tempUser);
                map.put("message", "Succesfully aded new user.");
            } catch (org.springframework.dao.DataIntegrityViolationException e) {
                 map.put("message", "Unable to add user since the username is already in use.");
                UserDetails tempUser1 = new UserDetails();
                map.put("tempUser", tempUser1);
                map.put("businessUnit", service.getAllBusinessUnit());
                map.put("userType", service.getAllUserTypes());       
                return "../../admin/add_user";
            }
                break;
        case "edit":
            tempUser.setBusinessUnit(service.getBusinessUnit(Integer.parseInt(buChosen)));
            tempUser.setRecordStatus(true);
            tempUser.setUserType(service.getUserTypeById(Integer.parseInt(userTypeChosen)));
            service.updateUser(tempUser);
            break;
        case "delete":
            try {
                service.deleteUser(Integer.parseInt(userId));
                map.put("message", "User successfully deleted.");
            } catch (Exception e) {
                map.put("message", "Oops... Unable to delete user.");
            }                
            break;
        case "reset password":
            service.resetPassword(service.getUserById(Integer.parseInt(userId)));
            map.put("message", "Password was successfully reset.");
            break;        
        case "search":             
            map.put("allUsers", service.searchUser(searchKey));        
            return "../../admin/manage_users";
        }
        map.put("allUsers", service.getAllUser());        
        map.put("loggedUser", loggedUser);       
        return "../../admin/manage_users";
    }
    
    @RequestMapping(value="/add_course", method=RequestMethod.GET)
    public String setupForm5 (@ModelAttribute UserDetails loggedUser, Map<String, Object> map){
        map.put("trainers", service.getAllTrainers());
        Course tempCourse = new Course();
        map.put("categories", service.getAllCourseCategory());
        map.put("tempCourse", tempCourse);
        return "../../admin/add_course";
    }
    
    @RequestMapping(value="/courseedit", method=RequestMethod.POST)
     public String setupForm6 (@ModelAttribute UserDetails loggedUser, @RequestParam String courseId, Map<String, Object> map){
        Course tempCourse = service.getCourseById(Integer.parseInt(courseId));
        map.put("tempCourse", tempCourse);        
        map.put("trainers", service.getAllTrainers());
        map.put("categories", service.getAllCourseCategory());
        map.put("trainer", tempCourse.getUserDetails().getUserId());
        map.put("courseCategory", service.getCategoryNameById(tempCourse.getCourseCategory().getCourseCategoryId()));        
        return "../../admin/edit_course";
    }
     
     @RequestMapping(value="/view_all_courses", method=RequestMethod.GET)
     public String setupForm7 (@ModelAttribute UserDetails loggedUser, Map<String, Object> map){
        map.put("allCourses", service.getAllCourse());      
        return "../../admin/manage_courses";
    }
     
     @RequestMapping(value="/user_type", method=RequestMethod.GET)
     public String setupForm (@ModelAttribute UserDetails loggedUser, Map<String, Object> map){
        map.put("userTypes", service.getAllUserTypes()); 
        UserType tempUserType = new UserType();
        map.put("tempType", tempUserType);
        return "../../admin/manage_user_types";
    }
    
    @RequestMapping(value="/courseactions", method=RequestMethod.POST)
    public String doActions1(@ModelAttribute UserDetails loggedUser, @ModelAttribute Course tempCourse, 
                BindingResult result, @RequestParam String action, @RequestParam String courseId, @RequestParam String searchKey, @RequestParam String trainerChosen,                
                @RequestParam String trainerChosen1, @RequestParam String categoryChosen, Map<String, Object> map){                
        switch(action.toLowerCase()){            
        case "add":            
            tempCourse.setCourseCategory(service.getCourseCategoryById(Integer.parseInt(categoryChosen)));
            tempCourse.setUserDetails(service.getUserById(Integer.parseInt(trainerChosen)));
            service.addCourse(tempCourse);
            break;
        case "edit":            
            tempCourse.setCourseCategory(service.getCourseCategoryById(Integer.parseInt(categoryChosen)));
            tempCourse.setUserDetails(service.getUserById(Integer.parseInt(trainerChosen1)));
            service.updateCourse(tempCourse);
            break;
        case "delete":
            try {
                service.deleteCourse(Integer.parseInt(courseId)); 
                map.put("message", "Course successfully deleted.");
            } catch (Exception e) {
                map.put("message", "Oops.. Unable to delete course.");
                e.printStackTrace();
            }
            break;        
        case "search":             
            map.put("allCourses", service.searchCourseByName(searchKey));        
            return "../../admin/manage_courses";
        }
        map.put("allCourses", service.getAllCourse());        
        map.put("loggedUser", loggedUser);       
        return "../../admin/manage_courses";
    }
    
    @RequestMapping(value="/usertypeactions", method=RequestMethod.POST)
    public String doActions2(@ModelAttribute UserType tempType, BindingResult result, @RequestParam String action, Map<String, Object> map){
            UserType type = new UserType();
            switch(action.toLowerCase()){	//only in Java7 you can put String in switch
            case "add":
                service.addUserType(tempType);
                type = tempType;
                break;
            case "edit":
                service.updateUserType(tempType);
                type = tempType;
                break;             
            case "delete":
                try {
                    service.deleteUserType(tempType.getUserTypeId());
                                                           
                } catch (Exception e) {
                    map.put("Message", "Unable to delete user type. Sorry.");
                }
                type = new UserType(); 
                break;
            case "search":
                    UserType searchedType = service.getUserTypeById(tempType.getUserTypeId());
                    type = searchedType!=null ? searchedType : new UserType();
                    break;
            }
            map.put("userTypes", service.getAllUserTypes()); 
            map.put("tempType", type);
            return "../../admin/manage_user_types";
    }          
    
    @RequestMapping(value="/business_unit", method=RequestMethod.GET)
     public String setupForm8 (@ModelAttribute UserDetails loggedUser, Map<String, Object> map){
        map.put("bus", service.getAllBusinessUnit()); 
        BusinessUnit bu = new BusinessUnit();
        map.put("bu", bu);
        return "../../admin/manage_bu";
    }    
     
    @RequestMapping(value="/businessunitctions", method=RequestMethod.POST)
    public String doActions3(@ModelAttribute BusinessUnit tempBU, BindingResult result, @RequestParam String action, Map<String, Object> map){
            BusinessUnit bu = new BusinessUnit();
            switch(action.toLowerCase()){	//only in Java7 you can put String in switch
            case "add":
                service.addBusinessUnit(tempBU);
                bu = tempBU;
                break;
            case "edit":
                service.updateBusinessUnit(tempBU);
                bu = tempBU;
                break;             
            case "delete":
                try {
                    service.deleteBusinessUnit(tempBU.getBusinessUnitId());
                } catch (Exception e) {
                }                    
                    bu = tempBU;
                    break;
            case "search":
                BusinessUnit searchedBU = service.getBusinessUnit(tempBU.getBusinessUnitId());
                bu = searchedBU!=null? searchedBU : new BusinessUnit();
                break;
            }
            map.put("bus", service.getAllBusinessUnit()); 
            map.put("bu", bu);
            return "../../admin/manage_bu";
    }
    
    @RequestMapping(value="/course_category", method=RequestMethod.GET)
     public String setupForm9 (@ModelAttribute UserDetails loggedUser, Map<String, Object> map){
        map.put("categories", service.getAllCourseCategory()); 
        CourseCategory category = new CourseCategory();
        map.put("category", category);
        return "../../admin/manage_categories";
    }    
     
    @RequestMapping(value="/categoryactions", method=RequestMethod.POST)
    public String doAction4(@ModelAttribute CourseCategory tempCat, BindingResult result, @RequestParam String action, Map<String, Object> map){
            CourseCategory cat = new CourseCategory();
            switch(action.toLowerCase()){	
            case "add":
                    service.addCourseCategory(tempCat);
                    cat = tempCat;
                    break;
            case "edit":
                    service.updateCourseCategory(tempCat);
                    cat = tempCat;
                    break;             
            case "delete":
                    service.deleteCourseCategory(tempCat.getCourseCategoryId());
                    cat = tempCat;
                    break;
            case "search":
                    CourseCategory searchedCat = service.getCourseCategoryById(tempCat.getCourseCategoryId());
                    cat = searchedCat!=null? searchedCat : new CourseCategory();
                    break;
            }
            map.put("categories", service.getAllCourseCategory()); 
            map.put("category", cat);
            return "../../admin/manage_categories";
    }
    
    @RequestMapping(value="/view_chapters",  method=RequestMethod.POST)
     public String setupForm10 (@ModelAttribute UserDetails loggedUser, BindingResult result,
             @RequestParam String courseId,  Map<String, Object> map){
        map.put("chapters", service.getChaptersByCourseId(Integer.parseInt(courseId))); 
        Course course = service.getCourseById(Integer.parseInt(courseId));
        map.put("course", course);
        return "../../admin/chapters_view";
    }
     
    @RequestMapping(value="/add_chapter", method=RequestMethod.GET)
    public String setupForm11 (@ModelAttribute UserDetails loggedUser, Map<String, Object> map){
        map.put("tempChapter", new Chapter());
        map.put("courses", service.getAllCourse());
        return "../../admin/add_chapter";
    }
    
    @RequestMapping(value="/edit_chapter", method=RequestMethod.POST)
    public String setupForm12 (@ModelAttribute UserDetails loggedUser, BindingResult result, 
            @RequestParam String chapterId, @RequestParam String courseId, Map<String, Object> map){
        Chapter tempChapter = service.getChapterById(Integer.parseInt(chapterId));        
        map.put("tempChapter", tempChapter);
        map.put("courses", service.getAllCourse());
        map.put("courseTitle", service.getCourseById(Integer.parseInt(courseId)).getCourseTitle());
        return "../../admin/edit_chapter";
    }
    
    @RequestMapping(value="/chapteractions", method=RequestMethod.POST)
    public String doAction5(@ModelAttribute Chapter tempChapter, BindingResult result, @RequestParam String action,
            @RequestParam String courseId, @RequestParam String chapterId, Map<String, Object> map){
            Chapter chapter = new Chapter();
            switch(action.toLowerCase()){	
            case "add":
                tempChapter.setCourse(service.getCourseById(Integer.parseInt(courseId)));
                service.addChapter(tempChapter);
                break;
            case "edit":
                tempChapter.setCourse(service.getCourseById(Integer.parseInt(courseId)));
                tempChapter.setChapterId(Integer.parseInt(chapterId));
                service.updateChapter(tempChapter);
                break;             
            case "delete":
                try {
                    service.deleteChapter(Integer.parseInt(chapterId));
                    map.put("message", "Chapter successfully deleted.");
                } catch (Exception e) {
                    map.put("message", "Unable to delete chapter. Sorry.");
                }                
                break;
            }
            map.put("chapters", service.getChaptersByCourseId(Integer.parseInt(courseId)));   
            map.put("course", service.getCourseById(Integer.parseInt(courseId))); 
            return "../../admin/chapters_view";
    }
    
    @RequestMapping(value="/add_presentation", method=RequestMethod.POST)
    public String setupForm15 (@ModelAttribute UserDetails loggedUser, BindingResult result, 
        @RequestParam String chapterId, Map<String, Object> map){       
        map.put("tempPresentation", new Presentation());
        map.put("chapterId", chapterId);
        map.put("presentations", service.getAllPresentationsByChapterId(Integer.parseInt(chapterId)));
        return "../../admin/add_presentation";
    }
    
    private static final long serialVersionUID = 1L;     
    // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "upload";
    // upload settings
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
    
    @RequestMapping(value="addpresentation", method=RequestMethod.POST)    
    public String doAction5(HttpServletRequest request, HttpServletResponse response, @ModelAttribute Chapter chapter, 
            @ModelAttribute UserDetails loggedUser, BindingResult result,
            Map<String, Object> map)  throws ServletException, IOException {            
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
        ServletFileUpload upload = new ServletFileUpload(factory);         
        upload.setFileSizeMax(MAX_FILE_SIZE);         
        upload.setSizeMax(MAX_REQUEST_SIZE);          
        Presentation tempPresentation = new Presentation();
        String chapterId = "";         
        String description = "";
        try {
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
 
            if (formItems != null && formItems.size() > 0) {
                for (FileItem item : formItems) {
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        String filePath = context.getRealPath("")+ File.separator + "uploads" + File.separator +fileName;                        
                        File storeFile = new File(filePath);
                        item.write(storeFile);
                        tempPresentation.setFilePath(filePath);
                        tempPresentation.setFileSize(item.getSize());
                        tempPresentation.setFileType(item.getContentType());                        
                        tempPresentation.setFileName(fileName);
                    } else {
                        String name = item.getFieldName();
                        String value = item.getString();
                        if (name.equals("chapterId")){
                            chapterId = value;
                        } else {
                            description = value;
                        }                        
                    }
                }
            }                        
        } catch (Exception ex) {            
            ex.printStackTrace();            
        }
                                
        tempPresentation.setRecordStatus(true);                                                
        tempPresentation.setDescription(description);      
        int id = Integer.parseInt(chapterId);
        tempPresentation.setChapter(this.service.getChapterById(id));        
        service.addPresentation(tempPresentation);             
        map.put("tempPresentation", new Presentation());
        map.put("chapterId", chapterId);
        map.put("presentations", service.getAllPresentationsByChapterId(Integer.parseInt(chapterId)));
        return "../../admin/add_presentation";
    }
    
    @RequestMapping(value="/assign_course")
    public String setupForm14 (@ModelAttribute UserDetails loggedUser, BindingResult result,
            @RequestParam String userId, Map<String, Object> map){
        map.put("courses", service.getAllCourse());
        map.put("tempAssignment", new CoursesAssigned());
        map.put("assigned", service.getCoursesAssignedByUser(Integer.parseInt(userId)));
        map.put("userId", userId);
        map.put("message", "");
        map.put("name", service.getUserFullName(service.getUserById(Integer.parseInt(userId))));
        return "../../admin/assign_course";
    }    
    
    @RequestMapping(value="/assignmentactions", method=RequestMethod.POST)
    public String doAction6(@ModelAttribute CoursesAssigned tempAssignment, 
        BindingResult result, @RequestParam String action, @RequestParam String userId, @RequestParam String courseId, 
        @RequestParam String assignmentId, Map<String, Object> map){                        
        switch(action.toLowerCase()){	
        case "add":
            if (service.isUserAlreadyAssigned(Integer.parseInt(userId), Integer.parseInt(courseId))){
                map.put("userId", userId);
                map.put("message", "Course is already assigned!");
            } else {
                tempAssignment.setCourse(service.getCourseById(Integer.parseInt(courseId)));
                tempAssignment.setUserDetails(service.getUserById(Integer.parseInt(userId)));
                service.addCourseAssignment(tempAssignment);
                map.put("message", "Course succesfully added!");
            }
            break;                  
        case "delete":
            try {
                service.deleteCourseAssignment(Integer.parseInt(assignmentId));
                map.put("message", "Course succesfully removed!");
            } catch (Exception e) {
                map.put("message", "Unable to perform action. Sorry.");
            }                        
            break;
        }
        map.put("userId", userId);
        map.put("courses", service.getAllCourse());
        map.put("tempAssignment", new CoursesAssigned());
        map.put("assigned", service.getCoursesAssignedByUser(Integer.parseInt(userId)));
        map.put("userId", userId);            
        map.put("name", service.getUserFullName(service.getUserById(Integer.parseInt(userId))));
        return "../../admin/assign_course";            
    }
    
    @RequestMapping(value="/presentationactions", method=RequestMethod.POST)
    public String doAction6(@ModelAttribute Presentation tempPresentation, 
        BindingResult result, @RequestParam String action, @RequestParam String presentationId, 
        @RequestParam String chapterId, Map<String, Object> map){                        
        switch(action.toLowerCase()){	
        case "add":
            
        case "delete":
            try{
                Presentation presentation = service.getPresentationById(Integer.parseInt(presentationId));
    		File file = new File(presentation.getFilePath()); 
    		file.delete();
                service.deletePresentatoin(Integer.parseInt(presentationId));
                map.put("message", "Presentation successfully deleted.");
            }catch(Exception e){
                map.put("message", "Unable to delete presentation.");
            }            
            break;
        }
        map.put("chapterId", chapterId);
        map.put("tempPresentation", new Presentation());
        map.put("presentations", service.getAllPresentationsByChapterId(Integer.parseInt(chapterId)));
        return "../../admin/add_presentation";            
    }
    
    @RequestMapping(value="/addexam", method=RequestMethod.GET)
    public String setupForm22 (@ModelAttribute UserDetails loggedUser, BindingResult result,
            Map<String, Object> map){
        map.put("courses", service.getAllCourse());
        map.put("tempExam", new Exam());
        return "../../admin/admin_add_exam";
    }
    
    @RequestMapping(value="/examactions", method=RequestMethod.POST)
    public String doAction7(HttpServletRequest request, HttpServletResponse response, @ModelAttribute UserDetails tempUser, 
        BindingResult result, @RequestParam String action, Map<String, Object> map){                        
                        
        String courseId = request.getParameter("courseId");
        switch(action.toLowerCase()){	
        case "add":            
            String examTitle = request.getParameter("examTitle");
            String examStart = request.getParameter("examStart");
            String examDue = request.getParameter("examDue");
            String timeLimit = request.getParameter("timeLimit");        
            System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<"+examStart);
            System.out.println(examDue);
            Timestamp tsExamStart = Timestamp.valueOf(examStart.replace("T", " ")+":00");
            System.out.println(tsExamStart);
            Timestamp tsExamDue = Timestamp.valueOf(examDue.replace("T", " ")+":00");                
            System.out.println(tsExamDue);
            Exam tempExam = new Exam();
            tempExam.setNumQuestions(this.getQuestionNumber(request));
            tempExam.setExamStart(tsExamStart);
            tempExam.setExamDue(tsExamDue);
            tempExam.setExamTitle(examTitle);
            tempExam.setTimeLimit(Float.valueOf(timeLimit));
            tempExam.setCourse(service.getCourseById(Integer.parseInt(courseId)));
            tempExam.setQuestionDetails(this.getQuestionDetails(request).toString());
            service.addExam(tempExam);
            break;
        case "delete":
            try {
                String examId = request.getParameter("examId");
                System.out.println(examId);
                service.deleteExam(Integer.parseInt(examId));
                map.put("message", "Exam successfully deleted.");
            } catch (Exception e) {
                map.put("message", "Unable to delete exam. Sorry.");
            }                
            break;
        }
        map.put("exams", service.getAllExam());
        return "../../admin/exams_view";            
    }
    
    public int getQuestionNumber (HttpServletRequest request){
        List<String> questions = new ArrayList();
        for(String q : request.getParameterValues("questions")){
            questions.add(q);
        }
        return questions.size();
    }
    
    public String getQuestionDetails (HttpServletRequest request){
        List<String> questions = new ArrayList();
        for(String q : request.getParameterValues("questions")){
            questions.add(q);
        }
        
        
        List<String> answers = new ArrayList();
        for(String a : request.getParameterValues("answers")){
            answers.add(a);
        }
        
        List<List> choices = new ArrayList();
        for(int x=1;x<(questions.size())+1;x++){            
            List<String> ch = new ArrayList();
            for(String c : request.getParameterValues("choice"+x)){
                ch.add(c);
            }            
            choices.add(ch);
        }
        
        JSONObject json = new JSONObject();
        for(int x=1;x<(questions.size())+1;x++){
            JSONObject g = new JSONObject();
            g.put("Question", questions.get(x-1));
            g.put("Answer", answers.get(x-1));
            g.put("Choices", choices.get(x-1));
            json.put(x-1, g);
        }
        return json.toString();
    }
    
    @RequestMapping(value="/view_exams")
     public String setupForm10 (@ModelAttribute UserDetails loggedUser, BindingResult result,
             Map<String, Object> map){
        map.put("exams", service.getAllExam()); 
        return "../../admin/exams_view";
    }
     
    @RequestMapping(value="/download", method=RequestMethod.GET)
    public String handleFileDownload(HttpServletResponse res, HttpServletRequest req) {
            try {
                String path = req.getParameter("file");
                String fileName = req.getParameter("name");
                File f = new File(path);
                if (f.exists()) {
                    res.setContentLength(new Long(f.length()).intValue());
                    res.setHeader("Content-Disposition", "attachment; " + fileName);
                    res.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
                    OutputStream out = res.getOutputStream();
                    res.setContentType("text/plain; charset=utf-8");
                    FileInputStream fi = new FileInputStream(f);
                    IOUtils.copy(fi, out);
                    out.flush();
                    out.close();                    
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            return null;
        }
    
    @RequestMapping(value="/logout")
     public String setupForm11 (HttpServletRequest request, @ModelAttribute UserDetails loggedUser, BindingResult result,
             Map<String, Object> map){
        request.getSession().invalidate();
        return "../../admin/redirect";
    }
     
     @RequestMapping(value="/reset_password")
     public String setupForm11 (@ModelAttribute UserDetails loggedUser, BindingResult result,
             Map<String, Object> map){
        return "../../admin/change_password";
    }
    
    @RequestMapping(value="/passwordactions", method=RequestMethod.POST)
    public String doAction6(HttpServletRequest request, @ModelAttribute UserDetails loggedUser, 
            @RequestParam String oldPassword, @RequestParam String newPassword, @RequestParam String newPassword1,
            Map<String, Object> map){
        
        UserDetails admin = (UserDetails)request.getSession().getAttribute("user");
        
        if (service.isPasswordCorrect(admin, oldPassword)){
            if (service.isPasswordEqual(newPassword, newPassword1)){
                service.changePasword(admin, newPassword);
                map.put("message", "Password successfully changed.");
            }
            else{
                map.put("message", "Passwords are incorrect. Please enter identical new passwords.");
            }
        } else {
            map.put("message", "Password is incorrect. Please enter the correct current password.");
        }        
        return "../../admin/change_password";        
    }
    
}
