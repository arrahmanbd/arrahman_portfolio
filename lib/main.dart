import 'all_imports.dart';
import 'screens/home/gitrepo/files.dart';
import 'screens/home/homepage.dart';
import 'screens/home/project/auto_view.dart';
import 'shared/shared_preferences.dart';
import 'themes/controller/theme_controller.dart';
import 'package:arrahman_portfolio/themes/data/theme_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDark = ref.watch(themeProvider).isDark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: !isDark ? AppTheme.light : AppTheme.dark,
      home: const HomePage(),
    );
  }
}
