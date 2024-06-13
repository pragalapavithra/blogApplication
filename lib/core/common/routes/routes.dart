import 'package:auto_route/auto_route.dart';
import 'package:blog_application/features/auth/presentation/pages/login_page.dart';
import 'package:blog_application/features/auth/presentation/pages/sign_up_page.dart';

import '../../../features/auth/presentation/pages/splash_page.dart';
import '../../../features/blog/pages/blog_page.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashPageRouter.page,
          path: "/splash",
          initial: true,
        ),
        AutoRoute(
            page: LoginPageRouter.page, path: "/login", keepHistory: false),
        AutoRoute(page: SignUpPageRouter.page, path: "/signup"),
        AutoRoute(page: BlogPageRouter.page, path: "/blogPage"),
      ];
}
