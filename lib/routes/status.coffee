'use strict'
#
# Ethan Mick
# 2015
#

module.exports = [
  method: 'GET'
  path: '/status'
  handler: (req, reply)->
    reply(status: 'up')
]
