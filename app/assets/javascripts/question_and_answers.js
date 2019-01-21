$( document ).ready(function() {

  let jsonUrl = window.location.href + ".json";
  $.ajax({url: jsonUrl, method: 'GET', dataType: 'JSON'})
  .success(function(response){
    response.answers.forEach(function(item){
    let x = new Answer(item)
    let ansHtml = Answer.template(Answer.all);
    $("div#answers").append(ansHtml);
  });
});

  Answer.templateSource = $("#answer-template").html();
  Answer.template = Handlebars.compile(Answer.templateSource);
  Answer.all = [];

  $("form#new_answer").on("submit", function(e){
    e.preventDefault();
    let form = $(this);
    let action = form.attr("action")
    let params = form.serialize();

    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST"
    }).success(function(json){
        let ans = new Answer(json);
        let ansHtml = Answer.template(Answer.all);
        $("div#answers").append(ansHtml);
        //alert("Answer accepted, please refresh the page to provide another answer.")
      }).error(function(response){
      console.log("There's an error!", response)
    });
});

      $.ajax({
          type: 'GET',
          url: window.location.href + '.json',
          dataType: 'json',
      }).success(function(response){
        question = new Question(response);
        let q_src = $('#question-template').html();
        let q_template = Handlebars.compile(q_src);
        let output = q_template(question);
       $('div#question').append(output);
      });

    class Question {
      constructor(attr){
        this.id = attr.id;
        this.created_at = attr.created_at;
        this.category = attr.category;
        this.user = attr.user;
        this.question_text = attr.question_text;
      }
    }

    function Answer(attr) {
        this.id = attr.id;
        this.created_at = attr.created_at;
        this.answer_text = attr.answer_text;
        this.user = attr.user;
        Answer.all.push(this);
      }

});
