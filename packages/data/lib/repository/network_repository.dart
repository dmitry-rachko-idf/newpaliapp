import 'package:domain/model/model.dart';
import 'package:domain/repository/network_repository.dart';
// import 'package:injectable/injectable.dart';

// @Singleton(as: INetworkRepository)
class NetworkRepository implements INetworkRepository {
  @override
  Future<PalindromeResponse> checkPalindrome(String palindrome) async {
    await Future.delayed(const Duration(seconds: 2));
    return Future.value(PalindromeResponse(true));
  }
}
