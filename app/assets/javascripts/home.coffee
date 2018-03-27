$ ->
  $('#msg-collapse').click () ->
    $('.msg-panel').slideToggle()
    $('.fa-angle-down').css('transform' : 'rotate(180deg)')