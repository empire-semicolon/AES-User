/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aes.dao.impl;

import com.aes.dao.ChapterDao;
import com.aes.model.Chapter;
import com.aes.util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
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
public class ChapterDaoImpl implements ChapterDao {

    @Autowired
    private SessionFactory session;   
    
    @Override
    public void add(Chapter chapter) {
        chapter.setChapterId(this.getNextId());
        session.getCurrentSession().save(chapter);
    }

    @Override
    public void edit(Chapter chapter) {
        session.getCurrentSession().update(chapter);
    }

    @Override
    public void delete(int chapterId) {
        session.getCurrentSession().delete(this.getById(chapterId));
    }

    @Override
    public Chapter getById(int chapterId) {        
        return (Chapter)session.getCurrentSession().get(Chapter.class, chapterId);
    }
    
    public Chapter ambotNgano (int ChapterId){
        return this.getById(ChapterId);
    }

    @Override
    public List getAll() {
        return session.getCurrentSession().createCriteria(Chapter.class).list();        
    }

    @Override
    public int getNextId() {        
        int nextNumber = 1;
        try {
             Integer nextInt = ((Integer)session.getCurrentSession().createCriteria(Chapter.class)
                .setProjection(Projections.max("chapterId")).uniqueResult()) + 1; 
            if (nextInt == null){
                return 1;
            }
            nextNumber = nextInt.intValue();
                       
        } catch (Exception e) {
            
        }
        return nextNumber;
    }
        
    public List getChaptersByCourseId(int id) {
        List temp = this.getAll();
        List list = new ArrayList();
        for (Object x : temp){
            Chapter tempX = (Chapter)x;
            if (tempX.getCourse().getCourseId() == id){
                list.add(x);
            }
        }
        return list;
    }

    @Override
    public List searchName(String name) {
        
        return session.getCurrentSession().createCriteria(Chapter.class)
                .add(Restrictions.like("chapterTitle", "%" + name + "%"))
                .addOrder(Order.asc("chapterName")).list();      
    }
    
}
