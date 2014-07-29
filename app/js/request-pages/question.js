window.RequestPages.Question = function(questionJson, currentValue) {
  if (currentValue == null) {
    currentValue = '';
  }
  this.dna = questionJson;
  this.value = currentValue;

  this.template = 'unknown-question';

  this.questionType = _.bind(function() { return this.dna.question_type; }, this);
  this.questionText = _.bind(function() { return this.dna.question_text; }, this);
  this.questionId   = _.bind(function() { return this.dna.question_id;   }, this);
  this.helpText     = _.bind(function() { return this.dna.help_text;     }, this);
  this.defaultNextQuestionId =
    _.bind(function() { return this.dna.default_next_question_id; }, this);


  this.isRequired = _.bind(function() {
    if (this.dna.flag === 'REQUIRED') {
      return 'required';
    } else {
      return '';
    }
  }, this);

  this.render = _.bind(function() {
    return JST[this.template]({
      question: this
    });
  }, this);

};

window.RequestPages.Question.create = function(questionJson, currentValue) {
  if (currentValue == null) {
    currentValue = '';
  }

  var questionFactory = (function() {
    switch (questionJson['question_type']) {
      case 'FREE_TEXT':
        return RequestPages.Question.FreeText;
      case 'CHOICE':
        return RequestPages.Question.Choice;
      default:
        return function(question) { return question; };
    }
  })();

  return questionFactory(new RequestPages.Question(questionJson, currentValue));

};

window.RequestPages.Question.init = function() {};
