/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
//    $('#cancelbtn').click(function(){
//       loadPage('booking-list.jsp');
//         $('#ResMsg').addClass("hidden");
//    });
    
    //to get the room number
    $('#roomtype,#bedtype').change(function(){
       var rtype=$('#roomtype').val();
       var btype=$('#bedtype').val();
      
       if(rtype!="-1" && btype!="-1" ){
          
           $('#invalidroom').addClass("hidden");
           $('#rno').css("border-color","lightgrey");
               $.ajax({
                   type:'post',
                   url:"./RoomNumberServlet",
                   data:{"rt":rtype,"bt":btype},
                   success:function(data){
                    
                      if(data.match("null")){
                          $('#rno').val("");
                         $('#invalidroom').removeClass("hidden");
                         $('#invalidroom').css("color","red");
                         $('#rno').css("border-color","red");
                         $('#invalidroom').html("<center><b>*selected room not available!</b></center>");
                         }  else $('#rno').val(data);
                  }
                });
       }else {
                $('#rno').val("");
               $('#invalidroom').removeClass("hidden");
               $('#invalidroom').css("color","red");
               $('#rno').css("border-color","red");
               $('#invalidroom').html("<center><b>*selected room not available!</b></center>");
       }

   });
    
    //To Submit the booking data to servlet..
    $('#bookingbtn').click(function(){
       
       if(validate()==="true"){
       $("#myWaitingModal").modal('show');   
       document.getElementById("bookingfrm").removeAttribute("action");
       document.getElementById("bookingfrm").setAttribute("action", "./BookingServlet");
       var form = $('#bookingfrm');
   
     $.ajax({
        type: form.attr('method'),
        url: form.attr('action'),
        data: form.serialize(),
        success: function (data) {
        
           $("#myWaitingModal").modal('hide');
                           if(data.match("Booking record has been successfully added."))
                            {
                              
                            $('#ResMsg').removeClass("hidden");
                             $('#ResMsg').removeClass("alert-warning");
                            $('#ResMsg').addClass("alert-success");
                            $('#ResMsg').text(data);
                            refreshCurrentPage('newbooking.jsp');
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
      
      
      
      
      //trying new validation
       $('#cname').keyup(function ()
        {
         BookingFrmTextFieldValidation('cname', 'invalidname', 'name');
    });
    
    $('#adr').keyup(function(){
          BookingFrmTextFieldValidation('adr', 'invalidaddress', 'address');
      });
      
    $('#contact').keyup(function(){
          BookingFrmTextFieldValidation('contact', 'invalidcontact', 'contact');
      });
      
       $('#purpose').keyup(function(){
          BookingFrmTextFieldValidation('purpose', 'invalidpurpose', 'purpose');
      });
      $('#occupancy').change(function(){
         
          if($('#occupancy').val() < 1){
            $("#invalidocc").removeClass("hidden");
            $("#occupancy").css("border-color", "red");
            $("#invalidocc").html(("<center><b>*occupancy can't be less than 1 person!</b></center>"));  
          }else{
              $("#invalidocc").addClass("hidden");
            $("#occupancy").css("border-color", "lightgrey");
          }
      });
       $('#days').change(function(){
           
         if($('#days').val() < 1){
            $("#invaliddays").removeClass("hidden");
            $("#days").css("border-color", "red");
            $("#invaliddays").html(("<center><b>*can't be less than 1 day!</b></center>"));  
          }else{
              $("#invaliddays").addClass("hidden");
            $("#days").css("border-color", "lightgrey");
          }
      });
      
   $('#contact').blur(function ()
    {
       
        if ($('#contact').val().length > 10 )
        {
            $("#invalidcontact").removeClass("hidden");
            $("#contact").css("border-color", "red");
            $("#invalidcontact").html(("<center><b>*can't be more than 10 digits!</b></center>"));
        }
         if ($('#contact').val().length < 10 )
        {
           $("#invalidcontact").removeClass("hidden");
            $("#contact").css("border-color", "red");
            $("#invalidcontact").html(("<center><b>*can't be less than 10 digits!</b></center>"));
        }
         if ($('#contact').val().length === 0 )
        {
            $("#invalidcontact").removeClass("hidden");
            $("#contact").css("border-color", "red");
            $("#invalidcontact").html(("<center><b>*can't be empty!</b></center>"));
         }
    });
    
    $('#date').blur(function(){
         if($('#date').val()!==""){
             
            $("#invaliddate").addClass("hidden");
            $("#date").css("border-color", "lightgrey");
          }else{
            $("#invaliddate").removeClass("hidden");
            $("#date").css("border-color", "red");
            $('#invaliddate').css("margin-right","85px");
            $("#invaliddate").html(("<center><b>*please select a date!</b></center>"));  
          }
    });


       function BookingFrmTextFieldValidation(component, msg, txtVal)
       {
        if (txtVal === "name"){
           var re = /^[a-zA-Z ]+$/;
           var emptymsg="name can't be empty";
       }
        if (txtVal === "address"){
           var re = /^[a-zA-Z\^[0-9-,-.-''-(-) ]+$/;
           var emptymsg="address can't be empty";
       }
        if (txtVal === "contact"){
           var re = /^[0-9-\" ]+$/;
           var emptymsg="contact can't be empty";
          }
        if (txtVal === "purpose"){
           var re = /^[a-zA-Z\^[0-9-,-.-'' ]+$/;
          
           var emptymsg="please fill this field too!";
        }
//        if (txtVal === "amount")
//           var re = /^[0-9-.\" ]+$/;
//        if (txtVal === "email")
//           var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
       
        
     var val = $('#' + component).val();

    if (re.test(val) || val.length === 0)
    {

        $("#" + msg).addClass("hidden");
        $("#" + component).css("border-color", "lightgrey");


    } else
    {

        $("#" + msg).removeClass("hidden");
        $("#" + component).css("border-color", "red");
        
        if (txtVal === "name")
        {
              $("#" + msg).html(("<center><b>*please use alphabets only!</b></center>"));
        }
        if (txtVal === "address")
        {
              $("#" + msg).html(("<center><b>*please dont use invalid characters!</b></center>"));
        }
        if (txtVal === "contact")
        {
            $("#" + msg).html(("<center><b>*please insert numeric values only!</b></center>"));
        }
        if (txtVal === "purpose")
        {
             $("#" + msg).html(("<center><b>*please dont use invalid characters!</b></center>"));
        }
       
    }
    if($("#"+component).val().length===0){
//       
        $("#"+msg).removeClass("hidden");
        $("#"+component).css("border-color","red");
        $("#" + msg).html(("<center><b>*"+emptymsg+"</b></center>"));
    }
}

//function to validate date
function validDate(){
    var d=new Date();
    return d;
}

//function to prevent invalid values from submit

    function validate(){
    flag="true";
    var name=$("#cname").val().trim();
    var vn=/^[a-zA-Z ]+$/;
    if(!vn.test(name)) flag="false";
    if($("#cname").val().length===0) flag="false";
    
    var address=$("#adr").val().trim();
    var va= /^[a-zA-Z\^[0-9-,-.-''-(-) ]+$/;
    if(!va.test(address)) flag="false";
    if($("#adr").val().length===0) flag="false";
    
    var contact=$("#contact").val().trim();
    var vc=/^[0-9 ]+$/;
    if(!vc.test(contact))flag="false";
    if($("#contact").val().length===0)flag="false";
    if($("#contact").val().length >10)flag="false";
    if($("#contact").val().length <10)flag="false";
    
    if($("#occupancy").val()<1)flag="false";
    if($("#days").val()<1)flag="false";
    
    if($('#date').val()==="")flag="false";
    
    var purpose=$('#purpose').val();
    var vp=/^[a-zA-Z\^[0-9-,-.-'' ]+$/;
    if(!vp.test(purpose))flag="false";
    if($('#purpose').val().length===0)flag="false";
    
    
    return flag;
}


    
  });


