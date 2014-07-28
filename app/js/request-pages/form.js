window.RequestPages.Form = function(requestPages) {
  this.currentValues = requestPages['data']['pa_request'];

  this.template = 'form';

  this.questionSets = [];
  requestPages['forms']['pa_request']['question_sets'].forEach(
    _.bind(function(questionSet) {
      this.questionSets.push(new RequestPages.QuestionSet(questionSet, this.currentValues));
    }, this));

  this.find_question_by_id = _.bind(function(questionId) {
    var foundQuestion = {};
    this.questionSets.forEach(_.bind(function(questionSet) {
      questionSet.questions.forEach(_.bind(function(question) {
        if (question.questionId() == questionId) {
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
