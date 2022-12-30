FROM ruby:2.7.2-slim

RUN apt-get update -qq && apt-get install -y build-essential

RUN apt-get install -y mariadb-server
# RUN apt-get install mysql-server mysql-client libmysqlclient-dev

RUN apt-get install -y vim

WORKDIR /home/app

COPY Gemfile* ./

RUN gem install bundler -v 2.2.6
RUN bundle install

COPY . .

# Run build task defined in lib/tasks/fly.rake
ARG BUILD_COMMAND="bin/rails fly:build"
RUN ${BUILD_COMMAND}

# Default server start instructions.  Generally Overridden by fly.toml.
ENV PORT 8080
ARG SERVER_COMMAND="bin/rails fly:server"
ENV SERVER_COMMAND ${SERVER_COMMAND}
CMD ${SERVER_COMMAND}
