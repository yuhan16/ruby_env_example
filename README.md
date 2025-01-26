# Typical Ruby env

We use docker to create a Ruby env. Only necessary packages and gems are installed.
- ruby-full
- git
- bundler


## Instructions 
1. `cd` to the project directory and create an ruby env image

    ```bash
    $ docker build -t my-ruby-env .
    ```

2. create a docker container, note the volum mount and port mapping.

    ```bash
    $ docker run --name jekyll-devbox -v ./app:/app -p 4000:4000 -it my-ruby-env /usr/bin/bash
    ```

### Special Instructions for Jekyll Project 
Since Jekyll server uses a loopback IP (usually `127.0.0.1:4000`) for security reasons, the content can only be access within the container. i.e., we cannot access the content from the host's web browser by visiting `127.0.0.1:4000`. Therefore, we need to configure the server to listen on `0.0.0.0` so that it can accept external connections from the host. 

```bash
$ bundle exec jekyll serve --host 0.0.0.0
```

Then, in the host web browser, enter `127.0.0.1:4000`.


## Project structure
We use bundler to install gems according to a Gemfile. e.g., Jekyll. The Gemfile and source code should go in `app` directory.
- `app`: project code

