# Crisp Worker
Simple deamon that connects to (https://crisp.im)[Crisp] via sockets and pushes to a webservice.

### Configuration
You need the following environment variables setup:
```
    export CRISP_IDENTIFIER='YOUR_CRISP_IDENTIFIER'
    export CRISP_KEY='YOUR_CRISP_AUTHENTICATION_KEY'
    export CRISP_PLUGIN_ID='YOUR_PLUGIN_ID'
    export BASE_URL='http://example.com'
```

### Running
To start the deamon:

```
    bundle exec ruby run.rb start
```

To stop the deamon:

```
    bundle exec ruby run.rb stop
```
