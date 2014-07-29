window.RequestPages.Question.Choice = function(question) {

  question.template = 'choice-question';

  question.selectMultiple = _.bind(function() {
    if (this.dna.select_multiple) {
      return 'multiple';
    } else {
      return '';
    }
  }, question);

  question.choices = _.bind(function() {
    return this.dna.choices;
  }, question);

  question.isSelected = _.bind(function(choice) {
    if (choice.choice_id === this.value) {
      return 'selected';
    } else {
      return '';
    }
  }, question);

  return question;
};
