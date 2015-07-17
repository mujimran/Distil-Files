curl -X GET "https://api.wmata.com/StationPrediction.svc/json/GetPrediction/K04?api_key=kfgpmgvfgacx98de9q3xazww"|  python -mjson.tool | grep -B 6 -A 4 OR

#Parsing JSON from command line using Python - http://www.cambus.net/parsing-json-from-command-line-using-python/
#Preceding and following lines - http://stackoverflow.com/questions/9081/grep-a-file-but-show-several-surrounding-lines