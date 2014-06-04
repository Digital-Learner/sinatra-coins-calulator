// Foundation JavaScript
// Documentation can be found at: http://foundation.zurb.com/docs
$(document).foundation();

$('div.alert-box').hide();

var sinatraFlashType = {
  "success": function() {
    $('.alert-box').show();
    $('.alert-box').addClass('success');
  },

  "info": function() {
    $('.alert-box').show();
    $('.alert-box').addClass('info');
  },

  "error": function() {
    $('.alert-box').show();
    $('.alert-box').addClass('alert');
  },

  "warning": function() {
    $('.alert-box').show();
    $('.alert-box').addClass('warning');
  },

  "default": function() {
  }
};

// Check what the .flash class property is.
if ( $('div.flash').hasClass('success') ) {
    sinatraFlashType[ "success" ]();

} else if ( $('.flash').hasClass('info') ) {
    sinatraFlashType[ "info" ]();

} else if ( $('.flash').hasClass('error') ) {
    sinatraFlashType[ "error" ]();

} else if ( $('.flash').hasClass('warning') ) {
    sinatraFlashType[ "warning" ]();

} else {
    sinatraFlashType[ "default" ]();
};
