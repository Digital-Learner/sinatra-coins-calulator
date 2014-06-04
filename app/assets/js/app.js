// Foundation JavaScript
// Documentation can be found at: http://foundation.zurb.com/docs
$(document).foundation();

$('div.alert-box').hide();

// <-- Sinatra-Flash behaviour : Start -->
var sinatraFlashType = {
  "success": function() {
    $('.alert-box').show();
    $('.alert-box').addClass('success');
    $('#main-h1-heading').hide();
  },

  "info": function() {
    $('.alert-box').show();
    $('.alert-box').addClass('info');
    $('#main-h1-heading').hide();
  },

  "error": function() {
    $('.alert-box').show();
    $('.alert-box').addClass('alert');
    $('#main-h1-heading').hide();
  },

  "warning": function() {
    $('.alert-box').show();
    $('.alert-box').addClass('warning');
    $('#main-h1-heading').hide();
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
