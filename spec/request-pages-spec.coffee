describe 'RequestPages', ->
  Given -> @patientId      = 1
  And   -> @prescriptionId = 1
  And   -> @paRequestId    = 1
  Given -> @resourceUrl = "/patients/#{@patientId}/prescriptions/#{@prescriptionId}/pa_requests/#{@paRequestId}"
  When  -> @subject = new RequestPages(@patientId, @prescriptionId, @paRequestId)

  describe '#constructor', ->
    Given -> spyOn($, 'get')
    Given -> @isResourceUrl        = (arg)=> arg == @resourceUrl
    Given -> @isGetSuccessCallback = (arg)=> arg == @subject._getSuccessCallback

    Then  ->
      expect($.get).toHaveBeenCalledWith
        url:      jasmine.argThat(@isResourceUrl)
        success:  jasmine.argThat(@isGetSuccessCallback)
        dataType: 'json'

  describe '#_resourceUrl', ->
    Then  -> expect( @subject._resourceUrl() ).toEqual @resourceUrl

  describe '#_getSuccessCallback', ->
    Given -> spyOn($, 'get').andCallFake -> 'prevent ajax call'

    Given -> affix '.request-pages'
    Given -> @renderedForm = 'form markup is here'

    Given -> @formSpies = spyOnConstructor(window.RequestPages, 'Form', ['render'])
    Given -> @formSpies.render.andReturn @renderedForm

    When  -> spyOn( @subject, '_setupFormHandlers')
    And   -> @subject._getSuccessCallback @requestPagesJson

    Then  -> expect( $('.request-pages').html() ).toEqual @renderedForm
    Then  -> expect( @subject._setupFormHandlers ).toHaveBeenCalled()

  describe '#update', ->
    # submits form contents back to @_resourceUrl
    #
