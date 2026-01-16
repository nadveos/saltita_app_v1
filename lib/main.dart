import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saltita/config/router/app_router.dart';
import 'package:saltita/config/theme/app_theme.dart';
import 'package:saltita/presentation/providers/settings_provider.dart';
 
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );


}
 
class MyApp extends ConsumerWidget {
   const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    return MaterialApp.router(
      title: 'Saltita App',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: settings.isDark ? AppTheme.dark : AppTheme.light,
    );
  }
}
