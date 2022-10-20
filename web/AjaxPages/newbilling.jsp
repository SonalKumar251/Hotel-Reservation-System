<%-- 
    Document   : newbilling
    Created on : 25 Aug, 2020, 2:22:52 PM
    Author     : Sonal kumar singh
--%>

<html>
    <head>
      
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
         <script src="js/billing.js" type="text/javascript"></script>
        <script>
            $('#bback').click(function(){
                  changeheading('Billing List');
                  loadPage('billing-list.jsp');
                  $('#ResMsg').addClass("hidden");
            });
        </script>
        <style>
            .form-group{
                  margin-top: 10px
              }
              .invalidmsg{
                  color: red;
                  margin-bottom:-25px;
              }
        </style>
    </head>
    <body>
        <button type="button" id="bback" name="tback" class="btn btn-info btn-sm" style="margin-top: 5px;margin-left: 195px"><span class="glyphicon glyphicon-chevron-left"></span> Back</button>
        
        
        <div class="container " style=" margin-top: 15px;background-color: #f2f2f2;border: 1px solid lightgrey;border-radius: 3px;width:65%">
           
            <form id="billingfrm" method="post" style="width:100%; margin-top:15px;" >
               
                 <div class="form-row">
                    <div class="form-group col-sm-6">
                       <label for="bbn">Booking no</label>
                       <input type="text" class="form-control" id="bbn" name="bbn" value="B-0" autocomplete="off">
                       <h5 class="hidden invalidmsg" id="invalidbbn"></h5>
                    </div>
                     
                    <div class="form-group col-sm-6">
                       <label for="bdate">Date</label>
                       <div class="input-group">
                           <div class="input-group-addon">
                               <i class="fa fa-calendar" style="font-size:20px"></i>
                           </div>
                       <input type="text" class="form-control" id="bdate" name="bdate" readonly>
                       <h5 class="hidden invalidmsg" id="invalidbdate"></h5>
                       </div>
                    </div>
                                             
                        
                     <div class="form-group col-sm-4">
                       <label for="days">Days</label>
                       <input type="text"  class="form-control" id="days" name="days" readonly>
                       <h5 class="hidden invalidmsg" id="invaliddays"></h5>
                    </div> 
                     
                       <div class="form-group col-sm-4">
                       <label for="amt">Amount</label>
                       <div class="input-group">
                           <div class="input-group-addon">
                               <i class="fa fa-inr" style="font-size:20px"></i>
                           </div>
                       <input type="text"  class="form-control" id="amt" name="amt" readonly>
                       </div>
                        <h5 class="hidden invalidmsg" id="invalidamt"></h5>
                    </div>  
                    
                         <div class=" form-group col-sm-4">
                     <label for="en1">Payment-type&nbsp;&nbsp;&nbsp;</label><br>
                     <input class="form-check-input" type="radio" name="ptype" id="pt1" value="Cash" checked>
                      <label class="form-check-label" for="ptype">Cash&nbsp</label>
                     <input class="form-check-input" type="radio" name="ptype" id="pt2" value="Card">
                     <label class="form-check-label" for="ptype">card&nbsp</label>
                     <h5 class="hidden invalidmsg" id="invalidptype"></h5>
                     </div>
                     
                     <div class="form-group col-sm-6">
                       <label for="cname">Bill to</label>
                        <div class="input-group">
                           <div class="input-group-addon">
                               <i class="fa fa-user" style="font-size:20px"></i>
                           </div>
                       <input type="text" class="form-control" id="cname" name="cname" placeholder="customer's name">
                       </div>
                        <h5 class="hidden invalidmsg" id="invalidcname"></h5>
                    </div>
                     
                      <div class="form-group col-sm-6">
                       <label for="card">Card number</label>
                        <div class="input-group">
                           <div class="input-group-addon">
                               <i class="fa fa-credit-card" style="font-size:20px"></i>
                           </div>
                       <input type="text" class="form-control" id="card" name="card" placeholder="XXXX XXXX XXXX XXXX" readonly>
                       </div>
                        <h5 class="hidden invalidmsg" id="invalidcard"></h5>
                    </div>
                        
                         <div class="form-group col-sm-6">
                             <input type="button" id="billingbtn" name="billingbtn"  value="Update" style="width:45%;font-size:16px;margin-left: 60px;margin-top: 33px; height: 40px;background-color:#ff9900; color: white;border-radius:3px" >
                     </div>
                        
                         <div class="form-group col-sm-6">
                       <label for="reason">Remarks</label>
                       <textarea class="form-control" rows="2" id="remarks" name="remarks" style="resize:none"  placeholder="Remarks.."></textarea>
                       <h5 class="hidden" id="invalidremarks" style="margin-top:5px; color:red" ></h5>
                    </div>
                 </div>
            </form>
                       
        </div>
    </body>
</html>