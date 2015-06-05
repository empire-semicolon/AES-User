package com.aes.controller;

import com.aes.model.Chapter;
import com.aes.model.Course;
import com.aes.model.Exam;
import com.aes.model.ExamScores;
import com.aes.model.UserDetails;
import com.aes.service.EmpireService;
import com.aes.service.UService;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.IOUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author RCBG
 */

@Controller
@RequestMapping("/user")
public class UserController {
    
    @Autowired
    private UService service;
    
    @Autowired
    private EmpireService e_service;
    
    @RequestMapping(value="/home")
    public String setupForm(Map<String, Object> map, HttpServletRequest request){
        HttpSession session=request.getSession();
        int userID=(int)session.getAttribute("userID");
        UserDetails usr = new UserDetails();
        usr.setUserId(userID);
        UserDetails user=service.getUserDetails(usr);
        map.put("userName",user.getUserName());
        return "../../user/home";
    }
    
    @RequestMapping(value="/view_profile", method=RequestMethod.GET)
     public String setupForm2 (Map<String, Object> map, HttpServletRequest request){
        HttpSession session=request.getSession();
        int userID=(int)session.getAttribute("userID");
        UserDetails usr = new UserDetails();
        usr.setUserId(userID);
        UserDetails user=service.getUserDetails(usr);
        map.put("firstName",user.getFirstName());
        map.put("middleName",user.getMiddleName());
        map.put("lastName",user.getLastName());
        map.put("userName",user.getUserName());
        map.put("userBU", e_service.getUnitNameById(user.getBusinessUnit().getBusinessUnitId()));
        map.put("position",user.getPosition());
        map.put("email",user.getEmail());
        return "../../user/profile/view_profile";
    }
   
    @RequestMapping(value="/edit_profile", method=RequestMethod.GET)
    public String setupForm3 (@ModelAttribute UserDetails loggedUser, Map<String, Object> map,
            HttpServletRequest request){
        HttpSession session=request.getSession();
        int userID=(int)session.getAttribute("userID");
        UserDetails usr = new UserDetails();
        usr.setUserId(userID);
        UserDetails user=service.getUserDetails(usr);
        //map.put("tempUser",user);
        map.put("firstName",user.getFirstName());
        map.put("middleName",user.getMiddleName());
        map.put("lastName",user.getLastName());
        map.put("userName",user.getUserName());
        map.put("businessUnit", e_service.getAllBusinessUnit());
        map.put("userBU", e_service.getUnitNameById(user.getBusinessUnit().getBusinessUnitId()));
        map.put("businessUnits", e_service.getAllBusinessUnit());
        map.put("position",user.getPosition());
        map.put("email",user.getEmail());
        //map.put("userType",service.getTypeNameById(user.getUserType().getUserTypeId()));
        return "../../user/profile/edit_profile";
    }
    
    @RequestMapping(value="/change_password", method=RequestMethod.GET)
    public String setupForm4 (@ModelAttribute UserDetails loggedUser, Map<String, Object> map,
            HttpServletRequest request){
        HttpSession session=request.getSession();
        int userID=(int)session.getAttribute("userID");
        UserDetails usr = new UserDetails();
        usr.setUserId(userID);
        UserDetails user=service.getUserDetails(usr);
        map.put("userName",user.getUserName());
        map.put("old_pw", user.getPassword());
        return "../../user/profile/change_password";
    }
    
    @RequestMapping(value="/useractions", method=RequestMethod.POST)
    public String doActions(Map<String, Object> map,
            HttpServletRequest request, @RequestParam String email, @RequestParam String buChosen, 
            @RequestParam String firstname, @RequestParam String middlename, 
            @RequestParam String lastname, @RequestParam String position,
            @RequestParam String action, @RequestParam String old_pw, 
            @RequestParam String new_pw, @RequestParam String confirm_pw){
        HttpSession session=request.getSession();
        int userID=(int)session.getAttribute("userID");
        UserDetails usr = new UserDetails();
        usr.setUserId(userID);
        UserDetails user=service.getUserDetails(usr);
        switch(action.toLowerCase()){
            case "edit":
                user.setFirstName(firstname);
                user.setMiddleName(middlename);
                user.setLastName(lastname);
                user.setEmail(email);
                user.setBusinessUnit(e_service.getBusinessUnit(Integer.parseInt(buChosen)));
                user.setPosition(position);
                service.updateProfile(user);
                break;
            case "change_password":
                
                String password=user.getPassword();
                if(password.equals(old_pw)&&new_pw.equals(confirm_pw)){
                    user.setPassword(new_pw);
                    service.updateProfile(user);
                }else{
                    map.put("userName",user.getUserName());
                    return "../../user/profile/change_password";
                }
                break;
        }
        map.put("userName",user.getUserName());
        return "../../user/home";
    }
    
