part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

class Loading extends SignInState {}

class Success extends SignInState {}

class Error extends SignInState {}
