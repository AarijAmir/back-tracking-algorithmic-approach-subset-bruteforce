class BackTrackingAlgorithms {
  static void printPermutation({required String str, required String perm}) {
    if (str.isEmpty) {
      print(perm);
      return;
    }
    for (var i = 0; i < str.length; i++) {
      String currChar = str[i];
      String newString = str.substring(0, i) + str.substring(i + 1);
      printPermutation(str: newString, perm: perm + currChar);
      print(' newString= $newString, perm= ${perm + currChar}');
    }
  }
}
