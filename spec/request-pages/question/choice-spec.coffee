describe 'RequestPages.Question.Choice', ->

  Given ->
    @json =
      question_type            : 'CHOICE'
      question_text            : 'Question Text'
      question_id              : 'question'
      default_next_question_id : 'next_question'
      help_text                : 'Helpful explanation'
      flag                     : 'IMPORTANT'
      choices                  : [
          choice_id        : 'question_choice_a'
          choice_text      : 'Plan A'
          next_question_id : 'question_if_a'
        ,
          choice_id        : 'question_choice_b'
          choice_text      : 'Plan B'
          next_question_id : 'question_if_b'
      ]
      select_multiple          : false

  Given -> @currentValue = null

  When  -> @subject = RequestPages.Question.create(@json, @currentValue)

  Then  -> expect( @subject.template ).toEqual 'choice-question'

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
