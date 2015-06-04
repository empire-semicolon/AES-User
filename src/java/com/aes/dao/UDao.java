/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.aes.dao;

import com.aes.model.Chapter;
import com.aes.model.Course;
import com.aes.model.CoursesAssigned;
import com.aes.model.Exam;
import com.aes.model.ExamScores;
import com.aes.model.Presentation;
import com.aes.model.UserDetails;
import com.aes.util.HibernateUtil;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Ken Andre
 */
@Repository
public class UDao {
    @Autowired
    private SessionFactory session;
    
    //@Autowired
    //private HibernateUtil dbUtil;
    
    public int isValid(UserDetails user){
        int uId = 0;
        Iterable<UserDetails> result =  session.getCurrentSession().createCriteria(UserDetails.class)
                .add(Restrictions.eq("userName", user.getUserName()))
                .add(Restrictions.eq("password", user.getPassword())).list();
        for(UserDetails u : result)
            uId = u.getUserId();
        
        return uId;
    }
    
    public Iterable<Presentation> getAllPresentations(Chapter chapter){
        
        return session.getCurrentSession().createCriteria(Presentation.class)
                .add(Restrictions.eq("chapter.chapterId", chapter.getChapterId())).list();
    }
    
    public Iterable<Exam> getAllExamsOfCourse(Course course){
        
        return session.getCurrentSession().createCriteria(Exam.class).add(Restrictions.eq("course.courseId", course.getCourseId())).list();
    }
    
    public Iterable<Chapter> getAllChapterOfCourse(Course course){
        
        return session.getCurrentSession().createCriteria(Chapter.class).add(Restrictions.eq("course.courseId", course.getCourseId())).list();
    }
    
    public Iterable<ExamScores> getExamScores(UserDetails user){
        
        return session.getCurrentSession().createCriteria(ExamScores.class).add(Restrictions.eq("userDetails.userId", user.getUserId())).list();
    }
    
    public List<Course> getAllCoursesAssigned(UserDetails user){
        
        Iterable<CoursesAssigned> coursesAssigned =  session.getCurrentSession().createCriteria(CoursesAssigned.class)
                .add(Restrictions.eq("userDetails.userId", user.getUserId())).list();
        List<Course> course = new ArrayList<>();
        for(CoursesAssigned ca : coursesAssigned)
            course.add(ca.getCourse());
        
        return course;
    }
    
    
    public List<Exam> getOngoingExams(UserDetails user){
        Iterable<ExamScores> user_examscores=getExamScores(user);
        List<Course> course = getAllCoursesAssigned(user);
        List<Exam> exams = new ArrayList<>();
        List<Integer> examIds=new ArrayList<>();
        
        //in order to eliminate taken exam that are still ongoing
        for(ExamScores es : user_examscores){
            if(!examIds.contains(es.getExam().getExamId())){
                examIds.add(es.getExam().getExamId());
            }
        }
        
        Date date = new Date();
        for(Course c : course){
            for(Exam e : c.getExams()){
                if((e.getExamStart().before(date))&&(e.getExamDue()).after(date)&&!examIds.contains(e.getExamId()))
                    exams.add(e);
            }
        }
        
        return exams;
    }
    
    public List<Exam> getPastExams(UserDetails user){
        Iterable<ExamScores> user_examscores=getExamScores(user);
        List<Course> user_courses = getAllCoursesAssigned(user);
        List<Exam> past_exams = new ArrayList<>();
        List<Integer> examIds=new ArrayList<>();
        
        //taken exams
        for(ExamScores es : user_examscores){
            if(!examIds.contains(es.getExam().getExamId())){
                past_exams.add(es.getExam());
                examIds.add(es.getExam().getExamId());
            }
        }
        
        //untaken exams but already past due
        Date date = new Date();
        for(Course c : user_courses){
            for(Exam e : c.getExams()){
                if((e.getExamDue()).before(date)&&!examIds.contains(e.getExamId()))
                    past_exams.add(e);
            }
        }
        
        return past_exams;
    }
    
    public List<Integer> getPastExamsExamScores(UserDetails user){
        List<Exam> past_exams=getPastExams(user);
        List<Integer> scores=new ArrayList<>();
        for(Exam e : past_exams){
            int score=0;
            for(ExamScores es : e.getExamScoreses()){
                if(es.getUserDetails().getUserId()==user.getUserId()){
                    score=es.getScore();
                }
            }
            scores.add(score);
        }
        return scores;
    }
    
