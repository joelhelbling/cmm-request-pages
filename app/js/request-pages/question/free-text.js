window.RequestPages.Question.FreeText = function(question) {

  question.template = 'free-text-question';

  question.placeholder = _.bind(function() { return this.dna.placeholder; }, question);

  return question;
};
