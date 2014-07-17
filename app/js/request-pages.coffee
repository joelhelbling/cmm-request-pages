window.RequestPages = class RequestPages

  constructor: (patientId, prescriptionId, paRequestId) ->
    @patientId = patientId
    @prescriptionId = prescriptionId
    @paRequestId = paRequestId

    $.get
      url: @_resourceUrl()
      success: @_getSuccessCallback
      dataType: 'json'

  selector: '.request-pages'

  _resourceUrl: ->
    "/patients/#{@patientId}/prescriptions/#{@prescriptionId}/pa_requests/#{@paRequestId}"

  _getSuccessCallback: (data)->
    @form = new RequestPages.Form(data)
    $(@selector).html @form.render()
    @_setupFormHandlers()

  _setupFormHandlers: ->
    $("#{@selector} form").onSubmit (event)=>
      event.preventDefault()
      @update()

  update: ->
      alert 'Here is where we would send the form back to the demo app'
