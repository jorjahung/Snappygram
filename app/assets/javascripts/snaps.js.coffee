# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('a.load-more-snaps').on 'inview', (e, visible) ->
    return unless visible
    
    return $.getScript $(this).attr('href')

  $('#settings-menu').click( ->
    $('#settings-dropdown').toggleClass('hidden')
  )