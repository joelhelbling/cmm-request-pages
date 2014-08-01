window.RequestPages.Form = function(formsJson, currentValues, actions) {
  this.actionsJson   = actions;

  this.template = 'form';

  this.name = _.bind(function() {
    return Object.keys(formsJson)[0];

  }, this);

  this.formJson      = formsJson[this.name()];
  this.currentValues = currentValues[this.name()];

  this.questionSets = [];
  this.formJson['question_sets'].forEach(_.bind(function(questionSet) {
      this.questionSets.push(
        new RequestPages.QuestionSet(questionSet, this.currentValues)
      );

    }, this));

  this.actions = [];
  this.actionsJson.forEach(_.bind(function(action) {
    this.actions.push( new RequestPages.Form.Action(action) );

  }, this));

  this.find_question_by_id = _.bind(function(questionId) {
    var foundQuestion = {};
    this.questionSets.forEach(_.bind(function(questionSet) {
      questionSet.questions.forEach(_.bind(function(question) {
        if (question.questionId() === questionId) {
          return foundQuestion = question;
        }
      }, this));
    }, this));
    return foundQuestion;
  }, this);

  this.render = _.bind(function() {
    return JST[this.template]({ form: this });
  }, this);

};
