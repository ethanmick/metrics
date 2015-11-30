'use strict'
#
# Ethan Mick
# 2015
#

winston = require 'winston'
level = process.env.WINSTON or 'debug'

winston.remove(winston.transports.Console)
winston.add(winston.transports.Console, {
  level: level
  colorize: yes
  json: no
  timestamp: yes
  prettyPrint: yes
  label: process.pid
})


module.exports = winston
