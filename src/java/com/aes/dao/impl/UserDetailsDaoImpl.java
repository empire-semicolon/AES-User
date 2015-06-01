/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aes.dao.impl;
import com.aes.dao.UserDetailsDao;
import com.aes.model.UserDetails;
import com.aes.util.DbUtil;
import com.aes.util.HibernateUtil;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
import java.util.Properties;
import java.util.Set;
import javax.transaction.Transactional;
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
public class UserDetailsDaoImpl implements UserDetailsDao {
    
    @Autowired
    private SessionFactory session;

    @Override
    public void add(UserDetails user) {
        user.setUserId(this.getNextId());
        user.setPassword("alliance@123");
        session.getCurrentSession().save(user);
    }

    @Override
    public void edit(UserDetails user) {
        session.getCurrentSession().saveOrUpdate(user);
    }

    @Override
    public void delete(int userId) {
        session.getCurrentSession().delete(this.getById(userId));
    }

    @Override
    public UserDetails getById(int userId) {       
        return (UserDetails)session.getCurrentSession().get(UserDetails.class, userId);        
    }

    @Override
    public List getAll() {   
        return session.getCurrentSession().createCriteria(UserDetails.class).list();
    }
    
    @Override
    public int getNextId() {
        int nextNumber = 1;
        try {
             Integer nextInt = ((Integer)session.getCurrentSession().createCriteria(UserDetails.class)
                .setProjection(Projections.max("userId")).uniqueResult()) + 1; 
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
        /*
        Criterion first = Restrictions.like("firstName", "%" + name + "%");
        Criterion second = Restrictions.like("middleName", "%" + name + "%");
        Criterion third = Restrictions.like("lastName", "%" + name + "%");
        Criterion completeCondition = Restrictions.disjunction().add(third)
                .add(second)
                .add(third); 
        return session.getCurrentSession().createCriteria(UserDetails.class)
                .add(completeCondition).list();       */
        
        Query query = session.getCurrentSession().createQuery("From UserDetails where "
                + "firstName LIKE :name or middleName LIKE :name1 or lastName LIKE :name2");
        query.setParameter("name", "%" + name + "%");
        query.setParameter("name1", "%" + name + "%");
        query.setParameter("name2", "%" + name + "%");        
        return query.list();
    }
    
    public String getBirthdayString (UserDetails user){
        return new SimpleDateFormat("mm/dd/yyyy").format(user.getBirthday());
    }
    
    public String getFullName (UserDetails user){
        return user.getFirstName() + " " + user.getMiddleName()
                + " " + user.getLastName();
    }
    
    public void resetPasword(UserDetails user){        
        user.setPassword("alliance@123");
        session.getCurrentSession().update(user);
    }
    
    public List getAllTrainers (){
        List temp = this.getAll();
        List list = new ArrayList();
        for (Object x : temp){
            UserDetails tempX = (UserDetails)x;
            if (tempX.getUserType().getUserTypeId() == 1){
                list.add(x);
            }
        }
        return list;
    }
    
    public List getAllTrainees (){
        List temp = this.getAll();
        List list = new ArrayList();
        for (Object x : temp){
            UserDetails tempX = (UserDetails)x;
            if (tempX.getUserType().getUserTypeId() == 2){
                list.add(x);
            }
        }
        return list;
    }
    
    public Set getAllCoursesAssigned(UserDetails user){
        return user.getCoursesAssigneds();
    }
    
    public boolean isPasswordCorrect (UserDetails user, String password){        
        String userPassword = user.getPassword();
        if (userPassword.equals(password)){
            return true;
        }
        return false;
    }
    
    public boolean isPasswordEqual(String password1, String password2){
        if (password1.equals(password2)){
            return true;
        }
        return false;
    }
    
    public void changePasword(UserDetails user, String password){        
        user.setPassword(password);
        session.getCurrentSession().update(user);
    }
}
