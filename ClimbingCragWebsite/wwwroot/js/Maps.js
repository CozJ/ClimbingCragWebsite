// mapbox / leaflet javascript
var myMap = L.map('mapid', {zoomControl:false}).setView([51.50, 0.12], 13);

L.control.zoom({
    position: 'bottomleft'
}).addTo(myMap);

L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox/streets-v11',
    tileSize: 512,
    zoomOffset: -1,
    accessToken: 'pk.eyJ1IjoiY296aiIsImEiOiJja21oMGdnMnIwMm9nMndwa3E2OWttYmE3In0.4Q-wJD3k3PGithpbOhnfBw'
}).addTo(myMap);

var marker = L.marker([51.50, 0.12]).addTo(myMap);