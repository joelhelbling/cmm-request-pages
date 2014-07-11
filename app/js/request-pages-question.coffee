# this will be moved elsewhere...
window.RequestPages = {}

window.RequestPages.Question = class Question
  constructor: (questionJson, currentValue='') ->
    @dna = questionJson
    @value = currentValue

  questionType: ->
    @dna.question_type

  questionText: ->
    @dna.question_text

  questionId: ->
    @dna.question_id

  defaultNextQuestionId: ->
    @dna.default_next_question_id

  helpText: ->
    @dna.help_text

  isRequired: ->
    if @dna.flag == 'REQUIRED' then 'required' else ''

  # unique to FREE_TEXT
  placeholder: ->
    @dna.placeholder

  # unique to CHOICE
  selectMultiple: ->
    if @dna.select_multiple then 'multiple' else ''

  choices: ->
    @dna.choices

  isSelected: (choice) ->
    if choice.choice_id == @value then 'selected' else ''

  # end unique to things

  templates:
    FREE_TEXT : 'free-text-question'
    CHOICE    : 'choice-question'

  template: ->
    @templates[@questionType()] || 'unknown-question'

  render: ->
    JST[@template()](question: this)

