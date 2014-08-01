describe 'RequestPages.Question.Statement', ->
  Given ->
    @json =
      question_type            : 'STATEMENT'
      question_text            : 'Question Text'
      question_id              : 'question'
      default_next_question_id : 'next_question'
      help_text                : 'Helpful explanation'
      content_plain            : 'Hello World!'
      content_html             : '<em>Hello World!</em>'

  Given -> @currentValue = null

  When  -> @subject = RequestPages.Question.create(@json, @currentValue)

  Then  -> expect( @subject.template        ).toEqual 'statement-question'
  Then  -> expect( @subject.content_plain() ).toEqual 'Hello World!'
  And   -> expect( @subject.content_html()  ).toEqual '<em>Hello World!</em>'

