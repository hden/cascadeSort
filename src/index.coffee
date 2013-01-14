_ = require 'underscore'

step = 0
notIdentical = (matrix) ->
  uniq = _.uniq matrix, false, (item) -> item.toString()
  return if uniq? then true else false
check = (value) ->
  step++
  console.log "step: #{step}"
  console.log value
iterator = (n) ->
  if n is 1 then true else false

exports.sort = sort = (matrix, column=0, isUpward=true, callback) ->
  length = matrix.length
  res    = matrix
  if length > 1 and column < matrix[0].length and notIdentical matrix
    res  = []
    hit  = _.filter matrix, (row) -> iterator row[column]
    miss = _.filter matrix, (row) -> not iterator row[column]
    next = column + 1
    hit  = sort hit, next, false
    miss = sort miss, next, true
    # set isUpward = true for conventional cascade sorting
    # isUpward = true
    [foo, bar] = if isUpward then [hit, miss] else [miss, hit]
    res  = []
    res.push item for item in foo if foo?
    res.push item for item in bar if bar?
    callback res if callback?
    # clean up
    hit = miss = next = foo = bar = null
  return res

exports.pivot = pivot = (matrix, callback) ->
  res = []
  res.push [] for element, columnNumber in matrix[0] # Prepare placehilders
  for row, rowNumber in matrix
    for element, columnNumber in row
      res[columnNumber][rowNumber] = element
  callback res if callback?
  return res

exports.sortByColumn = sortByColumn = (matrix, callback) ->
  # Pivot matrix
  matrix = pivot matrix
  matrix = _.sortBy matrix, (column) ->
    # Sort by sum of each column
    n = _.reduce column, ((foo, bar) -> foo + bar), 0
    return n * -1
  # Pivot back
  matrix = pivot matrix
  callback matrix if callback?
  return matrix