import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promedia_task/login/controller/provider/login_provider.dart';
import 'package:promedia_task/my_gallery/controller/provider/gallery_provider.dart';
import 'package:promedia_task/services/api_handler/general_api_state.dart';
import 'package:promedia_task/utilties/route/routes.dart';
import 'package:provider/provider.dart';
import 'dart:io';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SharedObj().init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) =>
      runApp(
          MultiProvider(
        providers: [
          ChangeNotifierProvider<GeneralApiState>(create: (_) => GeneralApiState()),
          ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
          ChangeNotifierProvider<GalleryProvider>(create: (_) => GalleryProvider()),
        ],
        child: TaskApp(),
      )
      ));


}

class TaskApp extends StatefulWidget {
  TaskApp({Key? key}) : super(key: key);

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  State<TaskApp> createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(427, 1385),
      builder: (_, __) => MaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        title:  "proMediaTask",
        initialRoute: "/LoginScreen",
        routes: Routes.routesMap,
      ),
    );
  }
}
