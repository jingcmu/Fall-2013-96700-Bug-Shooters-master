#!/bin/sh

bundle install && bundle update && rake db:migrate && rake db:seed && rake

