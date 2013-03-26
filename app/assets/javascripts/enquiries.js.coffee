# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.enquiries_context ?= {}

enquiries_context = window.enquiries_context

spinner_opts =
  lines: 15 # The number of lines to draw
  length: 10 # The length of each line
  width: 2 # The line thickness
  radius: 7 # The radius of the inner circle
  corners: 1 # Corner roundness (0..1)
  rotate: 0 # The rotation offset
  color: "#000" # #rgb or #rrggbb
  speed: 1 # Rounds per second
  trail: 60 # Afterglow percentage
  shadow: false # Whether to render a shadow
  hwaccel: false # Whether to use hardware acceleration
  className: "spinner" # The CSS class to assign to the spinner
  zIndex: 2e9 # The z-index (defaults to 2000000000)
  top: "auto" # Top position relative to parent in px
  left: "82" # Left position relative to parent in px


showSpinner = ()->
  target = $("#enquiryModal > modal-body")[0]
  enquiries_context['spinner'] = new Spinner(spinner_opts) unless enquiries_context['spinner']
  enquiries_context['spinner'].spin(target)

hideSpinner = ()->
  enquiries_context['spinner'].stop()

$(document).ready ->
  $("#send_enquiry_button").click (event)->
    showSpinner()
    $.post(enquiries_context.equiries_url+'.json',
      auth_token: enquiries_context.auth_token
    ).done((data)->
      $("#infoModal > .modal-header > h3").html("Thank You")
      $("#infoModal > .modal-body").html("Thank you very much for your enquiry. One of our consultants will contact you within the next 24 hours to arrange a
                                          time to discuss your requirements in more detail.")
    ).fail((data)->
      alert("in fail!")
      alert($("#infoModal > .modal-header > h3").html)
      $("#infoModal > .modal-header > h3").html("Communication Error")
      $("#infoModal > .modal-body").html("Whoops! There seems to be a problem with the internet or our servers. Please
                                          try again later or send an email to hello@nativetongue.com")
    ).always((data)->
      hideSpinner()
      $("#enquiryModal").modal("hide")
      $("#infoModal").modal("show")
    )