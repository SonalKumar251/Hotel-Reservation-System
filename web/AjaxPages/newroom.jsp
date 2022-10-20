<%-- 
    Document   : newroom
    Created on : 13 Aug, 2020, 12:45:34 PM
    Author     : Sonal
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <script src="js/room.js" type="text/javascript"></script>
         
    </head>
    <body>
        <div class="container" style="width: 100%; ">
            <div class="container-fluid" >
                <button type="button" id="rback" name="rback" class="btn btn-info btn-sm" style="margin-bottom: 20px"><span class="glyphicon glyphicon-chevron-left"></span> Back</button>
                <form id="roomfrm" method="post">
              <%
                  String column_name="room_no";
                  String table_name="room_master";
                  String ctype="R-0";
              String rn=hrs.HRSManager.getCount(column_name,table_name,ctype);
              %>
             <div class="row ">
                <div class="form-group col-lg-4">
                    <label><b>Room No</b></label>
                    <div><input type="text" id="rno" name="rno" value="<%=rn%>" class="form-control input-sm" readonly> </div>
                </div>
                </div>
            <div class="row ">
                <div class="form-group col-lg-4">
                    <label><b>Room-Type</b></label>
                            <div><select class="form-control input-sm" id="roomtype" name="roomtype">
                                <option value="-1">Select Room-Type</option>
                                                <% 
                                              Map map=hrs.HRSManager.getRoomtypePairList();
                                             Set set=map.entrySet();     
                                            Iterator itr=set.iterator();  
                                            while(itr.hasNext()){  
                                                    Map.Entry entry=(Map.Entry)itr.next();  %>
                                                    <option value="<%=entry.getValue() %>"><%=entry.getValue() %></option>
                                                 <%   }  

                                                        %>
                        </select></div>
                    
                    
                </div>
                
            </div>
              <div class="row ">
                <div class="form-group col-lg-4">
                    <label><b>Bed-Type</b></label>
                            <div><select class="form-control input-sm" id="bedtype" name="bedtype">
                        <option value="-1">-Select Bedtype-</option>
                        <option value="Single">Single</option>
                        <option value="Double">Double</option>
                        </select></div>
                </div>
                
            </div>
              
                
                <div class="row ">
                <div class="col-lg-4">
                    <div><input type="button" id="roombtn" name="roombtn" value="Submit" class="btn-primary input-sm"></div>
                </div>
                
            </div>
                </form>
            </div>
        </div>
                        
    </body>
</html>


