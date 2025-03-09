import 'package:defifundr_mobile/bloc_provider.dart';
<<<<<<< Updated upstream
import 'package:defifundr_mobile/core/routers/_routes.dart';
=======
import 'package:defifundr_mobile/core/routers/routers.dart';
>>>>>>> Stashed changes
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

<<<<<<< Updated upstream
class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
=======
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
>>>>>>> Stashed changes
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(410, 890),
      minTextAdapt: true,
      splitScreenMode: false,
      child: MultiBlocProvider(
        providers: appProviders,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'DeFiFundr',
          scrollBehavior: const _AppScrollBehavior(),
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          routeInformationProvider: AppRouter.router.routeInformationProvider,
          routeInformationParser: AppRouter.router.routeInformationParser,
          routerDelegate: AppRouter.router.routerDelegate,
        ),
      ),
    );
  }
}

class _AppScrollBehavior extends ScrollBehavior {
  const _AppScrollBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
