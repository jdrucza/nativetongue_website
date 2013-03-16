header = $('#mod-header')

$(document).ready ->
  init()

$(window).resize ->
  init()

init = ->
  unless Modernizr.mq('(max-width: 700px)')
    $('#toggle_link').remove()
    header.removeClass('toggle')
    return false

  header.addClass('toggle')

  unless $('#toggle_link').length
    $('<a href="#" class="toggle_link button" id="toggle_link">menu</a>').appendTo(header).click ->
      header.toggleClass('active')
