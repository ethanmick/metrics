'use strict'
#
# Ethan Mick
# 2015
#

# ToDo: Replace with Dynamic
module.exports =
  log: process.env.WINSTON
  http:
    host: process.env.HTTP_HOST
    port: process.env.HTTP_PORT

