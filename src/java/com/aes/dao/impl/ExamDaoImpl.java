/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aes.dao.impl;
import com.aes.dao.ExamDao;
import com.aes.model.Exam;
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
public class ExamDaoImpl implements ExamDao {

    @Autowired
    private SessionFactory session; 
    
    @Override
    public void add(Exam exam) {
        exam.setExamId(this.getNextId());
        session.getCurrentSession().save(exam);
    }

    @Override
    public void edit(Exam exam) {
        session.getCurrentSession().update(exam);
    }

    @Override
    public void delete(int examId) {
        session.getCurrentSession().delete(this.getById(examId));
    }

    @Override
    public Exam getById(int examId) {
        return (Exam)session.getCurrentSession().get(Exam.class, examId);          
    }
    
    public void deleteExamByCourseId (int id){
        List<Exam> list = this.getAll();
        for (Exam temp : list){
            if (temp.getCourse().getCourseId() == id){
                this.delete(temp.getExamId());
            }
        }
    }

    @Override
    public List getAll() {
        return session.getCurrentSession().createCriteria(Exam.class).addOrder(Order.asc("examTitle")).list();         
    }
    
    @Override
    public int getNextId() {  
        int nextNumber = 1;
        try {
             Integer nextInt = ((Integer)session.getCurrentSession().createCriteria(Exam.class)
                .setProjection(Projections.max("examId")).uniqueResult()) + 1; 
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
        return session.getCurrentSession().createCriteria(Exam.class)
                .add(Restrictions.like("examTitle", "%" + name + "%")).list();       
    }

}
