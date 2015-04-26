// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .


// Javascript Snippet


/* 
  function metrics () {

  var _metrics = {
    name: "foobar"
  }

  var _metrics_event;  
  if (window.XMLHttprequest) {
    _metrics_event = new XMLHttprequest();
  }
  else {
    _metrics_event = new ActiveXObject("Microsoft.XMLHTTP");
  }
  _metrics_event.open("POST", "http://localhost:3000/api/events", true);
  _metrics_event.setRequestHeader("Content-Type", "application/json");
  _metrics_event.onreadystatechange = function () {
    console.log(xmlhttp.responseText);
  } 
  _metrics_event.send(_metrics);

  metrics();
} */


