window.RequestPages.Question.Choice = class Choice extends RequestPages.Question

  template: 'choice-question'

  selectMultiple: ->
    if @dna.select_multiple then 'multiple' else ''

  choices: ->
    @dna.choices

  isSelected: (choice) ->
    if choice.choice_id == @value then 'selected' else ''

