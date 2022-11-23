#!/bin/bash

set -e

pushd api

npm install
node app.js
