$ ->
  deg = 0
  $('#msg-collapse').click () ->
    deg = 0 if $('.msg-panel').css('display') == 'none'
    $('.msg-panel').slideToggle()
    deg = (deg + 180) % 360
    $('.fa-angle-down').css('transform', 'rotate(' + deg + 'deg)')

  $('.msg-button').click () ->
    $('.msg-modal').modal('show')


  $('body')
    .on 'mouseenter', '.item-segment', () ->
      $(this).css('transform', 'scale(1.02)')
    .on 'mouseleave', '.item-segment', () ->
      $(this).css('transform', 'initial')


document.addEventListener 'turbolinks:load',  ->
  $('#close').click () ->
    $('.sentence-panel').fadeOut()
