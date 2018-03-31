$ ->
  $('.site-angle').click () ->
    id = $(this).children().first().data('id')
    $('.panel-body[data-id='+id+']').slideToggle()
    $(this).toggleClass('arrow-rotate')

  $('.site-item').tooltipster
    theme: 'tooltipster-borderless'
    maxWidth: 230
    interactive: true
    animation: 'swing'