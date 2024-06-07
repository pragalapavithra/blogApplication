import 'package:auto_route/auto_route.dart';
import 'package:blog_application/features/auth/presentation/pages/login_page.dart';
import 'package:blog_application/features/auth/presentation/pages/sign_up_page.dart';
part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
      AutoRoute(page: SignUpPageRouter.page,path: "/signup"),
      AutoRoute(page: LoginPageRouter.page,path: "/login",initial: true),
  ];
}