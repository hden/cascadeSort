assert  = require('chai').assert
_       = require 'underscore'
cascade = require '../src/index'

m    = []
step = 0

check = (value) ->
  step++
  console.log "step: #{step}"
  console.log value

describe 'Cascade sorter', ->
  @timeout 80
  step = 0
  m    = [[0, 0, 1, 1]
          [1, 1, 0, 0]
          [0, 1, 0, 1]
          [0, 1, 1, 1]
          [1, 0, 1, 0]
          [1, 0, 1, 0]]
  it 'should pivot a matrix properly', ->
    res = cascade.pivot m
    ans = [ [ 0, 1, 0, 0, 1, 1 ]
            [ 0, 1, 1, 1, 0, 0 ]
            [ 1, 0, 0, 1, 1, 1 ]
            [ 1, 0, 1, 1, 0, 0 ] ]
    assert.deepEqual res, ans
  it 'should be able to sort a matrix by column', ->
    res = cascade.sortByColumn m
    ans = [ [ 1, 0, 0, 1 ]
            [ 0, 1, 1, 0 ]
            [ 0, 0, 1, 1 ]
            [ 1, 0, 1, 1 ]
            [ 1, 1, 0, 0 ]
            [ 1, 1, 0, 0 ] ]
    assert.deepEqual res, ans
  it 'should be able to perform cascade sorting on a matrix', ->
    res = cascade.sort m
    ans = [ [ 1, 0, 1, 0 ]
            [ 1, 0, 1, 0 ]
            [ 1, 1, 0, 0 ]
            [ 0, 1, 0, 1 ]
            [ 0, 1, 1, 1 ]
            [ 0, 0, 1, 1 ] ]
    assert.deepEqual res, ans
  it 'should be able to perform cascade sorting after sortByColumn', ->
    res = cascade.sort cascade.sortByColumn m
    ans = [ [ 1, 0, 1, 1 ]
            [ 1, 0, 0, 1 ]
            [ 1, 1, 0, 0 ]
            [ 1, 1, 0, 0 ]
            [ 0, 1, 1, 0 ]
            [ 0, 0, 1, 1 ] ]
    assert.deepEqual res, ans