window.RequestPages.Question.FreeArea = function(question) {

  question.template = 'free-area-question';

  question.placeholder = _.bind(function() {
    return this.dna.placeholder;
  }, question);

  return question;
};
