# Ballerina Tutorial - Following along ballerina by example tutorial.

This repository contains the ballerina (.bal) files that I've used to learn the language and to build services with it.

Below is an example of how a ballerina service should be invoked. "hello_world.bal" is used in the example.

## Running Ballerina Services
```
ballerina run hello_world.bal
```

## Expected output on console
```
[ballerina/http] started HTTP/WS listener 0.0.0.0:9090
```

## The service can be invoked by using an HTTP client (Like cURL)
```
curl http://localhost:9090/hello/sayHello
```

## For more info, visit Ballerina.
See [BallerinaDocumentation](https://ballerina.io).
