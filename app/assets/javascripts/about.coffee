$ ->
  $('#collapse').click () ->
    $('#hobby').slideToggle()
    $(this).text(if $(this).text() == '展开 ▼' then '收起 ▲' else '展开 ▼')