import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saltita/config/router/app_router.dart';
import 'package:saltita/config/theme/app_theme.dart';
 
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );


}
 
class MyApp extends StatelessWidget {
   const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Saltita App',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
    );
  }
}
