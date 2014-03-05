
$(document).ready(function(){

 $(".select").select2();

 
    $('[data-behaviour~=datepicker]').datepicker({
       language: "rs",
       format: 'dd-mm-yyyy'
    });
    $('.multiselect').multiselect({
        maxHeight: 400,
         onChange: function(element, checked) {
                add_remove_sheep_row(element.val());
        },
        includeSelectAllOption : true,
        selectAllText : ' Selektuj sve',
        selectAllValue : 'multiselect-all',
        enableFiltering: true,
        nonSelectedText: 'Nista selektovano'
    });

    $(document).on('change','.lambNum',function() {
            set_lamb_rows_for_sheep($(this).val(),$(this).attr('id'));
    });
    $(document).on('keyup','#decimal',function(e) {
        val= $(this).val();
        a = val.match(/^[0-9]{1,4}\.[0-9]{1,3}$/) ===null;
        b = val.match(/^[0-9]{1,4}\,[0-9]{1,3}$/) ===null;
        c = val.match(/^[0-9]{1,4}$/) ===null;

        if ( a & b & c) {
            $(this).addClass('invalid');
        } else {
            $(this).removeClass('invalid');
        }
    });
});

function add_remove_sheep_row(el){  
    var values = $('.multiselect').val();
    index = jQuery.inArray( el, values );
    hiden_row =$('#sheep_row').first(); //the hiden one
    if (index != -1) {
        $new_row = hiden_row.clone();
        $new_row.find('a').html('Ovca ' + values[index]);
        $new_row.find('.lambing_list').attr( 'id', 'lambing_list_'+index);    
        $new_row.find('.lambNum').attr( 'id', index);
        $new_row.show();
        $new_row.attr('class', 'table table-hover');
        $new_row.attr('id', 'sheep_row_'+el);
        $new_row.appendTo("#accordion");          
    } else {
        $("#accordion").find("#sheep_row_"+el).remove();
    }     
}
function set_lamb_rows_for_sheep(n, sheep_num){
    list = '';
    var sheep = $('.multiselect').val()[sheep_num];
    for (i=0; i<n; i++){

        list += "<tr><td><input type='hidden' name='lambings[][sheep_id]' value='"+sheep+"'></td>"+
                "<td><select name='lambings[][sex]'><option>musko</option><option>zensko</option></select></td>"+
                "<td><input id='decimal' name='lambings[][weight]'/></td>" +
                "<td><input type='checkbox' value='true' name='lambings[][alive]'></td>"+
                "<td><input name='lambings[][comment]'></td></tr>";
    }
    table = $('#accordion').first();
    table.find('#lambing_list_'+sheep_num).html(list);
}
function getSheeps() {
    $.getJSON("/sheep.json",function(result){
      $.each(result, function(i, field){
             $('#sheep_code').append("<option value='"+ field.id +"'>" + field.code +"</option>");
        
      });

  });
 

}
function insert_sheeps_selector(){
    getSheeps();
}

function set_rows_for_lambing_inputs(){
    $( "#l_number" ).keyup(function() {
         var number_of_lambs = getValue($( "#l_number" ).val());
         $( "#l_number" ).val(number_of_lambs);
         rows = '';
         for (i=0; i<number_of_lambs; i++){
            rows += '<tr><td>sdfsdf</td><td>sdfsdf</td><td>row</tr>';
         }
         $( "#insert_lambings" ).html(rows);
    });
}

function getValue(n){
     if  (!$.isNumeric(n))
              return null;          
    if (n>10 || n<1) 
        return 1;
    return n;
}


/*
var type = "test&data";
var user_id = 1;
var param = {type: type, user_id: user_id};
 
$.ajax({
  url: 'application/test.php',
   data: param, 
  success: function(result) {
    $('#target').html(result);
  }
});*/