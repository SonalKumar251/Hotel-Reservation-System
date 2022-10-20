$(document).ready(function ()
{   
    //validation for tariff textfield
    $('[name="tariff"]').keyup(function(){
            
            var tariff=$('[name="tariff"]').val().trim();
          
            var re=/^[0-9]+$/;
            if(re.test(tariff)){
               $('#invalidtariff').addClass("hidden");
               $('[name="tariff"]').css("border-color","grey");
            }
            else{
                $('#invalidtariff').removeClass("hidden");
                $('[name="tariff"]').css("border-color","red");
                $("#invalidtariff").css("color","red");
                $("#invalidtariff").css("margin-left","125px");
                $("#invalidtariff").text("invalid tariff!");
            }
             if ($('[name="tariff"]').val().length===0){
                console.log(tariff);
                 $('#invalidtariff').removeClass("hidden");
                $('[name="tariff"]').css("border-color","red");
                $("#invalidtariff").css("color","red");
                $("#invalidtariff").css("margin-left","120px");
                $("#invalidtariff").text("field can't be empty!");
            }
           }); 
         
        //validation for description textfield
            $('[name="description"]').keyup(function(){
            
            var desc=$('[name="description"]').val().trim();
     
            var re=/^[A-Za-z\^[0-9 ]+$/;
            if(re.test(desc)){
               $('#invaliddesc').addClass("hidden");
               $('[name="description"]').css("border-color","grey");
            }
            else{
                $('#invaliddesc').removeClass("hidden");
                $('[name="description"]').css("border-color","red");
                $("#invaliddesc").css("color","red");
                $("#invaliddesc").css("margin-left","120px")
                $("#invaliddesc").text("invalid description!");
            }
             if ($('[name="description"]').val().length===0){
              
                 $('#invaliddesc').removeClass("hidden");
                $('[name="description"]').css("border-color","red");
                $("#invaliddesc").css("color","red");
                $("#invaliddesc").css("margin-left","120px")
                $("#invaliddesc").text("field can't be empty!");
            }
           });
           
   //ajax to submit newtariff data
   
    $('#tariffbtn').click(function ()
    {
    var tariff=$('[name="tariff"]').val().trim();
    var t=/^[0-9]+$/;
    var desc=$('[name="description"]').val().trim();
    var d=/^[A-Za-z\^[0-9 ]+$/;
    var rtype=$('[name="roomtype"]').val().trim();
    var btype=$('[name="bedtype"]').val().trim();
   
    if(d.test(desc) && t.test(tariff) )
    {
        $("#myWaitingModal").modal('show'); 
    document.getElementById("tarifffrm").removeAttribute("action");
     document.getElementById("tarifffrm").setAttribute("action", "./TariffServlet");
     var form = $('#tarifffrm');
     $.ajax({
        type: form.attr('method'),
        url: form.attr('action'),
        data: form.serialize(),
        success: function (data) {
        
           $("#myWaitingModal").modal('hide');
                           if(data.match("Tariff record has been successfully added."))
                            {
                              
                            $('#ResMsg').removeClass("hidden");
                             $('#ResMsg').removeClass("alert-warning");
                            $('#ResMsg').addClass("alert-success");
                            $('#ResMsg').text(data);
                            refreshCurrentPage('newtariff.jsp');
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
      } else{ 
            $('#ResMsg').removeClass("hidden");
             $('#ResMsg').addClass("alert-warning");
            $("#ResMsg").text("Please fill the form accordingly!");
      
        }
  });
        //to go back to home page..
                $("#back").click(function(){
                  loadPage('etariff-list.jsp');
                  $('#ResMsg').addClass("hidden");
                });
                
               
    
}); 
      