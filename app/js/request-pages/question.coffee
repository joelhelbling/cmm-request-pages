# this will be moved elsewhere...
window.RequestPages = {}

window.RequestPages.Question = class Question
  @create: (questionJson, currentValue='') ->
    Type = switch questionJson['question_type']
      when 'FREE_TEXT' then RequestPages.Question.FreeText
      when 'CHOICE'    then RequestPages.Question.Choice
      else                  RequestPages.Question
    new Type(questionJson, currentValue)

  constructor: (questionJson, currentValue='') ->
    @dna = questionJson
    @value = currentValue

  template: 'unknown-question' # subclass will override

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

  render: ->
    JST[@template](question: this)

