'use strict'
#
# Ethan Mick
# 2015
#

Hapi = require 'hapi'
Q = require 'q'
log = require './models/log'

class Server

  constructor: (opts)->
    @server = new Hapi.Server({
      connections:
        routes:
          payload:
            timeout: no
          cors:
            origin: ['*']
          timeout:
            server: no
            socket: no
    })
    @server.connection(opts)

    @server.on 'request-error', (req, err)->
      log.error 'Error: ', err

    @server.ext 'onPreResponse', (req, reply)->
      code = req.response.statusCode or req.response.output?.statusCode
      method = if code is 500 then 'error' else 'info'
      log[method] req.method.toUpperCase(), req.path, code, req.payload
      reply.continue()

  setup: (opts)->
    register = Q.nbind(@server.register, @server)
    register({
      register: require('hapi-router-coffee')
      options:
        routesDir: "#{__dirname}/routes/"
    })

  start: ->
    Q.nbind(@server.start, @server)().then =>
      log.warn 'Server started at: ', @server.info.uri
      log.warn 'Ready to go!'

  stop: (opts)->
    Q.nbind(@server.stop, @server)(opts)

module.exports = Server
