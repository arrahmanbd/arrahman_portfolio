import 'all_imports.dart';
import 'screens/home/homepage.dart';
import 'shared/shared_preferences.dart';
import 'themes/controller/theme_controller.dart';
import 'package:arrahman_portfolio/themes/data/theme_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await LocalStorage.init();
  runApp(ProviderScope(child: const MyApp()));
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
      theme: isDark ? AppTheme.light : AppTheme.dark,
      home: const HomePage(),
    );
  }
}
