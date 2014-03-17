
/*$("#vaccinations").ready(function(){

    add_sheep_to_vactination();
    $('#vaccin_sheeps').multiselect({
        onChange: function(){
           add_sheep_to_vactination();
        },
        maxHeight: 250,
        includeSelectAllOption : true,
        selectAllText : ' Selektuj sve',
        selectAllValue : 'all',
        enableFiltering: true,
        nonSelectedText: 'Nista selektovano'
    });
    
    $("#vaccin_costs").keyup(function (e) {
      if ($(this).val().length>3) {
         $(this).val('0');
         return false;
      }
      if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        $("#errmsg").html("!").show().fadeOut("slow");
        $(this).val('');
        return false;
    }
   });

});

function add_sheep_to_vactination(){
    all_html = '';
        $('#vaccin_sheeps').find(":selected").each(function() {
            sheep = $(this).data("value");
            all_html += "<tr><td><input type='hidden' name='sheeps[][sheep_id]' style='width: 50px' value='"+sheep.id+"'>"+ sheep.code +"</td>"+
                    "<td><strong>"+ sheep.nickname +"</strong></td>"+
                    "<td>"+ sheep.sex +"</td>"+
                    "<td>"+ sheep.describe +"</td></tr>";           
       });
        $(".vaccination_list").html(all_html);    
}
*/