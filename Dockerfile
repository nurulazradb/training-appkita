FROM ruby:2.6.6
LABEL maintainer="nurulazrad@gmail.com"

# allow apt to work with https-based source
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  apt-transport-https

# use LTS version of node
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -

# use latest packages for Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
  tee /etc/apt/sources.list.d/yarn.list

# install packages
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  nodejs \
  yarn

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install

COPY . /usr/src/app

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
