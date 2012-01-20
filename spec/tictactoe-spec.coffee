vows = require('vows')
assert = require('assert')

grade = require('../lib/grade')

vows.describe('grading').addBatch(
  'x wins':
    'x x o
     x o o
     x o x':
      topic: -> 'x x o x o o x o x'.split ' '
      'should win': (topic) ->
        assert.equal grade(topic), 'x'
    'x x x
     x o o
     o o x':
      topic: -> 'x x x x o o o o x'.split ' '
      'should win': (topic) ->
        assert.equal grade(topic), 'x'
    'x o x
     x x o
     o o x':
      topic: -> 'x o x x x o o o x'.split ' '
      'should win': (topic) ->
        assert.equal grade(topic), 'x'
    'x o x
     o x o
     x o o':
      topic: -> 'x o x o x o x o o'.split ' '
      'should win': (topic) ->
        assert.equal grade(topic), 'x'
  'o wins':
    'o o x
     o x x
     o x o':
       topic: -> 'o o x o x x o x o'.split ' '
       'should win': (topic) ->
         assert.equal grade(topic), 'o'
).export(module)
