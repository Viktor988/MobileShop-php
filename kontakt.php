<?php session_start();
include("konekcija.php");
?>
<!DOCTYPE html>
<html>
<title>Kontakt</title>
<?php include("head.php");?>
<body>
        
        <div id="ceo">

                <div id="gore">
                    <div id="logo">
                    <h1>Telefoni</h1>
                       <h2>Ćirić</h2> 
                    </div>
                    <div id="nav">
                    <?php include("meni.php") ?>
                     <button id="btnMeni">Meni</button>
                    </div>
                    
                    
            </div>
            <?php include("header.php");?>
          <div id="ksredina">
          <h1 id="knaslov">Kontakt</h1>
   
            <div id="kotntakti">
            <div id="formakontakt">
        
<form action="#" method="post">
<?php  if(isset($_SESSION['korisnik'])){ ?>
<input type="text" id="emailkk" name="email"placeholder="Email" value="<?=$_SESSION['korisnik']->email;?>"/><br/> <?php }

else{?><input type="text" id="emailkk" name="email"placeholder="Email"/><br/> <?php }?>
<input type="text" id="naslov" name="naslov"placeholder="Naslov"/><br/>
<textarea rows="10" cols="5" id="pitanja" name="pitanja" placeholder="Pitanje"></textarea><br/>
<input type="button" id="sub" name="sub" value="Posaljite poruku"/>

</form>
 <div id="greskee"></div>          
       <?php include("kontaktobrada.php") ?>  





</div>
<div id="anketa">
<form action="<?php echo $_SERVER['PHP_SELF'];?>" method="post">
            <?php
            $pitanje="SELECT idPitanja, tekstPitanja FROM anketapitanja WHERE aktivna=1";
            $rez1 = $konekcija->query($pitanje);
            $niz1 = $rez1 ->fetchAll();
            foreach($niz1 as $niz){
            
            echo "<table border='1px' id='anketatabela'><tr><td>$niz->tekstPitanja</td></tr>"; }
            
            $upit="SELECT  odgovori, idOdgovora FROM anketaodgovori o, anketapitanja a WHERE a.aktivna=1
AND a.idPitanja=o.idPitanja";
$rez = $konekcija->query($upit);
$aa=$rez->fetchAll();
$ispis="";
foreach($aa as $red){ 

$ispis.="<tr><td><input type='radio' name='odgovori' value='$red->idOdgovora'/>$red->odgovori</td></tr>"
;}
echo $ispis;


 echo "<tr><td><input type='submit' name='glasaj'id='glasaj' value='Glasaj' />";

echo "<input type='submit' name='rez' value='Rezultati'id='rezultat' /></td></tr>";
 
 echo "</table></form>";

  if( isset($_POST['glasaj'])){
    $gr=[];
    if(!isset($_POST['odgovori'])){
        $gr[]="Morate cekirati nesto!";}
       else if(!isset($_SESSION['korisnik'])){
          $gr[]="Greska morate se ulogovati";
        }
        if(isset($_SESSION['korisnik'])){
        $id=$_SESSION['korisnik']->idkorisnik;
        $anketaa=$konekcija->prepare("SELECT count(*) as broj from glasanje WHERE idkorisnik=$id");
       

        $izvrsiii= $anketaa->execute();

        $da=$anketaa->fetch();
      
       if($da->broj=="1"){
          $gr[]="Ne mozete glasati vise od jednom!";
      
        }}

      
     if(count($gr)!=0){
       foreach($gr as $g){
         echo "<script>alert('$g')</script>";
       }}
     
   else{
   
    
    $glasanje=$_POST['glasaj'];
    
 
  $odgovor=$_POST['odgovori'];
  $korisnik=$_SESSION['korisnik']->idkorisnik;
  $upisi_odgovor=$konekcija->prepare("UPDATE anketarezultati SET rezultat=rezultat+1 WHERE
  idOdgovora=:odgovor");
  $upisi_odgovor->bindParam(":odgovor",$odgovor);
  $izvrsi_upisi_odgovor = $upisi_odgovor->execute();
  if ($izvrsi_upisi_odgovor):
   
  echo "<script>alert('Hvala vam sto ste glasali!')</script>";
  else:
  echo 'Greška'.mysql_error();
  endif;  
  $nemoze="INSERT INTO glasanje (idOdgovora,idkorisnik) VALUES(:odg,:kor)";
  $sve=$konekcija->prepare($nemoze);
  $sve->bindParam(":odg",$odgovor);
                $sve->bindParam(":kor",$korisnik);
$sve->execute();



  }}
  
 if( isset($_POST['rez'])){
  $rezultati = $konekcija->prepare("SELECT * FROM anketapitanja WHERE aktivna=1");
 $sve=$rezultati->execute();
  $row = $rezultati ->fetchAll();
  foreach($row as $rr){
  $aa=$rr->idPitanja;}
  echo "<table id='anketaodgovor' border='1px solid black'><tr><td>Rezultati ankete</td></tr>";
           
  $odgovori = "SELECT o.odgovori, r.rezultat FROM anketaodgovori o, anketarezultati r WHERE
  o.idOdgovora = r.idOdgovora AND r.idPitanja =".$aa;
 $uzmi_odgovore = $konekcija->query($odgovori);

 $sve=$uzmi_odgovore->fetchAll();
 foreach($sve as $red):
  echo "<tr><td>$red->odgovori</td><td>$red->rezultat</td></tr>";
 endforeach;
 echo '</table>';
  }

  ?> 
</div>





</div>
</div>

<div id="futer">
<div id="ikonice">

<?php include("ikonice.php"); ?>
    </div>
<div id="dok">
  <a href="dokumentacija.pdf"><h2>DOKUMENTACIJA</h2></a>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="js/kotaktvalidacija.js"></script>