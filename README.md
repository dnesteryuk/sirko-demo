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
    $ bundle exec puma -e development
    ```

4. Visit [http://localhost:9393](http://localhost:9292) to see the demo site.


## Production deploy

1. Clone repo.
2. Define settings in `.env`.
2. Build an image:

    ```
    $ sudo docker build -t sirko-demo ./
    ```

3. Launch:

    ```
    $ sudo docker run -d --restart always --name sirko-demo -p 9292:9292 sirko-demo
    ```

4. Create a virtual host for Nginx:

    ```
    upstream demo {
        server 127.0.0.1:9292;
    }
    server {
            listen 443 ssl http2 default_server;
            listen [::]:443 ssl http2 default_server;

            server_name demo.sirko.io;

            gzip on;
            gzip_types text/plain text/css text/javascript application/javascript;
            gzip_comp_level 5;

            location = /sirko_sw.js {
                    proxy_pass http://127.0.0.1:4000/assets/sirko_sw.js;
           }

            location / {
                include proxy_params;
                proxy_redirect off;
                proxy_pass http://demo;
            }

            location ~* \.(?:ico|css|js|gif|jpe?g|png|html)$ {
                   expires 7d;
                   add_header Pragma public;
                   add_header Cache-Control "public";
            }

        ssl_certificate /etc/letsencrypt/live/demo.sirko.io/fullchain.pem; # managed by Certbot
        ssl_certificate_key /etc/letsencrypt/live/demo.sirko.io/privkey.pem; # managed by Certbot
    }

    server {
           listen         80;
           listen         [::]:80;
           server_name    demo.sirko.io;
           return         301 https://$server_name$request_uri;
    }
    ```
