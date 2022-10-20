/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var flag="true";
function invalidRoom(){
                    $('#ResMsg').addClass("hidden");
                    $('#invalidmsg').removeClass("hidden");
                    $('#invalidmsg').html("<b>*Enter a valid booking no.</b>");
                    $('#bookingno').css({"border-color":"red"});
                    $('#days').val("");
                    $('#amt').val("");
                    $('#cname').val(""); 
                     flag="false";                   
}
function invalid(val){
     $('#ResMsg').removeClass("hidden");
    $('#ResMsg').removeClass("alert-success");
    $('#ResMsg').addClass("alert-warning");
    $('#ResMsg').text(val);
    $('#days').val("");
    $('#amt').val("");
    $('#cname').val("");   
    flag="false";
}
function valid(val){
    $('#ResMsg').addClass("hidden");
    $('#invalidmsg').addClass("hidden");   
    flag="true";
}

$(document).ready(function(){
    
    
   
    $('#bbn').keyup(function(){
       var days;
       var bn=$('#bbn').val();
       
       $.get('BillingServlet?bn='+bn,"action=status",function(res){
          
         if(bn.length>"4"){
               
            if(res.match("Cancelled"))invalid("Booking already cancelled!");
              
            else if(res.match("checked-out"))invalid("Booking already checked-out!")
          
            else{ 
                valid();
                
          $.get('BillingServlet?bn='+bn,"action=days",function(response){
           
          if(response.match("null")){
            $('#days').val("") ;
          }else {
           $('#days').val(response);
            days=response;
          }
          });
       
         $.get('BillingServlet?bn='+bn,"action=amount",function(response){
          if(response.match("null")){
            $('#amt').val("") ;
          }else{
          var amount=response*days;
           $('#amt').val(amount);
          }
           });
           
         $.get('BillingServlet?bn='+bn,"action=name",function(response){
          if(response.match("null")){
            $('#cname').val("") ;
          }else
           $('#cname').val(response);
       });
       
          }
        }else {
          invalidRoom();
          
      }
      
           if($('#bbn').val().length < 5){
      
        $("#invalidbbn").removeClass("hidden");
        $("#bbn").css("border-color","red");
        $("#invalidbbn").html(("<center><b>*Booking unavailable!</b></center>"));
      }
      
  });
       
      
       
        
   });
   //to set card_number read only
    $('input[name="ptype"]').change(function(){
        if($('#pt2').prop('checked')){
            $('#card').attr('readonly', false);
        }else{
            $('#card').attr('readonly', true);
            $('#card').val("");
            $('#invalidcard').addClass("hidden");
            $('#card').css('border-color','lightgrey');
        }
    });
   //to get current date
             var d = new Date();
              var month = (d.getMonth() + 1);               
              var day = d.getDate();
              if (month < 10) 
                 month = "0" + month;
              if (day < 10) 
                 day = "0" + day;
              var today =  day+'-'+month+'-'+d.getFullYear();
                 $('#bdate').val(today);
                 
    //to validate all the fields.
    $('#bbn').keyup(function(){
        BillingValidation("bbn","invalidbbn","booking_num");
    });
    
     $('#cname').keyup(function(){
        BillingValidation("cname","invalidcname","bill_to");
    });
    
     $('#remarks').keyup(function(){
        BillingValidation("remarks","invalidremarks","remarks");
    });
    
     $('#card').keyup(function(){
        BillingValidation("card","invalidcard","card_no");
    });
    
    $('#card').blur(function ()
    {
       
        if ($('#card').val().length > 16 )
        {
            $("#invalidcard").removeClass("hidden");
            $("#card").css("border-color", "red");
            $("#invalidcard").html(("<center><b>*can't be more than 16 digits!</b></center>"));
        }
         if ($('#card').val().length < 16 )
        {
           $("#invalidcard").removeClass("hidden");
            $("#card").css("border-color", "red");
            $("#invalidcard").html(("<center><b>*can't be less than 16 digits!</b></center>"));
        }
         if ($('#card').val().length === 0 )
        {
            $("#invalidcard").removeClass("hidden");
            $("#card").css("border-color", "red");
            $("#invalidcard").html(("<center><b>*can't be empty!</b></center>"));
         }
    });
    
    
   
     function BillingValidation(component, msg, txtVal)
       {
        if (txtVal === "booking_num"){
           var re = /^[0-9-B ]+$/;
           var emptymsg="field can't be empty!";
       }
        if (txtVal === "bill_to"){
           var re = /^[a-zA-Z ]+$/;
           var emptymsg="name can't be empty!";
       }
        if (txtVal === "remarks"){
           var re = /^[a-zA-Z\^[0-9-,-.-''-(-) ]+$/;
           var emptymsg="please provide remarks!";
       }
        if (txtVal === "card_no"){
           var re = /^[0-9 ]+$/;
           var emptymsg="field can't be empty!";
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
              flag="false";
        }else flag="true";
        
        if (txtVal === "remarks")
        {
              $("#" + msg).html(("<center><b>*please dont use invalid characters!</b></center>"));
              flag="false";
        }else flag="true";
        
        if (txtVal === "bill_to")
        {
              $("#" + msg).html(("<center><b>*please use alphabets only!</b></center>"));
              flag="false";
        }else flag="true";
        
        if (txtVal === "card_no")
        {
              $("#" + msg).html(("<center><b>*please use numbers only!</b></center>"));
              flag="false"
        }flag="true";
       
       
    }
    if($("#"+component).val().length===0){       
        $("#"+msg).removeClass("hidden");
        $("#"+component).css("border-color","red");
        $("#" + msg).html(("<center><b>*"+emptymsg+"</b></center>"));
        flag="false";
    }else flag="true";
} 

$('#billingbtn').click(function(){
       if(validate()=="true"){
       
       $("#myWaitingModal").modal('show');  
       document.getElementById("billingfrm").removeAttribute("action");
       document.getElementById("billingfrm").setAttribute("action", "./BillingServlet?action=submit");
       var form = $('#billingfrm');
   
       $.ajax({
        type: form.attr('method'),
        url: form.attr('action'),
        data: form.serialize(),
        success: function (data) {
        
           $("#myWaitingModal").modal('hide');
                           if(data.match("Billing Sucessfull."))
                            {
                               $('#ResMsg').removeClass("hidden");
                               $('#ResMsg').removeClass("alert-warning");
                               $('#ResMsg').addClass("alert-success");
                               $('#ResMsg').text(data);
                            refreshCurrentPage('newbilling.jsp');
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
     
     function validate(){
   
    var name=$("#cname").val().trim();
    var vn=/^[a-zA-Z ]+$/;
    if(!vn.test(name)) flag="false";
    if($("#cname").val().length===0) flag="false";
    
    var remarks=$("#remarks").val().trim();
    var vr= /^[a-zA-Z\^[0-9-,-.-'' ]+$/;
    if(!vr.test(remarks)) flag="false";
    if($("#remarks").val().length===0) flag="false";
    
   if($("#days").val()<1)flag="false";
       
    
    return flag;
}
});
