window.RequestPagesQuestion = class RequestPagesQuestion
  templateDir: 'app/templates'

  constructor: (questionJson) ->
    @dna = questionJson

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

  placeholder: ->
    @dna.placeholder

  isRequired: ->
    @dna.flag == 'REQUIRED'

  templates:
    FREE_TEXT: 'free-text-question'

  template: ->
    @templates[@questionType()] || 'unknown-question'

  render: ->
    JST[@template()](question: this)

