package com.s2sbooks;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.s2sbooks.vo.BookCondition;
import com.s2sbooks.vo.BookStatus;
import com.s2sbooks.vo.Department;
import com.s2sbooks.vo.Subject;

public class HibernateMappingTest {

	public static void main(String[] args) {
		Configuration cfg=new Configuration();  
	    cfg.configure("/com/s2sbooks/resources/hibernate.cfg.xml");  
	    SessionFactory sf=cfg.buildSessionFactory();  
	    Session session = null;  
	    try{
	    	session = sf.openSession();
	    	Query query = session.createQuery("From User");
		    query.setCacheable(true);
		    List<Department> dList = query.list();
		    /*query = session.createQuery("From Subject");
		    List<Subject> sList = query.list(); 
		    Department dept = dList.get(0);
		    dept.setSubjects(sList);
			Transaction tx = session.beginTransaction();
			session.persist(subject);
			tx.commit();*/
		} catch (Throwable e) {
			System.out.println("Error");
		} finally{
			session.close(); 
		}
	    System.out.println("success");
	}
}
