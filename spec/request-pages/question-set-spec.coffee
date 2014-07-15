describe 'RequestPages.QuestionSet', ->
  Given ->
    @question_1 =
      question_text: 'Question Text'
      question_id: 'question'
      default_next_question_id: 'next_question'
      help_text: 'Helpful explanation'
      flag: 'IMPORTANT'
  Given ->
    @question_2 =
      question_text: 'Next Question'
      question_id: 'next_question'
      default_next_question_id: 'another_question'
      help_text: 'Unhelpful explanation'
      flag: 'IMPORTANT'
  Given ->
    @json =
      title: 'A Question Set'
      questions: [ @question_1, @question_2 ]
  Given ->
    @data =
      pa_request:
        question: 'answer'
        next_question: 'next answer'

  When -> @subject = new RequestPages.QuestionSet(@json, @data)

  describe '#constructor', ->
    Then -> expect( @subject.title ).toEqual 'A Question Set'
    Then -> expect( @subject.questions.length ).toEqual 2
    Then -> expect( @subject.questions[0].questionId() ).toEqual 'question'
    Then -> expect( @subject.questions[1].questionId() ).toEqual 'next_question'

  describe '#render', ->
    Given -> @renderedQuestion = '<question 2 />'
    Given -> @fakeQuestion = { render: => @renderedQuestion }
    Given -> spyOn(RequestPages.Question, 'create').andReturn @fakeQuestion
    Given -> @json.questions = [ {} ]
    When  -> @rendered = @subject.render()
    Then  -> expect( @rendered ).toContain "fieldset class='question-set'"
    And   -> expect( @rendered ).toContain @subject.title
    And   -> expect( @rendered ).toContain @renderedQuestion
