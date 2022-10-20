$(document).ready(function(){
    
    $('#username').keyup(function(){
        $('#ResMsg').addClass("hidden");
    });
    
    $('#Login_Submit').click(function(){
      
        var username=$('#username').val().trim();
        var password=$('#userpassword').val().trim();
        if(username.length>0 && password.length>0){
          document.getElementById("loginForm").removeAttribute("action");
          document.getElementById("loginForm").setAttribute("action", "./loginServlet");
          document.getElementById("loginForm").submit();
        }else{
             $('#ResMsg').removeClass("hidden");
             $('#ResMsg').text('please specify username/password!');
        }
    


   });
 });