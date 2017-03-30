config = require '../config'
log    = require './log'
server = require './server'

serverRunning = false

exit = (code) ->
  if app and serverRunning
    app.seppuku()
  else
    process.exit(code)

process.on 'uncaughtException', (err) ->
  log.error 'Process uncaught exception, shutting down the server'
  log.error err
  exit 1

process.on 'SIGINT', ->
  log.info ' -> SIGINT (Ctrl-C) received'
  exit 0

process.on 'SIGTERM', ->
  log.info ' -> SIGTERM (kill) received'
  exit 0

app = server.createServer()

app.listen config.serverPort, ->
  console.log "listening at " + config.serverPort
  serverRunning = true
