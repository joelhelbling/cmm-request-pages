window.RequestPages.QuestionSet = function(questionSetJson, currentValues) {
  this.title = questionSetJson['title'];

  this.template = 'question-set';

  this.questions = [];
  questionSetJson['questions'].forEach(_.bind(function(questionJson) {
    var currentValue;
    currentValue = currentValues[questionJson['question_id']];
    return this.questions.push(RequestPages.Question.create(questionJson, currentValue));
  }, this));

  this.render = _.bind(function() {
    return JST[this.template]({ questionSet: this });
  }, this);

};
