matador = require('matador')
grade = require('./lib/grade')
io = require('socket.io').listen(app)

app.configure ->
  app.set('models', __dirname + '/app/models')
  app.set('helpers', __dirname + '/app/helpers')
  app.set('views', __dirname + '/app/views')
  app.set('controllers', __dirname + '/app/controllers')

  app.set('view engine', 'html')
  app.register('.html', matador.engine)
  app.register('.jade', require('jade'))

  app.use(matador.cookieParser())
  app.use(matador.bodyParser())
  app.use(matador.methodOverride())
  app.use(require('connect-assets')(src: 'public'))
  app.use(matador.static(__dirname + '/public'))

app.configure 'development', ->
  app.use(matador.errorHandler({ dumpExceptions: true, showStack: true }))

app.configure 'production', ->
  app.use(matador.errorHandler())

app.set('viewPartials', matador.partials.build(app.set('views')))
matador.mount(require('./app/config/routes'))
app.listen(3000)
console.log('matador running on port 3000')



io.sockets.on 'connection', (socket) ->
  board = new Array(9)
  socket.on 'move', (data) ->
    board[data.position] = data.player
    result = grade board
    if result
      socket.emit 'game over',
        result: result
    else if board.join('').length == 9
      socket.emit 'game over',
        result: 'draw'
