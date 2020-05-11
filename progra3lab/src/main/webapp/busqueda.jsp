<!DOCTYPE html>
<html>
<script type="text/javascript" 
src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

			$.post('ControladorvistaHisto',{

			}, function (respose) {
				var datos = JSON.parse(respose);
				var tablaDatos = document.getElementById('tablaDatos')
				for (var item of datos) {
					tablaDatos.innerHTML += 
`
<tr>
<td>${item[0]}</td>
<td>${item[1]}</td>
<td>${item[2]}</td>
</tr>
`
}
});
});
</script>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="busquedaD.css">
    <title>Gobierno De El Salvador</title>
</head>
<body>
<div class="container">
	<br>
	<br><br>
<h1 class="text-center mt-5"> <p style="color:#A61010">Consulta quien de tu familia es el beneficiario del apoyo
<br> economico para alimentacion en la emergencia</p></h1>
<h1 class="text-center mt-1"><span class="badge badge-success">COVID-19</span></h1>

 <form  action="ControladorBusqueda" method="post">
 <div class="input-group mb-3">
 <input type="text" class="form-control light-grey" name="dui" style="background-color: #f2f2f2;" placeholder="Ingresa tu número de DUI">
 <div class="input-group-append">
<input type="submit" class="btn btn-info" value="buscar">
 </div>
 </div>
 </form>
                    <div class="col">
                        <p style="color:blue" align="center">El apoyo economico brindado por el Gobierno de El Salvador está dirigido a personas afectadas por la pandemia del COVID-19. Dicho beneficio corresponde a $300 por vivienda.</p>
                    </div>
    
         <div class="col text-right">
                        <p align="center">
                            <a target="_blank" href="https://presidencia.gob.sv/contactenos">Contactanos</a>
                            <a target="_blank" href="https://www.facebook.com/PresidenciaSV">Facebook</a>
                            <a target="_blank" href="https://twitter.com/presidenciasv">Twitter</a>
                            <a target="_blank" href="https://www.instagram.com/presidenciasv/">Instagram</a>
                        </p>
                   </div>  
    </div>
</div>

<table class="table table-dark" id="tablaDatos">
	<thead>
		<th>ID</th>
		<th>Usuario</th>
		<th>Fecha</th>
	</thead>

	<tbody>

	</tbody>
</table>
</body>
</html>