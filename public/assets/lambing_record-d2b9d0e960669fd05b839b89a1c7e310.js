function add_remove_sheep_row(e){var t=$("#lambing_sheeps_selection").val();index=jQuery.inArray(e,t),hiden_row=$("#sheep_row").first(),-1!=index?($new_row=hiden_row.clone(),$new_row.find("span").html("Ovca "+e+" ojagnjila"),$new_row.find(".lambing_list").attr("id","lambing_list_"+e),$new_row.find(".lambNum").attr("id",e),$new_row.show(),$new_row.attr("class","table table-hover"),$new_row.attr("id","sheep_row_"+e),$new_row.appendTo("#lambings")):$("#lambings").find("#sheep_row_"+e).remove()}function set_lamb_rows_for_sheep(e,t){for(list="",i=0;e>i;i++)list+="<tr><td><input type='hidden' name='lambings[][sheep_code]' style='width: 50px' value='"+t+"'></td><td><select class='btn' name='lambings[][sex]'><option>neutvrdjen</option><option>musko</option><option>zensko</option></select></td><td><input id='decimal' name='lambings[][weight]' style='width: 50px' /></td><td><input type='checkbox' value='true'  name='lambings[][alive]' checked></td><td><input name='lambings[][describe]' style='width: 280px'></td><td><input name='lambings[][comment]' style='width: 280px'></td></tr>";table=$("#lambings").first(),table.find("#lambing_list_"+t).html(list)}$("document").ready(function(){$(".select").select2(),$("[data-behaviour~=datepicker]").datepicker({language:"rs",format:"dd-mm-yyyy",autoclose:!0}),$("#lambing_sheeps_selection").multiselect({maxHeight:400,onChange:function(e){""!=e.val()&&add_remove_sheep_row(e.val())},includeSelectAllOption:!0,selectAllText:" Selektuj sve",selectAllValue:"",enableFiltering:!0,nonSelectedText:"Nista selektovano"}),$(document).on("change",".lambNum",function(){set_lamb_rows_for_sheep($(this).val(),$(this).attr("id"))}),$(document).on("keyup","#decimal",function(){val=$(this).val(),a=null===val.match(/^[0-9]{1,4}\.[0-9]{1,3}$/),a?$(this).addClass("invalid"):$(this).removeClass("invalid")})});