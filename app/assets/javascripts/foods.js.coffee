jQuery ->
  $('#food_cuisine_tokens').tokenInput '/cuisines',
    theme: 'facebook'
    prePopulate: $('#food_cuisine_tokens').data('load')
    hintText: 'Digite uma cozinha'
    noResultsText: 'Nenhum Resultado'
    searchingText: 'Buscando...'