    @RequestMapping(value="/ongoing_exams", method=RequestMethod.GET)
    public String setupForm5(@ModelAttribute UserDetails loggedUser, Map<String, Object> map,
            HttpServletRequest request){
        HttpSession session=request.getSession();
        int userID=(int)session.getAttribute("userID");
        UserDetails usr = new UserDetails();
        usr.setUserId(userID);
        UserDetails user=service.getUserDetails(usr);
        map.put("ongoingExams", service.getOngoingExams(user));
        return "../../user/exam/ongoing_exams";
    }
    
    @RequestMapping(value="/past_exams", method=RequestMethod.GET)
    public String setupForm10(@ModelAttribute UserDetails loggedUser, Map<String, Object> map,
            HttpServletRequest request){
        HttpSession session=request.getSession();
        int userID=(int)session.getAttribute("userID");
        UserDetails usr = new UserDetails();
        usr.setUserId(userID);
        UserDetails user=service.getUserDetails(usr);
        map.put("userID", userID);
        map.put("pastExams", service.getPastExams(user));
        map.put("scores",service.getPastExamsExamScores(user));
        return "../../user/exam/past_exams";
    }
    
    @RequestMapping(value="/upcoming_exams", method=RequestMethod.GET)
    public String setupForm6(@ModelAttribute UserDetails loggedUser, Map<String, Object> map,
            HttpServletRequest request){
        HttpSession session=request.getSession();
        int userID=(int)session.getAttribute("userID");
        UserDetails usr = new UserDetails();
        usr.setUserId(userID);
        UserDetails user=service.getUserDetails(usr);
        map.put("upcomingExams", service.getUpcomingExams(user));
        return "../../user/exam/upcoming_exams";
    }
    
    @RequestMapping(value="/take_exam", method=RequestMethod.GET)
    public String setupForm10(@ModelAttribute UserDetails loggedUser, Map<String, Object> map,
	HttpServletRequest request, @RequestParam String examId) throws ParseException{
        Exam exam = new Exam();
        exam.setExamId(Integer.parseInt(examId));
        exam = service.getExam(exam);

        JSONParser parser = new JSONParser();
        Object obj = parser.parse(exam.getQuestionDetails());
        JSONObject jsonObject = (JSONObject)obj;
        List<String> questions=new ArrayList<>();
        List<ArrayList> choices=new ArrayList<>();
        
        for(int x=0;x<2;x++){
            JSONObject question=(JSONObject)jsonObject.get(""+x);
            questions.add((String)question.get("Question"));
            ArrayList<String> listdata = new ArrayList<String>();
            JSONArray question_choices=(JSONArray)question.get("Choices");
            Iterator<String> iterator = question_choices.iterator();
            listdata.add((String)question.get("Answer"));
            while(iterator.hasNext()){
                listdata.add(iterator.next());
            }
            Collections.shuffle(listdata);
            choices.add(listdata);
        }
        
        map.put("exam",exam);
        map.put("questions", questions);
        map.put("choices", choices);
        
        return "../../user/exam/exam";
    }
    
