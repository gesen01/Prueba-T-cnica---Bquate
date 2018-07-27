<?php 
$host="localhost";
$usuario="root";
$pass="";
$db="multiplos";

$conexion=mysql_connect($host,$usuario,$pass);
mysql_select_db($db,$conexion);

$query="SELECT ID, CASE WHEN Descripcion='#N/A' THEN ID ELSE Descripcion END AS 'Descripcion' FROM multiplos_tbl";
$rs_multiplos=mysql_query($query,$conexion);

?>
<?php while($registro=mysql_fetch_assoc($rs_multiplos)){ ?>
<tr>
	<td><?php echo $registro['ID']; ?></td>
	<td><?php echo $registro['Descripcion']; ?></td>
</tr>
<?php } ?>