var flag=true;
function invalidRoom(){
                    $('#ResMsg').addClass("hidden");
                    $('#invalidmsg').removeClass("hidden");
                    $('#invalidmsg').html("<b>*Enter a valid booking no.</b>");
                     $('#bookingno').css({"border-color":"red"});
                      $('#rno').css({"border-color":"red"});
                      $('#rno').val("");
                      flag=false;
                    
}
function invalid(val){
     $('#ResMsg').removeClass("hidden");
    $('#ResMsg').removeClass("alert-success");
    $('#ResMsg').addClass("alert-warning");
    $('#ResMsg').text(val);
    flag=false;
}
function valid(val){
    $('#ResMsg').addClass("hidden");
    $('#rno').val(val);
    $('#invalidmsg').addClass("hidden");
    $('#bookingno').css({"border-color":"grey"});
    $('#rno').css({"border-color":"grey"});
    flag=true;
}
$(document).ready(function(){
     $('#bookingno').keyup(function(){
         var bno=$('#bookingno').val();
          $.get('cancelServlet?bookingno='+bno,"action=fetchDetail",function(response){
            if(bno.length>"4"){
                if(response.match(null))invalidRoom();
                else if(response.match("This Booking is already cancelled.")||response.match("This Booking is Checked-out."))
                invalid(response);
                else valid(response);
            }
            else invalidRoom();
        });
     });
    $('#bookingbtn').click(function ()
    {
        if(flag===true){
     $("#myWaitingModal").modal('show');
     document.getElementById("cancelfrm").removeAttribute("action");
     document.getElementById("cancelfrm").setAttribute("action","./cancelServlet?action=cancelRoom");
     var form = $('#cancelfrm');
     $.ajax({
        type: form.attr('method'),
        url: form.attr('action'),
        data: form.serialize(),
        success: function (data)
        {
        
           $("#myWaitingModal").modal('hide');
                           if(data.match("Room has been successfully Cancelled."))
                            {
                                
                             $('#ResMsg').removeClass("hidden");
                             $('#ResMsg').removeClass("alert-warning");
                             $('#ResMsg').addClass("alert-success");
                             $('#ResMsg').text(data);
                              refreshCurrentPage('newcancellation.jsp');
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
    }
    else invalid("please fill properly");
    });  
    $('#cancelbookingbtn').click(function(){
        $('#ResMsg').addClass("hidden");
         loadPage('cancel-list.jsp'); 
      });
});
