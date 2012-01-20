module.exports = (board) ->
  for n in [0..2]
    return board[n] if board[n] == board[n + 3] == board[n + 6]
    return board[n * 3] if board[n * 3] == board[n * 3 + 1] == board[n * 3 + 2]
  return board[4] if board[0] == board[4] == board[8]
  return board[4] if board[2] == board[4] == board[6]
