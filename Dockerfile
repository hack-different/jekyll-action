FROM ruby:3.1-alpine

LABEL version="2.1"
LABEL repository="https://github.com/hack-different/jekyll-action"
LABEL homepage="https://github.com/hack-different/jekyll-action"
LABEL maintainer="Alain Hélaïli <helaili@github.com>"

RUN apk add --no-cache git build-base
# Allow for timezone setting in _config.yml
RUN apk add --update tzdata
# Use curl to send API requests
RUN apk add --update curl

RUN apk add --update sqlite-dev

# debug
RUN bundle version

COPY LICENSE README.md /

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
