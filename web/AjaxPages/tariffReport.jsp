<%-- 
    Document   : TariffReport
    Created on : 8 Sep, 2020, 2:51:08 PM
    Author     : HP
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room-Tariff Report </title>
  <script src="js/tariffReport.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container" style="width: 98%">
            <div class="row " style="background-color: #cccccc;height: 62px;">
                
                <div class="form-group col-sm-2">
                    <label style="color:white"><b>Room-Type</b></label>
                            <div>
                                <select class="form-control input-sm" id="roomtype" name="roomtype">
                                <option value="-1">-Select RoomType-</option>
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
                    
               </div>
                <div class="form-group col-sm-2">
                    <label style="color:white"><b>Bed-Type</b></label>
                            <div><select class="form-control input-sm" id="bedtype" name="bedtype">
                        <option value="-1">-Select Bedtype-</option>
                        <option value="Single">Single</option>
                        <option value="Double">Double</option>
                        </select></div>
                </div>
                
                 <div class="form-group col-sm-2">
                    <label style="color:white"><b>Tariff criteria</b></label>
                       <div><select class="form-control input-sm" id="tcriteria" name="tcriteria">
                        <option value="-1">--Select--</option>
                        <option value="LT">Less Than</option>
                        <option value="MT">More Than</option>
                        <option value="EQ">Equals</option>
                        <option value="LE">Less Than Equals</option>
                        <option value="ME">More Than Equals</option>
                        </select></div>
                </div>
            
                <div class="form-group col-sm-2">
                    <label style="color:white"><b>Price</b></label>
                    <div><input type="text" id="rtariff" name="rtariff" class="form-control input-sm" autocomplete="off" readonly> </div>
                    <h6 id="tariffcheck">Select criteria to enter price</h6>
                </div>
                    
               <div class="form-group col-sm-2">
                    <label style="color:white"><b>Occupancy</b></label>
                      <div><select class="form-control input-sm" id="roccupancy" name="roccupancy">
                        <option value="-1">--select--</option>
                        <option value="vaccant">Vaccant</option>
                        <option value="occupied">Occupied</option>
                      </select></div>
                </div>
                 
                <div class="form-group col-sm-2">
                    <input type="button" id="check" name="check" value="Check" onclick="reportLoadPage('Report-list.jsp')" class="btn-primary input-sm" style="width:65%;font-size:14xp;margin-top:25px;margin-right:17px;height:30px;background-color:#05ae0e;color: white;border-radius:3px;"/>
                </div>
                               
                 <div class="row" id="reportdiv" style=""> </div>
                <div id="show_image" class="row text-center" style="margin-top: 5%;margin-right: 17% "> </div>
             
             </div>
        </div>
    </body>
</html>
