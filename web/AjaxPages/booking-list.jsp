
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
                $("#newbooking").click(function () {

                    changeheading('Book Room');
                    loadPage('newbooking.jsp');
                     
                    
                });
                $("#editbooking").click(function () {
                    
                    changeheading('Edit booking');
                    
                    loadPage('editbooking.jsp');
                 });
            });
            function showButtons()
            {
                $("#editbooking").removeClass("hidden");
                
              }

       </script>

    </head>
    <body>
        <div class="container-fluid" >
           
            <div class="row container-fluid">
                <div class="btn-group">
                    <button type="button" class="btn btn-primary" id="newbooking"  style="border-radius: 1px;box-shadow: none;outline: none;margin-right: 5px;">New</button>
                    <button type="button" class="btn btn-primary hidden" id="editbooking" style="border-radius: 1px;box-shadow: none;outline: none;margin-right: 5px;">Edit</button>

                </div>
            </div>
        <%
           
            List list =hrs.HRSManager.getBookingList();

            if (list.size() > 0) {
        %>



        
            <div class="row" style="height: 10px"></div>
            <div class="row container-fluid">
                <table id="example" class="display nowrap" cellspacing="0"  width="50%">
                    <thead>
                        <tr> 
                            <th>Sl no.</th>
                            <th>Select</th>
                            <th>Room no</th>
                            <th>Booking Date</th>
                            <th>Customer name</th>
                            <th>Contact</th>
                            <th>Occupancy</th>
                            <th>Days</th> 
                            <th>Status</th> 
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < list.size(); i++) {
                                bean.RoomBooking ob = (bean.RoomBooking) list.get(i);

                        %>
                        <tr>
                            <td><%=i+1%></td>
                            <td><input type="radio" value="<%=ob.getBooking_no() %>" onclick="showButtons()" name="BookingRadio"></td>
                            <td style="padding-left:20px !important"><%=ob.getRoom_no() %></td>
                            <td style="padding-left:20px !important"><%=ob.getB_date().replaceAll("00:00:00","")%></td>
                            <td style="padding-left:20px !important"><%=ob.getCust_name() %></td>
                            <td style="padding-left:20px !important"><%=ob.getContact_no() %></td>
                            <td style="text-align:center"><%=ob.getOccupancy() %></td>
                            <td style="text-align:center"><%=ob.getDays() %></td>
                            <td style="text-align:center"><%=ob.getStatus() %></td>

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
