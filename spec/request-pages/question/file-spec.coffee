describe 'RequestPages.Question.File', ->
  Given ->
    @json =
      question_type            : 'FILE'
      question_text            : 'Question Text'
      question_id              : 'question'
      default_next_question_id : 'next_question'
      help_text                : 'Helpful explanation'
      flag                     : 'IMPORTANT'

  When  -> @subject = RequestPages.Question.create(@json, null)

  Then  -> expect( @subject.template ).toEqual 'file-question'