    public List<Exam> getUpcomingExam(UserDetails user){
        List<Course> course = getAllCoursesAssigned(user);
        List<Exam> exams = new ArrayList<>();
        Date date = new Date();
        for(Course c : course){
            for(Exam e : c.getExams()){
                if((e.getExamStart()).after(date))
                    exams.add(e);
            }
        }
        
        return exams;
    }
    
    public Exam getExam(Exam exam){
        Iterable<Exam> e = session.getCurrentSession().createCriteria(Exam.class)
                .add(Restrictions.eq("examId", exam.getExamId())).list();
        Exam exm = new Exam();
        for(Exam ex : e)
            exm = ex;
        
        return exm;
    }
    
    public UserDetails getUserDetails(UserDetails user){
        Iterable<UserDetails> result = session.getCurrentSession().createCriteria(UserDetails.class)
                .add(Restrictions.eq("userId", user.getUserId())).list();
        UserDetails usr = new UserDetails();
        for(UserDetails u : result)
            usr = u;
        
        return usr;
    }
    
    public boolean updateProfile(UserDetails user){
        try{
            session.getCurrentSession().update(user);
            
            return true;
        }
        catch(HibernateException ex){
            ex.printStackTrace();
            
            return false;
        }
    }
    
    public List<Exam> getOngoingExamsByCourse(UserDetails user, int courseId) {
        List<Exam> exams = getOngoingExams(user);
        List<Exam> ongoing = new ArrayList<>();
        for (Exam e : exams) {
            if (e.getCourse().getCourseId() == courseId) {
                ongoing.add(e);
            }
        }

        return ongoing;
    }
		
		public List<Exam> getUpcomingExamsByCourse(UserDetails user, int courseId) {
        List<Exam> exams = getUpcomingExam(user);
        List<Exam> upcoming = new ArrayList<>();
        for (Exam e : exams) {
            if (e.getCourse().getCourseId() == courseId) {
                upcoming.add(e);
            }
        }

        return upcoming;
    }
    
		public List<Exam> getPastExamsByCourse(UserDetails user, int courseId){
        List<Exam> exams = getPastExams(user);
        List<Exam> past = new ArrayList<>();
        
        for(Exam e : exams){
            if(e.getCourse().getCourseId() == courseId)
                past.add(e);
        }
        
        return past;
    }
		
		public Course getCourseById(int courseId){
			Iterable<Course> c = session.getCurrentSession().createCriteria(Course.class)
							.add(Restrictions.eq("courseId", courseId)).list();
			Course course = new Course();
			for(Course cr : c)
				course = cr;
			
			return course;
		}
                
                public boolean isCourseAssigned(UserDetails user, int courseId){
                    List<Course> courses=getAllCoursesAssigned(user);
                    for(Course c: courses){
                        if(c.getCourseId()==courseId)
                            return true;
                    }
                    return false;
                }
                
                
                
		
    /*public boolean updateProfile(UserDetails user){
        Session session = dbUtil.getSessionFactory().openSession();
        Transaction tx = null;
        
        try{
            tx = session.beginTransaction();
            UserDetails newUser = (UserDetails)session.get(UserDetails.class, user.getUserId());
            newUser.setBirthday(user.getBirthday());
            newUser.setBusinessUnit(user.getBusinessUnit());
            newUser.setEmail(user.getEmail());
            newUser.setFirstName(user.getFirstName());
            newUser.setLastName(user.getLastName());
            newUser.setMiddleName(user.getMiddleName());
            newUser.setPosition(user.getPosition());
            newUser.setUserName(user.getUserName());
            
            session.update(newUser);
            tx.commit();
            
            return true;
        }
        catch(HibernateException e){
            if(tx!=null) tx.rollback();
            e.printStackTrace();
            
            return false;
        }
        finally{
            session.close();
        }
    }*/
    
    /*public boolean updatePassword(UserDetails user){
        Session session = dbUtil.getSessionFactory().openSession();
        Transaction tx = null;
        
        try{
            tx = session.beginTransaction();
            UserDetails newUser = (UserDetails)session.get(UserDetails.class, user.getUserId());
            newUser.setPassword(user.getPassword());
            
            session.update(newUser);
            tx.commit();
            
            return true;
        }
        catch(HibernateException e){
            if(tx!=null) tx.rollback();
            e.printStackTrace();
            
            return false;
        }
        finally{
            session.close();
        }
    }*/
}
