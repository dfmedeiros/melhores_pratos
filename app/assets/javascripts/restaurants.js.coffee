$ ->
  addresspickerMap = $("#addresspicker_map").addresspicker
    regionBias: "BR",
    updateCallback: showCallback,
    elements:
      map:      "#map",
      lat:      "#lat",
      lng:      "#lng",
      street_number: '#street_number',
      route: '#route',
      locality: '#locality',
      sublocality: '#sublocality',
      administrative_area_level_1: '#administrative_area_level_1',
      postal_code: '#postal_code'

  gmarker = addresspickerMap.addresspicker("marker")
  gmarker.setVisible(true)
  addresspickerMap.addresspicker( "updatePosition")

  $("#addresspicker_map").addresspicker("option", "reverseGeocode", true)

  showCallback = (geocodeResult, parsedGeocodeResult) ->
    console.log parsedGeocodeResult
    $('#callback_result').text(JSON.stringify(parsedGeocodeResult, null, 4))