
$("document").ready(function(){
 $(".select").select2();

    $('[data-behaviour~=datepicker]').datepicker({
       language: "rs",
       format: 'dd-mm-yyyy',
       autoclose: true
    });

    $('#lambing_sheeps_selection').multiselect({
        maxHeight: 400,
         onChange: function(element, checked) {
               if (element.val()!='') {
                add_remove_sheep_row(element.val());
            }
        },
        includeSelectAllOption : true,
        selectAllText : ' Selektuj sve',
        selectAllValue : '' ,
        enableFiltering: true,
        nonSelectedText: 'Nista selektovano'
    });

    $(document).on('change','.lambNum',function() {
            set_lamb_rows_for_sheep($(this).val(),$(this).attr('id'));
    });
    $(document).on('keyup','#decimal',function(e) {
        val= $(this).val();
        a = val.match(/^[0-9]{1,4}\.[0-9]{1,3}$/) ===null;

        if (a) {
            $(this).addClass('invalid');
        } else {
            $(this).removeClass('invalid');
        }
    });
});

function add_remove_sheep_row(el){  
    var values = $('#lambing_sheeps_selection').val();
    index = jQuery.inArray( el, values );
    hiden_row =$('#sheep_row').first(); //the hiden one
    if (index != -1) {
        $new_row = hiden_row.clone();
        $new_row.find('span').html('Ovca ' + el + ' ojagnjila');
        $new_row.find('.lambing_list').attr( 'id', 'lambing_list_'+el);    
        $new_row.find('.lambNum').attr( 'id', el);
        $new_row.show();
        $new_row.attr('class', 'table table-hover');
        $new_row.attr('id', 'sheep_row_'+el);
        $new_row.appendTo("#lambings");          
    } else {
        $("#lambings").find("#sheep_row_"+el).remove();
    }     
}
function set_lamb_rows_for_sheep(n, sheep_code){
    list = '';
    for (i=0; i<n; i++){

        list += "<tr><td><input type='hidden' name='lambings[][sheep_code]' style='width: 50px' value='"+sheep_code+"'></td>"+
                "<td><select class='btn' name='lambings[][sex]'><option>neutvrdjen</option><option>musko</option><option>zensko</option></select></td>"+
                "<td><input id='decimal' name='lambings[][weight]' style='width: 50px' /></td>" +
                "<td><input type='checkbox' value='true'  name='lambings[][alive]' checked></td>"+
                "<td><input name='lambings[][describe]' style='width: 280px'></td>"+
                "<td><input name='lambings[][comment]' style='width: 280px'></td></tr>";
    }
    table = $('#lambings').first();
    table.find('#lambing_list_'+ sheep_code).html(list);
}




