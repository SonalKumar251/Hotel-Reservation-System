<%-- 
    Document   : transfer-list
    Created on : 22 Aug, 2020, 2:34:09 PM
    Author     : Sonal kumar singh
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/roombooking.js" type="text/javascript"></script>


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
                $("#newtransfer").click(function () {

                    changeheading('Transfer Room');
                    loadPage('newtransfer.jsp');
                     
                    
                });
                $("#etransfer").click(function () {
                    
                    changeheading('Edit Transfer');
                    
                    loadPage('edittransfer.jsp');
                 });
            });
            function showButtons()
            {
                $("#etransfer").removeClass("hidden");
                
              }

       </script>

    </head>
    <body>
        <div class="container-fluid" >
           
            <div class="row container-fluid">
                <div class="btn-group">
                    <button type="button" class="btn btn-primary" id="newtransfer"  style="border-radius: 1px;box-shadow: none;outline: none;margin-right: 5px;">New</button>
                    <button type="button" class="btn btn-primary hidden" id="etransfer" style="border-radius: 1px;box-shadow: none;outline: none;margin-right: 5px;">Edit</button>

                </div>
            </div>
        <%
           
            List list =hrs.HRSManager.getTransferList();

            if (list.size() > 0) {
        %>



        
            <div class="row" style="height: 10px"></div>
            <div class="row container-fluid">
                <table id="example" class="display nowrap" cellspacing="0"  width="50%">
                    <thead>
                        <tr> 
                            <th>Sl no.</th>
                            <th>Select</th>
                            <th>Booking no</th>
                            <th>Previous Room</th>
                            <th>New Room</th>
                            <th>Date</th>
                            <th>Reason</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < list.size(); i++) {
                                bean.RoomTransfer t = (bean.RoomTransfer) list.get(i);

                        %>
                        <tr>
                            <td><%=i+1%></td>
                            <td><input type="radio" value="<%=t.getT_id() %>" onclick="showButtons()" name="TransferRadio"></td>
                            <td><%=t.getBno() %></td>
                            <td><%=t.getP_room() %></td>
                            <td><%=t.getN_room() %></td>
                            <td><%=(t.getT_date()).replace("00:00:00", "") %></td>
                            <td><%=t.getT_reason() %></td>
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
            out.println("<h1 align=center>Record Not Found!</h1>");
    %>


</body>
</html>
