testServer   = require '../../src/server'
request           = require 'supertest'
should  = require 'should'
server = testServer.createServer()

describe 'Status', () ->
  describe '/GET status', () ->
    it 'should get the status successfully', (done) ->
      request(server)
        .get("/status")
        .expect(200)
        .end (err, res) ->
          done(err) if err
          should(res.body).eql
            status: 'OK'
          done()