import 'package:fluent_ui/fluent_ui.dart';

import 'package:scheduling_assistant/routes/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
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
