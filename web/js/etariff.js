/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var count=0;
var row=0;
$(document).ready(function ()
{ 
    $('[name="etariff"]').keyup(function(){
            
            var tariff=$('[name="etariff"]').val().trim();
          
            var re=/^[0-9]+$/;
            if(re.test(tariff)){
               $('#invalidetariff').addClass("hidden");
               $('[name="etariff"]').css("border-color","grey");
            }
            else{
                $('#invalidetariff').removeClass("hidden");
                $('[name="etariff"]').css("border-color","red");
                $("#invalidetariff").css("color","red");
                $("#invalidetariff").css("margin-left","125px");
                $("#invalidetariff").text("invalid tariff!");
            }
             if ($('[name="etariff"]').val().length===0){
                console.log(tariff);
                 $('#invalidetariff').removeClass("hidden");
                $('[name="etariff"]').css("border-color","red");
                $("#invalidetariff").css("color","red");
                $("#invalidetariff").css("margin-left","120px");
                $("#invalidetariff").text("field can't be empty!");
            }
           }); 
         
        //validation for description textfield
            $('[name="edescription"]').keyup(function(){
            
            var desc=$('[name="edescription"]').val().trim();
     
            var re=/^[A-Za-z\^[0-9 ]+$/;
            if(re.test(desc)){
               $('#invalidedesc').addClass("hidden");
               $('[name="edescription"]').css("border-color","grey");
            }
            else{
                $('#invalidedesc').removeClass("hidden");
                $('[name="edescription"]').css("border-color","red");
                $("#invalidedesc").css("color","red");
                $("#invalidedesc").css("margin-left","120px");
                $("#invalidedesc").text("invalid description!");
            }
             if ($('[name="edescription"]').val().length===0){
              
                 $('#invalidedesc').removeClass("hidden");
                $('[name="edescription"]').css("border-color","red");
                $("#invalidedesc").css("color","red");
                $("#invalidedesc").css("margin-left","120px");
                $("#invalidedesc").text("field can't be empty!");
            }
           });
    
    $('#etariffbtn').click(function ()
    {
        var tariff=$('[name="etariff"]').val().trim();
    var t=/^[0-9]+$/;
   var desc=$('[name="edescription"]').val().trim();
    var d=/^[A-Za-z\^[0-9 ]+$/;
    
   
    if(d.test(desc) && t.test(tariff) )
    { 
   $("#myWaitingModal").modal('show');
    document.getElementById("etarifffrm").removeAttribute("action");
     document.getElementById("etarifffrm").setAttribute("action", "./EditTariffServlet");
     var form = $('#etarifffrm');
     $.ajax({
        type: form.attr('method'),
        url: form.attr('action'),
        data: form.serialize(),
        success: function (data) {
        
           $("#myWaitingModal").modal('hide');
                           if(data.match("Tariff record has been successfully updated.."))
                            {
                              
                            $('#ResMsg').removeClass("hidden");
                             $('#ResMsg').removeClass("alert-warning");
                            $('#ResMsg').addClass("alert-success");
                            $('#ResMsg').text(data);
                            refreshCurrentPage('edittariff.jsp');
                            }
                            else
                            {
                                  $('#ResMsg').removeClass("hidden");
                                  $('#ResMsg').removeClass("alert-success");
                                  $('#ResMsg').addClass("alert-warning");
                                  $('#ResMsg').text(data);
                            }

        }
    });
    }else{
         $('#ResMsg').removeClass("hidden");
             $('#ResMsg').addClass("alert-warning");
            $("#ResMsg").text("Please fill the form accordingly!");
      
    }
      
    });
    
    $("#eback").click(function(){
        loadPage('etariff-list.jsp');
         $('#ResMsg').addClass("hidden");
    });
   
    
}); 
      

