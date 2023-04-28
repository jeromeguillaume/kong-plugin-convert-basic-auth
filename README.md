# Kong plugin: Convert Basic Authorization
This plugin gets 2 HTTP headers (by default ```X-Client-Id``` and ```X-Client-Secret```) in the request and convert the value in a new HTTP header appended in the Request: 

```Authorization: Basic base64(value_of_X-Client-Id:value_of_X-Client-Secret)```