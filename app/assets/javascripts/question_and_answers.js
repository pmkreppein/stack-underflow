$( document ).ready(function() {
  let jsonUrl = window.location.href + ".json";


  $.ajax({url: jsonUrl, method: 'GET', dataType: 'JSON'})
  .success(function(response){
    response.answers.forEach(function(item){
    let ans = new Answer(item);
    ans.renderTemplate()
  });
});

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
        ans.renderTemplate();
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
        question.render();
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

    Question.prototype.render = function(){
      templateSource = $("#question-template").html();
      template = Handlebars.compile(templateSource);
      $('div#question').append(template(this));
    }

    function Answer(attr) {
        this.id = attr.id;
        this.created_at = attr.created_at;
        this.answer_text = attr.answer_text;
        this.user = attr.user;
        Answer.all.push(this);
      }
      Answer.prototype.renderTemplate = function(){
        templateSource = $("#answer-template").html();
        template = Handlebars.compile(templateSource);
        $('div#answers').append(template(this));
      }

      Answer.all = [];
});
