package com.marlon.controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marlon.DAO.BuscarDAo;
import com.marlon.DAO.LoginDao;

import progra3lab.TbUsuariop;

/**
 * Servlet implementation class ControladorBusqueda
 */
public class ControladorBusqueda extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorBusqueda() {
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
		String dui = request.getParameter("dui");
		TbUsuariop u = new TbUsuariop();
		  BuscarDAo d = new BuscarDAo();
		  u.setDui(dui);	  
		  try {
				int verri = d.buscar(u).size();
				if (verri==1) {
					System.out.println("El dui es" + dui);
			     }else {
					System.out.println("Error2");
				}
			} catch (Exception e) {
				System.out.println("Error3" + e);
			}
	}

}
