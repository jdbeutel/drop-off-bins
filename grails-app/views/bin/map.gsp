<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    %{--<g:javascript library="jquery"/>--}%
    %{--<r:require module="jquery"/>--}%
    %{--<r:layoutResources/>--}%
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <style type="text/css">
    html {
        height: 100%
    }

    body {
        height: 100%;
        margin: 0;
        padding: 0
    }

    #map-canvas {
        height: 100%
    }
    </style>
    <script type="text/javascript"
            src="https://maps.googleapis.com/maps/api/js?v=3&key=AIzaSyDNd80ElMFLwFT4gsAfeBwoaRJqyYfQwxg&sensor=false">
    </script>
    <script type="text/javascript">

        function detectBrowser() {
            var useragent = navigator.userAgent;
            var mapdiv = document.getElementById("map-canvas");

            if (useragent.indexOf('iPhone') != -1 || useragent.indexOf('Android') != -1) {
                mapdiv.style.width = '100%';
                mapdiv.style.height = '100%';
            }
            else {
                mapdiv.style.width = '600px';
                mapdiv.style.height = '800px';
            }
        }

        function initialize() {
            detectBrowser();
            var mapOptions = {
                center: new google.maps.LatLng(${avgLat}, ${avgLng}),
                zoom: 11,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
            var infowindow = new google.maps.InfoWindow({content: 'not set yet'});
            addBins(map, infowindow);
        }

        function addBins(map, infowindow) {
            <g:each var="bin" in="${bins}">
            addBin(map, infowindow, "${bin.name}", ${bin.lat}, ${bin.lng}, '${infowindows[bin]}');
            </g:each>
        }

        function addBin(map, infowindow, name, lat, lng, content) {
            var m = new google.maps.Marker({
                position: new google.maps.LatLng(lat, lng),
                title: name
            });
            m.setMap(map);
            google.maps.event.addListener(m, 'click', function() {
                infowindow.close();
                infowindow.setContent(content);
                infowindow.open(map, m);
                google.maps.event.addListener(document.getElementById("zoom"), 'click', function(mouseEvent) {
                    mouseEvent.stop();
                    alert('zoom was clicked');
                    map.setCenter( new google.maps.LatLng(lat, lng));
                    map.setZoom(15);
                });
            });
//            google.maps.event.addListener(m, 'click', function() {
//                infowindow.close();
//                infowindow.setContent(content);
//                infowindow.open(map, m);
//                $(function() {
//                    $('#zoom').click(function(event) {
//                        event.preventDefault();
//                        alert('zoom was clicked');
//                        map.setCenter( new google.maps.LatLng(lat, lng));
//                        map.setZoom(15);
//                    });
//                });
//            });
        }

        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
</head>

<body>
<div id="map-canvas"/>
</body>
</html>