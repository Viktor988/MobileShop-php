<?php 

    session_start();


include("konekcija.php");
?>


<!DOCTYPE html>
<html>
<title>Telefoni Ciric-Proizvodi</title>
<?php include("head.php");?>
<body>
<div id="ceo">

    <div id="gore">
        <div id="logo">
				<h1>Telefoni</h1>
                       <h2>Ćirić</h2> 
        </div>
        <div id="nav"> 
		<?php include("meni.php");?>
		
	<button id="btnMeni">Meni</button>
        </div>
            
</div>
<?php include("header.php") ;
$limit = 6;  
if (isset($_GET["page"])) { $page  = $_GET["page"]; } else { $page=1; };  
$kreniOd = ($page-1) * $limit;?>
           <form name="aa" action="index.php?page=<?=$page;?>" method="post">
		<div id="auta">
		<h1 id="naslovmodel">MODELI</h1>
		<input type="submit" value="Cena opadajuce" name="btno" id="opadajuce"class="dug"/>
    <input type="submit" value="Cena rastuce" name="btnr" id="rastuce" class="dug"/>
    <input type="submit" value="A-Z" name="btnno" id="opadajuce"class="dug"/>
    <input type="submit" value="Z-A" name="btnna" id="rastuce" class="dug"/>
        
</form>
		</div></div>
<div id="sredina2">
 <?php
        



$sql = $konekcija->prepare("SELECT* from proizvodi p inner join marka m on p.idMarka=m.idMarka inner join slike s on s.idslika=p.idslika   LIMIT $kreniOd, $limit");
if(isset($_POST['btno'])){
    $sql = $konekcija->prepare("SELECT* from proizvodi p inner join marka m on p.idMarka=m.idMarka inner join slike s on s.idslika=p.idslika order by cena DESC  LIMIT $kreniOd, $limit");}
    if(isset($_POST['btnr'])){
      $sql = $konekcija->prepare("SELECT* from proizvodi p inner join marka m on p.idMarka=m.idMarka inner join slike s on s.idslika=p.idslika order by cena ASC  LIMIT $kreniOd, $limit");}
      if(isset($_POST['btnno'])){
        $sql = $konekcija->prepare("SELECT* from proizvodi p inner join marka m on p.idMarka=m.idMarka inner join slike s on s.idslika=p.idslika order by Naziv ASC  LIMIT $kreniOd, $limit");}
        if(isset($_POST['btnna'])){
          $sql = $konekcija->prepare("SELECT* from proizvodi p inner join marka m on p.idMarka=m.idMarka inner join slike s on s.idslika=p.idslika order by Naziv DESC  LIMIT $kreniOd, $limit");}
$rez=$sql->execute();
if($rez){
		$sve=$sql->fetchAll();
		$is="";
		foreach($sve as $i){
			$is.="<div class='limprvi'>
           
<img src='$i->path'/>
<div id='opis'>
<span class='mar'>Marka:</span><span class='marka'>$i->Naziv</span><br/>
<span class='mod'>Model:</span><span class='model'>$i->Model</span><br/>
<span class='spec'>Specifikacije:</span> <span class='specifikacije'>$i->Opis
</span><br/>
<span class='cen'>Cena:</span><span class='cena' id='cenaa'>$i->cena RSD</span>
</div>
<a href='index.php?id=$i->idProizvod' id='opsirnije' value='Opsirnije'  data-id='$i->idProizvod'>Opsirnije</a>

<a href='index.php?idpr=$i->idProizvod' class='kupi' name='kupi' data-id=$i->idProizvod>Kupi<i class='fas fa-shopping-cart'
id='korpa'></i></a>


</div>";}
echo $is;
		}
		$sql = $konekcija->prepare("SELECT COUNT(idProizvod) FROM proizvodi");  
		$sql->execute();
	
$limit=6;
$total_records = $sql->fetchAll(PDO::FETCH_COLUMN, 0); 
$total_pages = ceil($total_records[0] / $limit);  
$pagLink = "<div class='pagination'>";  
for ($i=1; $i<=$total_pages; $i++) {  
             $pagLink .= "<a href='index.php?page=".$i."' >".$i."</a>";  
};  



?>


</div><?php 
if(!isset($_SESSION['korisnik'])){


	if(isset($_GET['idpr'])){
	$prom=$_GET['idpr'];

	
	echo "<script>alert('Ulogujte se na sajt da bi ste potvrdili kupovinu!')</script>";
	
	
	
	}	}
?>
<div id="proizvod">
<?php
if(isset($_GET['id'])){
    $id=$_GET['id'];
$upit =$konekcija->prepare("SELECT* from proizvodi p inner join marka m on p.idMarka=m.idMarka inner join slike s on s.idslika=p.idslika  where idProizvod=$id");
$rez=$upit->execute();
if($rez){

		$sve=$upit->fetch();
		$prom=explode(",",$sve->Opis);
   $isp="";
        
		$isp.="
		<i class='fas fa-times' id='iks'></i>	
		<div id='slikaproiz'>
    <img src='$sve->path' class='slikapr'/>
    </div>
    <div id='proizopis'>
    <table id='proiztabla'>
    <tr><td>Marka poizvoda:</td><th>$sve->Naziv</th></tr>
    <tr><td>Model:</td><th>$sve->Model</th></tr>
    <tr><td>Boja:</td><th>$prom[0]</th></tr>
    <tr><td>Dijagonala ekrana:</td><th>$prom[1]</th></tr>
     <tr><td>Procesor:</td><th>$prom[2]</td></tr>
		<tr><td>Kamera</td><th>$prom[4]</th></tr>
		<tr><td>Ram</td><th>$prom[3]</th></tr>
    <tr><td>Cena</td><th>$sve->cena RSD</th></tr>
    
    </table>
 
    </div>";

echo $isp;}}
?>


</div>
</div></div>
<div id="paginacija">
<?php echo $pagLink;?>
<?php

 ?>

   </div></div>



 


<div id="futer">
<div id="ikonice">

<?php include("ikonice.php"); ?>
    </div>
<div id="dok">
  <a href="dokumentacija.pdf"><h2>DOKUMENTACIJA</h2></a>
</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="js/main1.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>