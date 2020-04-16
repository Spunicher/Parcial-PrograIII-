<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<head>
<meta charset="ISO-8859-1">
<title>funcionese</title>
</head>
<body>
<h2 align="center">Agregar datos</h2>

<form action="servletControler" >
<table align="center">
	<thead>
		
	</thead>
<tbody>
	<tr>
		<td>			
				<p>id</p><input type="text" name="Id">
				<p>Nombre Producto</p><input type="text" name="Nproducto">
				<p>Precio Producto</p><input type="text" name="Pproducto">
				<p>Cantidad de Productos</p><input type="text" name="Cproducto">
				<p>Total de Productos</p><input type="text" name="Tproductos">
				<br>
				<br>					
		</td>
	</tr>
</tbody>
</table>

<input type="submit" class="btn btn-info" vulues="GUARDAR">
</form>
</body>
</html>