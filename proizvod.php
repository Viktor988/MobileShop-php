<?php
include("konekcija.php");

if(isset($_GET['id'])){
    $id=$_GET['id'];
$upit =$konekcija->prepare("SELECT* from proizvodi p inner join marka m on p.idMarka=m.idMarka where idProizvod=$id");
$rez=$upit->execute();
if($rez){
    $sve=$upit->fetch();
   $isp="";
        
    $isp.=`<div id="slikaproiz">
    <img src=""/>
    </div>
    <div id="proizopis">
    <table id="proiztabla">
    <tr><td>Marka poizvoda:</td><th></th></tr>
    <tr><td>Model:</td><th></th></tr>
    <tr><td>Boja:</td><th>Crna</th></tr>
    <tr><td>Dijagonala ekrana:</td><th>6.0"</th></tr>
    <tr><td>Procesor:</td><th>Quad-Core</td></tr>
    <tr><td>Kamera</td><th>13Mpix</th></tr>
    <tr><td>Cena</td><th>15000Rsd</th></tr>
    
    </table>
    <a href="#"id="kupi2">Kupi<i class="fas fa-shopping-cart" id="korpa"></i></a>
    </div>`;

echo $isp;
}}

?>






<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="language" content="serbian"/>
    <meta name="keywords" content="auto kuca ciric,bmw,bmw auto kuca"/>
    <meta name="description" content="Firma Auto kuća Ćirić je osnovana 1984. godine u Beogradu. Dugogodišnjim radom i kvalitetom pruženih usluga danas smo renomirana kuća sa dugogodišnjom tradicijom i iskustvom. Bavimo se i prodajom novih vozila marke BMW preko generalnog uvoznika Euroimpex Autogroup kao njihovi dileri.Možete se upoznati sa najnovijim modelima iz Opel porodice i sa polovnim vozilima."/>
    <link rel="shortcut icon" href="slike/ikona.ico" />
    <title>Auto kuca-Ćirić</title>
</head>
<body>
<div id="ceo">

    <div id="gore">
        <div id="logo">
            <h1>Auto kuća</h1>
           <h2>Ćirić</h2> 
        </div>
        <div id="nav"> 
		
		
	<button id="btnMeni">Meni</button>
        </div>
        <!--<div id="reg"><i class="fas fa-sign-in-alt"></i></div>
        <div id="meni"><ul><li id="prvil"><i class="fas fa-user-plus"></i><a href="registracija.html">Registracija</a></li></ul>
            <ul><li id="drugil"><i class="fas fa-user-plus"></i><a href="prijava.html">Prijava</a></li></ul>
        </div>-->
        
</div>
<div id="slevo">
<i class="fas fa-less-than"></i></div>
<div id="sdesno">
<i class="fas fa-greater-than"></i></div>
<p  id="pslajd">Novi SUV model BMW X5</p>
<div id="slajder">
    
  <img src="slike/sl2.jpg" class="aktivna" alt="slika slajder 1" /> 
  <img src="slike/sl3.jpg" alt="slika slajder 2"/> 

</div>

<div  id="sredpoizvod">
   <?php 
if(isset($_GET['id'])){
    $id=$_GET['id'];
$upit =$konekcija->prepare("SELECT* from proizvodi p inner join marka m on p.idMarka=m.idMarka where idProizvod=$id");
$rez=$upit->execute();
if($rez){
    $sve=$upit->fetch();
   $isp="";
        
    $isp.="
    
    <div id='slikaproiz'>
    <img src='$sve->Slika' class='slikapr'/>
    </div>
    <div id='proizopis'>
    <table id='proiztabla'>
    <tr><td>Marka poizvoda:</td><th>$sve->Naziv</th></tr>
    <tr><td>Model:</td><th>$sve->Model</th></tr>
    <tr><td>Boja:</td><th>Crna</th></tr>
    <tr><td>Dijagonala ekrana:</td><th>6.0</th></tr>
    <tr><td>Procesor:</td><th>Quad-Core</td></tr>
    <tr><td>Kamera</td><th>13Mpix</th></tr>
    <tr><td>Cena</td><th>15000Rsd</th></tr>
    
    </table>
    <a href='#'id='kupi2'>Kupi<i class='fas fa-shopping-cart' id='korpa'></i></a>
    </div>";

echo $isp;}}
?>
<?php 
if(isset($_POST['id'])){
    $id=$_POST['id'];
$upit =$konekcija->prepare("SELECT* from proizvodi p inner join marka m on p.idMarka=m.idMarka where idProizvod=$id");
$rez=$upit->execute();
if($rez){
    $sve=$upit->fetch();
 echo json_encode($sve);
}}
?>











</div>


<div id="futer">
<div id="ikonice">
    </div>
<div id="dok">
  <a href="dokumentacija.pdf"><h2>DOKUMENTACIJA</h2></a>
</div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/proizvod.js" type="text/javascript"></script>
</body>
</html>