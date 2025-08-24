#!/bin/bash
set -e

chmod -R 755 /usr/src/app

rm -rf dist/test

npm run watch &
sleep 5 
npm run serve:ssr:test &

wait