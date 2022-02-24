import 'package:domain/palindrome_usecase.dart';
import 'package:presentation/bloc/base_bloc.dart';
import 'package:presentation/home_data.dart';

abstract class HomeBloc extends BaseBloc {
  factory HomeBloc(PalindromeUseCase palindromeUseCase) =>
      _HomeBloc(palindromeUseCase);

  void isPalindrome();

  void setPaliString(String palindrome);
}

class _HomeBloc extends BlocImpl implements HomeBloc {
  final PalindromeUseCase _palindromeUseCase;
  final _screenData = HomeData.init();
  bool _isLoading = false;

  _HomeBloc(this._palindromeUseCase);

  @override
  void initState() {
    super.initState();
    updateData();
  }

  @override
  void isPalindrome() async {
    _isLoading = true;
    updateData();

    _screenData.isPalindrome =
        await _palindromeUseCase.isPalindrome(_screenData.stringInput);

    _isLoading = false;
    updateData();
  }

  @override
  void setPaliString(String palindrome) {
    _screenData.stringInput = palindrome;
  }

  void updateData() {
    super.handleData(
      isLoading: _isLoading,
      data: _screenData.copy(),
    );
  }
}
