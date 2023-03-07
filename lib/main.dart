import 'package:flutter/material.dart';
import 'package:named_routes/providers/http_provider.dart';
import 'package:named_routes/screens/user_info.dart';
import 'package:provider/provider.dart';
import 'screens/list_of_users.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => HttpServiceProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MockData(),
        '/particularUser': (context) => const UserInfo()
      },
    );
  }
}
