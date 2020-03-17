$ ->
  if $('.infinite-scrolling').size() > 0
    $(window).bind 'scroll', ->
      more_posts_url = $('.pagination a.next_page').attr('href')
      if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
        $('.pagination').html("<div class='ui active centered inline loader'></div>")
        setTimeout ->
          $.getScript more_posts_url
        , 1000
        return
      return
