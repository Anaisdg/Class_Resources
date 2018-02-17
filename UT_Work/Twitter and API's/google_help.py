
# Create code to answer each of the following questions.
# Hint: You will need multiple target urls and multiple API requests.

# Dependencies
import requests
import json

#Google Api key
gkey = "AIzaSyDDvD0Y543t8I0Y5wPJdZIm_jmRt94xFmc"

params = {
    "input": 'airports',
    "key": gkey,
    "components=country:": "us",
    "types" : "airport"
    
}

base_url = "https://developers.google.com/places/web-service/autocomplete/json?"

response = requests.get(base_url, params=params)
# Print the assembled URL
print(response.url)

#gooogle api places autocomplete documentation https://developers.google.com/places/web-service/autocomplete