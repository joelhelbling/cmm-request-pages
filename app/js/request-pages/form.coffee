window.RequestPages.Form = class Form

  constructor: (requestPages) ->
    @currentValues = requestPages['data']['pa_request']
    @questionSets = []
    requestPages['forms']['pa_request']['question_sets'].forEach (questionSet) =>
      @questionSets.push new RequestPages.QuestionSet(questionSet, @currentValues)

  find_question_by_id: (questionId) ->
    @foundQuestion = {}
    @questionSets.forEach (questionSet) =>
      questionSet.questions.forEach (question) =>
        if question.questionId() == questionId
          @foundQuestion = question
    @foundQuestion

  template: 'form'

  render: ->
    JST[@template](form: this)
