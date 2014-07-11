describe 'RequestPages.Question', ->
  Given ->
    @json =
      question_text:             'Question Text'
      question_id:               'question'
      default_next_question_id:  'next_question'
      help_text:                 'Helpful explanation'
      flag:                      'IMPORTANT'
  Given -> @currentValue = null
  When -> @subject = RequestPages.Question.create(@json, @currentValue)

  describe 'basic construction', ->
    Then  -> expect( @subject.questionText()          ).toEqual 'Question Text'
    Then  -> expect( @subject.questionId()            ).toEqual 'question'
    Then  -> expect( @subject.defaultNextQuestionId() ).toEqual 'next_question'
    Then  -> expect( @subject.helpText()              ).toEqual 'Helpful explanation'

  describe 'value attribute', ->
    describe 'when no currentValue is provided', ->
      Given -> @currentValue = null
      Then  -> expect( @subject.value ).toEqual ''

    describe 'when currentValue is provided', ->
      Given -> @currentValue = 'pre-populated answer'
      Then -> expect( @subject.value ).toEqual 'pre-populated answer'

  describe '#isRequired', ->
    describe 'when not required', ->
      Given -> @json.flag = 'IMPORTANT'
      Then  -> expect( @subject.isRequired() ).toEqual ''

    describe 'when required', ->
      Given -> @json.flag = 'REQUIRED'
      Then  -> expect( @subject.isRequired() ).toEqual 'required'

  describe 'unknown question type', ->
    Given -> @json.question_type = 'UNKNOWN'
    Then  -> expect( @subject.template ).toEqual 'unknown-question'

