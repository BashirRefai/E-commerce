// ignore_for_file: prefer_final_fields

import 'package:ecommerce_f1/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce_f1/features/auth/presentation/manager/state/auth_state.dart';
import 'package:ecommerce_f1/features/auth/presentation/manager/state/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  AuthRemoteDataSource _authRemoteDataSource = AuthRemoteDataSource();

  login(String email, String password) async {
    emit(state.copyWith(isLoadingType: IsLoadingType.isLoadingLogin));

    final userLogin = await _authRemoteDataSource.login(email, password);

    userLogin.fold((error) {
      emit(state.copyWith(errorType: ErrorType.errorLogin));
    }, (token) {
      emit(state.copyWith(token: token));
    });
  }

  // loginApi(LoginParams params) async {
  //   emit(state.copyWith(isLoadingLogin: true));

  //   final userLogin = await _authRemoteDataSource.loginApi(params);

  //   userLogin.fold((error) {
  //     emit(state.copyWith(errorLogin: error));
  //   }, (token) {
  //     emit(state.copyWith(token: token));
  //   });
  // }

  createUser(String name, String email, String password) async {
    emit(state.copyWith(isLoadingType: IsLoadingType.isLoadingRegister));
    final register =
        await _authRemoteDataSource.register(name, email, password);

    register.fold((error) {
      emit(state.copyWith(errorType: ErrorType.errorRegister));
    }, (name) {
      print(' name with cubit $name');
       emit(state.copyWith(nameUser: name));
    });
  }
}
