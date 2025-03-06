# A Typical Ruby Env by Docker Container

We use docker container to create a Ruby env, which facilites the development of Ruby-based projects like Jekyll. Only necessary packages and gems are installed.
- ruby-full
- git
- bundler


## Instructions
1. copy your project to the `app` directory. 

2. `cd` to the project directory and create an ruby env image

    ```bash
    $ docker build -t my-ruby-env .
    ```

3. create a docker container, note the volum mount and port mapping.

    ```bash
    $ docker run --name jekyll-devbox -v ./app:/app -p 4000:4000 -it my-ruby-env /usr/bin/bash
    ```

**Note:** the volume mapping allows you to modify your project conveinently. Any modifications on your local machine will be reflected to the docker container.

### Special Instructions for Jekyll Projects
Since Jekyll server uses a loopback IP (usually `127.0.0.1:4000`) to publish websites for security reasons, the content can only be access within the container. Therefore, we cannot access the content from the host's web browser by visiting `127.0.0.1:4000`. To solve this, we need to configure the server to listen on `0.0.0.0` so that it can accept external connections from the host. 

```bash
$ bundle exec jekyll serve --host 0.0.0.0
```

Then, in the host web browser, enter `127.0.0.1:4000` to visit the website.


## Project structure
We use bundler to install gems according to a Gemfile, such as Jekyll. The Gemfile and project source code should go in `app` directory.
- `app`: project code

**Note:** we follow the convention to name `app` directory. It can be other names.
