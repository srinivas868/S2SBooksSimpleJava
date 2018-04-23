package com.s2sbooks.tools;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.s2sbooks.vo.BookSellingInfo;
import com.s2sbooks.vo.User;

public class S2SBooksTools {

	private Configuration cfg;
	private	SessionFactory sessionFactory;
	
	public S2SBooksTools(){
		setConfiguration(new Configuration());
		getConfiguration().configure("/com/s2sbooks/resources/hibernate.cfg.xml");
	}
	
	/** this method will return item for given itemId
	 * @param classType
	 * @param pItemId
	 * @return
	 * @throws Exception
	 */
	public Object getItem(Class classType, int pItemId) throws Exception {
		return getItem(classType, pItemId, true);
	}
	
	/** this method will return items for itemType
	 * @param pItemType
	 * @param pCloseSession
	 * @return
	 * @throws Exception
	 */
	public List getItems(String pItemType, boolean pCloseSession) throws Exception {
		Session session = null;
		Transaction tx = null;
		try{
			session = getSessionFactory().openSession();
			if(session != null) {
				tx = session.beginTransaction();
				Query query = session.createQuery("FROM "+pItemType);
				return (List) query.list();
			}
			else {
				return null;
			}
		} catch (Throwable e) {
			throw new Exception(e);
		} finally{
			if(tx != null) {
				tx.commit();
			}
			if(session != null) {
				session.close();
			}
		}
	}
	
	/** this method will return bookinfo item for given parameters
	 * @param classType
	 * @param request 
	 * @param pItemId
	 * @param pCloseSession
	 * @return
	 * @throws Exception
	 */
	public List searchBookItemsWithISBN(Class<BookSellingInfo> classType, double isbn, HttpServletRequest request) throws Exception {
		Session session = null;
		Transaction tx = null;
		try{
			session = getSessionFactory().openSession();
			if(session != null) {
				tx = session.beginTransaction();
				Query query = session.createQuery("from BookSellingInfo b where b.isbn = :isbn and b.user =:user");
				query.setParameter("isbn", isbn);
				query.setEntity("user", S2SBooksTools.getCurrentUser(request));
				return (List) query.list();
			}
			else {
				return null;
			}
		} catch (Throwable e) {
			throw new Exception(e);
		} finally{
			if(tx != null){
				tx.commit();
			}
			if(session != null) {
				session.close();
			}
		}
	}
	
	/** this method will return bookinfo item for given parameters
	 * @param classType
	 * @param pItemId
	 * @param pCloseSession
	 * @return
	 * @throws Exception
	 */
	public List searchBookItems(Class<BookSellingInfo> classType, double isbn) throws Exception {
		Session session = null;
		Transaction tx = null;
		try{
			session = getSessionFactory().openSession();
			if(session != null) {
				tx = session.beginTransaction();
				Query query = session.createQuery("from BookSellingInfo b where b.isbn = :isbn");
				query.setParameter("isbn", isbn);
				return (List) query.list();
			}
			else {
				return null;
			}
		} catch (Throwable e) {
			throw new Exception(e);
		} finally{
			if(tx != null){
				tx.commit();
			}
			if(session != null) {
				session.close();
			}
		}
	}
	
	/** this method will return user item for given itemId
	 * @param classType
	 * @param pItemId
	 * @param pCloseSession
	 * @return
	 * @throws Exception
	 */
	public Object getUserItem(int pItemId, boolean pCloseSession) throws Exception {
		Session session = null;
		Transaction tx = null;
		try{
			session = getSessionFactory().openSession();
			if(session != null) {
				tx = session.beginTransaction();
				Query query = session.createQuery("from User b where b.id = :id");
				query.setParameter("id", pItemId);
				List list = query.list();
				if(!list.isEmpty()) {
					return list.get(0);
				}
				return null;
			}
			else {
				return null;
			}
		} catch (Throwable e) {
			throw new Exception(e);
		} finally{
			if(tx != null){
				tx.commit();
			}
			if(session != null) {
				session.close();
			}
		}
	}
	
