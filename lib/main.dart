import 'package:flutter/material.dart';
import 'package:full_stack_ecommerce/common/widgets/bottom_navigation.dart';
import 'package:full_stack_ecommerce/features/admin/screens/admin_screen.dart';
import 'package:full_stack_ecommerce/features/auth/screens/authscreen.dart';
import 'package:full_stack_ecommerce/provider/user_provider.dart';
import 'package:full_stack_ecommerce/router.dart';
import 'package:full_stack_ecommerce/services/authentication_service.dart';
import 'package:provider/provider.dart';
import 'constants/global_variables.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();
  final AuthenticationService authenticationService = AuthenticationService();

  @override
  void initState() {
    super.initState();
    authenticationService.getUserData(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: _messengerKey,
        title: 'Amazon clone',
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: GlobalVariables.secondaryColor),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.name == 'user'
                ? const BottomBar()
                : const AdminScreen()
            : const AuthScreen());
  }
}
