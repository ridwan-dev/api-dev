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
        "title": "kurang (0-24.99% tutupan karang hidup)",
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
        "title": "cukup (25-49.99% tutupan karang hidup)",
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
        "title": "baik (50-74.99% tutupan karang hidup)",
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
        "title": "sangat baik (75-100% tutupan karang hidup)",
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
        "title": "rusak (tutupan < 50 dan kerapatan < 1000)",
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
        "title": "sedang (tutupan >= 50 dan kerapatan >= 1000)",
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
        "title": "baik (tutupan >= 75 dan kerapatan >= 1500)",
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
        "title": "miskin (tutupan < 29.9)",
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
        "title": "kurang sehat (tutupan > 29.9)",
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
        "title": "sehat (tutupan >= 60)",
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
);