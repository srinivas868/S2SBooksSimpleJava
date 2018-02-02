package com.s2sbooks;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.s2sbooks.vo.BookSellingInfo;
import com.s2sbooks.vo.Department;
import com.s2sbooks.vo.Subject;
import com.s2sbooks.vo.User;
import com.s2sbooks.vo.enumtypes.BookCondition;
import com.s2sbooks.vo.enumtypes.BookStatus;

public class HibernateMappingTest {

	public static void main(String[] args) {
		Configuration cfg=new Configuration();  
	    cfg.configure("/com/s2sbooks/resources/hibernate.cfg.xml");  
	    SessionFactory sf=cfg.buildSessionFactory();  
	    Session session = null;  
	    try{
	    	session = sf.openSession();
	    	Query query = session.createQuery("from User");
		    query.setCacheable(true);
		    List<User> list = query.list();
		    BookSellingInfo item = null;
			Transaction tx = session.beginTransaction();
			session.persist(item);
			tx.commit();
		} catch (Throwable e) {
			System.out.println("Error");
		} finally{
			session.close(); 
		}
	    System.out.println("success");
	}
}
