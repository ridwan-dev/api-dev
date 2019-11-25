<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>CRMIS</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.3/jquery.min.js" integrity="sha384-I6F5OKECLVtK/BL+8iSLDEHowSAfUo76ZL9+kGAgTRdiByINKJaqTPH/QVNS1VDb" crossorigin="anonymous"></script>

    <!-- Maps -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBAl4y-7WWFw9VfR8jYDlUX4Kj5i5GyTS"></script>
    <script src="https://cdn.rawgit.com/googlemaps/v3-utility-library/master/markerclustererplus/src/markerclusterer.js"></script>

    <style>
        #map {
          height: 60vh;
          width: 60vw;
        }
    </style>
</head>
<body>
  <div id="map"></div>

  <script>
  <!-- GoogleMaps -->
  var geoJson = {
      "type": "FeatureCollection",
          "features": [{
          "type": "Feature",
              "properties": {
              "name": "Bielefeld"
          },
              "geometry": {
              "type": "Point",
                  "coordinates": [8.528849, 52.030656]
          }
      }, {
          "type": "Feature",
              "properties": {
              "name": "Herford"
          },
              "geometry": {
              "type": "Point",
                  "coordinates": [8.676780, 52.118003]
          }
      }, {
          "type": "Feature",
              "properties": {
              "name": "Guetersloh"
          },
              "geometry": {
              "type": "Point",
                  "coordinates": [8.383353, 51.902917]
          }
      }, {
          "type": "Feature",
              "properties": {
              "name": "Guetersloh2"
          },
              "geometry": {
              "type": "Point",
                  "coordinates": [8.38, 51.9]
          }
      }]
  };
  var map = null;
  var bounds = new google.maps.LatLngBounds();

  var boxText = document.createElement("div");
  boxText.style.cssText = "border: 1px solid black; margin-top: 8px; background: yellow; padding: 5px;";
  var markerClusterer = new MarkerClusterer(null,null,{imagePath: "extras/markerclusterer/images/m"});

  function initialize() {
      var mapOptions = {
          center: new google.maps.LatLng(52, 8),
          zoom: 4
      };
      map = new google.maps.Map(document.getElementById('map'), mapOptions);

      markerClusterer.setMap(map);
      google.maps.event.addListener(map.data, 'addfeature', function (e) {
          if (e.feature.getGeometry().getType() === 'Point') {
              var marker = new google.maps.Marker({
                  position: e.feature.getGeometry().get(),
                  title: e.feature.getProperty('name'),
                  map: map
              });
              markerClusterer.addMarker(marker);
              bounds.extend(e.feature.getGeometry().get());
              map.fitBounds(bounds);
              map.setCenter(e.feature.getGeometry().get());
          }
      });
      layer = map.data.loadGeoJson('json/stasiun');
      map.data.setMap(null);
  }
  google.maps.event.addDomListener(window, 'load', initialize);
  </script>
</body>
</html>
