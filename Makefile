REPORTER = spec
BASE = .

default: install

install: node_modules

node_modules: package.json
        @npm -s install

test:
        @NODE_ENV=test LOG_LEVEL=fatal ./node_modules/.bin/mocha \
                --require "should" \
                --reporter $(REPORTER) \
                --growl \
                --check-leaks \
                --recursive

lint:
        @./node_modules/.bin/jshint index.js lib \
                --reporter ./node_modules/jshint-stylish/stylish.js \
                --config $(BASE)/.jshintrc

clean:
        @rm -rf node_modules

.PHONY: default install test lint clean
