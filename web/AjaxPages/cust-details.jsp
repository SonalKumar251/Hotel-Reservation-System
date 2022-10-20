<%@page import="bean.RoomBooking"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  
    

  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" style="background-color: #009999">
            <%
            List list=null;
            try{
            String bn=request.getParameter("bn");
            list=hrs.HRSManager.getBookingDetails(bn);
            if(list.size()>0)
                {
                RoomBooking ob=(RoomBooking)list.get(0);
            %>
          <div class="">
                  <span style="color:black; font-size:16px; ">Customer Name :</span><span id="cn" style=""><%=ob.getCust_name()%></span>
              <br><span style="color:black; font-size:16px; ">Address       :</span><span id="cn" style=""><%=ob.getAddress()%></span>
              <br><span style="color:black; font-size:16px; ">Contact       :</span><span id="cn" style=""><%=ob.getContact_no()%></span>
              <br><span style="color:black; font-size:16px; ">gender        :</span><span id="cn" style=""><%=ob.getGender()%></span>
              <br><span style="color:black; font-size:16px; ">Occupancy     :</span><span id="cn" style=""><%=ob.getOccupancy()%></span>
              <br><span style="color:black; font-size:16px; ">Days          :</span><span id="cn" style=""><%=ob.getDays()%></span>
              <br><span style="color:black; font-size:16px; ">Booking date  :</span><span id="cn" style=""><%=ob.getB_date()%></span>
              <br><span style="color:black; font-size:16px; ">Purpose       :</span><span id="cn" style=""><%=ob.getPurpose()%></span>
        </div>
              <%
                }
            }catch(Exception ex){}
            %>
        </div>
        
       
      </div>
    </div>
  </div>
  
</div>

</body>
</html>
