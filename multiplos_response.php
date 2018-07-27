<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(e){
		function tabla_multiplos()
		{	
		   $.ajax({
			 url: 'multiplosdb.php',
			 success: function (response) {
			   		document.getElementById("lista").innerHTML=response; 
			 }
		   });
		   
		}
		
		tabla_multiplos();
		
		
	});
</script>
<style>
td{
	border: 1px solid #000;
	width: 30%;
	margin: 0px;
	text-align: center;
	padding-top: 10px;
	padding-right: 0px;
	padding-bottom: 10px;
	padding-left: 0px;
}
</style>
</head>

<body>
<h1>Lista de n&uacute;meros y sus multiplos</h1>
<table cellpadding="0" cellspacing="0" id="lista">

</table>
</body>
</html>