<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <script src="js/cancel.js" type="text/javascript"></script>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="container" style="width: 100%">
            <div class="container-fluid">
                <form id="cancelfrm" method="post">
                     <%
                    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
	            Date date = new Date();
	
                %>
                <div class="row ">
                <div class="form-group col-sm-4">
                    <label><b>Booking No.</b></label>
                    <div><input type="text" id="bookingno" name="bookingno" class="form-control input-sm" autocomplete="off"> </div>
                </div>
                <div class="form-group col-sm-4">
                    <label for="date">Date</label>
                         <div class="input-group">
                             <div class="input-group-addon">
                                 <i class="fa fa-calendar" style="font-size:20px"></i> 
                             </div>
                             <input type="text" class="form-control" id="date" name="date" readonly value="<%=formatter.format(date)%>" style="width:50%;height: 36px">
                         </div>
                </div>
            </div>
                     <div class="row ">
                <div class="form-group col-sm-4">
                    <label><b>Room No.</b></label>
                    <div><input type="text" id="rno" name="rno" class="form-control input-sm" readonly></div>
                    <center> <h5 class="hidden" id="invalidmsg" style="color:red;margin-bottom:-16px;margin-top:1px;"></h5></center>
                </div>
                
            </div>
                   
                <div class="row ">
                <div class="form-group col-sm-4">
                    <label><b>Reason</b></label>
                    <div><input type="text" id="reason" name="reason" class="form-control input-sm"></div>
                </div>
                
            </div>
                
                <div class="row ">
               <div class="form-group col-sm-4">
                <input type="button" id="bookingbtn" name="bookingbtn"  value="Submit" style="width:100px;font-size:16px;margin-left: 20px; height: 40px;background-color:lightseagreen; color: white" >
                <input type="button" id="cancelbookingbtn" name="cancelbookingbtn"  value="Cancel" style="width:100px;font-size:16px;margin-left: 10px; height: 40px;background-color:#e11515; color: white" >
                </div>
                
            </div>
                </form>
            </div>
        </div>
    </body>
</html>
