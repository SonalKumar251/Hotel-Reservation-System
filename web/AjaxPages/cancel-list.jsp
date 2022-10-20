<%@page import="java.util.List"%>
<%@page import="bean.Room" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                $("#newcancel").click(function () {

                    changeheading('Cancel Room');
                    loadPage('newcancellation.jsp');
                });            
            });
                        
            function showButtons()
            {
                $("#editroom").removeClass("hidden");
                
            }

 </script>

    </head>
    <body>
        <div class="container-fluid" >
           
            <div class="row container-fluid">
                <div class="btn-group">
                    <button type="button" class="btn btn-primary" id="newcancel"  style="border-radius: 0px;box-shadow: none;outline: none;margin-right: 5px;">New</button>
                    <!--<button type="button" class="btn btn-primary hidden" id="editroom" style="border-radius: 0px;box-shadow: none;outline: none;margin-right: 5px;">Edit</button>-->

                </div>
            </div>
        <%
           
            List list =hrs.HRSManager.getRoomCancelList();

            if (list.size()>0) {
        %>



        
            <div class="row" style="height: 10px"></div>
            <div class="row container-fluid">
                <table id="example" class="display nowrap" cellspacing="0"  width="50%">
                    <thead>
                        <tr> 
                            <th>Select</th>
                            <th>Booking no</th>
                            <th>Room no</th>
                            <th>Customer name</th>
                            <th>Cancel date</th>
                            <th>Reason</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i=0; i < list.size(); i++) {
                             bean.Cancel rb = (bean.Cancel)list.get(i);

                        %>
                        <tr>
                            <td><input type="radio" value="<%=rb.getId() %>" onclick="showButtons()" name="roomRadio"></td>
                            <td><%=rb.getBooking_no() %></td>
                            <td><%=rb.getRoom_no() %></td>
                            <td><%=rb.getCustomer_name() %></td>
                            <td><%=(rb.getCancel_date()).replaceAll(" 00:00:00","") %></td>
                            <td><%=rb.getReason() %></td>
                            

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
