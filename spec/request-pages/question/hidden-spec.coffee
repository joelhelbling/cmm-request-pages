describe 'RequestPages.Question.Hidden', ->
  Given ->
    @json =
      question_type            : 'HIDDEN'
      question_text            : 'Question Text'
      question_id              : 'hidden_question'

  Given -> @currentValue = 'furtive answer'

  When  -> @subject = RequestPages.Question.create(@json, @currentValue)

  Then  -> expect( @subject.template ).toEqual 'hidden-question'
  And   -> expect( @subject.value    ).toEqual 'furtive answer'
