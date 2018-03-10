# Sirko demo

It is a simple demo site which shows how the [sirko engine](https://github.com/sirko-io/engine) and
[sirko client](https://github.com/sirko-io/client) can provide better experience to users.

[Try demo](http://demo.sirko.io)

## Development

### Requirements

 - Ruby 2.x

### Setup

1. Install Ruby dependencies:

    ```
    $ bundle install
    ```

2. Create a `.env` file and define a url to the engine.

    ```
    # .env
    SIRKO_ENGINE_URL = http://localhost:4000
    ```

3. Launch the app:

    ```
    $ shotgun
    ```

4. Visit [http://localhost:9393](http://localhost:9393) to see the demo site.
