# Cascade sorting helper
A variation of cascade sorting that highlight the intersection between each dataset in column.

## Usage
Coffee-script

```coffee-script
cascade = require '../src/index'

m = [ [0, 0, 1, 1]
      [1, 1, 0, 0]
      [0, 1, 0, 1]
      [0, 1, 1, 1]
      [1, 0, 1, 0]
      [1, 0, 1, 0] ]

cascade.pivot m
# [ [ 0, 1, 0, 0, 1, 1 ]
#   [ 0, 1, 1, 1, 0, 0 ]
#   [ 1, 0, 0, 1, 1, 1 ]
#   [ 1, 0, 1, 1, 0, 0 ] ]

cascade.sortByColumn m
# [ [ 1, 0, 0, 1 ]
#   [ 0, 1, 1, 0 ]
#   [ 0, 0, 1, 1 ]
#   [ 1, 0, 1, 1 ]
#   [ 1, 1, 0, 0 ]
#   [ 1, 1, 0, 0 ] ]

cascade.sort cascade.sortByColumn m
# [ [ 1, 0, 1, 1 ]
#   [ 1, 0, 0, 1 ]
#   [ 1, 1, 0, 0 ]
#   [ 1, 1, 0, 0 ]
#   [ 0, 1, 1, 0 ]
#   [ 0, 0, 1, 1 ] ]

```

## Requirement
Underscore.js `npm install underscore`
## To-do
* Conventional cascade sorting
* read/write tsv file
* command-line option

##Licence
MIT