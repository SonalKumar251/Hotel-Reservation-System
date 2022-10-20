$(document).ready(function(){
    
//    $('#eback').click(function(){
//        loadPage("booking-list.jsp");
//        $('#ResMsg').addClass("hidden");
//    });
    
    //to submit editbooking form
    $('#ebookingbtn').click(function(){
        
         if(validate()==="true"){
              $("#myWaitingModal").modal('show');
         document.getElementById("ebookingfrm").removeAttribute("action");
         document.getElementById("ebookingfrm").setAttribute("action","./EditBooking");
         var form = $('#ebookingfrm');
           $.ajax({
                    type: form.attr('method'),
                    url: form.attr('action'),
                    data: form.serialize(),
                    success: function (data){
        
                           $("#myWaitingModal").modal('hide');
                           if(data.match("Booking record sucessfully updated."))
                            {
                              
                            $('#ResMsg').removeClass("hidden");
                            $('#ResMsg').removeClass("alert-warning");
                            $('#ResMsg').addClass("alert-success");
                            $('#ResMsg').text(data);
                            refreshCurrentPage('booking-list.jsp');
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
      
      //validation of EditBooking 
       $('#ecname').keyup(function ()
        {
           E_BookingFrmTextFieldValidation('ecname', 'invalidname', 'name');
        });
    
       $('#eadr').keyup(function(){
           E_BookingFrmTextFieldValidation('eadr', 'invalidaddress', 'address');
        });
      
       $('#econtact').keyup(function(){
          E_BookingFrmTextFieldValidation('econtact', 'invalidcontact', 'contact');
         });
      
       $('#epurpose').keyup(function(){
          E_BookingFrmTextFieldValidation('epurpose', 'invalidpurpose', 'purpose');
        });
        
       $('#eoccupancy').change(function(){
         
          if($('#eoccupancy').val() < 1){
            $("#invalidocc").removeClass("hidden");
            $("#eoccupancy").css("border-color", "red");
            $("#invalidocc").html(("<center><b>*occupancy can't be less than 1 person!</b></center>"));  
          }else{
              $("#invalidocc").addClass("hidden");
            $("#eoccupancy").css("border-color", "lightgrey");
          }
      });
       $('#edays').change(function(){
           
         if($('#edays').val() < 1){
            $("#invaliddays").removeClass("hidden");
            $("#edays").css("border-color", "red");
            $("#invaliddays").html(("<center><b>*can't be less than 1 day!</b></center>"));  
          }else{
              $("#invaliddays").addClass("hidden");
            $("#edays").css("border-color", "lightgrey");
          }
      });
      
   $('#econtact').blur(function ()
    {
       
        if ($('#econtact').val().length > 10 )
        {
            $("#invalidcontact").removeClass("hidden");
            $("#econtact").css("border-color", "red");
            $("#invalidcontact").html(("<center><b>*can't be more than 10 digits!</b></center>"));
        }
         if ($('#econtact').val().length < 10 )
        {
           $("#invalidcontact").removeClass("hidden");
            $("#econtact").css("border-color", "red");
            $("#invalidcontact").html(("<center><b>*can't be less than 10 digits!</b></center>"));
        }
         if ($('#econtact').val().length === 0 )
        {
            $("#invalidcontact").removeClass("hidden");
            $("#econtact").css("border-color", "red");
            $("#invalidcontact").html(("<center><b>*can't be empty!</b></center>"));
         }
    });
    
     function E_BookingFrmTextFieldValidation(component, msg, txtVal)
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
       
        $("#"+msg).removeClass("hidden");
        $("#"+component).css("border-color","red");
        $("#" + msg).html(("<center><b>*"+emptymsg+"</b></center>"));
    }
}

//

function validate(){
    flag="true";
    var name=$("#ecname").val().trim();
    var vn=/^[a-zA-Z ]+$/;
    if(!vn.test(name)) flag="false";
    if($("#ecname").val().length===0) flag="false";
    
    var address=$("#eadr").val().trim();
    var va= /^[a-zA-Z\^[0-9-,-.-''-(-) ]+$/;
    if(!va.test(address)) flag="false";
    if($("#eadr").val().length===0) flag="false";
    
    var contact=$("#econtact").val().trim();
    var vc=/^[0-9 ]+$/;
    if(!vc.test(contact))flag="false";
    if($("#econtact").val().length===0)flag="false";
    if($("#econtact").val().length >10)flag="false";
    if($("#econtact").val().length <10)flag="false";
    
    if($("#eoccupancy").val()<1)flag="false";
    if($("#edays").val()<1)flag="false";
    
    
    var purpose=$('#epurpose').val();
    var vp=/^[a-zA-Z\^[0-9-,-.-'' ]+$/;
    if(!vp.test(purpose))flag="false";
    if($('#epurpose').val().length===0)flag="false";
    
    
    return flag;
}
      
 });
    



