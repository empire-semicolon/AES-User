/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aes.dao.impl;
import com.aes.dao.ExamScoresDao;
import com.aes.model.ExamScores;
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
public class ExamScoresDaoImpl implements ExamScoresDao {
   
    @Autowired
    private SessionFactory session;  

    @Override
    public void add(ExamScores score) {
        score.setExamScoresId(this.getNextId());
        session.getCurrentSession().save(score);
    }

    @Override
    public void edit(ExamScores score) {
        session.getCurrentSession().update(score);
    }

    @Override
    public void delete(int scoreId) {
        session.getCurrentSession().delete(this.getById(scoreId));
    }

    @Override
    public ExamScores getById(int scoreId) {
        return (ExamScores)session.getCurrentSession().get(ExamScores.class, scoreId);  
    }

    @Override
    public List getAll() {
        return session.getCurrentSession().createCriteria(ExamScores.class)
                .addOrder(Order.asc("examScoresId")).list();        
    }
    
    @Override
    public int getNextId() {
        int nextNumber = 1;
        try {
             Integer nextInt = ((Integer)session.getCurrentSession().createCriteria(ExamScores.class)
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
    public List getAllById(int userId) {
        return session.getCurrentSession().createCriteria(ExamScores.class)
                .add(Restrictions.eq("user_details_userId", userId)).list();
    }    
}
