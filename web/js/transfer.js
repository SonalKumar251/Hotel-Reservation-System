var flag="true";
function invalidRoom(){
                    $('#ResMsg').addClass("hidden");
                    $('#invalidrn').removeClass("hidden");
                    $('#invalidrn').html("<center><b>*Enter a valid booking no.</b></center>");
                    $('#rn').css("border-color","red");
                    $('#rn').val("");
                    flag="false";                   
}
function invalid(val){
     $('#ResMsg').removeClass("hidden");
    $('#ResMsg').removeClass("alert-success");
    $('#ResMsg').addClass("alert-warning");
    $('#ResMsg').text(val);
     $('#invalidrn').removeClass("hidden");
    
     $('#rn').css("border-color","red");
    $('#invalidrn').html("<center><b>*Booking unavailable!</b></center>");
   
    $('#rn').val("");   
    flag="false";
}
function valid(val){
    $('#ResMsg').addClass("hidden");
    $('#invalidrn').addClass("hidden");
     $('#rn').css("border-color","lightgrey");
     $('#rn').val(val);
    flag="true";
}

$(document).ready(function(){
    $('#bn').keyup(function(){
        var bno=$('#bn').val();
        var acn="roomnum";
       
            if(bno.length > 4){
                 $.get('TransferServlet?bn='+bno,"action="+acn,function(response){
                
            if(response.match("Cancelled"))invalid("Booking already cancelled");
            else if(response.match("checked-out"))invalid("Booking already checked-out");
            else if(response.match("null"))invalid("Booking Unavailable ,Try again!");
            else valid(response);
         });
            }else invalidRoom();
            
        });
      
      //to get the new room and to check it's availablity...
      
       $('#troomtype,#tbedtype').change(function(){
       var rtype=$('#troomtype').val();
       var btype=$('#tbedtype').val();
      
       if(rtype!="-1" && btype!="-1" ){
          
           $('#invalidnrn').addClass("hidden");
           $('#nrn').css("border-color","lightgrey");
               $.ajax({
                   type:'post',
                   url:"./RoomNumberServlet",
                   data:{"rt":rtype,"bt":btype},
                   success:function(data){
                    
                      if(data.match("null")){
                          $('#nrn').val("");
                         $('#invalidnrn').removeClass("hidden");
                         $('#invalidnrn').css("color","red");
                         $('#nrn').css("border-color","red");
                         $('#invalidnrn').html("<center><b>*selected room not available!</b></center>");
                         }  else $('#nrn').val(data);
                  }
                });
       }else {
                $('#nrn').val("");
               $('#invalidnrn').removeClass("hidden");
               $('#invalidnrn').css("color","red");
               $('#nrn').css("border-color","red");
               $('#invalidnrn').html("<center><b>*selected room not available!</b></center>");
       }

   });
   
   //to submit data of transfer module
   $('#transferbtn').click(function(){
       
      
       if(validate()==="true")
       {
        $("#myWaitingModal").modal('show');  
       document.getElementById("transferfrm").removeAttribute("action");
       document.getElementById("transferfrm").setAttribute("action", "./TransferServlet?action=transfer");
       var form = $('#transferfrm');
   
       $.ajax({
        type: form.attr('method'),
        url: form.attr('action'),
        data: form.serialize(),
        success: function (data) {
        
           $("#myWaitingModal").modal('hide');
                           if(data.match("Room transfered sucessfully."))
                            {
                               $('#ResMsg').removeClass("hidden");
                               $('#ResMsg').removeClass("alert-warning");
                               $('#ResMsg').addClass("alert-success");
                               $('#ResMsg').text(data);
                            refreshCurrentPage('newtransfer.jsp');
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
     
     $('#bn').keyup(function(){
         TransferValidation('bn', 'invalidbn', 'booking_num')
     });
      $('#reason').keyup(function(){
         TransferValidation('reason', 'invalidreason', 'reason')
     });
     
      function TransferValidation(component, msg, txtVal)
       {
        if (txtVal === "booking_num"){
           var re = /^[0-9-B ]+$/;
           var emptymsg="field can't be empty!";
       }
        if (txtVal === "reason"){
           var re = /^[a-zA-Z\^[0-9-,-.-''-(-) ]+$/;
           var emptymsg="please provide a specific reason!";
       }
       
        
     var val = $('#' + component).val();

    if (re.test(val) || val.length === 0)
    {

        $("#" + msg).addClass("hidden");
        $("#" + component).css("border-color", "lightgrey");


    } else
    {

        $("#" + msg).removeClass("hidden");
        $("#" + component).css("border-color", "red");
        
        if (txtVal === "booking_num")
        {
              $("#" + msg).html(("<center><b>*please use valid characters only!</b></center>"));
        }
        if (txtVal === "reason")
        {
              $("#" + msg).html(("<center><b>*please dont use invalid characters!</b></center>"));
        }
       
       
    }
    if($("#"+component).val().length===0){       
        $("#"+msg).removeClass("hidden");
        $("#"+component).css("border-color","red");
        $("#" + msg).html(("<center><b>*"+emptymsg+"</b></center>"));
    }
}


//function to prevent invalid values from submit
function validate(){
   
    var bn=$('#bn').val();
    var vb = /^[0-9-B ]+$/;
    if(!vb.test(bn))flag="false";
    if($('#bn').val().length===0)flag="false";
    
    var reason=$('#reason').val();
    var vr =/^[a-zA-Z\^[0-9-,-.-''-(-) ]+$/;
    if(!vr.test(reason))flag="false";
    if($('#reason').val().length===0)flag="false";
    
    return flag;
}
        
              
});


