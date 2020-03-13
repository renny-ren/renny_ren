$ ->
  if $('.infinite-scrolling').size() > 0
    $(window).bind 'scroll', ->
      more_posts_url = $('.pagination a.next_page').attr('href')
      if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
        $('.pagination').html('<i class="fa fa-2x fa-spin fa-spinner", style="color: #a2b0bb"></i>')
        setTimeout ->
          $.getScript more_posts_url
        , 1000
        return
      return
