part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  // ignore: constant_identifier_names
  static const HOME = _Paths.HOME;
  // ignore: constant_identifier_names
  static const LOGIN = _Paths.LOGIN;
  // ignore: constant_identifier_names
  static const PROFILE = _Paths.PROFILE;
  // ignore: constant_identifier_names
  static const REGISTER = _Paths.REGISTER;
  // ignore: constant_identifier_names
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  // ignore: constant_identifier_names
  static const PHONE = _Paths.PHONE;
}

abstract class _Paths {
  // ignore: constant_identifier_names
  static const HOME = '/home';
  // ignore: constant_identifier_names
  static const LOGIN = '/login';
  // ignore: constant_identifier_names
  static const PROFILE = '/profile';
  // ignore: constant_identifier_names
  static const REGISTER = '/register';
  // ignore: constant_identifier_names
  static const FORGOT_PASSWORD = '/forgot-password';
  // ignore: constant_identifier_names
  static const PHONE = '/phone-login';
}
