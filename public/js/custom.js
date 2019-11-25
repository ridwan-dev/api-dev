$(document).ready(function(){
    if ($("#datatype") == 0) {
      $.get("/json/coral/conditiontable", function(data, status){
        $('#tabelKarang').append(data);
      });
    }

    $('#tahun').change(function(){
      $.get( "/json/getprov/"+$(this).val()+"/"+$("#datatype").val(), function( data ) {
          $('#areaProv').empty();
          $("<option />", {
                val: "0",
                text: "Choose Province"
            }).appendTo('#areaProv');
          $(data).each(function () {

            $("<option />", {
                val: this.id,
                text: this.provinsi
            }).appendTo('#areaProv');
          });

      });
    });

    $('#datatype').change(function(){
        var datatype = $("#datatype").val();

        if (datatype == 'mangrove'){
          $.get("/json/mangrove/conditiontable", function(data, status){
            $('#tabelMangrove').append(data);
          });
        }else if (datatype == 'seagrass'){
          $.get("/json/lamun/conditiontable", function(data, status){
            $('#tabelLamun').append(data);
          });
        }else{
          $.get("/json/coral/conditiontable", function(data, status){
            $('#tabelKarang').append(data);
          });
        }

        if (datatype == 'mangrove') {
          $("#divMangrove").css('display', 'block');
          $("#divLamun,#divCoral").css('display', 'none');
        }else if(datatype == 'seagrass'){
          $("#divLamun").css('display', 'block');
          $("#divMangrove,#divCoral").css('display', 'none');
        }else{
          $("#divMangrove, #divLamun").css('display', 'none');
        }

        $.get( "/json/getyear/"+datatype, function( data ) {
            $('#tahun').empty();
            $("<option />", {
                  val: "0",
                  text: "Please Choose Year"
              }).appendTo('#tahun');
            $(data).each(function () {
  
              $("<option />", {
                  val: this.year,
                  text: this.year
              }).appendTo('#tahun');
            });
  
        });
      });

    $('#areaProv').change(function(){
      $.get( "/json/getkab/"+$(this).val()+"/"+$('#tahun').val()+"/"+$('#datatype').val(), function( data ) {
          $('#areaKab').empty();
          $("<option />", {
                val: "0",
                text: "Please Choose SubDistrict or Location"
            }).appendTo('#areaKab');
          $(data).each(function () {
            $("<option />", {
                val: this.id,
                text: this.kabupaten
            }).appendTo('#areaKab');
          });

      });
    });
  });

      var gmap;
      var markers = [];
      //var bounds = new google.maps.LatLngBounds();

    function initMap(click = null) {
        if($('#datatype').val() == "coral"){
          $('#graphCoralArea').show();
          $('#graphCoralComparison').show();
        }else {
          $('#graphCoralArea').hide();
          $('#graphCoralComparison').hide();
        }
          
          var defaultLoc = new google.maps.LatLng(-6.626393, 119.824447);
          gmap = new google.maps.Map(document.getElementById('gmap'), {
              zoom: 4,
              center: defaultLoc,
              zoomControl: true,
              zoomControlOptions: {
                style: google.maps.ZoomControlStyle.SMALL
              },
              mapTypeId: 'terrain'
          });
          //console.log('json/stasiun/'+$('#tahun').val()+'/'+$('#areaKab').val());
          if ($("#datatype").val() != 0)
            gmap.data.loadGeoJson('json/stasiun/'+$('#tahun').val()+'/'+$('#areaKab').val()+'/'+$('#datatype').val());
          
          if(click == true){
            piechart('kab',$('#areaKab').val(),$('#tahun').val());
            chartCoral('kab',$('#areaKab').val(),$('#tahun').val());
            perbandingan('kab',$('#areaKab').val(),$('#tahun').val());
            $('#legendMap').html('');
            var mapdiv = document.getElementById('map');
            var legend = document.getElementById('legendMap');
            var div = document.createElement('div');
            
            div.innerHTML = '<img src="http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|FF0000"/> Poor<br/>' +
            '<img src="http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|FFFF00"/> Moderate<br/>' +
            '<img src="http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|008000"/> Good<br/>';
            if ($("#datatype").val() == 'coral')
            div.innerHTML += '<img src="http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|0000FF"/> Excellent<br/>' ;
            
            legend.appendChild(div);
            gmap.controls[google.maps.ControlPosition.LEFT_BOTTOM].push(legend);
            var legendDiv = document.createElement('div');
            legendDiv.setAttribute('id','legendMap');
            mapdiv.appendChild(legendDiv);
          }
          gmap.data.setStyle({visible: true});

          window.icons = {
              karang: 'img/red-dot.png',
              mangrove: 'img/green-dot.png',
              lamun: 'img/yellow-dot.png'
          };

          var infowindow = new google.maps.InfoWindow();
          google.maps.event.addListener(gmap.data, 'addfeature', function (e) {
              if (e.feature.getGeometry().getType() === 'Point') {
                  var marker = new google.maps.Marker({
                      position: e.feature.getGeometry().get(),
                      title: e.feature.getProperty('stat_code'),
                      map: gmap,
                      icon: {
                        url: e.feature.getProperty('icon'),
                        scale: 0
                      }
                  });

                  markers.push(marker);
                  marker.addListener('click', function(event) {
                    marker.setIcon(e.feature.getProperty('icon'))

                    document.getElementById("text").style.display = "block";
                    gmap.setCenter(e.feature.getGeometry().get());
                    if (gmap.getZoom() <= 8) {
                      gmap.setZoom(11);
                    }
                    var blank = '-';
                    
                    var id = e.feature.getProperty("id") === '' ? blank : e.feature.getProperty("id");
                    var stat_code = e.feature.getProperty("stat_code") === '' ? blank : e.feature.getProperty("stat_code");
                    var cruinfo = e.feature.getProperty("cruinfo") === '' ? '' : e.feature.getProperty("cruinfo");
                    var area = e.feature.getProperty("area") === '' ? blank : e.feature.getProperty("area");
                    var prov =  e.feature.getProperty("provinsi") === '' ? blank : e.feature.getProperty("provinsi");
                    var kabkot = e.feature.getProperty("kabupaten") === '' ? blank : e.feature.getProperty("kabupaten");
                    var location = e.feature.getProperty("location") === '' ? blank : e.feature.getProperty("location");
                    var desa = e.feature.getProperty("desa") === '' ? blank : e.feature.getProperty("desa");
                    var collector = e.feature.getProperty("collector") === '' ? blank : e.feature.getProperty("collector");
                    
                    var tipe = e.feature.getProperty("tipe") === '' ? blank : e.feature.getProperty("tipe");
                    var hc = e.feature.getProperty("hc") === '' ? blank : e.feature.getProperty("hc");
                    var fish = e.feature.getProperty("fish") === '' ? blank : e.feature.getProperty("fish");
                    var benthos = e.feature.getProperty("benthos") === '' ? blank : e.feature.getProperty("benthos");
                    var Biomass_Herbivorous_kgha = e.feature.getProperty("Biomass_Herbivorous_kgha") === '' ? blank : e.feature.getProperty("Biomass_Herbivorous_kgha");
                    var Biomass_Carnivorous_target_kgha = e.feature.getProperty("Biomass_Carnivorous_target_kgha") === '' ? blank : e.feature.getProperty("Biomass_Carnivorous_target_kgha");
                    
                    document.getElementById('tStat').textContent = 'Station ' + stat_code;
                    //document.getElementById('tArea').textContent = area;
                    document.getElementById('tProv').textContent = prov;
                    document.getElementById('tKab').textContent = kabkot;
                    document.getElementById('tLoc').textContent = location;
                    // document.getElementById('tDesa').textContent = desa;
                    // document.getElementById('tCol').textContent = collector;
                    // document.getElementById('tIdStasiun').value = id;
                    // document.getElementById('tCruinfo').value = cruinfo;
                    // document.getElementById('ecoval').value = 1;
                    document.getElementById('tHc').textContent = hc;
                    document.getElementById('Biomass_Herbivorous_kgha').textContent = Biomass_Herbivorous_kgha;
                    document.getElementById('Biomass_Carnivorous_target_kgha').textContent = Biomass_Carnivorous_target_kgha;
                    
                    // $('#statCoral').show();
                    if (tipe == 'coral') {
                      $('#statCoral').show();
                      $('#statLam').hide();
                      $('#statMangrove').hide();
                    } else if ( tipe == 'seagrass') {
                        var tTutupan = e.feature.getProperty("tutupan") === '' ? blank : e.feature.getProperty("tutupan");
                        var tJumJenis = e.feature.getProperty("n_jenis") === '' ? blank : e.feature.getProperty("n_jenis");
                    
                        $('#statCoral').hide();
                        $('#statLam').show();
                        $('#statMangrove').hide();
                        document.getElementById('tTutupan').textContent = tTutupan;
                        document.getElementById('tJumJenis').textContent = tJumJenis;
                    
                    } else if (tipe == 'mangrove') {
                        var tKerapatan = e.feature.getProperty("kerapatan") === '' ? blank : e.feature.getProperty("kerapatan");
                        var tTutupan = e.feature.getProperty("cover") === '' ? blank : e.feature.getProperty("cover");
                       
                        $('#statCoral').hide();
                        $('#statLam').hide();
                        $('#statMangrove').show();

                        document.getElementById('tTutupanMangrove').textContent = tTutupan;
                        document.getElementById('tKerapatanMangrove').textContent = tKerapatan;
                    
                    }
                      document.getElementById('tHc').textContent = hc;
                    //   // document.getElementById('tFish').textContent = fish;
                    document.getElementById('tHc').textContent = hc;
                    document.getElementById('Biomass_Herbivorous_kgha').textContent = Biomass_Herbivorous_kgha;
                    document.getElementById('Biomass_Carnivorous_target_kgha').textContent = Biomass_Carnivorous_target_kgha;
                    
                    //   // document.getElementById('tFish').textContent = fish;
                    //   // document.getElementById('tBenthos').textContent = benthos;
                    // } else {
                    //   $('#statCoral').hide();
                    //   $('#statLam').show();
                    //   // document.getElementById('tTutupan').textContent = '-';
                    //   // document.getElementById('tKerapatan').textContent = '-';
                    // }



                    infowindow.setContent("Station " + stat_code);
                    infowindow.setPosition(e.feature.getGeometry().get());
                    infowindow.setOptions({pixelOffset: new google.maps.Size(0,-30)});
                    infowindow.open(gmap);

                    //getTahun(id);
                    // piechart('titik',id,'9999');
                    // chartCoral('titik',id,'9999');
                    // upGraphBot(cruinfo);
                    // upGraphEco(cruinfo);
                  });
              }
          });
  }

  function moveMap() {
    var e = document.getElementById("areaTren");
    var area = e.options[e.selectedIndex].value;
    if (area == 1) {
      gmap.setCenter({lat: -0.534868, lng: 106.820292});
      gmap.setZoom(5);
    } else if (area == 2) {
      gmap.setCenter({lat: -1.378633, lng: 118.038204});
      gmap.setZoom(5);
    } else if (area == 3) {
      gmap.setCenter({lat: -1.326988, lng: 128.695573});
      gmap.setZoom(5);
    } else {
      gmap.setCenter({lat: -1.626393, lng: 119.824447});
      gmap.setZoom(4);
    }
  }

  function goMap() {
    // var e = document.getElementById("areaKab");
    // //gmap.data.loadGeoJson('json/stasiun_search');
    // var kab = e.options[e.selectedIndex].value;
    // if (kab == 1201) {
    //   gmap.setCenter({lat: 1.202901, lng: 97.519414});
    //   gmap.setZoom(8);
    // } else if (kab == 1301) {
    //   gmap.setCenter({lat: -2.330293, lng: 99.827720});
    //   gmap.setZoom(7);
    // } else {
    //   gmap.setCenter({lat: -1.626393, lng: 119.824447});
    //   gmap.setZoom(4);
    // }
  }