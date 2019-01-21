$( document ).ready(function() {

$.ajax({

    type: 'GET',
    url: "/questions.json",
    dataType: 'json',
}).success(function(response){
  response.forEach(function(i){
    let x = new Question(i);
  });

  let q_src = $('#question-list-template').html();
  let q_template = Handlebars.compile(q_src);

  let output = q_template(Question.all);
 $('div#questions').append(output);

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

});
