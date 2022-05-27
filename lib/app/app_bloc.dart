// import 'base_helper.dart';
// import 'build_config.dart';
//
// class AppBloc implements BlocBase {
//   final appState = AppRouteState();
//   SynconRouterDelegate? delegate;
//   final parser = SynconRouteParser();
//   SynconBackButtonDispatcher? backButtonDispatcher;
//
//   init() async {
//     delegate = SynconRouterDelegate(appState);
//     delegate!.setNewRoutePath(SplashPageConfig);
//     backButtonDispatcher = SynconBackButtonDispatcher(delegate);
//     Log.i("ReposeAppBloc.init");
//     Config.init();
//   }
//
//   logout() async {}
//
//   @override
//   void dispose() {}
// }
