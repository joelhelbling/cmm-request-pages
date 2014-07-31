describe 'RequestPages.Form.Action', ->
  When -> @subject = new RequestPages.Form.Action(@action)

  describe 'PUT action', ->
    Given -> @put_href = 'http://api/RQID/mark_as_sent?token_id=abc123&v=1'
    Given ->
      @action =
        ref:     'pa_request'
        title:   'Mark as Sent'
        href:    @put_href
        method:  'PUT'
    Then -> expect( @subject.ref      ).toEqual 'pa_request'
    And  -> expect( @subject.title    ).toEqual 'Mark as Sent'
    And  -> expect( @subject.href     ).toEqual @put_href
    And  -> expect( @subject.method   ).toEqual 'PUT'
    And  -> expect( @subject.template ).toEqual 'action-button'

    Then -> expect( @subject.slug()   ).toEqual 'mark_as_sent'

  describe 'GET action', ->
    Given -> @get_href = 'http://api/RQID/download?token_id=abc123&v=1'
    Given ->
      @action =
        ref:     ''
        title:   'Download / Print'
        href:    @get_href
        method:  'GET'
    Then -> expect( @subject.ref      ).toEqual ''
    And  -> expect( @subject.title    ).toEqual 'Download / Print'
    And  -> expect( @subject.href     ).toEqual @get_href
    And  -> expect( @subject.method   ).toEqual 'GET'
    And  -> expect( @subject.template ).toEqual 'action-button'
    Then -> expect( @subject.slug()   ).toEqual 'download_print'

