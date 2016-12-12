# Sirko demo

It is a simple demo site which shows how the [sirko engine](https://github.com/dnesteryuk/sirko-engine) and
[sirko client](https://github.com/dnesteryuk/sirko-client) can provide better experience to users.

[Try demo](http://demo.sirko.io)

## Development

### Requirements

 - Ruby 2.x
 - Node.js

### Setup

1. Install Ruby dependencies:

    ```
    $ bundle install
    ```

2. Install JS dependencies:

    ```
    $ npm install -g bower
    $ bower install
    ```

3. Create a `.env` file and define a url to the engine.

    ```
    # .env
    SIRKO_ENGINE_URL = http://localhost:4000
    ```

4. Launch the app:

    ```
    $ shotgun
    ```

5. Visit [http://localhost:9393](http://localhost:9393) to see the demo site.