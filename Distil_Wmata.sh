curl -X GET "https://api.wmata.com/StationPrediction.svc/json/GetPrediction/K04?api_key=kfgpmgvfgacx98de9q3xazww"|  python -mjson.tool | grep -B 6 -A 4 OR
