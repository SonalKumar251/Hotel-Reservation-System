

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HRS | HomePage</title>
        <meta name="theme-color" content="#4B77BE" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="jquery/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="table/table.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
        <link rel="stylesheet" type="text/css" href="table/table.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">

        
        
        <link  href="bootstrap-3.7/css/bootstrap.min.css" rel="stylesheet">

        <script src="bootstrap-3.7/js/bootstrap.min.js"></script>
        <link  href="css/Homepage.css" rel="stylesheet">
        <script src="js/AjaxPageLoad.js" type="text/javascript"></script>
         
                <script>

           

            $(document).ready(function (e)
            {

                   $("#ChangePassword").click(function () {

                    window.open("ChangePassword.jsp", "_blank");

                });
                
                $("#LogOut").click(function () {


                    $.get('./AjaxPages/logout.jsp', function (response)
                    {


                      //  location.href = "./";

                    });

                });

            });


            function changeheading(headingname)
            {
                var element = document.getElementById("heading");
                element.innerHTML = headingname;

            }

            var flag = true;
            var y = 0;
            function ShowSideBar()
            {

                var x = screen.width;

                y = parseInt(x) - parseInt(250);


                if (flag.toString() == 'false')
                {
                    
                     openNav();

                    flag = true;
                } else

                {


                    closeNav();
                    flag = false;
                }

            }


            function openNav() {


                document.getElementById("mySidenav").style.width = "250px";
                document.getElementById("main").style.marginLeft = "250px";
                document.getElementById("pagebar").style.width = y + "px";
                document.body.style.backgroundColor = "white";



            }

            function closeNav()
            {

                document.getElementById("mySidenav").style.width = "0";
                document.getElementById("main").style.marginLeft = "0";
                document.getElementById("pagebar").style.width = "100%";
                document.body.style.backgroundColor = "white";


            }

        </script>
    </head>
    <body  >

        <%
            String user_id = null;
            try {
                user_id =(String) request.getSession().getAttribute("username");

                if (user_id == null) {
                    response.sendRedirect(request.getContextPath());
                }


        %>    
        <input type="hidden" id="UserId" value="<%=user_id%>"/>
        <div id="mySidenav" class="sidenav">
            <div class="row" >
                <a href="#"><img class="pull-left" alt="Brand" src="img/logo1-hrs.PNG" style="width: 40px; height: 35px; margin-top: 3px;margin-left:-30px"/>&nbsp;&nbsp&nbsp<span style="position: absolute;font-size: 16px;top: 19px">HRS&nbsp;Menu</span></a>
            </div>
            <div class="row" style="height: 40px"></div>
            <a  id="tariff"  class="list-group-item small"  onclick="changeheading('Tariff List');loadPage('tariff-list.jsp')" style="cursor: pointer;color: black"><b>Tariff</b></a>
            <a  id="room"  class="list-group-item small"  onclick="changeheading('Room List');loadPage('room-list.jsp')" style="cursor: pointer;color: black"><b>Room</b></a>
            <a id="booking" class="list-group-item small"  onclick="changeheading('Booking List');loadPage('booking-list.jsp')" style="cursor: pointer;color: black"><b> Book Room</b></a>
            <a id="transfer" class="list-group-item small"  onclick="changeheading('Transfered Room');loadPage('transfer-list.jsp')" style="cursor: pointer;color: black"> <b>Transfer Room</b></a>
            <a id="cancel" class="list-group-item small"  onclick="changeheading('Cancel List');loadPage('cancel-list.jsp')" style="cursor: pointer;color: black"><b>Cancel Room</b></a>
            <a id="billing" class="list-group-item small"  onclick="changeheading('Billing List');loadPage('billing-list.jsp')" style="cursor: pointer;color: black"><b>Room Billing</b></a>
            <a id="billing" class="list-group-item small"  onclick="changeheading('Tariff-Room Report');loadPage('tariffReport.jsp')" style="cursor: pointer;color: black"><b>Room-Tariff Report</b></a>
            <div class="row" style="border-bottom: 1px solid menu"></div>

        </div>

        <div id="main" style="margin-left: 250px;">

            <nav class="navbar navbar-inverse"  id="pagebar" style="background:#4B77BE; position: fixed;z-index: 9999;border: none;border-radius: 0px;transition: width .5s;width: 81.7%">
                <div class="container-fluid">
                    <div class="navbar-header">

                        <a class="navbar-brand" href="#"><span style="font-size:20px;cursor:pointer;" id="showbutton" class="" onclick="ShowSideBar()">&#9776;</span><span id="closebutton" onclick="ShowSideBar()" class="hidden" style="font-size: 30px; margin-top: 12px"><div style=" margin-top:5px;float: left;">&times;</div></span>&nbsp;&nbsp;&nbsp;<span id="heading" style="letter-spacing: 0px;font-size: 16px">HOME</span></a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">

                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a style="color: white" href="#"><span style="font-size: 12pt;letter-spacing: 0px;margin-top: 10px">Hello,<%=user_id%></span></a></li>
                            <li ><a style="color: white" href="#"><span style="font-size: 17pt;" class=" glyphicon glyphicon-bell"><span  style="font-size:7pt;background: red;margin-top: -20px" id="order" class="badge"></span></a></li>
                            <li class="dropdown">
                                <img src="getUserImage.jsp?oid=<%=user_id%>" data-toggle="dropdown" class=" dropdown-toggle center-block img-circle img-responsive" style="margin-top: 0px" onerror="this.src='img/profile.png'" height="40" width="40"/>
                                <ul class="dropdown-menu"  >
                                    <li ><a style="letter-spacing: 0px" id="MyProfile" href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;My profile</a></li>
                                    <li><a style="letter-spacing: 0px;margin-top: 6px;" id="ChangePassword" href="#"><span class="glyphicon  glyphicon-cog "></span>&nbsp;&nbsp;&nbsp;Change Password</a></li>

                                    <li><a style="letter-spacing: 0px;margin-top: 12px" id="LogOut" href="#"><button style="margin-left: 34pt" type="button" class="btn btn-primary btn-xs">Logout</button></a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
                                <div class="container-fluid">
                <div id="ResMsg" class="text-center  hidden " style="margin-top: 50px;margin-bottom: -30px"></div>
                <div class="row" id="workingWindow" style="margin-top: 60px;">
                </div>

                    <div id="show_image" class="row text-center" style="margin-top: 5%; ">

                    </div>
                
                
                <div class="modal fade" id="myWaitingModal" role="dialog" data-keyboard="false" data-backdrop="static">
                <div class="modal-dialog modal-sm">
                   <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">
                           <div id="processing" class="row center-block" style='height:100px;width:100px;background:url("./img/processing.gif");background-repeat: no-repeat; background-size:100% 100%;'></div>
                        </div>
                       
                    </div>

                </div>

            </div>
                
                 </div>
 </div>
            

       
        <%
            } catch (Exception ex) {
            }
        %>
    </body>
</html>
