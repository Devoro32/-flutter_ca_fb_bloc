import 'package:ca_firebase_app/export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //TODO: Can't this be moved into initializedependencies?
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => getIt<AuthBloc>(),
      ),
      // BlocProvider(create: (_) => getIt<AuthenticationCubit>()),
      // BlocProvider(create: (context) => TaskTabSelectionCubit()),
      // BlocProvider(create: (context) => getIt<DptodoBloc>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture',
      theme: AppTheme.darkThemeMode,
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
