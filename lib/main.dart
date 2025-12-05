import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smart_exploration_notes/features/auth/presentation/pages/forgot_password_view.dart';
import 'package:smart_exploration_notes/features/auth/presentation/pages/register_view.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/pages/home_view.dart';
import 'service_locator/service_locator.dart';
import 'features/discoveries/presentation/pages/splash_view.dart';
import 'features/auth/presentation/pages/login_view.dart';
import 'features/auth/presentation/pages/phone_verification_view.dart';
import 'features/discoveries/presentation/pages/discoveries_list_view.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Exploration Notes',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          surface: Colors.transparent,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return ResponsiveBreakpoints.builder(
          child: child ?? const SizedBox.shrink(),
          breakpoints: const [
            Breakpoint(start: 0, end: 450, name: MOBILE),
            Breakpoint(start: 451, end: 800, name: TABLET),
            Breakpoint(start: 801, end: 1200, name: DESKTOP),
            Breakpoint(start: 1201, end: double.infinity, name: '4K'),
          ],
        );
      },
      home: const HomeView(),
    );
  }
}
