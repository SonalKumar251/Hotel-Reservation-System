function loadPage(url)
{ 
 
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    $("#show_image").removeClass("hidden");
    $("#workingWindow").addClass("hidden");
   $("#show_image").html('<center><img style=margin-top:15%; src=./img/processing.gif></img></center>');


    xmlhttp.onreadystatechange = function ()
    {
         
        if (xmlhttp.readyState === 4 && xmlhttp.status===200)
        {

            $("#show_image").addClass("hidden");
            $("#workingWindow").removeClass("hidden");
            $("#workingWindow").html(xmlhttp.responseText);
           
        }

    };

   if(url==="tariff-list.jsp"){
    xmlhttp.open("GET", "./AjaxPages/"+url, true);
    changeheading("Tariff-List");
     $('#ResMsg').addClass("hidden");
   }
   if(url==="etariff-list.jsp"){
    xmlhttp.open("GET", "./AjaxPages/tariff-list.jsp", true);
    changeheading("Tariff-List");
     $('#ResMsg').addClass("hidden");
   }
   
   if(url==="newtariff.jsp"){
    xmlhttp.open("GET", "./AjaxPages/"+url, true);
    changeheading("Add New Tariff");
   }
    
    if(url==="edittariff.jsp"){
       
    var id = $("input[name=TariffRadio]:checked").val().trim();
     url="edittariff.jsp?etariff_id="+id;
    xmlhttp.open("GET", "./AjaxPages/"+url, true);
    changeheading("Edit Tariff");
   }
    
    if(url==="room-list.jsp"){
        xmlhttp.open("GET","./AjaxPages/"+url,true);
        changeheading("Room-List");
         $('#ResMsg').addClass("hidden");
    }
    
    if(url==="newroom.jsp"){
        xmlhttp.open("GET","./AjaxPages/"+url,true);
        changeheading("Add New Room");
    }
    
    if(url==="booking-list.jsp"){
        
      xmlhttp.open("GET","./AjaxPages/"+url,true);
       $('#ResMsg').addClass("hidden");
    }
    
      if(url==="newbooking.jsp"){
        xmlhttp.open("GET","./AjaxPages/"+url,true);  
    }
    if(url==="editbooking.jsp"){
        var bn=$("[name=BookingRadio]:checked").val().trim();
        xmlhttp.open("GET","./AjaxPages/editbooking.jsp?bn="+bn,true);  
    }
     if(url==="transfer-list.jsp"){
      xmlhttp.open("GET","./AjaxPages/"+url,true);
       $('#ResMsg').addClass("hidden");
    }
    if(url==="newtransfer.jsp"){
      xmlhttp.open("GET","./AjaxPages/"+url,true);  
    }
     if(url==="billing-list.jsp"){
      xmlhttp.open("GET","./AjaxPages/"+url,true); 
       $('#ResMsg').addClass("hidden");
    }
     if(url==="newbilling.jsp"){
      xmlhttp.open("GET","./AjaxPages/"+url,true);  
    }
    if(url==="cancel-list.jsp"){
      xmlhttp.open("GET","./AjaxPages/"+url,true);
      changeheading("Cancelled Booking's");
       $('#ResMsg').addClass("hidden");
    }
     if(url==="newcancellation.jsp"){
      xmlhttp.open("GET","./AjaxPages/"+url,true);
      changeheading("Cancel Booking");
    }
    
     if(url==="tariffReport.jsp"){
      xmlhttp.open("GET","./AjaxPages/"+url,true);  
    }
   xmlhttp.send();
}


function refreshCurrentPage(url)
{ 
 
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    $("#workingWindow").addClass("hidden");
    xmlhttp.onreadystatechange = function ()
    {
         
        if (xmlhttp.readyState === 4 && xmlhttp.status===200)
        {

            $("#workingWindow").removeClass("hidden");
            $("#workingWindow").html(xmlhttp.responseText);
           
        }

    };
   
    if(url==="newtariff.jsp"){
    xmlhttp.open("GET", "./AjaxPages/"+url, true);
   }
    if(url==="edittariff.jsp"){
        var tid = document.getElementById("tariff_id1").value;
        xmlhttp.open("GET", "./AjaxPages/edittariff.jsp?etariff_id="+tid, true);
   }
    if(url==="newroom.jsp"){
    xmlhttp.open("GET", "./AjaxPages/"+url, true);
   }
    if(url==="newbooking.jsp"){
    xmlhttp.open("GET", "./AjaxPages/"+url, true);
   }
    if(url==="booking-list.jsp"){
    xmlhttp.open("GET", "./AjaxPages/"+url, true);
   }
    if(url==="newtransfer.jsp"){
      xmlhttp.open("GET","./AjaxPages/"+url,true);  
    }
   
   if(url==="newbilling.jsp"){
      xmlhttp.open("GET","./AjaxPages/"+url,true);  
    }
     if(url==="newcancellation.jsp"){
      xmlhttp.open("GET","./AjaxPages/"+url,true);  
    }
   xmlhttp.send();
}

function reportLoadPage(url)
{ 
 
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    $("#show_image").removeClass("hidden");
    $("#reportdiv").addClass("hidden");
   $("#show_image").html('<center><img style=margin-top:15%; src=./img/processing.gif></img></center>');


    xmlhttp.onreadystatechange = function ()
    {
         
        if (xmlhttp.readyState === 4 && xmlhttp.status===200)
        {

            $("#show_image").addClass("hidden");
            $("#reportdiv").removeClass("hidden");
            $("#reportdiv").html(xmlhttp.responseText);
           
        }

    };
if(url==="Report-list.jsp"){
   var rtype=$('#roomtype option:selected').val().trim();
   var btype=$('#bedtype option:selected').val().trim();
   var criteria=$('#tcriteria option:selected').val().trim();
   var rtariff=$('#rtariff').val();
   var roccupancy=$('#roccupancy option:selected').val().trim();
  
   xmlhttp.open("GET", "./AjaxPages/Report-list.jsp?rtype="+rtype +"&btype="+btype+ "&criteria="+criteria+ "&rtariff="+rtariff +"&roccupancy="+roccupancy, true) ;
}
xmlhttp.send();

}