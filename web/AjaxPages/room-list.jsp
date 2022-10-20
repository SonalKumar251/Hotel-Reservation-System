 
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/room.js" type="text/javascript"></script>


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
                $("#newroom").click(function () {

                    changeheading('Create  room');
                    loadPage('room.jsp');
                });
                
                 $("#edittariff").click(function () {
                    
                    changeheading('Edit Room');
                    
                    loadPage('editroom.jsp');
                 });
                 
                
                
            });
             function showBtn(){
               
                   $('#editroom').removeClass("hidden");
                
                }
           
            
        </script>

    </head>
    <body>
        <div class="container-fluid" >
           
            <div class="row container-fluid">
                <div class="btn-group">
                    <button type="button" class="btn btn-primary" id="newroom"  style="border-radius: 1px;box-shadow: none;outline: none;margin-right: 5px;">New</button>
                    <button type="button" class="btn btn-primary hidden" id="editroom" style="border-radius: 1px;box-shadow: none;outline: none;margin-right: 5px;">Edit</button>
                </div>
            </div>
        <%
           
            List list =hrs.HRSManager.getRoomList();

            if (list.size() > 0) {
        %>



        
            <div class="row" style="height: 10px"></div>
            <div class="row container-fluid">
                <table id="example" class="display nowrap" cellspacing="0"  width="50%">
                    <thead>
                        <tr> 
                            <th>S.no</th>
                            <th>Select</th>
                            <th>Room number</th>
                            <th>Room type</th>
                            <th>Bed type</th>
                            <th>Status</th>
                            
                         </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < list.size(); i++) {
                                bean.Room ob = (bean.Room) list.get(i);

                        %>
                        <tr>
                            <td><%=i + 1%></td>
                            <td><input type="radio" value="<%=ob.getRno() %>" onclick="showBtn()" name="RoomRadio"></td>
                            <td  ><%=ob.getRno() %></td>
                            <td><%=ob.getRtype() %></td>
                            <td><%=ob.getBtype() %></td>
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
            out.println("<h1 align=center>Record Not Found!</h1>");
    %>


</body>
</html>
