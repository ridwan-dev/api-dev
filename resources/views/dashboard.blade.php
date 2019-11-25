@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <form class="select-area form-inline">
              <div class="form-group">
                <select id="datatype"  onchange="" class="form-control">
                  <option value="0" selected>@lang("landing.data.choose") @lang("landing.data.ecosystem")</option>
                  <option value="coral">Coral</option>
                  <option value="seagrass">Seagrass</option>
                  <option value="mangrove">Mangrove</option>
                </select>&nbsp;

                <select id="tahun" onchange="" class="form-control">
                  <option value="0" selected>@lang("landing.data.choose") @lang("landing.data.year")</option>
                </select>
                &nbsp;

                <select id="areaProv" class="form-control">
                  <option value="" selected>@lang("landing.data.choose") @lang("landing.data.province")</option>
                </select>&nbsp;

                <select id="areaKab" class="form-control" >
                  <option value="" selected>@lang("landing.data.choose") @lang("landing.data.city")</option>
                </select>&nbsp;

                <button type="button" id="showMap" onclick="initMap(true)" class="btn btn-primary">@lang("landing.data.show")</button>
              </div>
            </form>
            <div class="panel panel-default">
                <div class="panel-heading">Distribution Map</div>

                <div class="panel-body">
                    <div id="map">
                      <div id="gmap" class="fill"></div>
                      <div id="olmap" class="fill"></div>
                    </div>
                    <div id="legendMap"></div>

                    <h3 id="tStat"></h3>
                    <input type="hidden" id="tIdStasiun"/>
                    <input type="hidden" id="tCruinfo"/>
                    <div class="row" id="text" style="display:none">
                        <div class="col-md-3">
                          <!--strong>Wilayah:</strong> <span id="tArea"></span><br /-->
                          <strong>@lang("landing.data.province"):</strong> <span id="tProv"></span><br />
                          <strong>@lang("landing.data.city"):</strong> <span id="tKab"></span>
                        </div>
                        <div class="col-md-3">
                          <strong>Location:</strong> <span id="tLoc"></span><br />
                          <!--strong>Desa:</strong> <span id="tDesa"></span><br />
                          <strong>Collector:</strong> <span id="tCol"></span-->
                        </div>
                        <div class="col-md-6">
                          <div class="statCoral" id="statCoral">
                          <strong>Hard Coral:</strong> <span id="tHc"></span> (% cover)<br />
                          <strong>Biomass Herbivorous (kg/ha) : </strong> <span id="Biomass_Herbivorous_kgha"></span> <br />
                          <strong>Biomass Carnivorous / target  (kg/ha) :</strong> <span id="Biomass_Carnivorous_target_kgha"></span> <br />
                            <!--strong>Fish Abundance:</strong> <span id="tFish"></span> (ind/ha)<br />
                            <strong>Benthos:</strong> <span id="tBenthos"></span> (ind)<br /-->
                          </div>
                          <div id="statLam">
                            <strong>% Cover:</strong> <span id="tTutupan"></span><br />
                            <strong>Number of Species:</strong> <span id="tJumJenis"></span><br />
                          </div>
                          <div id="statMangrove">
                            <strong>% Cover:</strong> <span id="tTutupanMangrove"></span><br />
                            <strong>Density:</strong> <span id="tKerapatanMangrove"> pohon/Ha </span><br />
                          </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-10 col-md-offset-1" id="divLamun" style="display:none">
            <div class="panel panel-default">
                <div class="panel-heading">Condition of @lang("landing.data.seagrass") in Monitoring Sites (number of stations)</div>

                <div class="panel-body">
                  <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#grafikLamun" aria-controls="grafikLamun" role="tab" data-toggle="tab">Grafik</a></li>
                    <li role="presentation"><a href="#tabelPanelLamun" aria-controls="tabelLamun" role="tab" data-toggle="tab">@lang("landing.data.table")</a></li>
                  </ul>

                  <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="grafikLamun">
                      <div id="chartrenLamun" style="height: 500px"></div>

                      </div>
                      <div role="tabpanel" class="tab-pane" id="tabelPanelLamun">
                        <table class="table table-hover" align="center">
                          <thead>
                            <tr>
                              <th align="center">@lang("landing.data.year")</td>
                              <th align="center"><span class="rank1">@lang("landing.data.poor")</span></td>
                              <th align="center"><span class="rank2">@lang("landing.data.unwell")</span></td>
                              <th align="center"><span class="rank3">@lang("landing.data.healthy")</span></td>
                            </tr>
                          </thead>
                          <tbody id="tabelLamun">
                            
                          </tbody>
                        </table>
                        <p class="ket">
                          <span class="rank1"><strong>@lang("landing.data.poor")</strong></span> ( @lang("landing.data.seagrass_poor"))<br />
                          <span class="rank2"><strong>@lang("landing.data.unwell")</strong></span> ( @lang("landing.data.seagrass_unwell"))<br />
                          <span class="rank3"><strong>@lang("landing.data.healthy")</strong></span> ( @lang("landing.data.seagrass_healthy"))<br />
                        </p>
                      </div>
                    </div>
                  </div>
            </div>
        </div>

        <div class="col-md-10 col-md-offset-1" id="divMangrove" style="display:none">
            <div class="panel panel-default">
                <div class="panel-heading">Condition of Mangrove in monitoring sites (number of stations)</div>

                <div class="panel-body">
                  <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#grafikMangrove" aria-controls="grafikMangrove" role="tab" data-toggle="tab">Grafik</a></li>
                    <li role="presentation"><a href="#tabelPanelMangrove" aria-controls="tabelMangrove" role="tab" data-toggle="tab">@lang("landing.data.table")</a></li>
                  </ul>

                  <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="grafikMangrove">
                      <div id="chartrenMangrove" style="height: 500px"></div>

                      </div>
                      <div role="tabpanel" class="tab-pane" id="tabelPanelMangrove">
                        <table class="table table-hover" align="center">
                          <thead>
                            <tr>
                              <th align="center">@lang("landing.data.year")</td>
                              <th align="center"><span class="rank1">@lang("landing.data.broken")</span></td>
                              <th align="center"><span class="rank2">@lang("landing.data.normal")</span></td>
                              <th align="center"><span class="rank3">@lang("landing.data.good")</span></td>
                            </tr>
                          </thead>
                          <tbody id="tabelMangrove">
                            
                          </tbody>
                        </table>
                        <p class="ket">
                          <span class="rank1"><strong>@lang("landing.data.broken")</strong></span> ( @lang("landing.data.mangrove_broken"))<br />
                          <span class="rank2"><strong>@lang("landing.data.normal")</strong></span> (@lang("landing.data.mangrove_normal"))<br />
                          <span class="rank3"><strong>@lang("landing.data.good")</strong></span> ( @lang("landing.data.mangrove_good"))<br />
                        </p>
                      </div>
                    </div>
                  </div>
            </div>
        </div>
        <div class="col-md-10 col-md-offset-1" id="divCoral">
            <div class="panel panel-default">
                <div class="panel-heading">Condition of Coral Reefs in monitoring sites (number of stations)</div>

                <div class="panel-body">
                  <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#grafik" aria-controls="grafik" role="tab" data-toggle="tab">Grafik</a></li>
                    <li role="presentation"><a href="#tabel" aria-controls="tabel" role="tab" data-toggle="tab">@lang("landing.data.table")</a></li>
                  </ul>

                  <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="grafik">
                      <div id="chartren"></div>

                      </div>
                      <div role="tabpanel" class="tab-pane" id="tabel">
                        <table class="table table-hover">
                          <thead>
                            <tr>
                              <th align="center">@lang("landing.data.year")</td>
                              <th align="center"><span class="rank1">@lang("landing.data.bad")</span></td>
                              <th align="center"><span class="rank2">@lang("landing.data.enough")</span></td>
                              <th align="center"><span class="rank3">@lang("landing.data.good")</span></td>
                              <th align="center"><span class="rank4">@lang("landing.data.very_good")</span></td>
                            </tr>
                          </thead>
                          <tbody id="tabelKarang">
                            
                          </tbody>
                        </table>
                        <p class="ket">
                          <span class="rank1"><strong>@lang("landing.data.bad")</strong></span> ( @lang('landing.data.coral_bad'))<br />
                          <span class="rank2"><strong>@lang("landing.data.enough")</strong></span> @lang('landing.data.coral_enough'))<br />
                          <span class="rank3"><strong>@lang("landing.data.good")</strong></span> ( @lang('landing.data.coral_good'))<br />
                          <span class="rank4"><strong>@lang("landing.data.very_good")</strong></span> ( @lang('landing.data.coral_very_good'))
                        </p>
                      </div>
                    </div>
                  </div>
            </div>
        </div>
    </div>

    <div class="row" id="graphCoralArea" style="display:none">
      <div class="col-md-3 col-md-offset-1">
          <div class="panel panel-default panelChartPie">
              <div class="panel-heading">@lang("landing.data.hc_dc_comparison")</div>

              <div class="panel-body">
                  <!--div class="form-group">
                    <label for="year">Pilih tahun &nbsp;</label>
                    <select id="year" class="form-control" disabled="">
                      @foreach($years as $year)
                        <option value="{{ $year->year }}">{{ $year->year }}</option>
                      @endforeach
                    </select>&nbsp;
                  </div-->
                  <div id="chartpie">@lang("landing.data.choose_parameter")</div>

                  <p class="coralInfo">
                    <br/><br/>
                    <span class="coralHard">HC - Hard Coral</span><br/>
                    <span class="coralDead">DC - Dead Coral</span><br/>
                    <span class="coralAlgae">DCA - Dead Coral Algae</span>
                  </p>

                  <script>

                function piechart(tipe,id,year){
                    AmCharts.addInitHandler(function(chartPie) {
                      if (chartPie.dataLoader === undefined || chartPie.dataLoader.length === 0) {
                        emptyChartPie();
                      }
                    }, ["pie"]);

                    var chartPie = AmCharts.makeChart( "chartpie", {
                      "type": "pie",
                      "startDuration": 0,
                      "dataLoader": {
                        "url": "json/corals/"+tipe+'/'+id+'/'+year
                      },
                      "titleField": "title",
                      "valueField": "value",
                      "colorField": "color",
                      "labelColorField": "color",
                      "labelRadius": 5,
                      "radius": "42%",
                      "innerRadius": "55%",
                      "labelText": "[[title]]",
                      "alpha": 1,
                      "export": {
                      "enabled": false
                      }
                    } );
                }
                  </script>
              </div>
          </div>
      </div>

      <div class="col-md-7">
        <div class="panel panel-default panelChartCoral">
            <div class="panel-heading">@lang("landing.data.coral_ecosystem_condition")</div>

            <div class="panel-body">
                <!--label for="year">Pilih ekosistem &nbsp;</label>
                <form class="form-inline" role="form">
                  <select id="ecoval" class="form-control">
                    <option value="1">Coral reef</option>
                    <option value="2">Seagrass</option>
                    <option value="3">Mangrove</option>
                  </select>&nbsp;
                </form-->
                <div id="chartcoral">@lang("landing.data.choose_parameter")</div>

              <script>
              function chartCoral(tipe,id,year){
                AmCharts.addInitHandler(function(chartCoral) {
                  if (chartCoral.dataLoader === undefined || chartCoral.dataLoader.length === 0) {
                    emptyChartCoral();
                  }
                }, ["pie"]);
                var chartCoral = AmCharts.makeChart( "chartcoral", {
                  "type": "radar",
                  "dataLoader": {
                    "url": "json/coral_bot/"+tipe+'/'+id+'/'+year
                  },
                  "theme": "black",
                  "valueAxes": [ {
                    "axisTitleOffset": 20,
                    "minimum": 0,
                    "axisAlpha": 0.15
                  } ],
                  "startDuration": 2,
                  "graphs": [ {
                    "balloonText": "[[value]]",
                    "bullet": "round",
                    "lineThickness": 2,
                    "valueField": "value"
                  } ],
                  "categoryField": "species",
                  "export": {
                    "enabled": false
                  }
                } );
              }
                </script>
            </div>
        </div>
      </div>
    </div>

    <div class="row" id="graphCoralComparison" style="display:none">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">@lang("landing.data.avg_graphic_comparison")</div>

                <div class="panel-body">
                    <div id="chartdiv">@lang("landing.data.choose_parameter")</div>

                    <script>
                    function perbandingan(tipe,id,year){

                    var chartdiv = AmCharts.makeChart("chartdiv", {
                      "type": "serial",
                      "dataLoader": {
                        "url": "json/ecosystem/"+tipe+'/'+id+'/'+year
                      },
                      "theme": "black",
                      "legend": {
                        "autoMargins": false,
                        "borderAlpha": 0.2,
                        "equalWidths": false,
                        "horizontalGap": 10,
                        "markerSize": 10,
                        "useGraphSettings": true,
                        "valueAlign": "left",
                        "valueWidth": 0,
                        "align": "center"
                      },
                      "valueAxes": [{
                        "stackType": "regular",
                        "axisAlpha": 0.3,
                        "gridAlpha": 0,
                        "labelsEnabled": false
                      }],
                      "graphs": [{
                        "balloonText": "[[title]], [[category]]<br><span style='font-size:14px;'><strong>[[value]]</strong> ([[percents]]%)</span>",
                        "fillAlphas": 0.9,
                        "fontSize": 11,
                        "labelText": "[[value]]",
                        "lineAlpha": 0.5,
                        "title": "HC (Hard Coral)",
                        "type": "column",
                        "valueField": "hc"
                      }, {
                        "balloonText": "[[title]], [[category]]<br><span style='font-size:14px;'><strong>[[value]]</strong> ([[percents]]%)</span>",
                        "fillAlphas": 0.9,
                        "fontSize": 11,
                        "labelText": "[[value]]",
                        "lineAlpha": 0.5,
                        "title": "SP (Sponge)",
                        "type": "column",
                        "valueField": "sp"
                      }, {
                        "balloonText": "[[title]], [[category]]<br><span style='font-size:14px;'><strong>[[value]]</strong> ([[percents]]%)</span>",
                        "fillAlphas": 0.9,
                        "fontSize": 11,
                        "labelText": "[[value]]",
                        "lineAlpha": 0.5,
                        "title": "OT (Other Biota)",
                        "type": "column",
                        "valueField": "ot"
                      }, {
                        "balloonText": "[[title]], [[category]]<br><span style='font-size:14px;'><strong>[[value]]</strong> ([[percents]]%)</span>",
                        "fillAlphas": 0.9,
                        "fontSize": 11,
                        "labelText": "[[value]]",
                        "lineAlpha": 0.5,
                        "title": "Soft Coral (SC)",
                        "type": "column",
                        "valueField": "sc"
                      }, {
                        "balloonText": "[[title]], [[category]]<br><span style='font-size:14px;'><strong>[[value]]</strong> ([[percents]]%)</span>",
                        "fillAlphas": 0.9,
                        "fontSize": 11,
                        "labelText": "[[value]]",
                        "lineAlpha": 0.5,
                        "title": "Recent Dead Coral (DC)",
                        "type": "column",
                        "valueField": "dc"
                      }, {
                        "balloonText": "[[title]], [[category]]<br><span style='font-size:14px;'><strong>[[value]]</strong> ([[percents]]%)</span>",
                        "fillAlphas": 0.9,
                        "fontSize": 11,
                        "labelText": "[[value]]",
                        "lineAlpha": 0.5,
                        "title": "Dead Coral with Algae (DCA)",
                        "type": "column",
                        "valueField": "dca"
                      }, {
                        "balloonText": "[[title]], [[category]]<br><span style='font-size:14px;'><strong>[[value]]</strong> ([[percents]]%)</span>",
                        "fillAlphas": 0.9,
                        "fontSize": 11,
                        "labelText": "[[value]]",
                        "lineAlpha": 0.5,
                        "title": "Fleshly Seweed (FS)",
                        "type": "column",
                        "valueField": "fs"
                      }, {
                        "balloonText": "[[title]], [[category]]<br><span style='font-size:14px;'><strong>[[value]]</strong> ([[percents]]%)</span>",
                        "fillAlphas": 0.9,
                        "fontSize": 11,
                        "labelText": "[[value]]",
                        "lineAlpha": 0.5,
                        "title": "Rubble (R)",
                        "type": "column",
                        "valueField": "r"
                      }, {
                        "balloonText": "[[title]], [[category]]<br><span style='font-size:14px;'><strong>[[value]]</strong> ([[percents]]%)</span>",
                        "fillAlphas": 0.9,
                        "fontSize": 11,
                        "labelText": "[[value]]",
                        "lineAlpha": 0.5,
                        "title": "Sand (S)",
                        "type": "column",
                        "valueField": "s"
                      }, {
                        "balloonText": "[[title]], [[category]]<br><span style='font-size:14px;'><strong>[[value]]</strong> ([[percents]]%)</span>",
                        "fillAlphas": 0.9,
                        "fontSize": 11,
                        "labelText": "[[value]]",
                        "lineAlpha": 0.5,
                        "title": "Silt (SI)",
                        "type": "column",
                        "valueField": "si"
                      }],
                      "categoryField": "stasiun",
                      "categoryAxis": {
                          "gridPosition": "start",
                          "axisAlpha": 0,
                          "gridAlpha": 0,
                          "position": "left",
                          "autoWrap": true
                      },
                      "export": {
                        "enabled": false
                      }

                    });
                    }
                  </script>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="{{ url('js/custom.js') }}" type="text/javascript"></script>
@include("custom_js")
<!-- <script src="{{ url('js/customchart.js') }}" type="text/javascript"></script> -->


@endsection
