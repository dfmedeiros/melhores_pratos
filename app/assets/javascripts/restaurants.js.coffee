$ = jQuery

$ ->
  $("#state").change (e) =>

    $.getJSON "/cities?state_id=" + e.currentTarget.value, (data) ->
      $("#restaurant_city_id").empty()

      $.each data, (i, item) ->
        $("<option value=\"" + item.id + "\">" + item.name + "</option>").appendTo "#restaurant_city_id"
