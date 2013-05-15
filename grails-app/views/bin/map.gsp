<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
    html { height: 100% }
    body { height: 100%; margin: 0; padding: 0 }
    #map-canvas { height: 100% }
    </style>
    <script type="text/javascript"
            src="https://maps.googleapis.com/maps/api/js?v=3&key=AIzaSyDNd80ElMFLwFT4gsAfeBwoaRJqyYfQwxg&sensor=false">
    </script>
    <script type="text/javascript">

        function detectBrowser() {
            var useragent = navigator.userAgent;
            var mapdiv = document.getElementById("map-canvas");

            if (useragent.indexOf('iPhone') != -1 || useragent.indexOf('Android') != -1 ) {
                mapdiv.style.width = '100%';
                mapdiv.style.height = '100%';
            } else {
                mapdiv.style.width = '600px';
                mapdiv.style.height = '800px';
            }
        }

        function initialize() {
            detectBrowser();
            var mapOptions = {
                // center: new google.maps.LatLng(-34.397, 150.644),
                center: new google.maps.LatLng(${avgLat}, ${avgLng}),
                zoom: 11,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
            addBins(map);
        }

        function addBins(map) {
            <g:each var="bin" in="${bins}">
            // bin is $bin
            new google.maps.Marker({
                position: new google.maps.LatLng(${bin.lat}, ${bin.lng}),
                title: '${bin.name}'
            }).setMap(map);
            </g:each>
        }

        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
</head>
<body>
<div id="map-canvas"/>
</body>
</html>