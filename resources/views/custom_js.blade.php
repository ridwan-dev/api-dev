<?php 
echo '<script type="text/javascript">
var chartTren = AmCharts.makeChart("chartren", {
    "type": "serial",
    "dataLoader": {
    "url": "json/coral/condition"
    },
    "theme": "black",
    "legend": {
    "horizontalGap": 10,
    "maxColumns": 1,
    "position": "bottom",
    "useGraphSettings": true,
    "markerSize": 10,
    "marginTop": 20
    },
    "dataDateFormat": "YYYY",
    "valueAxes": [{
        "id":"v1",
        "axisAlpha": 0,
        "position": "left"
    }],
    "graphs": [{
    "id": "g1",
        "bullet": "round",
        "bulletBorderAlpha": 1,
        "bulletSize": 5,
        "hideBulletsCount": 50,
        "lineThickness": 2,
        "title": "'.\Lang::get('landing.data.coral_bad').'",
        "useLineColorForBulletBorder": true,
        "valueField": "value"
    },
            {
    "id": "g2",
        "bullet": "round",
        "bulletBorderAlpha": 1,
        "bulletSize": 5,
        "hideBulletsCount": 50,
        "lineThickness": 2,
        "title": "'.\Lang::get('landing.data.coral_enough').'",
        "useLineColorForBulletBorder": true,
        "valueField": "value2"
    },
            {
"id": "g3",
        "bullet": "round",
        "bulletBorderAlpha": 1,
        "bulletSize": 5,
        "hideBulletsCount": 50,
        "lineThickness": 2,
        "title": "'.\Lang::get('landing.data.coral_good').'",
        "useLineColorForBulletBorder": true,
        "valueField": "value3"
    },
            {
"id": "g4",
        "bullet": "round",
        "bulletBorderAlpha": 1,
        "bulletSize": 5,
        "hideBulletsCount": 50,
        "lineThickness": 2,
        "title": "'.\Lang::get('landing.data.coral_very_good').'",
        "useLineColorForBulletBorder": true,
        "valueField": "value4"
    }
],
    "categoryField": "date",
    "categoryAxis": {
        "parseDates": true,
        "minPeriod": "YYYY",
        "dashLength": 1,
        "minorGridEnabled": true,
        "position": "bottom"
    },
    "export": {
        "enabled": false
    }
}
);

var chartTrenMangrove = AmCharts.makeChart("chartrenMangrove", {
    "type": "serial",
    "dataLoader": {
      "url": "json/mangrove/condition"
    },
    "theme": "black",
    "legend": {
      "horizontalGap": 10,
      "maxColumns": 1,
      "position": "bottom",
      "useGraphSettings": true,
      "markerSize": 10,
      "marginTop": 20
    },
    "dataDateFormat": "YYYY",
    "valueAxes": [{
      "id":"v1",
      "axisAlpha": 0,
      "position": "left"
    }],
    "graphs": [{
        "id": "g1",
        "bullet": "round",
        "bulletBorderAlpha": 1,
        "bulletSize": 5,
        "hideBulletsCount": 50,
        "lineThickness": 2,
        "title": "'.\Lang::get('landing.data.mangrove_broken').'",
        "useLineColorForBulletBorder": true,
        "valueField": "rusak"
      },
      {
        "id": "g2",
        "bullet": "round",
        "bulletBorderAlpha": 1,
        "bulletSize": 5,
        "hideBulletsCount": 50,
        "lineThickness": 2,
        "title": "'.\Lang::get('landing.data.mangrove_normal').'",
        "useLineColorForBulletBorder": true,
        "valueField": "sedang"
    },
    {
        "id": "g3",
        "bullet": "round",
        "bulletBorderAlpha": 1,
        "bulletSize": 5,
        "hideBulletsCount": 50,
        "lineThickness": 2,
        "title": "'.\Lang::get('landing.data.mangrove_good').'",
        "useLineColorForBulletBorder": true,
        "valueField": "baik"
    },
    
],
    "categoryField": "date",
    "categoryAxis": {
        "parseDates": true,
        "minPeriod": "YYYY",
        "dashLength": 1,
        "minorGridEnabled": true,
        "position": "bottom"
    },
    "export": {
        "enabled": false
    }
}
);

var chartTrenLamun = AmCharts.makeChart("chartrenLamun", {
    "type": "serial",
    "dataLoader": {
      "url": "json/lamun/condition"
    },
    "theme": "black",
    "legend": {
      "horizontalGap": 10,
      "maxColumns": 1,
      "position": "bottom",
      "useGraphSettings": true,
      "markerSize": 10,
      "marginTop": 20
    },
    "dataDateFormat": "YYYY",
    "valueAxes": [{
      "id":"v1",
      "axisAlpha": 0,
      "position": "left"
    }],
    "graphs": [{
        "id": "g1",
        "bullet": "round",
        "bulletBorderAlpha": 1,
        "bulletSize": 5,
        "hideBulletsCount": 50,
        "lineThickness": 2,
        "title": "'.\Lang::get('landing.data.seagrass_poor').'",
        "useLineColorForBulletBorder": true,
        "valueField": "miskin"
      },
      {
        "id": "g2",
        "bullet": "round",
        "bulletBorderAlpha": 1,
        "bulletSize": 5,
        "hideBulletsCount": 50,
        "lineThickness": 2,
        "title": "'.\Lang::get('landing.data.seagrass_unwell').')",
        "useLineColorForBulletBorder": true,
        "valueField": "kurang_sehat"
    },
    {
        "id": "g3",
        "bullet": "round",
        "bulletBorderAlpha": 1,
        "bulletSize": 5,
        "hideBulletsCount": 50,
        "lineThickness": 2,
        "title": "'.\Lang::get('landing.data.seagrass_healthy').'",
        "useLineColorForBulletBorder": true,
        "valueField": "sehat"
    },
    
],
    "categoryField": "date",
    "categoryAxis": {
        "parseDates": true,
        "minPeriod": "YYYY",
        "dashLength": 1,
        "minorGridEnabled": true,
        "position": "bottom"
    },
    "export": {
        "enabled": false
    }
}
);</script>';

?>