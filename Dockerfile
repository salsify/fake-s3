FROM ruby:2.2-alpine

RUN apk add --no-cache git

WORKDIR /opt/fakes3

COPY Gemfile Gemfile.lock fakes3.gemspec /opt/fakes3/
COPY lib/fakes3/version.rb /opt/fakes3/lib/fakes3/version.rb
RUN bundle install

RUN mkdir -p /var/data/fakes3
COPY . /opt/fakes3

EXPOSE 4554

CMD ["/opt/fakes3/bin/fakes3", "-r", "/var/data/fakes3", "-p", "4554"]
