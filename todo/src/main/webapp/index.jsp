<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.js">
</script>
<script type="text/javascript">
	$(document).ready(function() {	
	var btn = $('#cargar').val();
	$.post('servletControler',{
	     }, function(respose){
	     let datos = JSON.parse(respose);
	     console.log(datos);
var tabladatos = document.getElementById('tablaDatos') ;
	   for (let item of datos) { 
tabladatos.innerHTML += `
<tr>
<td>${item.id}</td>
<td>${item.nombreProducto}</td>
<td>${item.precioProducto}</td>
<td>${item.cantidadProducto}</td>
<td>${item.totalProducto}</td>
<td>
<a href="" class="btn btn-warning">Eliminar</a>
<a href="" class="btn btn-danger">Guardar</a>
<a href="" class="btn btn-info">Actualizar</a>
</td>
</tr>
`
	   }
	     });
       });
</script>
<head>
	<title>todos</title>
</head>
<body>
<a href="funciones.jsp" class="btn btn-info">Agregar</a>
<table class="table table-dark" id="tablaDatos">
	<thead>
		<th>ID</th>
		<th>Producto</th>
		<th>Precio</th>
		<th>Cantidad</th>
		<th>Total</th>
		<th>OPCIONES</th>
	</thead>

	<tbody>
		
	</tbody>
</table>


</body>
</html>