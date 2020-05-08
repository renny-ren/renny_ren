$ ->
  $('.msg-button').click () ->
    $('.msg-modal').modal('show')

document.addEventListener 'turbolinks:load',  ->
  $('#close').click () ->
    $('.sentence-panel').fadeOut()
