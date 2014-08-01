describe 'RequestPages.Question.Numeric', ->
  Given ->
    @json =
      question_type            : 'NUMERIC'
      question_text            : 'How many?'
      question_id              : 'number_question'
      default_next_question_id : 'next_question'
      help_text                : 'Helpful explanation'
      flag                     : 'IMPORTANT'

  Given -> @currentValue = 12

  When  -> @subject = RequestPages.Question.create(@json, @currentValue)

  Then  -> expect( @subject.template ).toEqual 'numeric-question'
  And   -> expect( @subject.value    ).toEqual 12
