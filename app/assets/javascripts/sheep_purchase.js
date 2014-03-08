
$(document).ready(function(){
   $("#quantity").keyup(function (e) {
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        $("#errmsg").html("!").show().fadeOut("slow");
        $(this).val('');
               return false;
    }
    set_sheep_rows(parseInt($(this).val()));
   });
    
    
    
});


function set_sheep_rows(rows_number){
    all_rows='';
    row="<tr><td><input type='text' name='purchases[][sheep_code]' style='width: 70px'></td>"+
            "<td><input type='text' name='purchases[][nickname]' style='width: 70px'></td>"+
            "<td><select class='btn' name='purchases[][sex]'><option>musko</option><option>zensko</option></select></td>"+
            "<td><input type='text' name='purchases[][percent_of_r]' style='width: 40px'>%</td>"+
            "<td><input type='text' name='purchases[][price]' style='width: 40px'></td>"+
            "<td><input type='text' name='purchases[][date_of_birth]'data-behaviour='datepicker' format='dd-mm-yyyy' style='width: 90px'></td>"+
            "<td><input type='text' name='purchases[][father_code]' style='width: 70px'></td>"+
            "<td><input type='text' name='purchases[][mother_code]' style='width: 70px'></td>"+
            "<td><input type='text' name='purchases[][sheep_describe]' style='width: 280px'></td>"+
            "<td><input type='text' name='purchases[][purchase_comment]' style='width: 120px'></td></tr>";
            
                
    for (i=0; i<rows_number; i++){
        all_rows += row;
    }
   $(".purchasing_list").html(all_rows);

    $('[data-behaviour~=datepicker]').datepicker({
       language: "rs",
       format: 'dd-mm-yyyy',
       autoclose: true
    });
    $('[data-behaviour~=datepicker]').datepicker('refresh');
}