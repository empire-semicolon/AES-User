/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aes.dao.impl;

import com.aes.dao.BusinessUnitDao;
import com.aes.model.BusinessUnit;
import com.aes.model.UserDetails;
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

@Repository
public class BusinessUnitDaoImpl implements BusinessUnitDao {        
    
    @Autowired
    private SessionFactory session;   
    
    @Override
    public void add(BusinessUnit businessUnit) {
        businessUnit.setBusinessUnitId(this.getNextId());
        session.getCurrentSession().save(businessUnit);
    }

    @Override
    public void edit(BusinessUnit businessUnit) {
        session.getCurrentSession().update(businessUnit);
    }

    @Override
    public void delete(int businessUnitId) {
        session.getCurrentSession().delete(getById(businessUnitId));
    }

    @Override
    public BusinessUnit getById(int businessUnitId) {
        return (BusinessUnit)session.getCurrentSession()
                .get(BusinessUnit.class, businessUnitId);
    }
    
    public String getUnitById (int businessUnitId){
        BusinessUnit unit =(BusinessUnit)session.getCurrentSession().get(BusinessUnit.class, businessUnitId);
        return unit.getBusinessUnit();
    }

    @Override
    public List getAll() {        
        return session.getCurrentSession().createCriteria(BusinessUnit.class)
                .addOrder(Order.asc("businessUnitId")).list();
    }

    @Override
    public int getNextId() {                              
        int nextNumber = 1;
        try {
             Integer nextInt = ((Integer)session.getCurrentSession().createCriteria(BusinessUnit.class)
                .setProjection(Projections.max("businessUnitId")).uniqueResult()) + 1; 
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
        Criteria criteria = session.getCurrentSession().createCriteria(BusinessUnit.class);
        Criterion condition = Restrictions.like("businessUnit", "%" + name + "%");
        criteria.add(condition);
        return criteria.list();        
    }
    
}
