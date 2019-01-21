$(function(){
  $("form#new_question").on("submit", function(e){
    let form = $(this);
    let action = form.attr("action")
    let params = form.serialize();
    $.post(action, params);
    alert("Question submitted successfully");
  });

});
