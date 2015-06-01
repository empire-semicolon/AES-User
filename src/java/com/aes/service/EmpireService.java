/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aes.service;
import com.aes.dao.impl.BusinessUnitDaoImpl;
import com.aes.dao.impl.ChapterDaoImpl;
import com.aes.dao.impl.CourseCategoryDaoImpl;
import com.aes.dao.impl.CourseDaoImpl;
import com.aes.dao.impl.CoursesAssignedDaoImpl;
import com.aes.dao.impl.ExamDaoImpl;
import com.aes.dao.impl.ExamScoresDaoImpl;
import com.aes.dao.impl.PresentationDaoImpl;
import com.aes.dao.impl.UserDetailsDaoImpl;
import com.aes.dao.impl.UserTypeDaoImpl;
import com.aes.model.BusinessUnit;
import com.aes.model.Chapter;
import com.aes.model.Course;
import com.aes.model.CourseCategory;
import com.aes.model.CoursesAssigned;
import com.aes.model.Exam;
import com.aes.model.ExamScores;
import com.aes.model.Presentation;
import com.aes.model.UserDetails;
import com.aes.model.UserType;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Bryan
 */
@Service
public class EmpireService {    
    
    @Autowired
    private BusinessUnitDaoImpl buDao;
    
    @Autowired
    private UserDetailsDaoImpl userDao;
    
    @Autowired
    private ChapterDaoImpl chapterDao;
    
    @Autowired
    private CourseCategoryDaoImpl categoryDao;
    
    @Autowired
    private CourseDaoImpl courseDao;
    
    @Autowired
    private CoursesAssignedDaoImpl assignmentDao;
    
    @Autowired
    private ExamDaoImpl examDao;
    
    @Autowired
    private ExamScoresDaoImpl scoreDao;
    
    @Autowired
    private PresentationDaoImpl presentationDao;
    
    @Autowired
    private UserTypeDaoImpl userTypeDao;
    
    @Transactional
    public void addBusinessUnit (BusinessUnit businessUnit){
        buDao.add(businessUnit);
    }
    
    @Transactional
    public void updateBusinessUnit (BusinessUnit businessUnit){
        buDao.edit(businessUnit);
    }
    
    @Transactional
    public void deleteBusinessUnit (int id){
        buDao.delete(id);
    }
    
    @Transactional
    public List getAllBusinessUnit (){
        return buDao.getAll();
    }
    
    @Transactional
    public List searchBusinessUnit(String name){
        return buDao.searchName(name);
    }
    
    @Transactional
    public BusinessUnit getBusinessUnit(int businessUnitId){
        return buDao.getById(businessUnitId);
    }    
    
    @Transactional
    public void addUser (UserDetails user){
        userDao.add(user);
    }
    
    @Transactional
    public void updateUser (UserDetails user){
        userDao.edit(user);
    }
    
    @Transactional
    public void deleteUser (int id){
        userDao.delete(id);
    }
    
    @Transactional
    public List getAllUser (){
        return userDao.getAll();
    }
    
    @Transactional
    public List searchUser(String name){
        return userDao.searchName(name);
    }
    
    @Transactional
    public UserDetails getUserById(int userId){
        return userDao.getById(userId);
    }
    
    @Transactional
    public void addChapter (Chapter chapter){
        chapterDao.add(chapter);
    }
    
    @Transactional
    public void updateChapter(Chapter chapter){
        chapterDao.edit(chapter);
    }
    
    @Transactional
    public void deleteChapter (int id){
        chapterDao.delete(id);
    }
    
    @Transactional
    public Chapter getChapterById (int id){
        return this.chapterDao.getById(id);
    }
    
    @Transactional
    public List getAllChapters (){
        return chapterDao.getAll();
    }
    
    @Transactional
    public List searchChapterByName(String name){
        return chapterDao.searchName(name);
    }
    
    @Transactional
    public void addCourseCategory(CourseCategory category){
        categoryDao.add(category);
    }
    
    @Transactional
    public void updateCourseCategory(CourseCategory category){
        categoryDao.edit(category);
    }
    
    @Transactional
    public void deleteCourseCategory (int id){
        categoryDao.delete(id);
    }
    
    @Transactional
    public CourseCategory getCourseCategoryById (int id){
        return categoryDao.getById(id);
    }
    
    @Transactional
    public List getAllCourseCategory (){
        return categoryDao.getAll();
    }
    
    @Transactional
    public List searchCourseCategoryByName (String name){
        return categoryDao.searchName(name);
    }
    
    @Transactional
    public void addCourse (Course course){
        courseDao.add(course);
    }
    
    @Transactional
    public void updateCourse (Course course){
        courseDao.edit(course);
    }
    
    @Transactional
    public void deleteCourse (int id){
        courseDao.delete(id);
    }
    
    @Transactional
    public Course getCourseById (int id){
        return courseDao.getById(id);
    }
    
    @Transactional
    public List getAllCourse(){
        return courseDao.getAll();
    }
    
    @Transactional
    public List searchCourseByName(String name){
        return courseDao.searchName(name);
    }
    
    @Transactional
    public void addCourseAssignment (CoursesAssigned assignment){
        assignmentDao.add(assignment);
    }
    
