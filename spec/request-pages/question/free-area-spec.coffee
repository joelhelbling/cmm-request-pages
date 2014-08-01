describe 'RequestPages.Question.FreeArea', ->
  Given ->
    @json =
      question_type: 'FREE_AREA'
      question_text: 'Question Text'
      question_id: 'text_area'
      default_next_question_id: 'next_question'
      flag: 'IMPORTANT'
      help_text: 'Helpful explanation'
      placeholder: 'E.g. answer like so...'

  Given -> @currentValue = 'free text answer'

  When  -> @subject = RequestPages.Question.create(@json, @currentValue)

  Then  -> expect( @subject.template      ).toEqual 'free-area-question'
  Then  -> expect( @subject.placeholder() ).toEqual 'E.g. answer like so...'
  And   -> expect( @subject.value         ).toEqual 'free text answer'
