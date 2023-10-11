class NQueensSolution {
  static bool isSafe(int row, int column, List<List<String>> board) {
    for (var j = 0; j < board.length; j++) {
      // horizontal
      if (board[row][j] == 'Q') {
        return false;
      }
    }
    // vertical
    for (var i = 0; i < board.length; i++) {
      // vertical
      if (board[i][column] == 'Q') {
        return false;
      }
    }
    // upper left
    int r = row;
    for (var c = column; c >= 0 && r >= 0; c--, r--) {
      if (board[r][c] == 'Q') {
        return false;
      }
    }
    // upper right
    r = row;
    for (var c = column; c < board.length && r >= 0; r--, c++) {
      if (board[r][c] == 'Q') {
        return false;
      }
    }
    // lower left
    r = row;
    for (var c = column; c >= 0 && r < board.length; r++, c--) {
      if (board[r][c] == 'Q') {
        return false;
      }
    }
    // lower right
    r = row;
    for (var c = column; c < board.length && r < board.length; r++, c++) {
      if (board[r][c] == 'Q') {
        return false;
      }
    }
    return true;
  }

  static void saveBoard(
      List<List<String>> board, List<List<String>> allBoards) {
    String row = '';
    List<String> newBoard = [];
    for (var i = 0; i < board.length; i++) {
      row = '';
      for (var j = 0; j < board[0].length; j++) {
        if (board[i][j] == 'Q') {
          row += 'Q';
        } else {
          row += '.';
        }
      }
      newBoard.add(row);
    }
    allBoards.add(newBoard);
  }

  static void helper(
      List<List<String>> board, List<List<String>> allBoards, int column) {
    if (column == board.length) {
      saveBoard(board, allBoards);
      return;
    }
    for (var row = 0; row < board.length; row++) {
      if (isSafe(row, column, board)) {
        board[row][column] = 'Q';
        helper(board, allBoards, column + 1);
        board[row][column] = '.';
      }
    }
  }

  static List<List<String>> solveQueen(int n) {
    List<List<String>> allBoards = [];
    List<List<String>> board = List.generate(
      n,
      (rowIndex) => List<String>.filled(n, ''),
    );

    helper(board, allBoards, 0);
    return allBoards;
  }
}



