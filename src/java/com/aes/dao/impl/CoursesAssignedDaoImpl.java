/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aes.dao.impl;
import com.aes.dao.CoursesAssignedDao;
import com.aes.model.CoursesAssigned;
import com.aes.util.HibernateUtil;
import java.util.ArrayList;
import java.util.Iterator;
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
public class CoursesAssignedDaoImpl implements CoursesAssignedDao {

    @Autowired
    private SessionFactory session; 
    
    @Override
    public void add(CoursesAssigned assignment) {
        assignment.setAssignmentId(this.getNextId());
        session.getCurrentSession().save(assignment);
    }

    @Override
    public void edit(CoursesAssigned assignment) {
        session.getCurrentSession().update(assignment);
    }

    @Override
    public void delete(int assignmentId) {
        session.getCurrentSession().delete(this.getById(assignmentId));
    }    

    @Override
    public CoursesAssigned getById(int assignmentId) {
        return (CoursesAssigned)session.getCurrentSession()
                .get(CoursesAssigned.class,assignmentId);
    }

    @Override
    public List getAll() {
        return session.getCurrentSession().createCriteria(CoursesAssigned.class)
                .addOrder(Order.asc("assignmentId")).list();        
    }
    
    @Override
    public int getNextId() {
        int nextNumber = 1;
        try {
             Integer nextInt = ((Integer)session.getCurrentSession().createCriteria(CoursesAssigned.class)
                .setProjection(Projections.max("assignmentId")).uniqueResult()) + 1; 
            if (nextInt == null){
                return 1;
            }
            nextNumber = nextInt.intValue();
                       
        } catch (Exception e) {
            
        }
        return nextNumber; 
    }

    @Override
    public List getAllById(int userId) {
        List list = this.getAll();
        List tempList = new ArrayList();
        for (Object temp : list){
            CoursesAssigned assignment = (CoursesAssigned)temp;
            if (assignment.getUserDetails().getUserId() == userId ){
                tempList.add(assignment);
            }
        }
        return tempList;
    }
    
    public void deleteAllAssignmentByUserId(int id){
        String hql = "delete from coursses_assigned where assignmentId= :id";
        session.getCurrentSession().createQuery(hql).setInteger("id", id).executeUpdate();
    }
    
    public boolean isUserAlreadyAssigned(int userId, int courseId){
        List list = this.getAll();
        for (Object temp : list){
            CoursesAssigned assignment = (CoursesAssigned)temp;
            if (assignment.getUserDetails().getUserId() == userId && assignment.getCourse().getCourseId() == courseId ){
                return true;
            }
        }
        return false;
    }
        
}
