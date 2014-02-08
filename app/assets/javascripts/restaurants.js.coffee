$ = jQuery

$ ->
  $("#restaurant_zip_code").blur (e) ->
    $.getJSON "http://cep.correiocontrol.com.br/" + e.currentTarget.value + ".json", (data) ->
      address = data

      $("#restaurant_street").val(address.logradouro)
      $("#restaurant_neighborhood").val(address.bairro)
      $("#state").val($("#state option[data-acronym=#{address.uf}]").val()).change()

      $("#restaurant_city_id").val(
        $("#restaurant_city_id option").filter(->
          $(this).html() is address.localidade
        ).val()
      ).change()

  $("#state").change (e) =>

    unless $.active > 0
      $.getJSON "/cities?state_id=" + e.currentTarget.value, (data) ->
        $("#restaurant_city_id").empty()

        $.each data, (i, item) ->
          $("<option value=\"" + item.id + "\">" + item.name + "</option>").appendTo "#restaurant_city_id"
