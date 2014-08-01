describe 'RequestPages.Question.Checkbox', ->
  Given ->
    @json =
      question_type            : 'CHECKBOX'
      question_text            : 'Question Text'
      question_id              : 'question'
      default_next_question_id : 'next_question'
      help_text                : 'Helpful explanation'
      flag                     : 'IMPORTANT'

  Given -> @currentValue = 'checkbox answer'

  When  -> @subject = RequestPages.Question.create(@json, @currentValue)

  Then  -> expect( @subject.template ).toEqual 'checkbox-question'
  And   -> expect( @subject.value    ).toEqual 'checkbox answer'
