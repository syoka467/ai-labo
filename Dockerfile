FROM ruby:2.6.6
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
#RUN curl https://cli-assets.heroku.com/install.sh | sh

WORKDIR /myproject

ADD Gemfile /myproject/Gemfile
ADD Gemfile.lock /myproject/Gemfile.lock

# RUN gem install bundler -v 2.4.22 && bundle install
# RUN bundle config set --global force_ruby_platform true
# RUN bundle install

RUN gem install bundler -v 2.4.22
RUN bundle config set --global force_ruby_platform true
RUN bundle install


ADD . /myproject