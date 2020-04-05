$ ->
  $('.carousel-modal').modal({
    onShow: () ->
      $('.jR3DCarouselGallery').addClass('active')
    onHide: () ->
      $('.jR3DCarouselGallery').removeClass('active')
  })

  $('#collapse').click () ->
    $('#hobby').slideToggle()
    $(this).text(if $(this).text() == '展开 ▼' then '收起 ▲' else '展开 ▼')

  $('.feedback-container').on 'ajax:success', ->
    $('.feedback-container').removeClass('warning')
    $('.feedback-container').addClass('success')
    $('#message_body')[0].value = ''
    $('#message_author')[0].value = ''
    $('#message_contact_info')[0].value = ''

  $('.feedback-container').on 'ajax:error', (event, xhr, status, error) ->
    $('.feedback-container').addClass('warning')

  $('.jR3DCarouselGallery').click (e) ->
    if e.target.nodeName == 'IMG'
      $('.carousel-modal').modal('show')
