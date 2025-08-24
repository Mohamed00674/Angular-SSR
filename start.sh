#!/bin/bash
set -e
npm run watch &
npm run serve:ssr:test &
wait
