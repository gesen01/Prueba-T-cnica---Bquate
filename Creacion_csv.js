//Se crean las instancias de los objetos a utilizar en este caso se usara la conexion a mysql y csv
var mysql = require('mysql');
var doc_csv=require('csv');

//Creamos una variable donde se tenga la consulta a realizar
var rs_pistasURL="SELECT o.PistaOriginalURL FROM PistasOriginales_tbl o JOIN PistasCortas c ON c.PistaOriginalID=o.ID JOIN Artistas_tbl a ON .ID=o.ArtistaID WHERE a.Nombre='Arjona' AND MONTH(c.FechaPrevisualizacion)=MONTH(GETDATE())"

//Creamos un objeto para realizar la conexion con mySQL
var con = mysql.createConnection({
  host: "localhost",
  user: "mysqlsr",
  password: "lqsym",
  database:"online-music"
});

//Creamos un arreglo para almacenar las URL
var pistasURL;

//Validamos la conexion
con.connect(function(err) {
  if (err) throw err;
  //Ejecutamos la consulta
  con.query(rs_pistasURL,function(err,result,fields){
      //Convertimos el resultado en el documento CSV en la ruta especificada
      pistasURL=[fields.PistaOriginaURL];
      csv.from(pistasURL).to.path('/data/queries/previews/arjona.csv')
      
  });  
});