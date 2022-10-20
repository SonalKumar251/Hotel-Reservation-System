<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="js/tariff.js" type="text/javascript"></script>

    </head>
    <body>
        <div class="container" style="width: 100%">
            <div class="container-fluid">
                <button type="button" id="back" name="back" class="btn btn-info btn-sm" style="margin-bottom: 20px"><span class="glyphicon glyphicon-chevron-left"></span> Back</button>
                <form id="tarifffrm" method="post">
                    <div class="row ">
                        <div class="form-group col-lg-4">
                            <label><b>Room-Type</b></label>
                            <div><select class="form-control input-sm" id="roomtype" name="roomtype">
                                    <option value="-1">Select Room-Type</option>
                                    <%
                                        Map map = hrs.HRSManager.getRoomtypePairList();
                                        Set set = map.entrySet();
                                        Iterator itr = set.iterator();
                                                    while (itr.hasNext()) {
                                                        Map.Entry entry = (Map.Entry) itr.next();%>
                                    <option value="<%=entry.getValue()%>"><%=entry.getValue()%></option>
                                    <%   
                                                    }
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
                        <div class="form-group col-lg-4">
                            <label><b>Tariff</b></label>
                            <div><input type="text" id="tariff" name="tariff" class="form-control input-sm"> </div>
                        </div>
                    </div>

                    <div id="invalidtariff" class="hidden ">
                        <span style="color:red; font-size:15px ;margin-left:120px "></span>
                    </div>
                    <div class="row ">
                        <div class="form-group col-lg-4">
                            <label><b>Description</b></label>
                            <div><input type="text" id="description" name="description" class="form-control input-sm"></div>
                        </div>

                    </div>

                    <div id="invaliddesc" class="text-captalize hidden ">
                        <span style="color:red; font-size:15px ;margin-left:100px "></span>
                    </div>

                    <div class="row ">
                        <div class="col-lg-4">
                            <div><input type="button" id="tariffbtn" name="tariffbtn" value="Submit" class="btn-primary input-sm"></div>
                        </div>

                    </div>
                </form>
            </div>
        </div>

    </body>
</html>
