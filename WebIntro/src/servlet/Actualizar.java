package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.Documento;
import entities.Persona;
import logic.Login;

/**
 * Servlet implementation class Actualizar
 */
@WebServlet({ "/Actualizar", "/actualizar", "/ACTUALIZAR" })
public class Actualizar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Actualizar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession(false);
		LinkedList<Persona> lista = (LinkedList<Persona>)session.getAttribute("listaPersonas");
		
		try {
			Login ctrlLogin = new Login();
			
			Persona per = new Persona();
			Documento d = new Documento();
			d.setTipo(request.getParameter("tipo_doc"));
			d.setNro(request.getParameter("nro_doc"));
			per.setDocumento(d);
			per.setId(Integer.parseInt(request.getParameter("txtid")));
			per.setNombre(request.getParameter("nombre"));
			per.setApellido(request.getParameter("apellido"));
			per.setEmail(request.getParameter("email"));
			per.setPassword(request.getParameter("password"));
			per.setTel(request.getParameter("tel"));
			
			if (per.isEmpty()) {
				response.sendRedirect("menu.jsp");
				
			} 
			else {
				ctrlLogin.update(per);
				
//				PrintWriter writer = response.getWriter();		
//				writer.println("<div class=\"alert alert-success\">\n" + 
//						"  <strong>Success!</strong> <a href=\"usuarios.jsp\" class=\"alert-link\">read this message</a>.\n" + 
//						"</div>");
				response.sendRedirect("usuarios.jsp");
			}
			
			
			
			
		} finally {
			// TODO: handle finally clause
		}
		
		
		
		
	}

}
