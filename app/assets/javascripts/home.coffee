$ ->
  deg = 0
  $('#msg-collapse').click () ->
    $('.msg-panel').slideToggle()
    deg = (deg + 180) % 360
    $('.fa-angle-down').css('transform', 'rotate(' + deg + 'deg)')
