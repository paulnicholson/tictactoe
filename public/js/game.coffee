socket = io.connect('http://localhost')
socket.on 'game over', (data) ->
  alert data.result

jQuery ($) ->
  board = $ '#board'
  spaces = board.find 'td'
  otherPlayer = (player) ->
    all =
      x: 'o'
      o: 'x'
    all[player]

  player = 'o'

  spaces.on 'click', (event) ->
    player = otherPlayer player
    $(this).text player
    socket.emit 'move',
      position: spaces.index(this)
      player: player
