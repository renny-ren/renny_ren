$ ->
  deg = 0
  $('#msg-collapse').click () ->
    deg = 0 if $('.msg-panel').css('display') == 'none'
    $('.msg-panel').slideToggle()
    deg = (deg + 180) % 360
    $('.fa-angle-down').css('transform', 'rotate(' + deg + 'deg)')

document.addEventListener 'turbolinks:load',  ->
  $('#close').click () ->
    $('.sentence-panel').fadeOut()