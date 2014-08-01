window.RequestPages.Question.Statement = function(question) {

  question.template = 'statement-question';

  question.content_plain = _.bind(function() {
    return this.dna.content_plain;
  }, question);

  question.content_html = _.bind(function() {
    return this.dna.content_html;
  }, question);

  return question;
};
