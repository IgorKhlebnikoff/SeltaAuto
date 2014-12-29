initialize = ->
  latlng = new google.maps.LatLng 49.44149, 32.013275

  map_canvas = document.getElementById 'map_canvas'

  map_options = 
    center: latlng
    zoom: 14

  map = new google.maps.Map map_canvas, map_options

  marker = new google.maps.Marker(
    position: latlng
    title: 'Черкассы, Рускополянский проезд 10'
  )

  marker.setMap map

google.maps.event.addDomListener window, 'load', initialize unless typeof google is 'undefined'
