class HomeData {
  bool? isPalindrome;
  String stringInput = '';

  HomeData(this.isPalindrome, this.stringInput);

  factory HomeData.init() => HomeData(null, '');

  HomeData copy() => HomeData(isPalindrome, stringInput);
}
