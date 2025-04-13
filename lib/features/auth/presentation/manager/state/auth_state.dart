// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecommerce_f1/features/auth/presentation/manager/state/state.dart';

class AuthState {
  final IsLoadingType? isLoadingType;
  final ErrorType? errorType;
  final String? token;
  final String? nameUser;
  AuthState({this.isLoadingType, this.errorType, this.token, this.nameUser});

  AuthState copyWith({
    IsLoadingType? isLoadingType,
    ErrorType? errorType,
    String? token,
    String? nameUser,
  }) {
    return AuthState(
      isLoadingType: isLoadingType ?? IsLoadingType.none,
      errorType: errorType ?? ErrorType.none,
      token: token ?? '',
      nameUser: nameUser ?? '',
    );
  }
}
