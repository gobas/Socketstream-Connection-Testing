This Service Accepts socketconncetion and has one event "ping" in the "app" namespace.
The methods requires an integer as param. the integer has to be the integer of the last response
plus one. if the client sends the correct integer the request is saved as successfull in redis
if not the request is saved as unsuccessfull.

this is a very simple way to measure connection quality of socket.io