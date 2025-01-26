# get base iamge and update
FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    ruby-full \
    build-essential \
    zlib1g-dev \
    git

# install bundler to install other gems
RUN gem install bundler

WORKDIR /app
COPY ./app ./
CMD [ "irb" ]
