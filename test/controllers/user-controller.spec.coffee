
testServer = require '../../src/server'
chance     = require('chance')()
request    = require 'supertest'
should     = require 'should'
server     = testServer.createServer()

describe 'Users', ->
  describe '/GET users', ->
    it 'it should GET the list of users', (done) ->
      request(server)
        .get('/users')
        .expect(200)
        .end (err, res) ->
          should(res.body).be.instanceof(Array)
          done()

  describe '/POST user', ->
    it 'it should create a new user', (done) ->

      name = chance.name()
      age = chance.age()
      email = chance.email()

      request(server)
        .post('/users')
        .send( { name, age, email } )
        .expect(200)
        .end (err, res) ->
          should(res.body).eql "User #{name} created"
          done()