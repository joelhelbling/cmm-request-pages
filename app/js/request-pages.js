window.RequestPages = function(patientId, prescriptionId, paRequestId) {

  this.patientId      = patientId;
  this.prescriptionId = prescriptionId;
  this.paRequestId    = paRequestId;

  this.selector       = '.request-pages';

  this._resourceUrl = _.bind(function() {
    return '/patients/'      + this.patientId      +
           '/prescriptions/' + this.prescriptionId +
           '/pa_requests/'   + this.paRequestId    +
           '/request_pages.json';

  }, this);

  this._getSuccessCallback = _.bind(function(data) {
    this.form = new RequestPages.Form(data['request_page']);
    $(this.selector).html(this.form.render());
    return this._setupFormHandlers();

  }, this);

  this._setupFormHandlers = _.bind(function(){}, this);

  $.get(this._resourceUrl(), this._getSuccessCallback);

};
