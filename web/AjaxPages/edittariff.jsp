<%@page import="bean.Tariff"%>
<%@page import="java.util.List"%>
<%!
List list=null;
%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <script src="js/etariff.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            try
            {
                String id=request.getParameter("etariff_id");
                list=hrs.HRSManager.getTariff(id);
                if(list.size()>0)
                {
                Tariff ob=(Tariff)list.get(0);
                
            %>
            
        <div class="container">
            <div class="container-fluid">
                 <button type="button" id="eback" name="eback" class="btn btn-info btn-sm" style="margin-bottom: 20px"><span class="glyphicon glyphicon-chevron-left"></span> Back</button>
                <form id="etarifffrm" method="post">
                    <input type="hidden" id="tariff_id1" name="tariff_id1" value="<%=id%>">
            <div class="row ">
                <div class="form-group col-lg-4">
                    <label><b>Room-Type</b></label>
                            <div><select class="form-control input-sm" id="eroomtype" name="eroomtype">
                                    <option value="<%=ob.getRoomtype()%>"><%=ob.getRoomtype()%></option>
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
                            <div><select class="form-control input-sm" id="ebedtype" name="ebedtype">
                        <option value="<%=ob.getBedtype()%>"><%=ob.getBedtype()%></option>
                        <option value="Single">Single</option>
                        <option value="Double">Double</option>
                        </select></div>
                </div>
                
            </div>
                <div class="row ">
                <div class="form-group col-lg-4">
                    <label><b>Tariff</b></label>
                    <div><input type="text" id="etariff" name="etariff" value="<%=ob.getTariff()%>" class="form-control input-sm"> </div>
                </div>
                
                </div>
                <div id="invalidetariff" class="hidden ">
            <span style="color:red; font-size:15px  "></span>
        </div>
            
                <div class="row ">
                <div class="form-group col-lg-4">
                    <label><b>Description</b></label>
                    <div><input type="text" id="edescription" name="edescription" value="<%=ob.getDescription()%>" class="form-control input-sm"></div>
                </div>
                
            </div>
                <div id="invalidedesc" class="hidden ">
            <span style="color:red; font-size:15px "></span>
        </div>
                
                <div class="row ">
                <div class="col-lg-4">
                    <div><input type="button" id="etariffbtn" name="etariffbtn" value="Edit" class="btn-primary input-sm"></div>
                </div>
                
            </div>
                </form>
            </div>
        </div>
              <%
               }
            }catch(Exception ex){}
            
            %>
    </body>
</html>
