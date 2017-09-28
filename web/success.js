var textmiddle=document.getElementById("textinthemiddle");

//textmiddle.innerHTML="<h1>your payment has been successfull</h1>";
var paymentsuccess=document.createElement("h1");
paymentsuccess.innerHTML="<center>Your Payment has been Successful";
textmiddle.appendChild(paymentsuccess);

var para=document.createElement("p");
para.innerHTML="<center><b>TRANSACTION ID IS"+" 34t6243652"+"<br>To Print The Receipt ,CLICK BELOW</b></center>";
textmiddle.appendChild(para);


var print=document.createElement("button");
print.innerHTML="<b>Print</b>";
print.setAttribute("class", "btn center-block");
textmiddle.appendChild(print);

print.addEventListener("click",function(event)
{
        window.location.href="receipt.jsp";
});

