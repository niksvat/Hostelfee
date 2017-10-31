var textmiddle=document.getElementById("textmiddleid");

var print=document.createElement("button");
print.innerHTML="<b>Print</b>";
print.setAttribute("class", "btn center-block");
textmiddle.appendChild(print);

print.addEventListener("click",function(event)
{
        window.location.href="receipt.jsp";
});

