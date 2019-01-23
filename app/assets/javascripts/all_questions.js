$( document ).ready(function() {

$.ajax({

    type: 'GET',
    url: '/questions.json',
    dataType: 'json',
}).success(function(response){
  response.forEach(function(i){
    let q = new Question(i);
    q.render();
  });
});

function Question(attr) {
  this.id = attr.id;
  this.created_at = attr.created_at;
  this.category = attr.category;
  this.user = attr.user;
  this.question_text = attr.question_text;
  Question.all.push(this);
}
Question.all = [];

Question.prototype.render = function(){
  templateSource = $("#question-list-template").html();
  template = Handlebars.compile(templateSource);
  $('div#questions').append(template(this));
}

});
