 

<html>
    <head>
        <% 
        new hrs.MConnection();
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="jquery/jquery-3.1.0.min.js"></script> <%-- for Navbar on mobile size--%>
      
        <link  href="bootstrap-3.7/css/bootstrap.min.css" rel="stylesheet">
     
        <script src="bootstrap-3.7/js/bootstrap.min.js"></script>
       
        <script src="js/login.js" type="text/javascript"> </script>
        <link  href="css/Homepage.css" rel="stylesheet">
        
        
       
        <style>
                        .navbar {
                            margin-bottom: 0;
                            background: menu;
                            z-index: 9999;
                            border: 0;
                            font-size: 12px !important;
                            line-height: 1.42857143 !important;
                            letter-spacing: 4px;
                            border-radius: 0;
                        }
            
                        .navbar li a, .navbar .navbar-brand {
                            color: black;
                        }
            
                        .navbar .navbar-brand:hover{
                            color: blue !important;
                        }
            
                        .navbar-nav .li .a:hover {
                            color: green !important;
                            background-color: menu!important;
                        }
            
                        .navbar-default .navbar-toggle {
                            border-color: transparent;
                            color: #fff !important;
                        }
                        p { margin:0 }

        </style>
        
        <title>HRS-Login</title>
    </head>
    <body>



        <nav class="navbar navbar-inverse navbar-fixed-top" style="background: menu">
            <div class="container-fluid">
                <div class="navbar-header">


                    <img class="pull-left" alt="Brand" src="img/hrs.png" style="width: 40px; height: 35px; margin-top: 6px;">  
                    <a style="margin-left: 2px;" class="navbar-brand" href="./"><span >HRS<strong style="color: #00ACE9;">.in</strong></span></a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        


                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid" style="">
            
            <div class="row text-center" style="margin-top: 50px">
                
                <%
                        String mno="";
                        try{
                            ServletContext sc=getServletContext();
                            String ouser=(String)sc.getAttribute("ouser");
                            
                            if(ouser!=null)mno=ouser;
                            
                            String omsg=(String)sc.getAttribute("omsg");
                            if(omsg!=null)
                            {
                            %>
                       
                            <div class="" id="ResMsg" style="margin-top:1px; color: white;background-color: #cc0000"><%=omsg%></div>                  
                        <%
                         }
                            
                           getServletContext().setAttribute("omsg","");
                      }catch(Exception e){}
                          %>
            </div>
            
            <div class="row" >
                <div class="col-lg-8 col-md-8 col-sm-8"  style="">
                      <div class="row visible-xs" style="height:20px"></div>
                    <div class="row hidden-xs" style="height:140px"></div>
                    <div class="row">
                        <img src="img/logo1-hrs.jpg" class="img-responsive center-block" style="margin-top:-20px; margin-left: 250px" width="400" height="200"/>
                         </div>
                    <div class="row text-center">
                        <p><b style="font-size:2.3em;">Hotel Reservation System</b></p>
                        <p><b style="font-size: 1.7em;">Book your rooms easily</b></p>
                    </div>        
                    <div class="row text-center">
                        
                    </div>        



                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">            

                    <div class="row hidden-xs" style="height: 90px"></div>
                    <div class="row">
                        <form id="loginForm"  method="post">
                        <div class="col-lg-12">
                            <div class="row" style="height: 10px"></div>
                            
                            <div class="row" style="height: 40px"></div>
                            <div class="well btn-flat" style="border: 1px solid black;border-radius: 10px;background: white">
                                <div class="row" style="height: 20px"></div>
                                <div class="row">
                                    <div class="col-lg-1"></div>
                                    <div class="col-lg-10">
                                        <b>UserName</b>
                                        <div class="input-group" style="margin-top: 5px;border: 1px solid black;" >
                                            <span class="input-group-addon"  style="border: none;border-radius: 0px;box-shadow: none;outline: none"><span class="glyphicon glyphicon-user"></span></span>
                                            <input type="text"  class="form-control" id="username" name="username" placeholder="Username"  style="border: none;border-radius: 0px;box-shadow: none; outline: none">
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="height: 20px"></div>
                                <div class="row">
                                    <div class="col-lg-1"></div>
                                    <div class="col-lg-10">
                                        <b>Password</b>

                                        <div class="input-group" style="margin-top: 5px;border: 1px solid black;" >
                                            <span class="input-group-addon"  style="border: none;border-radius: 0px;box-shadow: none;outline: none"><span class="glyphicon glyphicon glyphicon-lock"></span></span>
                                            <input type="password" class="form-control" placeholder="Enter Password" id="userpassword" name="userpassword" style="border: none;border-radius: 0px;box-shadow: none;outline: none">
                                        </div>
                                    </div>
                                </div>



                                <div class="row" style="height: 30px"></div>
                                <div class="row text-center">
                                    <div class="col-lg-1"></div>
                                    <div class="col-lg-10 text-center">
                                        <button type="button" id="Login_Submit" class="btn btn-info btn-flat btn-block" style="border: none;border-radius: 1px;box-shadow: none;outline: none" >Login</button>
                                    </div>
                                </div>

                                <div class="row text-center">
                                    <div class="col-lg-6"></div>
                                    <div class="col-lg-6">
                                        <button type="button"  class="btn btn-link ">Forget password</button>
                                    </div>
                                </div>
                            </div>
                        </div> 
                                </form>
                    </div>
                </div>
            </div>
            <div class="row hidden-xs" style="height:120px"></div>
            <div class="row text-center" style="margin-top: -15px">
               Copyright @ 2019 Hotel Reservation System. All Rights Reserved. Design & Developed By Jaminto Infotech (P) Limited.

            </div>



        </div>



  
</body>
</html>
