import 'package:auto_route/auto_route_annotations.dart';
import 'package:checkincheckout/pages/intro_screen.dart';
import 'package:checkincheckout/pages/payment_info_screen.dart';
import 'package:checkincheckout/pages/payment_plan_screen.dart';
import 'package:checkincheckout/pages/restore_password_screen.dart';
import 'package:checkincheckout/pages/signIn_screen.dart';
import 'package:checkincheckout/pages/sign_up_screen.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    AdaptiveRoute(page: IntroScreen, initial: true),
    AdaptiveRoute(page: SignUpScreen),
    AdaptiveRoute(page: PaymentInfoScreen),
    AdaptiveRoute(page: PaymentPlanScreen),
    AdaptiveRoute(page: SignInScreen),
    AdaptiveRoute(page: RestorPasswordScreen),
  ],
)
class $AppRouter {}
