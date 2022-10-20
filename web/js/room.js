/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

  $(document).ready(function(){
      
      $('#newroom').click(function(){
          loadPage("newroom.jsp");
      });
      
     $('#rback').click(function(){
         loadPage('room-list.jsp');
         $('#ResMsg').addClass("hidden");
      });
       
      
      $('#roombtn').click(function(){
         $("#myWaitingModal").modal('show'); 
         document.getElementById("roomfrm").removeAttribute("action");
         document.getElementById("roomfrm").setAttribute("action", "./RoomServlet");
     var form = $('#roomfrm');
     $.ajax({
        type: form.attr('method'),
        url: form.attr('action'),
        data: form.serialize(),
        success: function (data) {
        
           $("#myWaitingModal").modal('hide');
                           if(data.match("Room has been successfully created."))
                            {
                              
                            $('#ResMsg').removeClass("hidden");
                             $('#ResMsg').removeClass("alert-warning");
                            $('#ResMsg').addClass("alert-success");
                            $('#ResMsg').text(data);
                            refreshCurrentPage('newroom.jsp');
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
      });
  });
