$ ->
  addresspickerMap = $("#address_search").addresspicker
    regionBias: "BR",
    appendAddressString: ", BR"
    elements:
      map: "#map",
      lat: "#latitude",
      lng: "#longitude",
      street_number: '#street_number',
      route: '#restaurant_street',
      locality: '#city',
      sublocality: '#restaurant_neighborhood',
      administrative_area_level_1: '#state',
      postal_code: '#restaurant_zip_code'

  gmarker = addresspickerMap.addresspicker("marker")
  gmarker.setVisible(true)
  addresspickerMap.addresspicker("updatePosition")

  $("#address_search").addresspicker("option", "reverseGeocode", true)
