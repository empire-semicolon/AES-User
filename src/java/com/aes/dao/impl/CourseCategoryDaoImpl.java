/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aes.dao.impl;

import com.aes.dao.CourseCategoryDao;
import com.aes.model.CourseCategory;
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
public class CourseCategoryDaoImpl implements CourseCategoryDao {

    @Autowired
    private SessionFactory session;
    
    @Override
    public void add(CourseCategory category) {
        category.setCourseCategoryId(this.getNextId());
        session.getCurrentSession().save(category);
    }

    @Override
    public void edit(CourseCategory category) {
        session.getCurrentSession().update(category);      
    }

    @Override
    public void delete(int categoryId) {
        session.getCurrentSession().delete(this.getById(categoryId));
    }

    @Override
    public CourseCategory getById(int categoryId) {
        return (CourseCategory)session.getCurrentSession()
                .get(CourseCategory.class, categoryId);   
    }

    @Override
    public List getAll() {
        return session.getCurrentSession().createCriteria(CourseCategory.class)
                .addOrder(Order.asc("courseCategory")).list();        
    }
    
    @Override
    public int getNextId() {               
        int nextNumber = 1;
        try {
             Integer nextInt = ((Integer)session.getCurrentSession().createCriteria(CourseCategory.class)
                .setProjection(Projections.max("courseCategoryId")).uniqueResult()) + 1; 
            if (nextInt == null){
                return 1;
            }
            nextNumber = nextInt.intValue();
                       
        } catch (Exception e) {
            
        }
        return nextNumber;
    }

    @Override
    public List searchName(String name) {
        return session.getCurrentSession().createCriteria(CourseCategory.class)
                .add(Restrictions.like("courseCategory", "%" + name + "%")).list();    
    }
    
    public String getTypeNameById(int id) {
        CourseCategory category = (CourseCategory)session.getCurrentSession().get(CourseCategory.class, id);
        return category.getCourseCategory();
    }
    
}