	/** this method will return item for given itemId
	 * @param classType
	 * @param pItemId
	 * @param pCloseSession
	 * @return
	 * @throws Exception
	 */
	public Object getItem(Class<User> classType, int pItemId, boolean pCloseSession) throws Exception {
		Session session = null;
		Transaction tx = null;
		try{
			session = getSessionFactory().openSession();
			if(session != null) {
				tx = session.beginTransaction();
				return session.get(classType,pItemId);
			}
			else {
				return null;
			}
		} catch (Throwable e) {
			throw new Exception(e);
		} finally{
			if(tx != null){
				tx.commit();
			}
			if(session != null) {
				session.close();
			}
		}
	}
	
	public boolean addItem(Object pItem) throws Exception {
		return addItem(pItem, true);
	}
	
	/** this method will write the data to Database
	 * @param pItem
	 * @return
	 * @throws Exception
	 */
	public boolean addItem(Object pItem, boolean pCloseSession) throws Exception {
		Session session = null;
		Transaction tx = null;
		try{
			session = getSessionFactory().openSession();
			if(session != null) {
				tx = session.beginTransaction();
				session.persist(pItem);
			}
		} catch (Throwable e) {
			throw new Exception(e);
		} finally{
			if(tx != null){
				tx.commit();
			}
			if(session != null) {
				session.close();
			}
		}
		return true;
	}
	
	/** this method will update the data to Database
	 * @param pItem
	 * @return
	 * @throws Exception
	 */
	public boolean updateItem(Object pItem, boolean pCloseSession) throws Exception {
		Session session = null;
		Transaction tx = null;
		try{
			session = getSessionFactory().openSession();
			if(session != null) {
				tx = session.beginTransaction();
				session.update(pItem);
			}
		} catch (Throwable e) {
			throw new Exception(e);
		} finally{
			if(tx != null){
				tx.commit();
			}
			if(session != null) {
				session.close();
			}
		}
		return true;
	}
	
	/** this method will perform the login operations
	 * @param userName userName
	 * @param password password
	 * @throws Exception 
	 */
	public User login(String email, String password) throws Exception {
		Session session = null;
		Transaction tx = null;
		try{
			session = getSessionFactory().openSession();
			if(session != null) {
				tx = session.beginTransaction();
				Query query = session.createQuery("FROM User as u where u.email=:email and u.password=:password");
				query.setString("email", email);
				query.setString("password", password);
				List users =  query.list();
				if(users != null && !users.isEmpty()){
					return (User) query.list().get(0);
				} else{
					return null;
				}
			}
			else {
				return null;
			}
		} catch (Throwable e) {
			throw new Exception(e);
		} finally{
			if(tx != null){
				tx.commit();
			}
			if(session != null) {
				session.close();
			}
		}
	}
	
	public List getBookItemByUser(HttpServletRequest request) throws Exception {
		Session session = null;
		Transaction tx = null;
		try{
			session = getSessionFactory().openSession();
			if(session != null) {
				tx = session.beginTransaction();
				Query query = session.createQuery("FROM BookSellingInfo as b where b.user=:user");
				query.setEntity("user", S2SBooksTools.getCurrentUser(request));
				List items =  query.list();
				if(items != null && !items.isEmpty()){
					return items;
				} else{
					return null;
				}
			}
			else {
				return null;
			}
			
		} catch (Throwable e) {
			throw new Exception(e);
		} finally{
			if(tx != null){
				tx.commit();
			}
			if(session != null) {
				session.close();
			}
		}
	}
	
	public static User getCurrentUser(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if(user != null) {
			return user;
		}
		return null;
	}
	
	public Configuration getConfiguration() {
		return cfg;
	}

	public void setConfiguration(Configuration cfg) {
		this.cfg = cfg;
	}
	
	public SessionFactory getSessionFactory() {
		if(this.sessionFactory == null){
			this.sessionFactory = getConfiguration().buildSessionFactory();
		}
		return sessionFactory;
	}

}
