window.RequestPages = class RequestPages

  constructor: (patientId, prescriptionId, paRequestId) ->
    @patientId = patientId
    @prescriptionId = prescriptionId
    @paRequestId = paRequestId

    $.get @_resourceUrl(), @_getSuccessCallback

  selector: '.request-pages'

  _resourceUrl: ->
    "/patients/#{@patientId}/prescriptions/#{@prescriptionId}/pa_requests/#{@paRequestId}/request_pages.json"

  _getSuccessCallback: (data)=>
    @form = new RequestPages.Form(data['request_page'])
    $(@selector).html @form.render()
    @_setupFormHandlers()

  _setupFormHandlers: =>
    $("#{@selector} form").submit (event)=>
      event.preventDefault()
      @update()

  update: =>
      alert 'Here is where we would send the form back to the demo app'
