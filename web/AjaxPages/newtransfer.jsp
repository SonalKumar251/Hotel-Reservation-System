<%-- 
    Document   : newtransfer
    Created on : 22 Aug, 2020, 11:17:53 PM
    Author     : Sonal kumar singh
--%>

<%@page import="java.util.List"%>
<%@page import="bean.RoomBooking"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>

<html>
    <head>
        <title>Room Transfer</title>
       
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
              $('#tback').click(function(){
                   changeheading('Transfered Room');
                   loadPage('transfer-list.jsp');
                   $('#ResMsg').addClass("hidden");
              });
               
              $(document).ready( function() {
              var d = new Date();
              var month = (d.getMonth() + 1);               
              var day = d.getDate();
              if (month < 10) 
                 month = "0" + month;
              if (day < 10) 
                 day = "0" + day;
              var today = d.getFullYear() + '-' + month + '-' + day;
                 $('#tdate').val(today);
             });
             
            
          </script>
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
          <script src="js/transfer.js" type="text/javascript"> </script>
    </head>
    <body>
        <button type="button" id="tback" name="tback" class="btn btn-info btn-sm" style="margin-top: 5px;margin-left: 195px"><span class="glyphicon glyphicon-chevron-left"></span> Back</button>
        
        
        <div class="container " style=" margin-top: 15px;background-color: #f2f2f2;border: 1px solid lightgrey;border-radius: 3px;width:65%">
           
            <form id="transferfrm" method="post" style="width:100%; margin-top:15px;" >
                <input type="hidden" id="chk" name="chk" value="transfer">
                 <div class="form-row">
                    <div class="form-group col-sm-6">
                       <label for="bn">Booking no</label>
                       <input type="text" class="form-control" id="bn" name="bn" value="B-0" autocomplete="off">
                       <h5 class="hidden invalidmsg" id="invalidbn"></h5>
                    </div>
                     
                    <div class="form-group col-sm-6">
                       <label for="rn">Current Room</label>
                       <input type="text" class="form-control" id="rn" name="rn" readonly>
                       <h5 class="hidden invalidmsg" id="invalidrn"></h5>
                    </div>
                     
                      <div class="form-group col-sm-6">
                           <label for="troomtype">Room Type</label>
                          <select class="form-control input-sm" id="troomtype" name="troomtype">
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
                        
                     <div class="form-group col-sm-6">
                           <label for="tbedtype">Bed Type</label>
                           <select class="form-control input-sm" id="tbedtype" name="tbedtype">
                               <option value="-1" >-Select Bedtype-</option>
                               <option value="Single">Single</option>
                               <option value="Double">Double</option>
                        </select>                   
                    </div>
                        
                     <div class="form-group col-sm-6">
                       <label for="nrn">New Room no</label>
                       <input type="text"  class="form-control" id="nrn" name="nrn" readonly>
                       <h5 class="hidden invalidmsg" id="invalidnrn"></h5>
                    </div>  
                    
                         <div class="form-group col-sm-6">
                       <label for="bdate">Date</label>
                       <div class="input-group">
                           <div class="input-group-addon">
                               <i class="fa fa-calendar" style="font-size:20px"></i>
                           </div>
                       <input type="text" class="form-control" id="tdate" name="tdate" readonly>
                       <h5 class="hidden " id="invalidtdate" style="color:red;margin-bottom: -25px"></h5>
                       </div>
                    </div>
                          
                    
                         <div class="form-group col-sm-6">
                             <input type="button" id="transferbtn" name="transferbtn"  value="Update" style="width:45%;font-size:16px;margin-left: 60px;margin-top: 33px; height: 40px;background-color:#ff9900; color: white;border-radius:3px" >
                     </div>
                        
                         <div class="form-group col-sm-6">
                       <label for="reason">Reason</label>
                       <textarea class="form-control" rows="2" id="reason" name="reason" style="resize:none"  placeholder="Reason for Transfer.."></textarea>
                       <h5 class="hidden" id="invalidreason" style="margin-top:5px; color:red" ></h5>
                    </div>
                 </div>
            </form>
                       
        </div>
    </body>
</html>
