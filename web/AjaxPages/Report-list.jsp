<%-- 
    Document   : Report-list
    Created on : 9 Sep, 2020, 6:39:17 PM
    Author     : Sonal kumar singh
--%>


<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report List</title>
         <style>
            div.dataTables_wrapper {
                width: 100%!important;
                margin: 0 auto!important;
                alignment-adjust: auto;
            }
            
            td {
                text-align: left;
                vertical-align: middle;
            }
            tr {
                text-align: left;
                vertical-align: middle;
            }
        </style>
         <script>

         
            $(document).ready(function ()

            {

                $('#example').DataTable({
                    dom: 'Bfrtip',
                    "autoWidth": false,
                    "pageLength": 10,
                    buttons: [
                        'copy', 'csv', 'excel', 'print'
                    ]

                });
               
            });
 </script>

    </head>
    <body>
         <div class="container-fluid" >
           
           
        <%
            String rt=request.getParameter("rtype");
            String bt=request.getParameter("btype");
            String tc=request.getParameter("criteria");
            String t= request.getParameter("rtariff");
            String st=request.getParameter("roccupancy");
           
            List list =hrs.HRSManager.getTariffRoomReport(rt,bt,tc,t,st);

            if (list.size() > 0) {
        %>



        
            <div class="row" style="height: 10px"></div>
            <div class="row container-fluid">
                <table id="example" class="display nowrap" cellspacing="0"  width="50%">
                    <thead>
                        <tr> 
                            <th>S.no</th>
                            <th>Room no.</th>
                            <th>Room Type</th>
                            <th>Bed Type</th>
                            <th>Tariff</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < list.size(); i++) {
                                bean.TariffReportBean ob = (bean.TariffReportBean)list.get(i);

                        %>
                        <tr>
                            <td><%=i + 1%></td>
                            <td><%=ob.getRoomno() %></td>
                            <td><%=ob.getRoomtype() %></td>
                            <td><%=ob.getBedtype() %></td>
                            <td><%=ob.getTariff() %></td>
                            <td><%=ob.getStatus() %></td>
                            

                        </tr>
                        <%
                            }
                        %>

                    </tbody>
                </table>
            </div>
        

        <div align="center" >
            <div class="col-md-12 text-center">

            </div>
        </div>
        <div class="clear height200" ></div>  
    </div><!--all-end-->

    <%
        } else
            out.println("<center><h1>Record not found!</h1></center>");
    %>
</body>
</html>

