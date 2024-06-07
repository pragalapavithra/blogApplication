// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginPageRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    SignUpPageRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpPage(),
      );
    },
  };
}

/// generated route for
/// [LoginPage]
class LoginPageRouter extends PageRouteInfo<void> {
  const LoginPageRouter({List<PageRouteInfo>? children})
      : super(
          LoginPageRouter.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpPage]
class SignUpPageRouter extends PageRouteInfo<void> {
  const SignUpPageRouter({List<PageRouteInfo>? children})
      : super(
          SignUpPageRouter.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPageRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}