    @RequestMapping(value="/submit_exam", method=RequestMethod.POST)
    public String setupForm11(@ModelAttribute UserDetails loggedUser, Map<String, Object> map,
            HttpServletRequest request, @RequestParam String examId, @RequestParam String answers) throws ParseException, java.text.ParseException{
        Exam exam = new Exam();
        exam.setExamId(Integer.parseInt(examId));
        exam = service.getExam(exam);
        
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(exam.getQuestionDetails());
        JSONObject jsonObject = (JSONObject)obj;
        List<String> correct_answers=new ArrayList<>();
        List<String> questions=new ArrayList<>();
        List<String> correctOrWrong=new ArrayList<>();
        
        for(int x=0;x<2;x++){
            JSONObject question=(JSONObject)jsonObject.get(""+x);
            questions.add((String)question.get("Question"));
            correct_answers.add((String)question.get("Answer"));
        }
        
        int exam_score=0;
        String user_answers_array[]=answers.split(",");
        List<String> user_answers=new ArrayList<>();
        user_answers.addAll(Arrays.asList(user_answers_array));
        for(int x=0;x<2;x++){
            if(correct_answers.get(x).equals(user_answers.get(x))){
                correctOrWrong.add("+1");
                exam_score++;
            }else{
                correctOrWrong.add("");
            }
        }
				
        System.out.println("Exam Score: "+exam_score);		
        
        HttpSession session = request.getSession();
        UserDetails user = new UserDetails();
        user.setUserId((int)session.getAttribute("userID"));
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date=new Date();
        String dateString = dateFormat.format(date);
        ExamScores e=new ExamScores();
        e.setExam(exam);
        e.setDateTaken(dateFormat.parse(dateString));
        e.setScore(exam_score);
        e.setMaxScore(10);
        e.setUserDetails(user);
        e_service.addExamScore(e);
        
        map.put("exam",exam);
        map.put("questions", questions);
        map.put("correct_answers", correct_answers);
        map.put("user_answers",user_answers);
        map.put("correctOrWrong", correctOrWrong);
        map.put("exam_score",exam_score);
        
        return "../../user/exam/exam_results";
    }

    @RequestMapping(value="/course_outline", method=RequestMethod.GET)
    public String setupForm7(@ModelAttribute UserDetails loggedUser, Map<String, Object> map,
        HttpServletRequest request, @RequestParam String courseId){
        HttpSession session = request.getSession();
        UserDetails user = new UserDetails();
        user.setUserId((int)session.getAttribute("userID"));
        if(service.isCourseAssigned(user, Integer.parseInt(courseId))){
            Course course = service.getCourseById(Integer.parseInt(courseId));
            Iterable<Chapter> chapters=service.getAllChapterOfCourse(course);
            List<Integer> chapterIDs = new ArrayList<>();
            List<Chapter> chapters_final = new ArrayList<>();
            for(Chapter c: chapters){
                if(!chapterIDs.contains(c.getChapterId())){
                    chapters_final.add(c);
                    chapterIDs.add(c.getChapterId());
                }
            }
            map.put("course", course);
            map.put("chapter", chapters_final);
            return "../../user/course/course_outline";
        }else{
            return "../../user/home";
        }
    }
    
    @RequestMapping(value="/course_exams", method=RequestMethod.GET)
    public String setupForm8(@ModelAttribute UserDetails loggedUser, Map<String, Object> map,
        HttpServletRequest request, @RequestParam String courseId){
        HttpSession session = request.getSession();
        UserDetails user = new UserDetails();
        user.setUserId((int)session.getAttribute("userID"));
        if(service.isCourseAssigned(user, Integer.parseInt(courseId))){
            map.put("ongoingExam", service.getOngoingExamsByCourse(user,Integer.parseInt(courseId)));
            map.put("pastExam", service.getPastExamsByCourse(user, Integer.parseInt(courseId)));
            map.put("upcomingExam", service.getUpcomingExamsByCourse(user, Integer.parseInt(courseId)));
            map.put("course", e_service.getCourseById(Integer.parseInt(courseId)));
            map.put("scores",service.getPastExamsExamScores(user));
            return "../../user/course/course_exams";
        }else{
            return "../../user/home";
        }
    }
    
    @RequestMapping(value="/download", method=RequestMethod.GET)
    public String handleFileDownload(@RequestParam String file, @RequestParam String name,
        HttpServletResponse res, HttpServletRequest req) {
        try{
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
        }catch (Exception e) {
           System.out.println(e.getMessage());
        }
        return null;
    }
}
