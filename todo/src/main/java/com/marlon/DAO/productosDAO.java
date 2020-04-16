package com.marlon.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.mysql.fabric.xmlrpc.base.Array;

import todo.Inventario;

public class productosDAO {
public List<Inventario> inventrioLista(){
	List<Inventario> listapr = new ArrayList<>();
	EntityManager em;
	EntityManagerFactory emf;
	emf = Persistence.createEntityManagerFactory("todo");
	em = emf.createEntityManager();
	
	
	try {
		em.getTransaction().begin();
		listapr = em.createQuery("FROM Inventario").getResultList();
		em.getTransaction().commit();
	} catch (Exception e) {
		System.out.println("error2" + e);
	}
	
	
	return listapr;
	
}

public void agregarDatos(Inventario in) {
	EntityManager em;
	EntityManagerFactory emf;
	emf = Persistence.createEntityManagerFactory("todo");
	em = emf.createEntityManager();
	em.getTransaction().begin();
	em.persist(in);
	em.flush();
	em.getTransaction().commit();
}
}
