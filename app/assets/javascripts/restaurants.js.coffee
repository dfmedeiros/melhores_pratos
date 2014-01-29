$ = jQuery

$ ->
  $("#restaurant_zip_code").blur (e) ->
    $.getJSON "/addresses?zipcode=" + e.currentTarget.value, (data) ->
      address = data

      $("#restaurant_street").val(address.street_address)
      $("#restaurant_neighborhood").val(address.neighborhood)
      $("#state").val($("#state option[data-acronym=#{address.state}]").val()).change()

      $("#restaurant_city_id").val(
        $("#restaurant_city_id option").filter(->
          $(this).html() is address.city
        ).val()
      ).change()

  $("#state").change (e) =>

    unless $.active > 0
      $.getJSON "/cities?state_id=" + e.currentTarget.value, (data) ->
        $("#restaurant_city_id").empty()

        $.each data, (i, item) ->
          $("<option value=\"" + item.id + "\">" + item.name + "</option>").appendTo "#restaurant_city_id"
