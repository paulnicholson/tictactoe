module.exports = require(app.set('controllers') + '/ApplicationController').extend().methods
  index: (request, response) ->
    @render 'game/index.jade',
      title: 'The TicTacToe Framework'
