<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="bean.RoomBooking"%>
<%!
List list=null;
%>
<html>
    <head>
        <title>Room Booking</title>
       
          <style>
              .form-group{
                  margin-top: 10px
              }
              .invalidmsg{
                  color: red;
                  margin-bottom:-25px;
              }
          </style>
          
          <script src="js/eroombooking.js" type="text/javascript"> </script>
          <script>
              $('#eback').click(function(){
                   changeheading('Booking List');
                   loadPage("booking-list.jsp");
                   $('#ResMsg').addClass("hidden");
              });
          </script>

    </head>
    <body>
        <%
            try
            {
                String bn=request.getParameter("bn");
                list=hrs.HRSManager.getBookingDetails(bn);
                if(list.size()>0)
                {
                RoomBooking ob=(RoomBooking)list.get(0);
                
            %>
        <button type="button" id="eback" name="eback" class="btn btn-info btn-sm" style="margin-bottom: 10px;margin-left: 55px"><span class="glyphicon glyphicon-chevron-left"></span> Back</button>
        <div class="container "  style=" margin-top: 10px;background-color: #f2f2f2;border: 1px solid lightgrey;border-radius: 3px;width:90%">
           
            <form id="ebookingfrm" method="post" style="width:100%; margin-top:15px;">
                <input type="hidden" id="bno" name="bno" value="<%=ob.getBooking_no()%>">
                 <div class="form-row">
                    <div class="form-group col-sm-6">
                       <label for="ecname">Customer name</label>
                       <input type="text" class="form-control" id="ecname" name="ecname" value="<%=ob.getCust_name()%>" >
                       <h5 class="hidden invalidmsg" id="invalidname"></h5>
                    </div>
                    <div class="form-group col-sm-6">
                       <label for="eadr">Address</label>
                       <input type="text" class="form-control" id="eadr" name="eadr" value="<%=ob.getAddress()%>">
                       <h5 class="hidden invalidmsg" id="invalidaddress"></h5>
                    </div>
                    <div class="form-group col-sm-4">
                          <label for="econtact">Contact no</label>
                          <input type="text" class="form-control" id="econtact" name="econtact" value="<%=ob.getContact_no()%>">
                          <h5 class="hidden invalidmsg" id="invalidcontact"></h5>
                    </div>
                     
                     <div class="form-group col-sm-4">
                          <label for="eoccupancy">Occupancy</label>
                          <input type="number" MIN="0" MAX="10" STEP="1" value="<%=ob.getOccupancy()%>" class="form-control" id="eoccupancy" name="eoccupancy" >
                          <h5 class="hidden invalidmsg" id="invalidocc"></h5>
                    </div>
                     <div class="form-group col-sm-4">
                          <label for="edays">Days</label>
                          <input type="number" MIN="0" MAX="10" STEP="1" VALUE="<%=ob.getDays()%>" class="form-control" id="edays" name="edays">
                          <h5 class="hidden invalidmsg" id="invaliddays"></h5>
                    </div>
                
                     <%
                     if(ob.getGender().equalsIgnoreCase("M")){
                     %>
                      <div class=" form-group col-sm-4">
                     <label for="eg1">Gender&nbsp;&nbsp;&nbsp;</label><br>
                     <input class="form-check-input" type="radio" name="egender" id="eg1" value="M" checked>
                      <label class="form-check-label" for="exampleRadios1">Male</label>
                     <input class="form-check-input" type="radio" name="egender" id="eg2" value="F">
                     <label class="form-check-label" for="exampleRadios2">Female</label>
                     <h5 class="hidden invalidmsg" id="invalidgender"></h5>
                      </div>
                     <%
                     }
                     else{
                     %>
                     <div class=" form-group col-sm-4">
                      <label for="eg1">Gender&nbsp;&nbsp;&nbsp;</label><br>
                     <input class="form-check-input" type="radio" name="egender" id="eg1" value="M" >
                      <label class="form-check-label" for="exampleRadios1">Male</label>
                     <input class="form-check-input" type="radio" name="egender" id="eg2" value="F" checked>
                     <label class="form-check-label" for="exampleRadios2">Female</label>
                     <h5 class="hidden invalidmsg" id="invalidgender"></h5>
                      </div>
                     <%
                        }
                     
                     if(ob.getNationality().equalsIgnoreCase("Indian")){
                     %>
                     <div class=" form-group col-sm-4">
                     <label for="en1">Nationality&nbsp;&nbsp;&nbsp;</label><br>
                     <input class="form-check-input" type="radio" name="enationality" id="en1" value="Indian" checked>
                      <label class="form-check-label" for="exampleRadios1">Indian</label>
                     <input class="form-check-input" type="radio" name="enationality" id="en2" value="Other">
                     <label class="form-check-label" for="exampleRadios2">Other</label>
                     <h5 class="hidden invalidmsg" id="invalidnat"></h5>
                     </div>
                     <%
                     }else{
                     %>
                     <div class=" form-group col-sm-4">
                     <label for="en1">Nationality&nbsp;&nbsp;&nbsp;</label><br>
                     <input class="form-check-input" type="radio" name="enationality" id="en1" value="Indian">
                      <label class="form-check-label" for="exampleRadios1">Indian</label>
                     <input class="form-check-input" type="radio" name="enationality" id="en2" value="Other" checked>
                     <label class="form-check-label" for="exampleRadios2">Other</label>
                     <h5 class="hidden invalidmsg" id="invalidnat"></h5>
                      </div>
                     <%
                         }
                     
                     if(ob.getStatus().equalsIgnoreCase("Present")){
                     %>
                      <div class=" form-group col-sm-4">
                     <label for="s1">Status&nbsp;&nbsp;&nbsp;</label><br>
                     <input class="form-check-input" type="radio" name="estatus" id="es1" value="Present" checked>
                      <label class="form-check-label" for="exampleRadios1">Present</label>
                     <input class="form-check-input" type="radio" name="estatus" id="es2" value="Absent">
                     <label class="form-check-label" for="exampleRadios2">Absent</label>
                     <h5 class="hidden invalidmsg" id="invalidstatus"></h5>
                      </div>
                     <%
                     }else{
                     %>
                     <div class=" form-group col-sm-4">
                     <label for="s1">Status&nbsp;&nbsp;&nbsp;</label><br>
                     <input class="form-check-input" type="radio" name="estatus" id="es1" value="Present">
                      <label class="form-check-label" for="exampleRadios1">Present</label>
                      <input class="form-check-input" type="radio" name="estatus" id="es2" value="Absent" checked>
                     <label class="form-check-label" for="exampleRadios2">Absent</label>
                     <h5 class="hidden invalidmsg" id="invalidstatus"></h5>
                     </div>
                     <%
                         }
                     %>
                    
                    
                     <div class="form-group col-sm-4">
                     <input type="button" id="ebookingbtn" name="ebookingbtn"  value="Update" style="width:50%;font-size:16px;margin-left: 20px;margin-top: 25px; height: 40px;background-color:orange; color: white;border-radius:3px" >
                     </div>
              
                    <div class="form-group col-sm-8">
                       <label for="purpose">Purpose</label>
                       <input type="text" class="form-control" id="epurpose" name="epurpose" value="<%=ob.getPurpose()%>"><br>
                       <h5 class="hidden" id="invalidpurpose" style="margin-top:-10px; color:red" ></h5>
                    </div>
                
            </form>
                
        </div>
        <%
              }  
            }catch(Exception e){}
         %>
    </body>
</html>