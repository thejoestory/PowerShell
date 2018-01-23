$origin = "LAT,LON"
$destination = "LAT,LON"
$apikey = "YOUR API KEY"
$model = "best-guess" #best-guess, pesimistic, optimistic

$response = Invoke-RestMethod -Uri "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&traffic_model=best_guess&departure_time=now&origins=$origin&destinations=$destination&mode=driving&language=en-EN&sensor=false&key=$apikey" 
foreach ($row in $response.rows) {
$row[0].elements.duration.text
}
