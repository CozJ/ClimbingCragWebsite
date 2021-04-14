// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
var myMap = L.map('mapid', { zoomControl: false }).setView([52.3338, -1.2813], 7);

L.control.zoom({
    position: 'bottomleft'
}).addTo(myMap);

L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    minZoom: 7,
    id: 'mapbox/streets-v11',
    tileSize: 512,
    zoomOffset: -1,
    accessToken: 'pk.eyJ1IjoiY296aiIsImEiOiJja21oMGdnMnIwMm9nMndwa3E2OWttYmE3In0.4Q-wJD3k3PGithpbOhnfBw'
}).addTo(myMap);

$.ajax({
    url: "/Crags/GetLocations",
    success: function (data) {
        $(data).each(function (index, item) {
            console.log(data);
            var lat = item.latitude;
            var long = item.longitude;
            var name = item.cragName;
            var cragId = item.cragId;
            var link = "/Crags/CragDetails/" + encodeURI(cragId);
            L.marker([lat, long]).bindPopup("<a href=" + link + "><h4>" + name + "</h4></a>").addTo(myMap);
        })
    }
})