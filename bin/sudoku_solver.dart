class SudokuSolver {
  static void solveSudoku({required List<List<String>> board}) {
    helper(board: board, row: 0, column: 0);
    print(board);
  }

  static bool helper(
      {required List<List<String>> board,
      required int row,
      required int column}) {
    // Base Condition
    // We are travel row-wise below, then we travel column wise.
    // After increasing row on any point to (n-1,n-1), means we are on
    // our last cell of sudoku, after this increasing in row will
    // be equal to board.length! that is the point, where our base case come
    // means we have filled our whole sudoku.
    if (row == board.length) {
      return true;
    }
    // first we define, next time when we perform recursion, then what will
    // be our next row and column
    int newRow = 0;
    int newColumn = 0;
    // if we in our whole row on any column and that will not be our last
    // column, then in this case we will proceed next
    // else, in case when we are on last column on any row, then we have
    // to go to next row and we see that on next recursion, what will
    // be our new row and new column
    if (column != board.length - 1) {
      newRow = row;
      newColumn = column + 1;
    } else {
      newRow = row + 1;
      newColumn = 0;
    }
    // Next thing we have to check, number is already present in the row?
    // if number is present, then we will move to next cell.
    // if number is not present, then we have to place something from 1-9
    if (board[row][column] != '.') {
      // if our row, column is not empty, then on this case, we will call helper()
      // we will pass board, newRow and newColumn
      if (helper(board: board, row: newRow, column: newColumn)) {
        // if true is returns from this helper, if we calculate that type of a solution
        // from this, we got our whole sudoku result and helper returned true, then
        // in this case, we will also return true, that we got solution
        return true;
      }
    } else {
      // if it does not happen, then in this case we will place a number one by one.
      // e.g, if 1 is safe to place on this position, we placed 1 on the board,
      // then we call other levels, after reaching further, we know 1 is not safe
      // to place here, apply other numbers, because, from this solution is not
      // right! and on this case, we will come again and after coming, we will
      // make the solution null, and on next loop, we will place 2.
      // This is how our recursive called will be maintained. and if in this
      // function, no function returns true, then finally we will return false.
      for (var i = 1; i <= 9; i++) {
        // First we check, is it safe for us a number on board (row-column).
        // This isSafe() will check the validity, is this number is allowed to place
        // on row,column cell?
        if (isSafe(board: board, row: row, column: column, number: i)) {
          //here we place the number, if it is safe!
          board[row][column] = i.toString();
          // and again we will recursively call on helper and we will pass board,
          // newRow and newColumn.
          // and again we will check, after placing a number, is true returns or not?
          if (helper(board: board, row: newRow, column: newColumn)) {
            // if true comes, then we will also returns true.
            return true;
          } else {
            // simply, board[row][column] will be null. we will null the board.
            board[row][column] = '.';
          }
        }
      }
    }
    return false;
  }

  static bool isSafe(
      {required List<List<String>> board,
      required int row,
      required column,
      required int number}) {
    // Row and Column
    for (var i = 0; i < board.length; i++) {
      if (board[i][column] == number.toString()) {
        return false;
      }
      if (board[row][i] == number.toString()) {
        return false;
      }
    }
    // Grid
    int startingRow = (row ~/ 3) * 3;
    int startingColumn = (column ~/ 3) * 3;
    // Now we know the grid starting point, Grid is 3*3 Matrix.
    // Means we have to increase and column until 3 and check if the no. exists
    // in the matrix or not?
    for (var i = startingRow; i < startingRow + 3; i++) {
      for (var j = startingColumn; j < startingColumn + 3; j++) {
        if (board[i][j] == number.toString()) {
          return false;
        }
      }
    }
    return true;
  }
}
