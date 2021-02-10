// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';

import 'pages/intro_screen.dart';
import 'pages/payment_info_screen.dart';
import 'pages/payment_plan_screen.dart';
import 'pages/restore_password_screen.dart';
import 'pages/signIn_screen.dart';
import 'pages/sign_up_screen.dart';

class Routes {
  static const String introScreen = '/';
  static const String signUpScreen = '/sign-up-screen';
  static const String paymentInfoScreen = '/payment-info-screen';
  static const String paymentPlanScreen = '/payment-plan-screen';
  static const String signInScreen = '/sign-in-screen';
  static const String restorPasswordScreen = '/restor-password-screen';
  static const all = <String>{
    introScreen,
    signUpScreen,
    paymentInfoScreen,
    paymentPlanScreen,
    signInScreen,
    restorPasswordScreen,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.introScreen, page: IntroScreen),
    RouteDef(Routes.signUpScreen, page: SignUpScreen),
    RouteDef(Routes.paymentInfoScreen, page: PaymentInfoScreen),
    RouteDef(Routes.paymentPlanScreen, page: PaymentPlanScreen),
    RouteDef(Routes.signInScreen, page: SignInScreen),
    RouteDef(Routes.restorPasswordScreen, page: RestorPasswordScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    IntroScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => IntroScreen(),
        settings: data,
      );
    },
    SignUpScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SignUpScreen(),
        settings: data,
      );
    },
    PaymentInfoScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => PaymentInfoScreen(),
        settings: data,
      );
    },
    PaymentPlanScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => PaymentPlanScreen(),
        settings: data,
      );
    },
    SignInScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SignInScreen(),
        settings: data,
      );
    },
    RestorPasswordScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => RestorPasswordScreen(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension AppRouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushIntroScreen() => push<dynamic>(Routes.introScreen);

  Future<dynamic> pushSignUpScreen() => push<dynamic>(Routes.signUpScreen);

  Future<dynamic> pushPaymentInfoScreen() =>
      push<dynamic>(Routes.paymentInfoScreen);

  Future<dynamic> pushPaymentPlanScreen() =>
      push<dynamic>(Routes.paymentPlanScreen);

  Future<dynamic> pushSignInScreen() => push<dynamic>(Routes.signInScreen);

  Future<dynamic> pushRestorPasswordScreen() =>
      push<dynamic>(Routes.restorPasswordScreen);
}
