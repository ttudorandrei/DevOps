#!/bin/bash

# cd into spec tests folder
cd environment/spec-tests/

# install bundler
gem install bundler

# installs requirements for running spec tests
bundle

# run spec tests
rake spec