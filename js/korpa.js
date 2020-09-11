 $(document).ready(function () {
    let products = proizvodUKorpi();
    
   
    displayCartData();

});

function displayCartData() {
    let products = proizvodUKorpi();

    $.ajax({
        url : "./proizvodi.php",
        dataType:"json",
        success : function(data) {
            let productsForDisplay = [];
     
            
            data = data.filter(p => {
                for(let prod of products)
                {
                    if(p.idProizvod == prod.id) {
                        p.quantity = prod.quantity;
                        return true;
                    }
                     
                }
                return false;
            });
            generateTable(data)
        }
    })}

function generateTable(data){
var ispis=`<table id='korpatab' border="1px solid black">
<thead><tr>
    <th>Redni broj</th>
    <th>Slika</th>
    <th>Marka</th>
    <th>Model</th>
    <th>Cena</th>
    <th>Kolicina</th>
    <th>Odustani</th>
    <th>Kupi</th>
</tr><thead>`

var br=1


for(let i of data){
ispis+=`<tr><td>${br}</td><td><img src='${i.path}'class='slikakorpa'/></td><td>${i.Naziv}</td><td>${i.Model}</td><td>${i.cena*i.quantity}</td><td class='kolicin'data-id=${i.idProizvod}>${i.quantity}</td><td><a href="#" onclick='removeFromCart(${i.idProizvod})'id='kbrisi'>Obrisi</a></td><td><a href="korpaprikaz.php" id='kkupi'class="a" data-id=${i.idProizvod}>Kupi</a></td>`;
br++
}

ispis+="</tr></table>"

document.getElementById("sadrzajjj").innerHTML=ispis;

}

$("#sadrzajjj").on("click",".a",function(){
 


   var x= document.getElementsByClassName("kolicin")


var ccc=JSON.parse(localStorage.getItem("products"))

for(var ff of ccc){
    var id= $(this).data("id")
if(ff.id==id){
    
 var z=ff.id
  kol=ff.quantity

}
}
    alert("Uspesno ste narucili proizvod!")
$.ajax({
  
    url:"./korpaprikaz.php",
    type:"post",
    data:{
        id:id,
        kolicina:kol
     
    },
    dataType:"json",
    success:function(sve){
      
    }
})

})



function proizvodUKorpi() {
    return JSON.parse(localStorage.getItem("products"));
}



function removeFromCart(id) {
    let products = proizvodUKorpi();
    let filtered = products.filter(p => p.id != id);

    localStorage.setItem("products", JSON.stringify(filtered));

    displayCartData();




}

$("#btnMeni").click(function(){
    $("#nav ul").slideToggle()
    
    
})	

$(document).ready(function(){
    slideShow();
  });
  
  function slideShow() {
    var trenutni = $('#slajder .aktivna');
    var next = trenutni.next().length ? trenutni.next() :trenutni.parent().children(':first');
    
    trenutni.hide().removeClass('aktivna');
    next.fadeIn().addClass('aktivna');
    
    setTimeout(slideShow, 4000);
  }
$("#sdesno").click(function(){
    var trenutni=$("#slajder .aktivna");
    var sledeci= trenutni.next().length?trenutni.next():trenutni.parent().children(":first");
    trenutni.hide().removeClass("aktivna");
    sledeci.fadeIn().addClass("aktivna");
})
$("#slevo").click(function(){
    var trenutni=$("#slajder .aktivna");
    var sledeci= trenutni.prev().length?trenutni.prev():trenutni.parent().children(":last");
    trenutni.hide().removeClass("aktivna");
    sledeci.fadeIn().addClass("aktivna");

})