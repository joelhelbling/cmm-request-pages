window.RequestPages.Form.Action = function(actionJson) {
  this.ref    = actionJson[ 'ref'    ];
  this.title  = actionJson[ 'title'  ];
  this.href   = actionJson[ 'href'   ];
  this.method = actionJson[ 'method' ];

  this.template = 'action-button';

  this.slug = _.bind(function() {
    return this.title.toLowerCase().replace(/[\s\/]+/g, '_');
  }, this);

  this._addHandler = _.bind(function() {
    var btnSelector = 'button.' + this.slug();
    $('.request-pages').on('click', btnSelector, _.bind(function(e) {
      $('input.form_action').val(this.title);
    }, this));
  }, this);

  this.render = _.bind(function() {
    this._addHandler();
    return JST[this.template]({ action: this });
  }, this);
};
