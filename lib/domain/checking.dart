class Checking{
  bool isPanlindrome(String word) {
    for (int i = 0; i < word.length ~/ 2; i++) {
      if (word[i] != word[word.length - i - 1]) return false;
    }
    return true;
  }
}