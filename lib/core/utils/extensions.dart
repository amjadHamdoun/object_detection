
extension StringUtils on String {
  String get toPascalCase {
    final List<String> allLetters = split('');
    String ret = '';
    for (int i = 0; i < allLetters.length; i++) {
      if (i == 0) {
        ret += allLetters[0].toUpperCase();
      } else if (allLetters[i][0] == allLetters[i][0].toUpperCase()) {
        ret += ' ${allLetters[i][0]}';
      } else {
        ret += allLetters[i][0];
      }
    }
    return ret;
  }

  String get removeUnderscores  {
    final List<String> allLetters = split('_'); // Split by underscores
    String ret = '';
    for (int i = 0; i < allLetters.length; i++) {
      if (allLetters[i].isNotEmpty) {
        ret += allLetters[i][0].toUpperCase() + allLetters[i].substring(1);
      }
    }
    return ret;
  }

  String get capitalized {
    final String result = toPascalCase.toLowerCase();
    final List<String> letters = result.split('');
    letters[0] = letters[0].toUpperCase();
    return letters.fold('', (final pre, final current) => '$pre$current');
  }


}



