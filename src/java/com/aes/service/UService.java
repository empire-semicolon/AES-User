/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.aes.service;

import com.aes.dao.UDao;
import com.aes.model.Chapter;
import com.aes.model.Course;
import com.aes.model.Exam;
import com.aes.model.ExamScores;
import com.aes.model.Presentation;
import com.aes.model.UserDetails;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Ken Andre
 */
@Service
public class UService {
    @Autowired
    private UDao uDao;
    
    @Transactional
    public int isValid(UserDetails user){
        return uDao.isValid(user);
    }
    
    @Transactional
    public Iterable<Presentation> getAllPresentations(Chapter chapter){
        return uDao.getAllPresentations(chapter);
    }
    
    @Transactional
    public Iterable<Exam> getAllExamsOfCourse(Course course){
        return uDao.getAllExamsOfCourse(course);
    }
    
    @Transactional
    public Iterable<Chapter> getAllChapterOfCourse(Course course){
        return uDao.getAllChapterOfCourse(course);
    }
    
    @Transactional
    public Iterable<ExamScores> getExamScores(UserDetails user){
        return uDao.getExamScores(user);
    }
    
    @Transactional
    public List<Course> getAllCoursesAssigned(UserDetails user){
        return uDao.getAllCoursesAssigned(user);
    }
    
    @Transactional
    public List<Exam> getOngoingExams(UserDetails user){
        return uDao.getOngoingExams(user);
    }
    
    @Transactional
    public List<Exam> getPastExams(UserDetails user){
        return uDao.getPastExams(user);
    }
    
    @Transactional
    public List<Integer> getPastExamsExamScores(UserDetails user){
        return uDao.getPastExamsExamScores(user);
    }
    
    @Transactional
    public List<Exam> getUpcomingExams(UserDetails user){
        return uDao.getUpcomingExam(user);
    }
    
    @Transactional
    public Exam getExam(Exam exam){
        return uDao.getExam(exam);
    }
    
    @Transactional
    public boolean updateProfile(UserDetails user){
        return uDao.updateProfile(user);
    }
    
    @Transactional
    public UserDetails getUserDetails(UserDetails user){
        return uDao.getUserDetails(user);
    }
    
    @Transactional
    public List<Exam> getOngoingExamsByCourse(UserDetails user, int courseId){
        return uDao.getOngoingExamsByCourse(user, courseId);
    }
    
		@Transactional
    public List<Exam> getUpcomingExamsByCourse(UserDetails user, int courseId){
        return uDao.getUpcomingExamsByCourse(user, courseId);
    }
		
		 @Transactional
    public List<Exam> getPastExamsByCourse(UserDetails user, int courseId){
        return uDao.getPastExamsByCourse(user, courseId);
    }
		
		@Transactional
		public Course getCourseById(int courseId){
			return uDao.getCourseById(courseId);
		}
                
                @Transactional
		public boolean isCourseAssigned(UserDetails user, int courseId){
			return uDao.isCourseAssigned(user, courseId);
		}

		
    /*@Transactional
    public boolean updateProfile(UserDetails user){
        return uDao.updateProfile(user);
    }*/
    
    /*@Transactional
    public boolean updatePassword(UserDetails user){
        return uDao.updatePassword(user);
    }*/
}
