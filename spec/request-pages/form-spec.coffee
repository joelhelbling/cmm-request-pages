describe 'RequestPages.Form', ->
  Given ->
    @question_1 =
      question_text: 'Question Text'
      question_id: 'question'
      default_next_question_id: 'next_question'
      help_text: 'Helpful explanation'
      flag: 'IMPORTANT'
  Given ->
    @question_2 =
      question_text: 'Next Question'
      question_id: 'next_question'
      help_text: 'Unhelpful explanation'
      flag: 'IMPORTANT'
  Given ->
    @json =
      data:
        pa_request:
          question: 'An answer'
          next_question: 'Another answer'
      forms:
        pa_request:
          question_sets: [
              title: '1st Question Set'
              questions: [ @question_1, @question_2 ]
            ,
          ]
      actions: [
          ref: 'pa_request'
          title: 'Save'
          href: 'http://web.app/request_pages'
          method: 'PUT'
      ]

  When -> @subject = new RequestPages.Form(@json)

  Then -> expect( @subject.questionSets.length ).toEqual 1
  Then -> expect( @subject.currentValues.question ).toEqual 'An answer'

  describe '#find_question_by_id', ->
    When -> @result = @subject.find_question_by_id('next_question')
    Then -> expect( @result.questionText() ).toEqual 'Next Question'

  describe '#render', ->
    When -> @rendered = @subject.render()
    Then -> expect( @rendered ).toContain "form class='request-pages-form'"
    Then -> expect( @rendered ).toContain '1st Question Set'
    Then -> expect( @rendered ).toContain 'Save'
