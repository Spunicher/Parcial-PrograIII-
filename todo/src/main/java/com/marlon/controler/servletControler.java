package com.marlon.controler;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.marlon.DAO.productosDAO;
import todo.Inventario;

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
		Inventario in = new Inventario();
		productosDAO prd = new productosDAO();
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
		
		prd.agregarDatos(in);
		response.sendRedirect("index.jsp");
			} catch (Exception e) {
				System.out.println("Errrroooo" + e);
			}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	productosDAO prDao = new productosDAO();
	Gson json = new Gson();
	try {
		response.getWriter().append(json.toJson(prDao.inventrioLista()));
	} catch (Exception e) {
		System.out.println("error1" + e);
	}
	}
}

