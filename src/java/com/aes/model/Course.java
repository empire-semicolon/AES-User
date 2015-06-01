package com.aes.model;
// Generated May 22, 2015 8:39:55 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Course generated by hbm2java
 */
@Entity
@Table(name="course"
    ,catalog="aes"
)
public class Course  implements java.io.Serializable {


     private int courseId;
     private CourseCategory courseCategory;
     private UserDetails userDetails;
     private String courseTitle;
     private String courseDescription;
     private Date dateCreated;
     private Date lastEdited;
     private Set<Exam> exams = new HashSet<Exam>(0);
     private Set<Chapter> chapters = new HashSet<Chapter>(0);
     private Set<CoursesAssigned> coursesAssigneds = new HashSet<CoursesAssigned>(0);

    public Course() {
    }

	
    public Course(int courseId, CourseCategory courseCategory, UserDetails userDetails, String courseTitle, String courseDescription, Date dateCreated, Date lastEdited) {
        this.courseId = courseId;
        this.courseCategory = courseCategory;
        this.userDetails = userDetails;
        this.courseTitle = courseTitle;
        this.courseDescription = courseDescription;
        this.dateCreated = dateCreated;
        this.lastEdited = lastEdited;
    }
    public Course(int courseId, CourseCategory courseCategory, UserDetails userDetails, String courseTitle, String courseDescription, Date dateCreated, Date lastEdited, Set<Exam> exams, Set<Chapter> chapters, Set<CoursesAssigned> coursesAssigneds) {
       this.courseId = courseId;
       this.courseCategory = courseCategory;
       this.userDetails = userDetails;
       this.courseTitle = courseTitle;
       this.courseDescription = courseDescription;
       this.dateCreated = dateCreated;
       this.lastEdited = lastEdited;
       this.exams = exams;
       this.chapters = chapters;
       this.coursesAssigneds = coursesAssigneds;
    }
   
     @Id 

    
    @Column(name="courseId", unique=true, nullable=false)
    public int getCourseId() {
        return this.courseId;
    }
    
    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="course_category_courseCategoryId", nullable=false)
    public CourseCategory getCourseCategory() {
        return this.courseCategory;
    }
    
    public void setCourseCategory(CourseCategory courseCategory) {
        this.courseCategory = courseCategory;
    }

@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="user_details_trainer", nullable=false)
    public UserDetails getUserDetails() {
        return this.userDetails;
    }
    
    public void setUserDetails(UserDetails userDetails) {
        this.userDetails = userDetails;
    }

    
    @Column(name="courseTitle", nullable=false, length=50)
    public String getCourseTitle() {
        return this.courseTitle;
    }
    
    public void setCourseTitle(String courseTitle) {
        this.courseTitle = courseTitle;
    }

    
    @Column(name="courseDescription", nullable=false)
    public String getCourseDescription() {
        return this.courseDescription;
    }
    
    public void setCourseDescription(String courseDescription) {
        this.courseDescription = courseDescription;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="dateCreated", nullable=false, length=19)
    public Date getDateCreated() {
        return this.dateCreated;
    }
    
    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="lastEdited", nullable=false, length=19)
    public Date getLastEdited() {
        return this.lastEdited;
    }
    
    public void setLastEdited(Date lastEdited) {
        this.lastEdited = lastEdited;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="course")
    public Set<Exam> getExams() {
        return this.exams;
    }
    
    public void setExams(Set<Exam> exams) {
        this.exams = exams;
    }

@OneToMany(fetch=FetchType.EAGER, mappedBy="course")
    public Set<Chapter> getChapters() {
        return this.chapters;
    }
    
    public void setChapters(Set<Chapter> chapters) {
        this.chapters = chapters;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="course")
    public Set<CoursesAssigned> getCoursesAssigneds() {
        return this.coursesAssigneds;
    }
    
    public void setCoursesAssigneds(Set<CoursesAssigned> coursesAssigneds) {
        this.coursesAssigneds = coursesAssigneds;
    }




}


