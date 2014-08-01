window.RequestPages = function(patientId, prescriptionId, paRequestId) {

  this.patientId       = patientId;
  this.prescriptionId  = prescriptionId;
  this.paRequestId     = paRequestId;

  this.defaultSelector = '.request-pages';
  this.container       = $(this.defaultSelector);

  this._resourceUrl = _.bind(function() {
    return '/patients/'      + this.patientId      +
           '/prescriptions/' + this.prescriptionId +
           '/pa_requests/'   + this.paRequestId    +
           '/request_pages.json';

  }, this);

  this._getSuccessCallback = _.bind(function(data) {
    this.form = new RequestPages.Form(data['request_page']['forms'], data['request_page']['data'], data['request_page']['actions']);
    $(this.container).html(this.form.render());
    $(this.container).find('form').on('submit', _.bind(function(e) {
      this.postForm();
      return false;
    }, this));

  }, this);

  this.showForm = _.bind(function() {
    $.get(this._resourceUrl(), this._getSuccessCallback);

  }, this);

  this.postForm = _.bind(function() {
    $.post(
      this._resourceUrl(),
      $(this.container).find('form').serialize(),
      this._getSuccessCallback );

  }, this);

};

