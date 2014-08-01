(function($) {
  $.fn.showRequestPagesForm = function() {
    $.each(this, _.bind(function() {
      var patientId      = this.data('patient-id');
      var prescriptionId = this.data('prescription-id');
      var paRequestId    = this.data('pa-request-id');
      var requestPages   = new RequestPages(patientId, prescriptionId, paRequestId);

      requestPages.container = this;
      requestPages.showForm();
    }, this));
    return this;
  };
}(jQuery));

