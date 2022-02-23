class PalindromeUseCase {
  Future<bool> isPalindrome(String str) async {
    await Future.delayed(const Duration(seconds: 1));
    str = str.trim().toLowerCase();
    for (int i = 0; i < str.length ~/ 2; i++) {
      if (str[i] != str[str.length - i - 1]) return false;
    }
    return true;
  }

  void dispose() {}
}
