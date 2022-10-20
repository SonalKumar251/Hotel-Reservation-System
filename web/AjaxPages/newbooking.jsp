<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
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
          <script>
              $('#cancelbtn').click(function(){
                   changeheading('Booking List');
                   loadPage('booking-list.jsp');
                   $('#ResMsg').addClass("hidden");
              });
          </script>
          <script src="js/roombooking.js" type="text/javascript"> </script>
    </head>
    <body>
        <div class="container " style=" margin-top: 10px;background-color: #f2f2f2;border: 1px solid lightgrey;border-radius: 3px;width:90%">
           
            <form id="bookingfrm" method="post" style="width:100%; margin-top:15px;" >
                
                 <div class="form-row">
                    <div class="form-group col-sm-6">
                       <label for="cname">Customer name</label>
                       <input type="text" class="form-control" id="cname" name="cname" placeholder="Customer name">
                       <h5 class="hidden invalidmsg" id="invalidname"></h5>
                    </div>
                    <div class="form-group col-sm-6">
                       <label for="adr">Address</label>
                       <input type="text" class="form-control" id="adr" name="adr" placeholder="Address">
                       <h5 class="hidden invalidmsg" id="invalidaddress"></h5>
                    </div>
                    <div class="form-group col-sm-4">
                           <label for="roomtype">Room Type</label>
                          <select class="form-control input-sm" id="roomtype" name="roomtype">
                              <option value="-1" >-Select RoomType-</option>
                                                <% 
                                              Map map=hrs.HRSManager.getRoomtypePairList();
                                             Set set=map.entrySet();
                                            Iterator itr=set.iterator();  
                                            while(itr.hasNext()){  
                                                    Map.Entry entry=(Map.Entry)itr.next();  %>
                                                    <option value="<%=entry.getValue() %>"><%=entry.getValue() %></option>
                                                 <%   }  

                                                        %>
                        </select>
                    </div>
                    <div class="form-group col-sm-4">
                           <label for="bedtype">Bed Type</label>
                           <select class="form-control input-sm" id="bedtype" name="bedtype">
                               <option value="-1" >-Select Bedtype-</option>
                               <option value="Single">Single</option>
                               <option value="Double">Double</option>
                        </select>                   
                    </div>
                    <div class="form-group col-sm-4">
                         <label for="inputZip">Room no</label>
                         <input type="text" class="form-control" id="rno" name="rno" readonly>
                         <h5 class="hidden invalidmsg" id="invalidroom"></h5>
                    </div>
                        
                    <div class="form-group col-sm-4">
                          <label for="contact">Contact no</label>
                          <input type="text" class="form-control" id="contact" name="contact">
                          <h5 class="hidden invalidmsg" id="invalidcontact"></h5>
                    </div>
                     <div class="form-group col-sm-4">
                          <label for="occupancy">Occupancy</label>
                          <input type="number" MIN="0" MAX="10" STEP="1" VALUE="1" class="form-control cbdr" id="occupancy" name="occupancy">
                          <h5 class="hidden invalidmsg" id="invalidocc"></h5>
                    </div>
                     <div class="form-group col-sm-4">
                          <label for="days">Days</label>
                          <input type="number" MIN="0" MAX="10" STEP="1" VALUE="1" class="form-control cdbr" id="days" name="days">
                          <h5 class="hidden invalidmsg" id="invaliddays"></h5>
                    </div>
                 <div class=" form-group col-sm-4">
                     <label for="g1">Gender&nbsp;&nbsp;&nbsp;</label><br>
                     <input class="form-check-input" type="radio" name="gender" id="g1" value="M" checked>
                      <label class="form-check-label" for="exampleRadios1">Male</label>
                     <input class="form-check-input" type="radio" name="gender" id="g2" value="F">
                     <label class="form-check-label" for="exampleRadios2">Female</label>
                     <h5 class="hidden invalidmsg" id="invalidgender"></h5>
                 </div>
                     <div class=" form-group col-sm-4">
                     <label for="n1">Nationality&nbsp;&nbsp;&nbsp;</label><br>
                     <input class="form-check-input" type="radio" name="nationality" id="n1" value="Indian" checked>
                      <label class="form-check-label" for="exampleRadios1">Indian</label>
                     <input class="form-check-input" type="radio" name="nationality" id="n2" value="Other">
                     <label class="form-check-label" for="exampleRadios2">Other</label>
                     <h5 class="hidden invalidmsg" id="invalidnat"></h5>
                 </div>
                     </div>
                     <div class=" form-group col-sm-4">
                     <label for="s1">Status&nbsp;&nbsp;&nbsp;</label><br>
                     <input class="form-check-input" type="radio" name="Status" id="s1" value="Present" checked>
                      <label class="form-check-label" for="exampleRadios1">Present</label>
                     <input class="form-check-input" type="radio" name="Status" id="s2" value="Absent">
                     <label class="form-check-label" for="exampleRadios2">Absent</label>
                     <h5 class="hidden invalidmsg" id="invalidstatus"></h5>
                 </div>
                  
                        <div class="form-group col-sm-4" style="">
                          <label for="date"><i class='fa fa-calender'></i> Date</label><br>
                          <input type="date" id="date" class="date" name="date" style="width:70%;height: 36px" value="">
                          <h5 class="hidden " id="invaliddate" style="color:red;margin-bottom: -25px"></h5>
                    </div>
                    <div class="form-group col-sm-6">
                       <label for="purpose">Purpose</label>
                       <input type="text" class="form-control" id="purpose" name="purpose" placeholder="Purpose"><br>
                       <h5 class="hidden" id="invalidpurpose" style="margin-top:-10px; color:red" ></h5>
                    </div>
                <div class="form-group col-sm-8">
                <input type="button" id="bookingbtn" name="bookingbtn"  value="Submit" style="width:20%;font-size:16px;margin-left: 20px; height: 40px;background-color:lightseagreen; color: white" >
                <input type="button" id="cancelbtn" name="cancelbtn"  value="Cancel" style="width:20%;font-size:16px;margin-left: 10px; height: 40px;background-color:#e11515; color: white" >
                </div>
            </form>
                
        </div>
        
    </body>
</html>