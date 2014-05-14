
$("document").ready(function(){
    add_sheep_to_selling();
    $('#selling_sheeps').multiselect({
        onChange: function(){
           add_sheep_to_selling();
        },
        maxHeight: 250,
        includeSelectAllOption : true,
        selectAllText : ' Selektuj sve',
        selectAllValue : 'all',
        enableFiltering: true,
        nonSelectedText: 'Nista selektovano'
    });
        $(document).on('change','.po_kg',function() {
        if($(this).is(":checked")) {
            $(this).parent().parent().find(".pricekg").prop("disabled", false);
            $(this).parent().parent().find(".weight").prop("disabled", false);
        } else {
            $(this).parent().parent().find(".pricekg").prop("disabled", true);
            $(this).parent().parent().find(".weight").prop("disabled", true);
        }
    });

});

function add_sheep_to_selling(){
    all_html = '';
        $('#selling_sheeps').find(":selected").each(function() {
            sheep = $(this).data("value");
            all_html += "<tr><td><input type='hidden' name='sheep_selling[][sheep_id]' style='width: 50px' value='"+sheep.id+"'>"+ sheep.code +"</td>"+
                    "<td><strong>"+ sheep.nickname +"</strong></td>"+
                    "<td>"+ sheep.sex +"</td>"+
                    "<td>"+ sheep.describe +"</td>"+
                    "<td><input type='checkbox' value='true' name='sheep_selling[][po_kg]' class='po_kg' checked></td>"+
                    "<td><input type='text' name='sheep_selling[][pricekg]' class='pricekg' style='width: 50px' > evra</td>"+
                    "<td><input type='text' name='sheep_selling[][weight]' class='weight' style='width: 50px'></td>"+
                    "<td><input type='text' name='sheep_selling[][price]' style='width: 50px'> evra</td>"+
                    "<td><input type='text' name='sheep_selling[][describe]'></td></tr>";
       });
        $(".selling_list").html(all_html);    
}
