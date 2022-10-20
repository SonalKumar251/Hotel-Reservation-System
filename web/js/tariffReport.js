/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    $('#tcriteria').change(function(){
      var crit=$('#tcriteria option:selected').val().trim();
      if(crit!=="-1"){
         $('#rtariff').attr('readonly',false);
         $('#tariffcheck').addClass('hidden');
 }else{ 
     $('#rtariff').attr('readonly',true);
     $('#tariffcheck').removeClass('hidden');
     $('#rtariff').val('');
       }
    });
});