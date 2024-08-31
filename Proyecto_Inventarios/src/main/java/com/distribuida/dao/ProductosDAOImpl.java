package com.distribuida.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.distribuida.entities.Productos;

@Repository
public class ProductosDAOImpl implements ProductosDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
    @Transactional
	public List<Productos> findAll() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("from Productos", Productos.class).getResultList();
	}

	@Override
	@Transactional
	public Productos findOne(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Productos.class, id);
	}
	
	@Override
	@Transactional
	public void add(Productos productos) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(productos);
	}

	@Override
	@Transactional
	public void up(Productos productos) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(productos);
	}

	@Override
	@Transactional
	public void del(int id) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(findOne(id));
	}
}
