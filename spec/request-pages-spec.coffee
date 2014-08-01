describe 'RequestPages', ->
  Given -> @patientId      = 1
  And   -> @prescriptionId = 1
  And   -> @paRequestId    = 1
  Given -> @resourceUrl = "/patients/#{@patientId}/prescriptions/#{@prescriptionId}/pa_requests/#{@paRequestId}/request_pages.json"
  When  -> @subject = new RequestPages(@patientId, @prescriptionId, @paRequestId)

  describe '#showForm', ->
    Given -> spyOn($, 'get')
    Given -> @isResourceUrl        = (arg)=> arg == @resourceUrl
    Given -> @isGetSuccessCallback = (arg)=> arg == @subject._getSuccessCallback

    When  -> @subject.showForm()

    Then  ->
      expect($.get).toHaveBeenCalledWith(
          jasmine.argThat(@isResourceUrl),
          jasmine.argThat(@isGetSuccessCallback)
        )

  describe '#postForm', ->
    Given -> spyOn($, 'post')
    Given -> @isResourceUrl        = (arg)=> arg == @resourceUrl
    Given -> @isGetSuccessCallback = (arg)=> arg == @subject._getSuccessCallback
    Given -> spyOn($, 'get').andCallFake -> 'prevent ajax call'
    Given -> affix '.request-pages'
    Given -> @renderedForm = '<form><input type="text" name="foo" value="bar" /></form>'
    Given -> @requestPagesJson = { request_page: { api_json: 'yeah! fake!' } }
    Given -> @formSpies = spyOnConstructor(window.RequestPages, 'Form', ['render'])
    Given -> @formSpies.render.andReturn @renderedForm

    When  -> @subject.showForm()
    And   -> @subject.postForm()

    Then  ->
      expect($.post).toHaveBeenCalledWith(
          jasmine.argThat(@isResourceUrl),
          jasmine.any(String),
          jasmine.argThat(@isGetSuccessCallback)
        )

  describe '#_resourceUrl', ->
    Then  -> expect( @subject._resourceUrl() ).toEqual @resourceUrl

  describe '#_getSuccessCallback', ->
    Given -> spyOn($, 'get').andCallFake -> 'prevent ajax call'
    Given -> affix '.request-pages'
    Given -> @renderedForm = 'form markup is here'
    Given -> @requestPagesJson = { request_page: { api_json: 'yeah! fake!' } }
    Given -> @formSpies = spyOnConstructor(window.RequestPages, 'Form', ['render'])
    Given -> @formSpies.render.andReturn @renderedForm

    When  -> @subject._getSuccessCallback @requestPagesJson

    Then  -> expect( $('.request-pages').html() ).toEqual @renderedForm

