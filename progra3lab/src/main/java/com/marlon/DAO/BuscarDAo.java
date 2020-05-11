package com.marlon.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import progra3lab.TbHistorial;
import progra3lab.TbUsuariop;

public class BuscarDAo {
	public List<TbUsuariop> buscar(TbUsuariop usu) {
		List<TbUsuariop> u = new ArrayList();
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("progra3lab");
		em = emf.createEntityManager();
		
	    try {
			em.getTransaction().begin();
			u = em.createQuery("from TbUsuariop as u where u.dui = '"+usu.getDui()+"'").getResultList();
			em.getTransaction().commit();		
		} catch (Exception e) {
			System.out.println("Erro1r" + e);
		}
			return u;
		}
	
	public List<Object> LISTAHISTO() {
		List<Object> listad = new ArrayList<>();
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("progra3lab");
		em = emf.createEntityManager();
		try {
			em.getTransaction().begin();
			listad = em.createQuery("SELECT h.idHistorial, u.nombre_usuario, h.fecha FROM TbHistorial as h, TbUsuariop as u"
					+ " where h.tbUsuariop = u.idUsuarios").getResultList();
			em.getTransaction().commit();
		} catch (Exception e) {
			System.out.println(e);
		}
		return listad;
	}
}
