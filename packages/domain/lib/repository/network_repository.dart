import 'package:domain/model/model.dart';

abstract class INetworkRepository {
  Future<PalindromeResponse> checkPalindrome(String palindrome);
}