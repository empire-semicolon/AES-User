/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aes.dao.impl;

import com.aes.dao.CourseDao;
import com.aes.model.Course;
import com.aes.util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Bryan
 */
@Repository
public class CourseDaoImpl implements CourseDao {

    @Autowired
    private SessionFactory session;
    
    @Override
    public void add(Course course) {
        course.setCourseId(this.getNextId());
        session.getCurrentSession().save(course);
    }

    @Override
    public void edit(Course course) {
        session.getCurrentSession().update(course);
    }

    @Override
    public void delete(int courseId) {
        session.getCurrentSession().delete(this.getById(courseId));
    }

    @Override
    public Course getById(int courseId) {
        return (Course)session.getCurrentSession().get(Course.class, courseId);       
    }

    @Override
    public List getAll() {
        return session.getCurrentSession().createCriteria(Course.class)
                .addOrder(Order.asc("courseTitle")).list();        
    }
    
    @Override
    public int getNextId() {          
        int nextNumber = 1;
        try {
             Integer nextInt = ((Integer)session.getCurrentSession().createCriteria(Course.class)
                .setProjection(Projections.max("courseId")).uniqueResult()) + 1; 
            if (nextInt == null){
                return 1;
            }
            nextNumber = nextInt.intValue();
                       
        } catch (Exception e) {            
        }
        return nextNumber;
    }

    @Override
    public List searchName(String name){ 
        return session.getCurrentSession().createCriteria(Course.class)
                .add(Restrictions.like("courseTitle", "%" + name + "%")).list();      
    } 
    
}
