FROM ruby:3.0.2

RUN apt-get update && \
    apt-get install -y nodejs postgresql-client vim --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test

COPY . .

RUN bundle exec rake DATABASE_URL=postgresql:does_not_exist assets:precompile
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
