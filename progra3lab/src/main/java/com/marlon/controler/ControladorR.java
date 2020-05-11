package com.marlon.controler;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marlon.DAO.LoginDao;

import progra3lab.TbUsuariop;

/**
 * Servlet implementation class ControladorR
 */
public class ControladorR extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorR() {
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
		String action = request.getParameter("btn");
		TbUsuariop u = new TbUsuariop();
	    LoginDao d = new LoginDao();
		try {
	
	String usu = request.getParameter("Usuario");
    String con = request.getParameter("contraseña");
    String nom = request.getParameter("Nombre");
    String ape = request.getParameter("Apellido");
    String dui = request.getParameter("Dui");
    
    
    u.setNombre_usuario(nom);
    u.setApellido_usuario(ape);
    u.setUsuario(usu);
    u.setContrasenia(con);
    u.setDui(dui);
} catch (Exception e) {
	System.out.println(e);
}  
	    EntityManager em;
	    EntityManagerFactory emf;
	    emf = Persistence.createEntityManagerFactory("progra3lab");
	    if (action.equals("Guardar")) {
	    	em = emf.createEntityManager();
			em.getTransaction().begin();
			em.persist(u);
			em.flush();
			em.getTransaction().commit();
			response.sendRedirect("index.jsp");
		}
	}

}
