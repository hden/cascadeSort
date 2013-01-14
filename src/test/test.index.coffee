assert = require('chai').assert
_      = require 'underscore'
helper = require '../index'

m    = []
step = 0

check = (value) ->
  step++
  console.log "step: #{step}"
  console.log value

describe 'Cascade sorter', ->
  #@timeout = 800
  console.log helper
  helper   = null
  step = 0
  m    = [[0, 0, 1, 1]
          [1, 1, 0, 0]
          [0, 1, 0, 1]
          [0, 1, 1, 1]
          [1, 0, 1, 0]
          [1, 0, 1, 0]]
  it 'should pivot a matrix properly', ->
    res = helper.pivot m
    assert.Equal 'A', 'B'