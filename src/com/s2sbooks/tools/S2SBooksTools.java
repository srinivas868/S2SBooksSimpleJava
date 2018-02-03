package com.s2sbooks.tools;

import java.util.List;

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
	public Object getItem(Class classType, String pItemId) throws Exception {
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
		try{
			session = getSessionFactory().openSession();
			session.clear();
			Query query = session.createQuery("FROM "+pItemType);
			return (List) query.list();
		} catch (Throwable e) {
			throw new Exception(e);
		} finally{
			if(pCloseSession){
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
	public List searchBookItems(Class<BookSellingInfo> classType, double isbn, String department,
							String subject, boolean pCloseSession) throws Exception {
		Session session = null;
		try{
			session = getSessionFactory().openSession();
			Query query = session.createQuery("from BookSellingInfo b where b.isbn = :isbn "
												+ "and b.department = :department and b.subject = :subject");
			query.setParameter("isbn", isbn);
			query.setParameter("department", department);
			query.setParameter("subject", subject);
			return (List) query.list();
		} catch (Throwable e) {
			throw new Exception(e);
		} finally{
			if(pCloseSession){
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
	public Object getItem(Class<User> classType, String pItemId, boolean pCloseSession) throws Exception {
		Session session = null;
		try{
			session = getSessionFactory().openSession();
			return session.get(classType,Integer.valueOf(pItemId));
		} catch (Throwable e) {
			throw new Exception(e);
		} finally{
			if(pCloseSession){
				session.close(); 
			}
		}
	}
	
	/** this method will write the data to Database
	 * @param pItem
	 * @return
	 * @throws Exception
	 */
	public boolean addItem(Object pItem) throws Exception {
		Session session = null;
		try{
			session = getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			session.persist(pItem);
			tx.commit();
		} catch (Throwable e) {
			throw new Exception(e);
		} finally{
			session.close(); 
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
		try{
			session = getSessionFactory().openSession();
			Query query = session.createQuery("FROM User as u where u.email=:email and u.password=:password");
			query.setString("email", email);
			query.setString("password", password);
			List users =  query.list();
			if(users != null && !users.isEmpty()){
				return (User) query.list().get(0);
			} else{
				return null;
			}
		} catch (Throwable e) {
			throw new Exception(e);
		} finally{
			session.close(); 
		}
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
