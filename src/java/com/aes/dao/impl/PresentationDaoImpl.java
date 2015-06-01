/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aes.dao.impl;
import com.aes.dao.PresentationDao;
import com.aes.model.Chapter;
import com.aes.model.Presentation;
import com.aes.util.HibernateUtil;
import java.util.ArrayList;
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
public class PresentationDaoImpl implements PresentationDao {
    
    @Autowired
    private SessionFactory session;  

    @Override
    public void add(Presentation presentation) {
        presentation.setPresentationId(this.getNextId());
        session.getCurrentSession().save(presentation);
    }

    @Override
    public void edit(Presentation presentation) {
        session.getCurrentSession().update(presentation);
    }

    @Override
    public void delete(int presentationId) {
        session.getCurrentSession().delete(this.getById(presentationId));
    }

    @Override
    public Presentation getById(int presentationId) {
        return (Presentation)session.getCurrentSession()
                .get(Presentation.class, presentationId);
    }
    
    
    public List getAllPresentationsByChapterId(int chapterId) {
        List list = this.getAll();
        List newList = new ArrayList();
        for (Object temp : list){
            Presentation presentation = (Presentation)temp;
            if (presentation.getChapter().getChapterId() == chapterId){
                newList.add(presentation);
            }
        }
        return newList;
    }
    

    @Override
    public List getAll() {
        return session.getCurrentSession().createCriteria(Presentation.class)
                .addOrder(Order.asc("fileName")).list();
    }
    
    @Override
    public int getNextId() {    
        int nextNumber = 1;
        try {
             Integer nextInt = ((Integer)session.getCurrentSession().createCriteria(Presentation.class)
                .setProjection(Projections.max("presentationId")).uniqueResult()) + 1; 
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
        return session.getCurrentSession().createCriteria(Presentation.class)
                .add(Restrictions.like("fileName", "%" + name + "%")).list();     
    }
}
