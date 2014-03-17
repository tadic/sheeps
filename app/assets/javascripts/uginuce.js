
$("#vaccinations").ready(function(){
 refresh_calendar();
 $('.select').select2();

});
function refresh_calendar(){
   
    $('[data-behaviour~=datepicker]').datepicker({
       language: "rs",
       format: 'dd-mm-yyyy',
       autoclose: true
    });
    $('[data-behaviour~=datepicker]').datepicker('refresh');
}