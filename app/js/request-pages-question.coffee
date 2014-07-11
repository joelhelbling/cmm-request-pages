window.RequestPagesQuestion = class RequestPagesQuestion
  templateDir: 'app/templates'

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
    @dna.flag == 'REQUIRED'

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

  templates:
    FREE_TEXT : 'free-text-question'
    CHOICE    : 'choice-question'

  template: ->
    @templates[@questionType()] || 'unknown-question'

  render: ->
    JST[@template()](question: this)

