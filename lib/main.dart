import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scheduling_assistant/routes/router.dart';

// build inco
// dart run flutter_launcher_icons
// build android
// flutter build apk --release

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp.router(
      title: '排班助手',
      debugShowCheckedModeBanner: false,
      routerConfig: viewRouter,
      theme: FluentThemeData(brightness: Brightness.light),
    );
  }
}