    @Transactional
    public void editCourseAssignment (CoursesAssigned assignment){
        assignmentDao.edit(assignment);
    }
    
    @Transactional
    public void deleteCourseAssignment (int id){
        assignmentDao.delete(id);
    }
    
    @Transactional
    public void deleteAllCourseAssignmentByUserId(int id){
        assignmentDao.deleteAllAssignmentByUserId(id);
    }
    
    @Transactional
    public CoursesAssigned getByAssignmentId (int id){
        return assignmentDao.getById(id);
    }
    
    @Transactional
    public List getAllCourseAssignedByUserId (int id){
        return assignmentDao.getAllById(id);
    }
    
    @Transactional
    public void addExam (Exam exam){
        examDao.add(exam);
    }
    
    @Transactional
    public void updateExam (Exam exam){
        examDao.edit(exam);
    }
    
    @Transactional
    public void deleteExam (int id){
        examDao.delete(id);
    }
    
    @Transactional
    public Exam getExamById (int id){
        return examDao.getById(id);
    }
    
    @Transactional
    public List getAllExam (){
        return examDao.getAll();
    }
    
    @Transactional
    public List searchExamByName (String name){
        return examDao.searchName(name);
    }
    
    @Transactional
    public void addExamScore (ExamScores score){
        scoreDao.add(score);
    }
    
    @Transactional
    public void updateExamScore (ExamScores score){
        scoreDao.edit(score);
    }
    
    @Transactional
    public void deleteExamScore (int id){
        scoreDao.delete(id);
    }
    
    @Transactional
    public ExamScores getScoreById (int id){
        return scoreDao.getById(id);
    }
    
    @Transactional
    public List getAllScores(){
        return scoreDao.getAll();
    }
    
    @Transactional
    public List getAllByUserId (int id){
        return scoreDao.getAllById(id);
    }
    
    @Transactional
    public void addPresentation (Presentation presentation){
        presentationDao.add(presentation);
    }
    
    @Transactional
    public void updatePresentation (Presentation presentation){
        presentationDao.edit(presentation);
    }
    @Transactional
    public void deletePresentatoin (int id){
        presentationDao.delete(id);
    }
    
    @Transactional
    public List getAllPresentation (){
        return presentationDao.getAll();
    }
    
    @Transactional
    public Presentation getPresentationById (int id){
        return presentationDao.getById(id);
    }
    
    @Transactional
    public List searchPresentationByName (String name){
        return presentationDao.searchName(name);
    }
    
    @Transactional
    public void addUserType (UserType userType){
        userTypeDao.add(userType);
    }
    
    @Transactional
    public void updateUserType (UserType type){
        userTypeDao.edit(type);
    }
    
    @Transactional
    public void deleteUserType (int id){
        userTypeDao.delete(id);
    }
    
    @Transactional
    public UserType getUserTypeById (int id){
        return userTypeDao.getById(id);
    }
    
    @Transactional
    public List getAllUserTypes (){
        return userTypeDao.getAll();
    }
    
    @Transactional
    public List searchUserTypeByName (String name){
        return userTypeDao.searchName(name);
    }
    
    public String getStringUserBirthday (UserDetails user){
        return userDao.getBirthdayString(user);
    }
    
    @Transactional
    public String getUnitNameById (int id){
        return buDao.getUnitById(id);
    }
    
    @Transactional
    public String getTypeNameById (int id){
        return userTypeDao.getTypeNameById(id);
    }
    
    @Transactional
    public void resetPassword (UserDetails user){
        userDao.resetPasword(user);
    }
    
    @Transactional
    public List getAllTrainers(){
        return userDao.getAllTrainers();
    }
    
    @Transactional
    public List getAllTrainees(){
        return userDao.getAllTrainees();
    }
    
    @Transactional
    public String getCategoryNameById (int id){
        return this.categoryDao.getTypeNameById(id);
    }   
    
    @Transactional
    public List getChaptersByCourseId (int id){
        return this.chapterDao.getChaptersByCourseId(id);
    }
    
    @Transactional
    public List getCoursesAssignedByUser (int userId){
        return this.assignmentDao.getAllById(userId);
    }
    
    @Transactional
    public boolean isUserAlreadyAssigned(int userId, int courseId){
        return this.assignmentDao.isUserAlreadyAssigned(userId, courseId);
    }
    
    @Transactional
    public String getUserFullName(UserDetails user){
        return this.userDao.getFullName(user);
    }   
    
    @Transactional
    public CoursesAssigned getCourseAssignment(int assignmentId){
        return this.assignmentDao.getById(assignmentId);
    }
    
    @Transactional
    public List getAllPresentationsByChapterId(int chapterId) {
        return this.presentationDao.getAllPresentationsByChapterId(chapterId);
    } 
    
    @Transactional
    public void deleteExamByCourseId (int id){
        this.examDao.deleteExamByCourseId(id);
    }
    
    @Transactional
    public boolean isPasswordCorrect (UserDetails user, String password){
        return this.userDao.isPasswordCorrect(user, password);
    }
    
    @Transactional
    public boolean isPasswordEqual(String password1, String password2){
        return this.userDao.isPasswordEqual(password1, password2);
    }
    
    @Transactional
    public void changePasword(UserDetails user, String password){
        this.userDao.changePasword(user, password);
    }
        
}
