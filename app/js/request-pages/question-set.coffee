window.RequestPages.QuestionSet = class QuestionSet

  constructor: (questionSetJson, currentValues) ->
    @title = questionSetJson['title']
    @questions = []
    questionSetJson['questions'].forEach (questionJson) =>
      currentValue = currentValues[questionJson['question_id']]
      @questions.push RequestPages.Question.create(questionJson, currentValue)

  template: 'question-set'

  render: ->
    JST[@template](questionSet: this)

