package com.marlon.ControladorDeDatos;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marlon.model.Inventario;

/**
 * Servlet implementation class servletControler
 */
public class servletControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletControler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String acction = request.getParameter("btn");
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("JPAHibernate");
		em = emf.createEntityManager();
		Inventario in = new Inventario();
		try {		
		String id = request.getParameter("Id");
		String Nproducto = request.getParameter("Nproducto");
		String Pproducto = request.getParameter("Pproducto");
		String Cproductos = request.getParameter("Cproductos");
		String Tproductos = request.getParameter("Tproductos");
		
		
		in.setId(Integer.parseInt(id));
		in.setNombreProducto(Nproducto);
		in.setPrecioProducto(Double.parseDouble(Pproducto));
		in.setCantidadProducto(Integer.parseInt(Cproductos));
		in.setTotalProducto(Double.parseDouble(Tproductos));
	
	
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		if (acction.equals("Agregar")) {
			em.getTransaction().begin();
			em.persist(in);
			em.flush();
			em.getTransaction().commit();
			
		}else if (acction.equals("Eliminar")) {
			in = em.getReference(Inventario.class, in.getId());
			em.getTransaction().begin();
			em.remove(in);
			em.flush();
			em.getTransaction().commit();
			
		}else if (acction.equals("Actualizar")) {
			em.getTransaction().begin();
			em.merge(in);
			em.flush();
			em.getTransaction().commit();
		}
		response.sendRedirect("index.jsp");
	}

}
