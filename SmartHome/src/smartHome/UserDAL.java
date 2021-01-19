package smartHome;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;


public class UserDAL {
	
	public Users getUser(String name) {

		Transaction transaction = null;
		Users us = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			us = session.get(Users.class, name);
			 
			
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return us;
	}
	
	public void addUser(Users usr) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			session.save(usr);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> getAllUsers() {

		Transaction transaction = null;
		List<Users> listOfAnime = null;
		System.out.println("outside try");
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			
			//System.out.println("inside transaction");
			
			listOfAnime = session.createQuery("from Users").getResultList();
			//System.out.println("Query after");
			session.flush();
			// commit transaction
			transaction.commit();
			//System.out.println("transaction commited");
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return listOfAnime;
	}
	
	@SuppressWarnings("unchecked")
	public List<Sensors> getAllSensors() {

		Transaction transaction = null;
		List<Sensors> sensorList = null;
		System.out.println("outside try");
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			
			//System.out.println("inside transaction");
			
			sensorList = session.createQuery("from Sensors").getResultList();
			//System.out.println("Query after");
			session.flush();
			// commit transaction
			transaction.commit();
			//System.out.println("transaction commited");
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return sensorList;
	}
	
	public Sensors getLast() {

		Transaction transaction = null;
		List<Sensors> listOfAnime = null;
		System.out.println("outside try");
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			
			transaction = session.beginTransaction();
			//System.out.println("inside transaction");
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<Sensors> cq = builder.createQuery(Sensors.class);
			Root<Sensors> sens= cq.from(Sensors.class);
			//cq.where(sens.get("motion").in(0));
			cq.orderBy(builder.desc(sens.get("id")));
			listOfAnime = session.createQuery(cq).getResultList();
			//System.out.println("Query after");
			session.flush();
			// commit transaction
			transaction.commit();
			//System.out.println("transaction commited");
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return listOfAnime.get(0);
	}
	
	@SuppressWarnings("unchecked")
	public List<Sensors> getlastdaysData(Sensors sen) {
		
		String day=sen.getTs().substring(8,10);
		String month= sen.getTs().substring(5, 7);
		System.out.println(day);
		int d = Integer.parseInt(day);
		Transaction transaction = null;
		List<Sensors> sl = null;
		List<Sensors> rsl = new ArrayList<Sensors>();
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			
			
			sl = session.createQuery("from Sensors").getResultList();
			session.flush();
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		
		for (Sensors s: sl) {
			String slmonth= s.getTs().substring(5, 7);
			int slday= Integer.parseInt(s.getTs().substring(8, 10));
			if (slmonth.equals(month)) {
				if (slday == d) {
					rsl.add(s);
					//System.out.println(s.getTs());
				}
			}
		}
		return rsl;
	}


}
