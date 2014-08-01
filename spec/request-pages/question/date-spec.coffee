describe 'RequestPages.Question.Date', ->
  Given ->
    @json =
      question_type            : 'DATE'
      question_text            : 'Question Text'
      question_id              : 'question'
      default_next_question_id : 'next_question'
      help_text                : 'Helpful explanation'
      flag                     : 'IMPORTANT'

  Given -> @currentValue = '12/12/2012'

  When  -> @subject = RequestPages.Question.create(@json, @currentValue)

  Then  -> expect( @subject.template ).toEqual 'date-question'
  Then  -> expect( @subject.value    ).toEqual @currentValue
