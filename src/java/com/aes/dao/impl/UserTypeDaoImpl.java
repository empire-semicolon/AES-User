/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aes.dao.impl;
import com.aes.dao.UserTypeDao;
import com.aes.model.UserType;
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
public class UserTypeDaoImpl implements UserTypeDao {
    
    @Autowired
    private SessionFactory session;

    @Override
    public void add(UserType userType) {
        userType.setUserTypeId(this.getNextId());
        session.getCurrentSession().save(userType);
    }

    @Override
    public void edit(UserType userType) {
        session.getCurrentSession().update(userType);
    }

    @Override
    public void delete(int userTypeId) {
        session.getCurrentSession().delete(this.getById(userTypeId));
    }

    @Override
    public UserType getById(int userTypeId) {
        return (UserType)session.getCurrentSession().get(UserType.class, userTypeId);   
    }

    @Override
    public List getAll() {
        return session.getCurrentSession().createCriteria(UserType.class)
                .addOrder(Order.asc("userType")).list();        
    }
    
    @Override
    public int getNextId() {               
        int nextNumber = 1;
        try {
             Integer nextInt = ((Integer)session.getCurrentSession().createCriteria(UserType.class)
                .setProjection(Projections.max("userTypeId")).uniqueResult()) + 1; 
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
        return session.getCurrentSession().createCriteria(UserType.class)
                .add(Restrictions.like("userType", "%" + name + "%")).list();         
    }
    
    public String getTypeNameById(int id) {
        UserType type = (UserType)session.getCurrentSession().get(UserType.class, id);
        return type.getUserType();
    }
    
}
