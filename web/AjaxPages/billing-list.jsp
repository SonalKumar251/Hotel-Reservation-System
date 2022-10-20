<%-- 
    Document   : billing-list
    Created on : 25 Aug, 2020, 1:07:45 PM
    Author     : Sonal
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
                $("#newbilling").click(function () {

                    changeheading('New Billing');
                    loadPage('newbilling.jsp');
                     
                    
                });
                $("#ebilling").click(function () {
                    
                    changeheading('Edit Billing');
                    
                    loadPage('editbilling.jsp');
                 });
            });
            function showButtons()
            {
                $("#ebilling").removeClass("hidden");
                
              }

       </script>

    </head>
    <body>
        <div class="container-fluid" >
           
            <div class="row container-fluid">
                <div class="btn-group">
                    <button type="button" class="btn btn-primary" id="newbilling"  style="border-radius: 1px;box-shadow: none;outline: none;margin-right: 5px;">New</button>
                    <button type="button" class="btn btn-primary hidden" id="ebilling" style="border-radius: 1px;box-shadow: none;outline: none;margin-right: 5px;">Edit</button>

                </div>
            </div>
        <%
           
            List list =hrs.HRSManager.getBillingList();

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
                            <th>Billed to</th>
                            <th>Date</th>
                            <th>Days</th>
                            <th>Payment</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < list.size(); i++) {
                                bean.Billing b = (bean.Billing) list.get(i);

                        %>
                        <tr>
                            <td><%=i+1%></td>
                            <td><input type="radio" value="<%=b.getId() %>" onclick="showButtons()" name="BillRadio"></td>
                            <td><%=b.getBno() %></td>
                            <td><%=b.getCname() %></td>
                            <td><%=(b.getBdate()).replace("00:00:00", "") %></td>
                            <td><%=b.getDays() %></td>
                            <td><%=b.getPtype() %></td>
                             <td><%=b.getAmount() %></td>
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

