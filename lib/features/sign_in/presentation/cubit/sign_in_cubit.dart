import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otlob/core/di/dependency_injection.dart';
import 'package:otlob/core/network/failure_message.dart';
import 'package:otlob/core/services/storage_services/storage_service.dart';
import 'package:otlob/core/ui_kit/overlay_loading/overlay_loading_manager.dart';
import 'package:otlob/core/utils/snackbar_helper.dart';
import 'package:otlob/core/validation/field_rules.dart';
import 'package:otlob/features/sign_in/data/request/sign_in_request.dart';
import 'package:otlob/features/sign_in/domain/usecase/sign_in_usecase.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(Loading());

  void signIn(
    String email_,
    String password_,
    FocusNode _emailFocus,
    FocusNode _passwordFocus,
  ) async {
    sl<LoadingManager>().show();
    final email = email_.trim();
    final password = password_.trim();

    final error = await validateOnSubmit([
      // 1. Email
      SubmitField(
        value: email,
        focusNode: _emailFocus,
        rule: Rules.all([
          Rules.required('Please enter your email'),
          Rules.email('Please enter a valid email address'),
        ]),
      ),

      // 2. Password
      SubmitField(
        value: password,
        focusNode: _passwordFocus,
        rule: Rules.all([
          Rules.required('Please enter your password'),
          Rules.minLength(6, 'Password must be at least 6 characters'),
        ]),
      ),
    ]);

    if (error != null) {
      sl<LoadingManager>().hide();
      sl<SnackbarHelper>().showMessage(error, ErrorMessage.snackBar);
      return;
    }

    final result = await sl<SignInUseCase>().execute(
      SignInRequest(email: email_, password: password_),
    );

    sl<LoadingManager>().hide();

    await result.fold(
      (l) async =>
          sl<SnackbarHelper>().showMessage(l.message, ErrorMessage.snackBar),
      (r) async {
        await sl<StorageService>().setMap("user_name", {"name": r.displayName});
        await sl<StorageService>().setToken(r.token);
        emit(Success());
      },
    );
  }
}
