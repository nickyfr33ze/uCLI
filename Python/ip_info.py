import os
import urllib. request as urllib2
import json

while True:
    ip = input("What is your target IP: ")
    url = "http://ip-api.com/json/"
    response = urllib2.urlopen(url + ip)
    data = response. read ()
    values = json. loads(data)
    
    print("IP: " + values ["query"])
    print("City: " + values["city"])
    print("State: " + values["regionName"])
    print("ZIP: " + values["zip"])
    print("Latitude: " + str(values["lat"]))
    print("Longitude: " + str(values["lon"]))
    print("Google Maps: https://www.google.com/maps/search/?api=1&query=" + str(values["lat"]) + "," + str(values["lon"]))
    print("ISP: " + values["isp"])
    print("Country: " + values ["country"])
    print("Region: " + values ["region"])
    print("Timezone: " + values ["timezone"])
    break