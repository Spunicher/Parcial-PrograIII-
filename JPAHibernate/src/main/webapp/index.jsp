<!DOCTYPE html>
<html>
<head>
	<title>Videos del inge</title>
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
</head>
<body>
	<h2 align="center">AGREGAR DATOS</h2>
	<form action="servletControler" method="post">
<table align="center">
	<thead>
		
	</thead>
	<tbody>
		<tr>
			<td>
				
					<p>id</p><input type="text" name="Id">
					<p>Nombre Producto</p><input type="text" name="Nproducto">
					<p>precio Producto</p><input type="text" name="Pproducto">
					<p>Cantidad de Producto</p><input type="text" name="Cproductos">
					<p>Total de producto</p><input type="text" name="Tproductos">
					<br>
					<br>
				
			</td>
		</tr>
	</tbody>
</table>
	<input align="center" type="submit" name="btn" value="Agregar" class="btn btn-info">
<input type="submit" name="btn" value="Eliminar" class="btn btn-info">
<input type="submit" name="btn" value="Actualizar" class="btn btn-info">

</form>
</body>
</html>
