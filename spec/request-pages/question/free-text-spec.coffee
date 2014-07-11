describe 'RequestPages.Question.FreeText', ->
  Given ->
    @json =
      question_type            : 'FREE_TEXT'
      question_text            : 'Question Text'
      question_id              : 'question'
      default_next_question_id : 'next_question'
      help_text                : 'Helpful explanation'
      flag                     : 'IMPORTANT'
      placeholder              : 'E.g. answer like so...'

  Given -> @currentValue = null

  When  -> @subject = RequestPages.Question.create(@json, @currentValue)

  Then  -> expect( @subject.constructor.name ).toEqual 'FreeText'
  Then  -> expect( @subject.template ).toEqual 'free-text-question'

  Then  -> expect( @subject.placeholder() ).toEqual 'E.g. answer like so...'
