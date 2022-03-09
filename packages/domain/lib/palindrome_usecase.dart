import 'package:domain/repository/network_repository.dart';

class PalindromeUseCase {
  final INetworkRepository _repository;

  PalindromeUseCase(this._repository);

  Future<bool> call(String params) async {
    final response = await _repository.checkPalindrome(params);
    return Future.value(response.isPalindrome);
  }
}
