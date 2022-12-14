<%@page import="logic.Login"%>
<%@page import="java.util.LinkedList"%>
<%@page import="entities.Persona"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://getbootstrap.com/favicon.ico">
	<title>Java Web Intro</title>
	
	<!-- Bootstrap core CSS -->
    <link href="style/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="style/signin.css" rel="stylesheet">
	
	<% // Me mapeo los datos enviados en la request
		Persona p = (Persona)session.getAttribute("usuario");
    		
    	if(p.isHabilitado()==false){
    		response.sendRedirect("menu.jsp");
    	}
    	
    	Login ctrlLogin = new Login();
    	LinkedList<Persona> lp = ctrlLogin.getAll();
    	
	%>
	
</head>
<body>

	<div class="container">
		<div class="row">
        	<h4>Personas</h4>
            	<div class="col-12 col-sm-12 col-lg-12">
                	<div class="table-responsive">
                    	<table class="table table-hover table-borderless ">
                    		<thead>
                    			<tr>
                    				<th>ID</th>
                    		    	<th>Nombre</th>
                        			<th>Apellido</th>
                        			<th>Email</th>
                        			<th>Telefono</th>
                        			<th>Habilitado</th>
                        			<th></th>
                        			<th></th>
                      			</tr>
                      		</thead>
                    		<tbody>
                    		<% for (Persona per : lp) { %>
                    			<tr>
                    				<td><%=per.getId()%></td>
                    				<td><%=per.getNombre()%></td>
                    				<td><%=per.getApellido()%></td>
                    				<td><%=per.getEmail()%></td>
                    				<td><%=per.getTel()%></td>
                    				<td>
                    				    <div class="custom-control custom-checkbox">
                                        	<input type="checkbox" class="custom-control-input" id="defaultDisabled" <%=per.isHabilitado()?"checked":""%> disabled>
                                        <label class="custom-control-label" for="defaultDisabled"><%=per.isHabilitado()?"Si":"No"%></label>
                                		</div>
                    				</td>
                    				<td>
                    					<a href="edituser?id=<%=per.getId()%>" class="btn" type="submit">Editar</a><!-- editar -->
                    					<a href="eliminarUsuario?id=<%=per.getId()%>" class="btn btn-danger">Eliminar</a><!-- borrar -->
                    				</td>
                    				
                    			</tr>
                    		<% } %>
                    		</tbody>	
                    </table>
                    </div>
             	</div>	
             <a href="menu.jsp" class="btn">Volver al menu</a>
        </div>
	</div> <!-- /container -->
	
</body>
</html>