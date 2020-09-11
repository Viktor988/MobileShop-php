<?php include("konekcija.php");
if(isset($_SESSION['korisnik'])){
    if($_SESSION['korisnik']->iduloga != 2){

        header("Location: index.php");
    }
} else {
   
    header("Location: index.php");
}

$upit =$konekcija->prepare("SELECT* from proizvodi p inner join marka m on p.idMarka=m.idMarka inner join slike s on s.idslika=p.idslika");
$rez=$upit->execute();
if($rez){
    $sve=$upit->fetchAll();
  
   echo json_encode($sve);
}
?>