
/*$("#sheep_purchases").ready(function(){
   $("#quantity").keyup(function (e) {
      if ($(this).val().length>2) {
         $(this).val('0');
         set_sheep_rows(0);
         return false;
      }
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        $("#errmsg").html("!").show().fadeOut("slow");
        $(this).val('');
        return false;
    }
    set_sheep_rows(parseInt($(this).val()));
   });
   $('#add_sheep').click(function(){
      current_rows_number = $(".purchasing_list").find('.purchase_row').length;
      $("#quantity").val(current_rows_number+1);
      insert_sheep_row();
      refresh_calendar();
   });
      $('#remove_sheep').click(function(){
      current_rows_number = $(".purchasing_list").find('.purchase_row').length;
      if (current_rows_number>0) {
         $("#quantity").val(current_rows_number-1);
         remove_sheep_row()
      }

   });
      

      
   $('.remove_this_sheep').click(function(){
      if (confirm('Da li ste sigurni da zelite da izbrisete ovu ovcu iz baze podataka?')) {
          sheep_id = $(this).val();
          $("#s_purchase_"+sheep_id).remove();
          $("#quantity").val($("#quantity").val()-1);
      } 
   });
    
      
    
});

function insert_sheep_row(){
   row="<tr class='purchase_row'><td><input type='text' name='purchases[][sheep_code]' style='width: 70px'></td>"+
            "<td><input type='text' name='purchases[][nickname]' style='width: 70px'></td>"+
            "<td><select class='btn' name='purchases[][sex]'><option>musko</option><option>zensko</option></select></td>"+
            "<td><input type='text' name='purchases[][percent_of_r]' style='width: 40px'>%</td>"+
            "<td><input type='text' name='purchases[][price]' style='width: 40px'></td>"+
            "<td><input type='text' name='purchases[][date_of_birth]'data-behaviour='datepicker' format='dd-mm-yyyy' style='width: 90px'></td>"+
            "<td><input type='text' name='purchases[][father_code]' style='width: 70px'></td>"+
            "<td><input type='text' name='purchases[][mother_code]' style='width: 70px'></td>"+
            "<td><input type='text' name='purchases[][sheep_describe]' style='width: 150px'></td>"+
            "<td><input type='text' name='purchases[][purchase_comment]' style='width: 120px'></td></tr>";
      $(".purchasing_list").append(row);
}

function remove_sheep_row(){
   $(".purchasing_list").find('.purchase_row').last().remove();
}
function refresh_calendar(){
   
    $('[data-behaviour~=datepicker]').datepicker({
       language: "rs",
       format: 'dd-mm-yyyy',
       autoclose: true
    });
    $('[data-behaviour~=datepicker]').datepicker('refresh');
}
function set_sheep_rows(rows_number){

    current_rows_number = $(".purchasing_list").find('.purchase_row').length;
   if (rows_number>current_rows_number) {
         for (i=current_rows_number; i<rows_number; i++){
             insert_sheep_row();
         }
        refresh_calendar();
    } else {
         for (i=rows_number; i<current_rows_number; i++){
             remove_sheep_row();
         }
    }


}*/