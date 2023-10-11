import 'sudoku_solver.dart';

void main(List<String> arguments) {
  // BackTrackingAlgorithms.printPermutation(str: 'ABC', perm: '');
  // NQueensSolution.solveQueen(4);
  List<List<String>> inputBoard = <List<String>>[
    ['5', '3', '.', '.', '7', '.', '.', '.', '.'],
    ['6', '.', '.', '1', '9', '5', '.', '.', '.'],
    ['.', '9', '8', '.', '.', '.', '.', '6', '.'],
    ['8', '.', '.', '.', '6', '.', '.', '.', '3'],
    ['4', '.', '.', '8', '.', '3', '.', '.', '1'],
    ['7', '.', '.', '.', '2', '.', '.', '.', '6'],
    ['.', '6', '.', '.', '.', '.', '2', '8', '.'],
    ['.', '.', '.', '4', '1', '9', '.', '.', '5'],
    ['.', '.', '.', '.', '8', '.', '.', '7', '9'],
  ];
  SudokuSolver.solveSudoku(board: inputBoard);
}
