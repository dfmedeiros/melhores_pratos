jQuery ->
  $('#food_cuisine_tokens').tokenInput '/cuisines',
    theme: 'facebook'
    prePopulate: $('#food_cuisine_tokens').data('load')