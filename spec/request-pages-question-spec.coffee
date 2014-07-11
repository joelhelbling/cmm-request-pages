describe 'RequestPagesQuestion', ->
  Given ->
    @json =
      question_text:             'Question Text'
      question_id:               'question'
      default_next_question_id:  'next_question'
      help_text:                 'Helpful explanation'
      flag:                      'IMPORTANT'
  Given -> @currentValue = null
  When -> @subject = new RequestPagesQuestion(@json, @currentValue)

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
    Then  -> expect( @subject.template() ).toEqual 'unknown-question'

  describe 'FREE_TEXT', ->
    Given -> @json.question_type = 'FREE_TEXT'
    Given -> @json.placeholder = 'E.g. answer like so...'
    Then  -> expect( @subject.template() ).toEqual 'free-text-question'
    Then  -> expect( @subject.placeholder() ).toEqual 'E.g. answer like so...'

  describe 'CHOICE', ->
    Given -> @json.question_type = 'CHOICE'
    And   ->
      @json.choices = [
          choice_id: 'question_choice_a'
          choice_text: 'Plan A'
          next_question_id: 'question_if_a'
        ,
          choice_id: 'question_choice_b'
          choice_text: 'Plan B'
          next_question_id: 'question_if_b'
      ]
    And   -> @json.select_multiple = false

    Then  -> expect( @subject.template() ).toEqual 'choice-question'

    describe '#selectMultiple', ->
      describe 'when select_multiple is false', ->
        Given -> @json.select_multiple = false
        Then  -> expect( @subject.selectMultiple() ).toEqual ''

      describe 'when select_multiple is true', ->
        Given -> @json.select_multiple = true
        Then -> expect( @subject.selectMultiple() ).toEqual 'multiple'

    describe '#choices', ->
      Then  -> expect( @subject.choices().length ).toEqual 2
      Then  -> expect( @subject.choices()[0].choice_id ).toEqual 'question_choice_a'

    describe '#isSelected', ->
      Given -> @choice = @json.choices[0]

      describe 'when not selected', ->
        Given -> @currentValue = 'some_other_id'
        Then  -> expect( @subject.isSelected @choice ).toEqual ''

      describe 'when selected', ->
        Given -> @currentValue = @choice.choice_id
        Then  -> expect( @subject.isSelected @choice ).toEqual 'selected'
